from readjson import *
from rowplace import *
from rowroute import *
from writejson import *
from order_and_mirror import *
from func_for_cluster import *
from Bstar import *
from mapping_for_3duf import *
from graph import *
from utils import *
from LP_postprocess import *
# from withinrowroute import *
import random
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import time 
import math as m
import os
import shutil  
from collections import Counter, defaultdict, deque

from design_rules import (
    CPORT_FLOW_CHANNEL_CLEARANCE,
    VALVE_BEND_CLEARANCE,
    VALVE_FLOW_PORT_CLEARANCE,
    VALVE_SIZE,
)


VALVE_KEEP_OUT = VALVE_SIZE
# The flow corridor must contain the valve plus its required clearances to the
# adjacent flow port and bend.
VALVE_ROUTE_MARGIN = VALVE_FLOW_PORT_CLEARANCE + VALVE_BEND_CLEARANCE


def _layer_is(value, layer_id):
    return str(value) == str(layer_id)


def _connection_is_layer0(connection):
    if "layer" in connection:
        return _layer_is(connection.get("layer"), "0")
    return True


def _component_index_by_name(compon):
    return {c[3]: i for i, c in enumerate(compon)}


def valve_connection_region_sides(raw_data, compon, tree):
    name_to_id = _component_index_by_name(compon)
    connection_by_id = {
        con.get("id"): con
        for con in raw_data.get("connections", [])
        if _connection_is_layer0(con)
    }
    max_row_id = max(tree, key=takeFirst)[0]
    valve_connections = []
    endpoint_use = Counter()

    for valve in raw_data.get("valves", []):
        con = connection_by_id.get(valve.get("connectionid"))
        if con is None:
            continue
        source_name = con.get("source", {}).get("component")
        sinks = con.get("sinks", [])
        if not source_name or not sinks:
            continue
        sink_name = sinks[0].get("component")
        if source_name not in name_to_id or sink_name not in name_to_id:
            continue
        valve_connections.append((source_name, sink_name))
        endpoint_use[source_name] += 1
        endpoint_use[sink_name] += 1

    side_votes = defaultdict(Counter)
    for source_name, sink_name in valve_connections:
        source_tree = tree[name_to_id[source_name]]
        sink_tree = tree[name_to_id[sink_name]]
        upper_row = max(source_tree[0], sink_tree[0])
        if upper_row <= 0:
            continue
        region = int(max_row_id - upper_row)
        preferred_name = (
            source_name
            if endpoint_use[source_name] <= endpoint_use[sink_name]
            else sink_name
        )
        preferred_tree = tree[name_to_id[preferred_name]]
        side = "upper" if preferred_tree[0] == upper_row else "lower"
        side_votes[region][side] += 1

    return {
        region: max(votes, key=lambda side: (votes[side], side == "upper"))
        for region, votes in side_votes.items()
    }


def valve_connection_regions(raw_data, compon, tree):
    return set(valve_connection_region_sides(raw_data, compon, tree))


def route_clearances_for_regions(num_regions, valve_region_sides, default_spacing):
    valve_spacing = VALVE_KEEP_OUT + VALVE_ROUTE_MARGIN
    opposite_spacing = max(
        default_spacing,
        VALVE_FLOW_PORT_CLEARANCE - VALVE_BEND_CLEARANCE,
        CPORT_FLOW_CHANNEL_CLEARANCE,
    )
    clearances = []
    for region in range(num_regions):
        side = valve_region_sides.get(region)
        lower = valve_spacing if side == "lower" else opposite_spacing if side else default_spacing
        upper = valve_spacing if side == "upper" else opposite_spacing if side else default_spacing
        clearances.append((lower, upper))
    return clearances


def route_spacing_for_regions(num_regions, valve_regions, default_spacing):
    valve_spacing = VALVE_KEEP_OUT + VALVE_ROUTE_MARGIN
    return [
        max(default_spacing, valve_spacing) if i in valve_regions else default_spacing
        for i in range(num_regions)
    ]


SUBGRAPH_FLOORPLAN_SPACING = 1000.0


def _json_is_layer0(item):
    if "layer" in item:
        return _layer_is(item.get("layer"), "0")
    layers = item.get("layers", [])
    if isinstance(layers, list):
        return any(_layer_is(layer, "0") for layer in layers)
    return True


def _component_display_size(component):
    x_span = float(component.get("x-span", component.get("params", {}).get("width", 0.0)))
    y_span = float(component.get("y-span", component.get("params", {}).get("length", 0.0)))
    rotation = int(float(component.get("params", {}).get("rotation", 0.0))) % 360
    if rotation in (90, 270):
        return y_span, x_span
    return x_span, y_span


def _component_rect_for_floorplan(component):
    pos = component.get("params", {}).get("position", [-1, -1])
    if pos[0] < 0 or pos[1] < 0:
        return None
    w, h = _component_display_size(component)
    x = float(pos[0])
    y = float(pos[1])
    return (x, y, x + w, y + h)


def _connection_waypoints(connection):
    params = connection.get("params", {})
    wps = params.get("wayPoints", [])
    if len(wps) >= 2 and wps[0] != [-1, -1]:
        return [[float(p[0]), float(p[1])] for p in wps if len(p) >= 2 and p[0] >= 0 and p[1] >= 0]

    segs = params.get("segments", [])
    if not segs or segs[0][0] == [-1, -1]:
        return []
    out = [[float(segs[0][0][0]), float(segs[0][0][1])]]
    for seg in segs:
        if seg[1][0] >= 0 and seg[1][1] >= 0:
            out.append([float(seg[1][0]), float(seg[1][1])])
    return out


def _write_connection_waypoints(connection, waypoints):
    connection.setdefault("params", {})
    connection["params"]["wayPoints"] = waypoints
    if waypoints:
        connection["params"]["start"] = waypoints[0]
        connection["params"]["end"] = waypoints[-1]
        connection["params"]["segments"] = [[waypoints[i], waypoints[i + 1]] for i in range(len(waypoints) - 1)]
    for path in connection.get("paths", []):
        path["wayPoints"] = waypoints


def _rewrite_connection_params_from_paths(connection):
    paths = connection.get("paths", [])
    if paths and paths[0].get("wayPoints"):
        waypoints = paths[0]["wayPoints"]
        connection.setdefault("params", {})
        connection["params"]["wayPoints"] = waypoints
        connection["params"]["start"] = waypoints[0]
        connection["params"]["end"] = waypoints[-1]
        connection["params"]["segments"] = [[waypoints[i], waypoints[i + 1]] for i in range(len(waypoints) - 1)]


def visualize_final_layer0(data, output_png):
    """Render the final layer-0 JSON after disconnected-subgraph floorplanning."""
    fig, ax = plt.subplots(figsize=(8, 6))
    xmin = ymin = float("inf")
    xmax = ymax = float("-inf")

    for component in data.get("components", []):
        if not _json_is_layer0(component):
            continue
        rect = _component_rect_for_floorplan(component)
        if rect is None:
            continue
        x0, y0, x1, y1 = rect
        ax.add_patch(Rectangle((x0, y0), x1 - x0, y1 - y0, edgecolor="blue", facecolor="none", linewidth=0.5))
        xmin, ymin = min(xmin, x0), min(ymin, y0)
        xmax, ymax = max(xmax, x1), max(ymax, y1)

    for connection in data.get("connections", []):
        if not _json_is_layer0(connection):
            continue
        waypoints = _connection_waypoints(connection)
        if len(waypoints) < 2:
            continue
        xs = [point[0] for point in waypoints]
        ys = [point[1] for point in waypoints]
        ax.plot(xs, ys, color="red", linewidth=0.5)
        ax.scatter((xs[0], xs[-1]), (ys[0], ys[-1]), color="red", s=4)
        xmin, ymin = min(xmin, min(xs)), min(ymin, min(ys))
        xmax, ymax = max(xmax, max(xs)), max(ymax, max(ys))

    if xmin < xmax and ymin < ymax:
        margin = max(300.0, 0.02 * max(xmax - xmin, ymax - ymin))
        ax.set_xlim(xmin - margin, xmax + margin)
        ax.set_ylim(ymin - margin, ymax + margin)
    ax.set_aspect("equal", adjustable="box")
    ax.grid(False)
    fig.tight_layout()
    fig.savefig(output_png, dpi=100)
    plt.close(fig)


def _transform_local_point(point, bounds, rotation):
    min_x, min_y, max_x, max_y = bounds
    x = float(point[0]) - min_x
    y = float(point[1]) - min_y
    width = max_x - min_x
    height = max_y - min_y

    if rotation == 0:
        return [x, y]
    if rotation == 90:
        return [height - y, x]
    if rotation == 180:
        return [width - x, height - y]
    if rotation == 270:
        return [y, width - x]
    return [x, y]


def _transform_rect(rect, bounds, target_x, target_y, rotation):
    corners = [
        [rect[0], rect[1]],
        [rect[0], rect[3]],
        [rect[2], rect[1]],
        [rect[2], rect[3]],
    ]
    transformed = [_transform_local_point(point, bounds, rotation) for point in corners]
    xs = [target_x + point[0] for point in transformed]
    ys = [target_y + point[1] for point in transformed]
    return (min(xs), min(ys), max(xs), max(ys))


def _rotated_bounds_size(bounds, rotation):
    width = bounds[2] - bounds[0]
    height = bounds[3] - bounds[1]
    if rotation in (90, 270):
        return height, width
    return width, height


def _rects_overlap(a, b):
    return a[0] < b[2] and a[2] > b[0] and a[1] < b[3] and a[3] > b[1]


def _rotation_preserves_internal_spacing(rects, bounds, rotation):
    transformed = [_transform_rect(rect, bounds, 0.0, 0.0, rotation) for rect in rects]
    for i in range(len(transformed)):
        for j in range(i + 1, len(transformed)):
            if _rects_overlap(transformed[i], transformed[j]):
                return False
    return True


def _point_in_rect(point, rect, tol=1e-6):
    return (
        rect[0] - tol <= point[0] <= rect[2] + tol
        and rect[1] - tol <= point[1] <= rect[3] + tol
    )


def _rotation_preserves_internal_connections(data, group_ids, components_by_id, bounds, rotation):
    transformed_rect_by_id = {}
    for cid in group_ids:
        rect = _component_rect_for_floorplan(components_by_id[cid])
        if rect is None:
            continue
        transformed_rect_by_id[cid] = _transform_rect(rect, bounds, 0.0, 0.0, rotation)

    def transformed_point(point):
        local = _transform_local_point(point, bounds, rotation)
        return [local[0], local[1]]

    def path_endpoints(connection):
        paths = connection.get("paths", [])
        if paths:
            for path in paths:
                waypoints = path.get("wayPoints", [])
                if len(waypoints) >= 2:
                    yield path.get("source", connection.get("source", {})), path.get("sink", {}), waypoints[0], waypoints[-1]
            return

        waypoints = _connection_waypoints(connection)
        sinks = connection.get("sinks", [])
        if len(waypoints) >= 2 and sinks:
            yield connection.get("source", {}), sinks[0], waypoints[0], waypoints[-1]

    for connection in data.get("connections", []):
        if not _json_is_layer0(connection):
            continue
        for source, sink, start, end in path_endpoints(connection):
            source_id = source.get("component")
            sink_id = sink.get("component")
            if source_id not in group_ids or sink_id not in group_ids:
                continue
            source_rect = transformed_rect_by_id.get(source_id)
            sink_rect = transformed_rect_by_id.get(sink_id)
            if source_rect is None or sink_rect is None:
                continue
            if not _point_in_rect(transformed_point(start), source_rect):
                return False
            if not _point_in_rect(transformed_point(end), sink_rect):
                return False
    return True


def _pack_subgraph_blocks(blocks, spacing=SUBGRAPH_FLOORPLAN_SPACING):
    placed = []
    order = sorted(range(len(blocks)), key=lambda idx: blocks[idx]["area"], reverse=True)

    for idx in order:
        block = blocks[idx]
        xs = {0.0}
        ys = {0.0}
        for placed_block in placed:
            xs.add(placed_block["rect"][2] + spacing)
            ys.add(placed_block["rect"][3] + spacing)
        candidates = [(x, y) for x in xs for y in ys]

        best = None
        for rotation in block.get("allowed_rotations", (0, 90)):
            width, height = _rotated_bounds_size(block["bounds"], rotation)
            for x, y in candidates:
                rect = (x, y, x + width, y + height)
                if any(_rects_overlap(rect, placed_block["rect"]) for placed_block in placed):
                    continue
                all_rects = [p["rect"] for p in placed] + [rect]
                min_x = min(r[0] for r in all_rects)
                min_y = min(r[1] for r in all_rects)
                max_x = max(r[2] for r in all_rects)
                max_y = max(r[3] for r in all_rects)
                layout_w = max_x - min_x
                layout_h = max_y - min_y
                area = layout_w * layout_h
                aspect_ratio = max(layout_w / max(layout_h, 1.0), layout_h / max(layout_w, 1.0))
                # Area is the primary objective. Other metrics only break ties.
                score = (area, max(layout_w, layout_h), aspect_ratio, y, x, rotation)
                if best is None or score < best["score"]:
                    best = {"idx": idx, "rotation": rotation, "rect": rect, "score": score}

        if best is None:
            width, height = _rotated_bounds_size(block["bounds"], 0)
            x = max((p["rect"][2] for p in placed), default=0.0) + spacing
            best = {"idx": idx, "rotation": 0, "rect": (x, 0.0, x + width, height), "score": (float("inf"),)}
        placed.append(best)

    return {p["idx"]: p for p in placed}


def compact_disconnected_layer0_subgraphs(data):
    components = data.get("components", [])
    layer0_ids = {c.get("id") for c in components if _json_is_layer0(c)}
    if len(layer0_ids) <= 1:
        return data

    components_by_id = {c.get("id"): c for c in components}
    rect_by_component = {
        cid: rect
        for cid in layer0_ids
        if (rect := _component_rect_for_floorplan(components_by_id[cid])) is not None
    }

    def components_at_point(point):
        return {
            cid
            for cid, rect in rect_by_component.items()
            if _point_in_rect(point, rect)
        }

    graph = {component_id: set() for component_id in layer0_ids}
    for connection in data.get("connections", []):
        if not _json_is_layer0(connection):
            continue
        touched = set()
        source = connection.get("source", {}).get("component")
        sinks = connection.get("sinks", [])
        if source in layer0_ids:
            touched.add(source)
        for sink in sinks:
            target = sink.get("component")
            if target in layer0_ids:
                touched.add(target)

        for path in connection.get("paths", []) or []:
            waypoints = path.get("wayPoints", [])
            if len(waypoints) >= 2:
                for point in waypoints:
                    touched.update(components_at_point(point))

        waypoints = _connection_waypoints(connection)
        if len(waypoints) >= 2:
            for point in waypoints:
                touched.update(components_at_point(point))

        touched = [cid for cid in touched if cid in layer0_ids]
        for i in range(len(touched)):
            for j in range(i + 1, len(touched)):
                graph[touched[i]].add(touched[j])
                graph[touched[j]].add(touched[i])

    seen = set()
    subgraphs = []
    for component_id in sorted(layer0_ids):
        if component_id in seen:
            continue
        queue = deque([component_id])
        seen.add(component_id)
        group = []
        while queue:
            current = queue.popleft()
            group.append(current)
            for neighbor in graph[current]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    queue.append(neighbor)
        rects = [
            rect
            for cid in group
            if (rect := _component_rect_for_floorplan(components_by_id[cid])) is not None
        ]
        if not rects:
            continue
        bounds = (
            min(r[0] for r in rects),
            min(r[1] for r in rects),
            max(r[2] for r in rects),
            max(r[3] for r in rects),
        )
        allowed_rotations = [0]
        if (
            _rotation_preserves_internal_spacing(rects, bounds, 90)
            and _rotation_preserves_internal_connections(data, set(group), components_by_id, bounds, 90)
        ):
            allowed_rotations.append(90)
        subgraphs.append(
            {
                "ids": set(group),
                "bounds": bounds,
                "area": (bounds[2] - bounds[0]) * (bounds[3] - bounds[1]),
                "allowed_rotations": tuple(allowed_rotations),
            }
        )

    if len(subgraphs) <= 1:
        return data

    placements = _pack_subgraph_blocks(subgraphs)
    original_rect_by_component = {
        comp.get("id"): _component_rect_for_floorplan(comp)
        for comp in components
        if _json_is_layer0(comp)
    }
    original_rotation_by_component = {
        comp.get("id"): int(float(comp.get("params", {}).get("rotation", 0.0))) % 360
        for comp in components
        if _json_is_layer0(comp)
    }
    transform_by_component = {}
    for idx, subgraph in enumerate(subgraphs):
        placement = placements[idx]
        target_x, target_y = placement["rect"][0], placement["rect"][1]
        rotation = placement["rotation"]
        for cid in subgraph["ids"]:
            transform_by_component[cid] = (subgraph["bounds"], target_x, target_y, rotation)

    for cid, (bounds, target_x, target_y, rotation) in transform_by_component.items():
        comp = components_by_id[cid]
        rect = original_rect_by_component.get(cid)
        if rect is None:
            continue
        transformed_rect = _transform_rect(rect, bounds, target_x, target_y, rotation)
        comp.setdefault("params", {}).setdefault("position", [-1, -1])
        comp["params"]["position"] = [transformed_rect[0], transformed_rect[1]]
        comp["params"]["rotation"] = (original_rotation_by_component.get(cid, 0) + rotation) % 360

    for connection in data.get("connections", []):
        if not _json_is_layer0(connection):
            continue
        source = connection.get("source", {}).get("component")
        sinks = connection.get("sinks", [])
        if source not in transform_by_component or not sinks:
            continue
        # Only transform internal routes; cross-subgraph routes are left as-is.
        if any(sink.get("component") not in transform_by_component for sink in sinks):
            continue
        source_transform = transform_by_component[source]
        if any(transform_by_component[sink.get("component")] != source_transform for sink in sinks):
            continue
        bounds, target_x, target_y, rotation = source_transform
        transformed_any_path = False
        for path in connection.get("paths", []):
            waypoints = path.get("wayPoints", [])
            if not waypoints:
                continue
            new_waypoints = []
            for point in waypoints:
                local = _transform_local_point(point, bounds, rotation)
                new_waypoints.append([target_x + local[0], target_y + local[1]])
            path["wayPoints"] = new_waypoints
            transformed_any_path = True

        if transformed_any_path:
            _rewrite_connection_params_from_paths(connection)
        else:
            waypoints = _connection_waypoints(connection)
            if not waypoints:
                continue
            new_waypoints = []
            for point in waypoints:
                local = _transform_local_point(point, bounds, rotation)
                new_waypoints.append([target_x + local[0], target_y + local[1]])
            _write_connection_waypoints(connection, new_waypoints)

    rects = [_component_rect_for_floorplan(c) for c in components if _json_is_layer0(c)]
    rects = [r for r in rects if r is not None]
    if rects:
        min_x = min(r[0] for r in rects)
        min_y = min(r[1] for r in rects)
        if min_x != 0.0 or min_y != 0.0:
            for comp in components:
                if not _json_is_layer0(comp):
                    continue
                pos = comp.get("params", {}).get("position", [-1, -1])
                if pos[0] >= 0 and pos[1] >= 0:
                    comp["params"]["position"] = [float(pos[0]) - min_x, float(pos[1]) - min_y]
            for connection in data.get("connections", []):
                if not _json_is_layer0(connection):
                    continue
                shifted_any_path = False
                for path in connection.get("paths", []):
                    waypoints = path.get("wayPoints", [])
                    if not waypoints:
                        continue
                    path["wayPoints"] = [[float(p[0]) - min_x, float(p[1]) - min_y] for p in waypoints]
                    shifted_any_path = True
                if shifted_any_path:
                    _rewrite_connection_params_from_paths(connection)
                else:
                    waypoints = _connection_waypoints(connection)
                    if waypoints:
                        _write_connection_waypoints(connection, [[p[0] - min_x, p[1] - min_y] for p in waypoints])

        rects = [_component_rect_for_floorplan(c) for c in components if _json_is_layer0(c)]
        rects = [r for r in rects if r is not None]
        data.setdefault("params", {})
        data["params"]["x-span"] = max(r[2] for r in rects)
        data["params"]["y-span"] = max(r[3] for r in rects)
        data["params"]["length"] = max(data["params"]["x-span"], data["params"]["y-span"])

    print(f"Compacted {len(subgraphs)} disconnected layer-0 subgraph(s).")
    return data




def gen_PR_nofig(FILENAME):
    # this version needs all netlist being placed under ./testcase/netlist
    # results only have a json and a final PR figure
    # results are put in ./testcase/results

    # clear ./tmp to reserve space for the storage of cluster information
    shutil.rmtree('./tmp')  
    os.mkdir('./tmp')  

    linwid=0.5
    # the test case should be saved at './dx/FILENAME', consisting two files: tree.json, and connection.csv
    # generate blocks and relative positions
    # connectionadd='./Benchmarks/'+CATEGORY+'/'+FILENAME+'/connection.csv'
    componadd='./testcase/netlist/'+FILENAME+'.json'
    treeadd='./dx/tree/'+FILENAME+'/tree.json'
    jsonfile=readjson(componadd)
    cluster=gen_graph(jsonfile,treeadd) # create the tree.json file, which contains the original row information
    
    compon,port=readcompon(componadd)
    tree,max_row=readtree(treeadd,compon)

    for i in range(len(cluster)):
        gen_files_each_cluster(i,cluster[i],jsonfile,tree)
        gen_PR_each_cluster(i)

    # 9.3 need to load the PR of each cluster from ./tmp, and merge to a whole json file
    # need to determine the floorplan of all the clusters
    # need to map the floorplan result to the actual location of blocks in each cluster
    # need to map the whole result to 3duf

    print("done")



def gen_PR_developing(CATEGORY, FILENAME):
    # this version requires all testcase being put under one case folder under ./dx
    # results have figures
    # results are put in a floder under the case folder
    ##################################### MAIN #######################################
    ### inidicate test case
    linwid=0.5
    pad=0
    if_opt=0
    # the test case should be saved at './dx/FILENAME', consisting two files: tree.json, and connection.csv
    # generate blocks and relative positions
    # connectionadd='./Benchmarks/'+CATEGORY+'/'+FILENAME+'/connection.csv'
    componadd='./Benchmarks/'+CATEGORY+'/'+FILENAME+'/'+FILENAME+'.json'
    if not os.path.exists('./Benchmarks/'+CATEGORY+'/'+FILENAME):
        os.makedirs('./Benchmarks/'+CATEGORY+'/'+FILENAME)

    treeadd='./Benchmarks/'+CATEGORY+'/'+FILENAME+'/tree.json'
    jsonfile=readjson(componadd)
    cluster=gen_graph(jsonfile,treeadd) # create the tree.json file, which contains the original row information

    if not os.path.exists('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result'):
        os.makedirs('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result')

    compon,port=readcompon(componadd)

    tree,max_row=readtree(treeadd,compon)
    tree.sort(key=takeThird) # sort using the index element, which is tree[2]
    connection=[] # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    connection=readconnection_with_rotation(componadd,compon,tree)
    print("Finish loading test case:",FILENAME)

    ## initial placement
    start=time.time()
    ver_dis=5000 # reserve this between adjacent rows to ease routing
    hor_dis=2000 # reserve this between blocks horizontally
    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    # print(R)
    # print(L)
    # print(B)
    end=time.time()
    t1=end-start

    plt.cla()
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/1_ori_result_ini.png')
    # plt.show()

    print("1/9, Finish initial placement, time spent:",t1,"s")

    ## initial placement with rotation
    start=time.time()
    decide_rotation(compon,tree,port,connection)
    ver_dis=5000 # reserve this between adjacent rows to ease routing
    hor_dis=2000 # reserve this between blocks horizontally
    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    end=time.time()
    t2=end-start

    plt.cla()
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/2_ori_result_ini_with_rotation.png')
    # plt.show()

    print("2/9, Finish initial placement with rotation, time spent:",t2,"s")

    # make symetrical
    plt.cla()
    start=time.time()
    mid_x,max_rowid=make_symetric(L,B)
    end=time.time()
    t3=end-start

    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/3_ori_result_sym.png')
    # plt.show()
    print("3/9, Finish symmetricalization, time spent:",t3,"s")


    # generate connections between blocks (still for test case) # starts backwards
    # for i in range(len(connection)):
    #     for j in range(len(connection[i])):
    #         connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+0.5*B[-i-1][int(connection[i][j][2])][0]
    #         connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+0.5*B[-i-2][int(connection[i][j][3])][0]

    # print(connection)
    for i in range(len(connection)):
        for j in range(len(connection[i])):
            # the up one
            if compon[R[-i-1][int(connection[i][j][2])][2]][-1]:
                # mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            else:
                # no mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            

            # the low one
            if compon[R[-i-2][int(connection[i][j][3])][2]][-1]:
                # mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
        
            else:
                # no mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]

    ## initial routing and draw
    start=time.time()
    channel_spacing=500
    routes=[]
    heights=[]
    for i in range(len(connection)):
        y_loc, height=row_route(connection[i],channel_spacing)
        # y_loc records the relative y-axis positions of routes
        routes.append(y_loc)
        heights.append(height)
    end=time.time()
    t4=end-start

    plt.cla()
    for i in range(len(connection)):
        for j in range(len(routes[i])):
            plt.plot([connection[i][j][0],connection[i][j][1]],[L[-i-1][0][1]-routes[i][j],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
        

    # redraw the symetric placement
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

            # plt.savefig('result_sym_&_route.png')
            # time.sleep(0.1)
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/4_ori_result_sym_&_route.png')
    # plt.show()
    print("4/9, Finish routing, time spent:",t4,"s")


    ###################### reordering ####################################
    start=time.time()
    relation=gen_port_relation(tree,B,port)
    # print("relation:",relation)

    inrow_rela=gen_inrow_relation(R,connection,relation)

    # print(connection)
    # print(inrow_rela)
    print('****************************************************')
    new_order=reorder(R,connection,inrow_rela)

    if new_order!=[]:
        print("New valid order that can lead to planar graph found:")
        print(new_order)
    else:
        print("Fail to find valid order, please check the design")
        return
    print('****************************************************')

    apply_new_order(tree,new_order)
    tree.sort(key=takeThird)

    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    connection=[] # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    connection=readconnection_with_rotation(componadd,compon,tree) # update connection
    print("--Finish applying new order")

    gen_mirror(compon,R,connection,relation)
    print("--Finish mirroring related components")
    end=time.time()

    plt.cla()
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/5_result_ini.png')
    t5=end-start
    print("5/9, Finish initialization of new orders, time spent:",t5,"s")

    ####################################################################


    ## make symetrical
    # plt.cla()
    # start=time.time()
    # make_symetric(L,B)
    # end=time.time()
    # t6=end-start

    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/6_result_sym.png')
    # # plt.show()
    # print("6/9, Finish symmetricalization, time spent:",t6,"s")


    # 2024.6.16 new stage 6, adjust placement to shorten wirelength
    plt.cla()
    start=time.time()
    ######################################################################## 2024.6.16 add new codes here
    mid_x,max_rowid=make_symetric(L,B) ####################### 6.18 this needs to be revised to pick the row whose ports are the widest

    # print(max_rowid)
    # go down
    for i in range(max_rowid):
        idupdated_l=[]
        idupdated_r=[]
        flag_l_r=0 # 0 for left, 1 for right
        midid=m.floor((len(R[max_rowid-1-i])-1)/2)
        currowid=max_rowid-1-i
        formerrela=get_connect_rela(currowid,R,connection,1)
        for j in range(len(R[max_rowid-1-i])):
            if flag_l_r==0:
            # go left
                id=midid-len(idupdated_l)
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,1) # can1 for port alignment
                
                if idupdated_l==[]:
                    can2=L[currowid][id][0] # can2 for legalization
                else:
                    can2=L[currowid][idupdated_l[-1]][0]-hor_dis-B[currowid][id][0]

                if idupdated_l==[]:
                    if can1!=999999999999:
                        L[currowid][id][0]=can1
                    else:
                        L[currowid][id][0]=can2
                else:
                    if can1+hor_dis+B[currowid][id][0]>=L[currowid][idupdated_l[-1]][0]:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_l.append(id)



            else:
            # go right
                id=midid+len(idupdated_r)+1
                # two choices, if can1 fails, go to can2

                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,1) # can1 for port alignment
                # if can1==999999999999: # this means this device is constraint free from the former row in the current direction
                #     formerrela[id]=formerrela=get_connect_rela(currowid,R,connection,0) # find new relation in the reverse direction
                #     can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0)

                if idupdated_r==[]:
                    can2=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis # can2 for legalization
                else:
                    can2=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis

                if idupdated_r==[]:
                    if can1<=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis or can1==999999999999:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1
                else:
                    if can1<=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis or can1==999999999999: # 25.8.17 bug fixed
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_r.append(id)

            flag_l_r=1-flag_l_r # turn to the other side


    # go up    
    for i in range(len(R)-1-max_rowid):
        # go left
        # go right
        idupdated_l=[]
        idupdated_r=[]
        flag_l_r=0 # 0 for left, 1 for right
        currowid=max_rowid+1+i
        midid=m.floor((len(R[max_rowid+1+i])-1)/2)
        formerrela=get_connect_rela(currowid,R,connection,0)
        for j in range(len(R[max_rowid+1+i])):
            if flag_l_r==0:
            # go left
                id=midid-len(idupdated_l)
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0) # can1 for port alignment
                
                if idupdated_l==[]:
                    can2=L[currowid][id][0] # can2 for legalization
                else:
                    can2=L[currowid][idupdated_l[-1]][0]-hor_dis-B[currowid][id][0]

                if idupdated_l==[]:
                    if can1!=999999999999:
                        L[currowid][id][0]=can1
                    else:
                        L[currowid][id][0]=can2
                else:
                    if can1+hor_dis+B[currowid][id][0]>=L[currowid][idupdated_l[-1]][0]:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_l.append(id)


            else:
            # go right
                id=midid+len(idupdated_r)+1
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0) # can1 for port alignment
                
                if idupdated_r==[]:
                    can2=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis # can2 for legalization
                else:
                    can2=L[currowid][idupdated_r[0]][0]+B[currowid][idupdated_r[0]][0]+hor_dis

                if idupdated_r==[]:
                    if can1<=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis or can1==999999999999:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1
                else:
                    if can1<=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_r.append(id)


            flag_l_r=1-flag_l_r # turn to the other side

    ######################################################################## 
    end=time.time()
    t6=end-start

    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/6_result_shorten.png')
    # plt.show()
    print("6/9, Finish shortening wirelength, time spent:",t6,"s")



    if if_opt:
        # Optional stage, LP for optimized placement
        cur_max_x = float('-inf')
        for i in range(len(L)):
            for j in range(len(L[i])):
                if L[i][j][0] > cur_max_x:
                    cur_max_x = L[i][j][0]

        start=time.time()
        opt_result=LP_opt(compon, R, B, L, port, connection, hor_dis, cur_max_x)
        end=time.time()
        t7=end-start

        plt.cla()
        for i in range(len(L)):
            for j in range(len(L[i])):
                draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
                for k in range(len(port[R[i][j][2]])):
                    plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
                
        plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/7_opt_placement.png')

        print("Conduct stage7 LP according to user's need")
        print("7/9, Finish LP-based relocation, time spent:",t7,"s")
    else:
        t7=0
        print("Skip stage7 LP according to user's need")














    ### double check if there are components exceeding boundaries ###
    ### also the xspan and yspan value ###
    offsetx=0
    offsety=0
    xspan=0
    yspan=0
    for i in range(len(R)):
        for j in range(len(R[i])):
            offsetx=max(offsetx,-L[i][j][0])
            offsety=max(offsety,-L[i][j][1])
            xspan=max(xspan,L[i][j][0]+B[i][j][0])
            yspan=max(yspan,L[i][j][1]+B[i][j][1])

    for i in range(len(R)):
        for j in range(len(R[i])):
            L[i][j][0]+=offsetx
            L[i][j][1]+=offsety


    xspan+=offsetx
    yspan+=offsety

    # generate connections between blocks (still for test case) # starts backwards
    # for i in range(len(connection)):
    #     for j in range(len(connection[i])):
    #         connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+0.5*B[-i-1][int(connection[i][j][2])][0]
    #         connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+0.5*B[-i-2][int(connection[i][j][3])][0]

    # print(connection)
    for i in range(len(connection)):
        for j in range(len(connection[i])):
            # the up one
            if compon[R[-i-1][int(connection[i][j][2])][2]][-1]:
                # mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            else:
                # no mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            

            # the low one
            if compon[R[-i-2][int(connection[i][j][3])][2]][-1]:
                # mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
        
            else:
                # no mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]

    ## initial routing and draw
    start=time.time()
    channel_spacing=500
    valve_region_sides=valve_connection_region_sides(readjson_raw(componadd),compon,tree)
    route_clearances=route_clearances_for_regions(len(connection),valve_region_sides,channel_spacing)
    routes=[]
    heights=[]
    for i in range(len(connection)):
        y_loc, height=row_route(connection[i],channel_spacing)
        # y_loc records the relative y-axis positions of routes
        routes.append(y_loc)
        heights.append(height)
    end=time.time()
    t8=end-start

    plt.cla()
    for i in range(len(connection)):
        for j in range(len(routes[i])):
            plt.plot([connection[i][j][0],connection[i][j][1]],[L[-i-1][0][1]-routes[i][j],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
        

    # redraw the symetric placement
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

            # plt.savefig('result_sym_&_route.png')
            # time.sleep(0.1)
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/8_result_sym_&_route.png')
    # plt.show()
    print("8/9, Finish routing, time spent:",t8,"s")


    ## make compact
    # regard the routes between different rows as one piece
    # need to add a channel_spacing to all the blocks below routes 2023.10.16
    # compact(R,L,B) # is actially compact down
    start=time.time()
    y_new=compact_new(R,L,B,connection,routes,heights,route_clearances)

    plt.cla()
    for i in range(len(L)):
        for j in range(len(L[i])):
            draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1]) # draw the blocks
            for k in range(len(port[R[i][j][2]])):
                plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    # NOTICE: routes,heights,connection have reversed orders than R, and y_new is reversed from routes, so the drawing here is different from in the previous step.
            
    for i in range(len(connection)):
        for j in range(len(y_new[-1-i])):
            plt.plot([connection[i][j][0],connection[i][j][1]],[y_new[-1-i][j],y_new[-1-i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],y_new[-1-i][j]],'r',linewidth=linwid)
            plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],y_new[-1-i][j]],'r',linewidth=linwid)

    ## connect the ports to the boundaries
    for i in range(len(connection)):
        for j in range(len(y_new[-1-i])):
            # the upper block
            # [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
            match (R[len(R)-1-i][connection[i][j][2]][3] % 360):
                case 0:
                    plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][1]],'r',linewidth=linwid)

                case 90:
                    plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+(compon[R[len(R)-1-i][connection[i][j][2]][2]][1]-port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][0])],'r',linewidth=linwid)

                case 180:
                    plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+(compon[R[len(R)-1-i][connection[i][j][2]][2]][2]-port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][1])],'r',linewidth=linwid)

                case 270:        
                    plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][0]],'r',linewidth=linwid)
            
            # the lower block
            match (R[len(R)-2-i][connection[i][j][3]][3] % 360):
                case 0:
                    plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][1]],'r',linewidth=linwid)

                case 90:
                    plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+(compon[R[len(R)-2-i][connection[i][j][3]][2]][1]-port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][0])],'r',linewidth=linwid)

                case 180:
                    plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+(compon[R[len(R)-2-i][connection[i][j][3]][2]][2]-port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][1])],'r',linewidth=linwid)

                case 270:        
                    plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][0]],'r',linewidth=linwid)
    end=time.time()
    t9=end-start
    # plt.show()
    plt.savefig('./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/9_result_sym_compact_final.png')

    print("9/9, Finish compaction and connecting ports, time spent:",t9,"s")
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All P&R Done >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    print("Total Timeusage:",t1+t2+t3+t4+t5+t6+t7+t8+t9,"s")
    print("Reordering Timeusage:",t5,"s")
    print("LP-based Optimization Timeusage:",t7,"s")
    print("P&R for the new orders:",t5+t6+t7+t8+t9,"s")

    ### double check if there are components exceeding boundaries ###
    ### also the xspan and yspan value ###
    offsetx=0
    offsety=0
    xspan=0
    yspan=0
    for i in range(len(R)):
        for j in range(len(R[i])):
            offsetx=max(offsetx,-L[i][j][0])
            offsety=max(offsety,-L[i][j][1])
            xspan=max(xspan,L[i][j][0]+B[i][j][0])
            yspan=max(yspan,L[i][j][1]+B[i][j][1])

    for i in range(len(R)):
        for j in range(len(R[i])):
            L[i][j][0]+=offsetx+pad
            L[i][j][1]+=offsety+pad


    xspan+=offsetx
    yspan+=offsety

    xspan+=2*pad
    yspan+=2*pad


    # write to json
    orifile=readjson_raw(componadd)
    # generate the DATA for updatecomponents
    # name=R data[1-2]=L data[3]=R
    orifile["params"]["x-span"]=xspan
    orifile["params"]["y-span"]=yspan

    ### compon_new contains different information than compon, just for the convinence of output ###
    compon_new=[]
    for i in range(len(tree)):
        compon_new.append([compon[tree[i][2]][3],L[tree[i][0]][tree[i][1]][0],L[tree[i][0]][tree[i][1]][1],R[tree[i][0]][tree[i][1]][3],compon[tree[i][2]][-1]])
    updatecomponents(orifile,compon_new)
    updateconnections(orifile,connection,y_new,R,L,B,tree,compon,port)
    orifile=compact_disconnected_layer0_subgraphs(orifile)
    visualize_final_layer0(
        orifile,
        './Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/9_result_sym_compact_final.png',
    )
    if "IsPlacedAndRouted" in orifile:
        orifile["IsPlacedAndRouted"] = True
        save_to_json(orifile,'./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/result.json')
    else:
        tmp_file=list(orifile.items())
        tmp_file.insert(1,("IsPlacedAndRouted",True))
        newfile=dict(tmp_file)
        save_to_json(newfile,'./Benchmarks/'+CATEGORY+'/'+FILENAME+'/result/result.json')



    ### 2025.2.20 for raw result without mapping ###
    # nx_max,ny_max=map_for_3duf(orifile)
    # orifile["params"]["x-span"]=nx_max
    # orifile["params"]["y-span"]=ny_max

    print("Please check the results under \"./Benchmarks/"+CATEGORY+"/"+FILENAME+"/result\"")



if __name__=="__main__":
    # case3=["device1_scRNA_seq","device2_artificial_cells","device4_molecular_diagnostics","device5_bacteria_diagnostics"]
    # gen_PR_developing("LiteratureReviewBenchmarks",case3[3])

    gen_PR_developing("case_control", "flow_and_control_demo_fromLFR")


    # new_files=["device1_scRNA_seq","device2_artificial_cells","device6_organic_chemical_synthesis"]
    # filename="flow_focus"
    # gen_PR_developing(filename)

