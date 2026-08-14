import argparse
import copy
import heapq
import json
import math
import os
from typing import Dict, List, Tuple

import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

from design_rules import (
    CPORT_CPORT_CLEARANCE,
    CPORT_DEVICE_CLEARANCE,
    CPORT_FLOW_CHANNEL_CLEARANCE,
    CPORT_FLOW_PORT_CLEARANCE,
    CPORT_VALVE_CLEARANCE,
    VALVE_BEND_CLEARANCE,
    VALVE_FLOW_PORT_CLEARANCE,
    VALVE_SIZE,
)


PORT_SIZE = 1400.0
PORT_GAP = 1000.0
GRID_STEP = 100.0
ROUTE_CLEARANCE = 100.0
DEVICE_CLEARANCE = CPORT_CPORT_CLEARANCE
ROUTE_DEVICE_CLEARANCE = 100.0
VALVE_DEVICE_CLEARANCE = 100.0
VALVE_ROUTE_CLEARANCE = 0.0
CONTROL_TRACK_PITCH = 500.0
DIRS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def load_json(path: str) -> Dict:
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_json(path: str, data: Dict) -> None:
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)


def is_layer(comp_or_conn: Dict, layer_id: str) -> bool:
    if "layer" in comp_or_conn:
        return str(comp_or_conn.get("layer")) == layer_id
    layers = comp_or_conn.get("layers", [])
    if isinstance(layers, list):
        return any(str(x) == layer_id for x in layers)
    return False


def get_layer0_port_obstacles(data: Dict) -> List[Tuple[float, float, float, float]]:
    obstacles = []
    for comp in data.get("components", []):
        if comp.get("entity") == "PORT" and is_layer(comp, "0"):
            rect = component_rect(comp)
            if rect is not None:
                obstacles.append(rect)
    return obstacles


def component_rect(comp: Dict) -> Tuple[float, float, float, float] | None:
    pos = comp.get("params", {}).get("position", [-1, -1])
    if pos[0] == -1 and pos[1] == -1:
        return None

    x = float(pos[0])
    y = float(pos[1])
    x_span = float(comp.get("x-span", comp.get("params", {}).get("width", PORT_SIZE)))
    y_span = float(comp.get("y-span", comp.get("params", {}).get("length", PORT_SIZE)))
    rotation = int(float(comp.get("params", {}).get("rotation", 0.0))) % 360
    if rotation in (90, 270):
        x_span, y_span = y_span, x_span
    return (x, y, x + x_span, y + y_span)


def layer0_component_obstacles(data: Dict) -> List[Tuple[float, float, float, float]]:
    obstacles = []
    for comp in data.get("components", []):
        if not is_layer(comp, "0"):
            continue
        rect = component_rect(comp)
        if rect is not None:
            obstacles.append(rect)
    return obstacles


def layer0_non_port_component_obstacles(data: Dict) -> List[Tuple[float, float, float, float]]:
    obstacles = []
    for comp in data.get("components", []):
        if not is_layer(comp, "0") or comp.get("entity") == "PORT":
            continue
        rect = component_rect(comp)
        if rect is not None:
            obstacles.append(rect)
    return obstacles


def placed_component_bounds(data: Dict) -> Tuple[float, float, float, float]:
    rects = [rect for comp in data.get("components", []) if (rect := component_rect(comp)) is not None and is_layer(comp, "0")]
    if not rects:
        x_span = float(data.get("params", {}).get("x-span", 0.0))
        y_span = float(data.get("params", {}).get("y-span", 0.0))
        return (0.0, 0.0, x_span, y_span)
    return (
        min(r[0] for r in rects),
        min(r[1] for r in rects),
        max(r[2] for r in rects),
        max(r[3] for r in rects),
    )


def component_by_id(data: Dict) -> Dict[str, Dict]:
    return {c.get("id"): c for c in data.get("components", [])}


def connection_by_id(data: Dict) -> Dict[str, Dict]:
    return {c.get("id"): c for c in data.get("connections", [])}


def get_connection_waypoints(connection: Dict) -> List[List[float]]:
    params = connection.get("params", {})
    wps = params.get("wayPoints", [])
    if len(wps) >= 2:
        return [[float(p[0]), float(p[1])] for p in wps if len(p) >= 2]

    segs = params.get("segments", [])
    if not segs:
        return []

    out = [[float(segs[0][0][0]), float(segs[0][0][1])]]
    for seg in segs:
        out.append([float(seg[1][0]), float(seg[1][1])])
    return out


def get_connection_segments(connection: Dict) -> List[Tuple[List[float], List[float]]]:
    wps = get_connection_waypoints(connection)
    segments = []
    for i in range(len(wps) - 1):
        p0 = wps[i]
        p1 = wps[i + 1]
        if math.isclose(p0[0], p1[0]) and math.isclose(p0[1], p1[1]):
            continue
        segments.append((p0, p1))
    return segments


def get_connection_bend_points(connection: Dict) -> List[List[float]]:
    """Return internal waypoints where the flow route changes direction."""
    wps = get_connection_waypoints(connection)
    cleaned = []
    for point in wps:
        if not cleaned or not (
            math.isclose(point[0], cleaned[-1][0])
            and math.isclose(point[1], cleaned[-1][1])
        ):
            cleaned.append(point)

    bends = []
    for previous, current, following in zip(cleaned, cleaned[1:], cleaned[2:]):
        incoming = (current[0] - previous[0], current[1] - previous[1])
        outgoing = (following[0] - current[0], following[1] - current[1])
        cross = incoming[0] * outgoing[1] - incoming[1] * outgoing[0]
        dot = incoming[0] * outgoing[0] + incoming[1] * outgoing[1]
        if not math.isclose(cross, 0.0) or dot <= 0.0:
            bends.append(current)
    return bends


def layer0_connection_obstacles(data: Dict) -> List[Tuple[float, float, float, float]]:
    obstacles = []
    for con in data.get("connections", []):
        if not is_layer(con, "0"):
            continue
        for p0, p1 in get_connection_segments(con):
            obstacles.append(
                (
                    min(p0[0], p1[0]),
                    min(p0[1], p1[1]),
                    max(p0[0], p1[0]),
                    max(p0[1], p1[1]),
                )
            )
    return obstacles


def rects_overlap(a: Tuple[float, float, float, float], b: Tuple[float, float, float, float]) -> bool:
    return a[0] < b[2] and a[2] > b[0] and a[1] < b[3] and a[3] > b[1]


def segment_intersects_rect(a: List[float], b: List[float], rect: Tuple[float, float, float, float]) -> bool:
    x1, y1 = a
    x2, y2 = b
    if point_in_rect(x1, y1, rect) or point_in_rect(x2, y2, rect):
        return True

    if math.isclose(x1, x2):
        x = x1
        if rect[0] <= x <= rect[2]:
            return max(min(y1, y2), rect[1]) <= min(max(y1, y2), rect[3])
        return False

    if math.isclose(y1, y2):
        y = y1
        if rect[1] <= y <= rect[3]:
            return max(min(x1, x2), rect[0]) <= min(max(x1, x2), rect[2])
        return False

    # The input routes are expected to be orthogonal. Keep a conservative fallback
    # for malformed diagonal data by testing against the rectangle edges.
    left, bottom, right, top = rect
    for x in (left, right):
        if math.isclose(x1, x2):
            continue
        t = (x - x1) / (x2 - x1)
        if 0.0 <= t <= 1.0:
            y = y1 + t * (y2 - y1)
            if bottom <= y <= top:
                return True
    for y in (bottom, top):
        if math.isclose(y1, y2):
            continue
        t = (y - y1) / (y2 - y1)
        if 0.0 <= t <= 1.0:
            x = x1 + t * (x2 - x1)
            if left <= x <= right:
                return True
    return False


def segment_intersects_rect_interior(
    a: List[float],
    b: List[float],
    rect: Tuple[float, float, float, float],
) -> bool:
    """Return whether an orthogonal segment enters a rectangle's open interior."""
    x1, y1 = a
    x2, y2 = b
    if math.isclose(x1, x2):
        return (
            rect[0] < x1 < rect[2]
            and max(min(y1, y2), rect[1]) < min(max(y1, y2), rect[3])
        )
    if math.isclose(y1, y2):
        return (
            rect[1] < y1 < rect[3]
            and max(min(x1, x2), rect[0]) < min(max(x1, x2), rect[2])
        )
    return segment_intersects_rect(a, b, rect)


def layer1_component_obstacles(data: Dict, exclude_ids: set[str] | None = None) -> List[Tuple[float, float, float, float]]:
    exclude_ids = exclude_ids or set()
    obstacles = []
    for comp in data.get("components", []):
        if comp.get("id") in exclude_ids or not is_layer(comp, "1"):
            continue
        rect = component_rect(comp)
        if rect is not None:
            obstacles.append(rect)
    return obstacles


def all_other_connection_segments(data: Dict, current_connection_id: str) -> List[Tuple[List[float], List[float]]]:
    out = []
    for con in data.get("connections", []):
        if con.get("id") == current_connection_id:
            continue
        out.extend(get_connection_segments(con))
    return out


def valve_bbox_from_anchor(anchor: List[float]) -> Tuple[float, float, float, float]:
    half = VALVE_SIZE / 2.0
    return (anchor[0] - half, anchor[1] - half, anchor[0] + half, anchor[1] + half)


def valve_position_is_clear(
    anchor: List[float],
    bend_points: List[List[float]],
    other_segments: List[Tuple[List[float], List[float]]],
    layer1_obstacles: List[Tuple[float, float, float, float]],
    flow_port_obstacles: List[Tuple[float, float, float, float]],
    layer0_device_obstacles: List[Tuple[float, float, float, float]],
) -> bool:
    box = valve_bbox_from_anchor(anchor)
    # A bend may touch the valve boundary when the configured clearance is zero,
    # but it may never enter the valve interior.
    bend_keepout = inflate_rect(box, VALVE_BEND_CLEARANCE)
    for bend in bend_points:
        if point_strictly_in_rect(bend[0], bend[1], bend_keepout):
            return False
    layer1_clearance_box = inflate_rect(box, ROUTE_CLEARANCE)
    flow_clearance_box = inflate_rect(box, VALVE_ROUTE_CLEARANCE)
    for rect in layer1_obstacles:
        if rects_overlap(layer1_clearance_box, rect):
            return False
    for rect in flow_port_obstacles:
        if rects_overlap(inflate_rect(box, VALVE_FLOW_PORT_CLEARANCE), rect):
            return False
    for rect in layer0_device_obstacles:
        if rects_overlap(inflate_rect(box, VALVE_DEVICE_CLEARANCE), rect):
            return False
    for p0, p1 in other_segments:
        if segment_intersects_rect_interior(p0, p1, flow_clearance_box):
            return False
    return True


def candidate_points_on_segment(p0: List[float], p1: List[float]) -> List[List[float]]:
    x0, y0 = p0
    x1, y1 = p1
    length = abs(x1 - x0) + abs(y1 - y0)
    if length <= 0:
        return []

    steps = max(1, int(math.floor(length / GRID_STEP)))
    candidates = []
    for i in range(steps + 1):
        t = i / steps
        candidates.append([x0 + (x1 - x0) * t, y0 + (y1 - y0) * t])
    candidates.append([(x0 + x1) / 2.0, (y0 + y1) / 2.0])
    return candidates


def find_valve_anchor_on_connection(
    data: Dict,
    connection: Dict,
    valve_id: str,
    preferred_anchor_ys: List[float] | None = None,
) -> List[float] | None:
    bend_points = get_connection_bend_points(connection)
    other_segments = all_other_connection_segments(data, connection.get("id"))
    layer1_obstacles = layer1_component_obstacles(data, exclude_ids={valve_id})
    flow_port_obstacles = get_layer0_port_obstacles(data)
    layer0_device_obstacles = layer0_non_port_component_obstacles(data)

    candidates = []
    for p0, p1 in get_connection_segments(connection):
        for pt in candidate_points_on_segment(p0, p1):
            candidates.append(pt)

    if not candidates:
        return None

    # Reuse an existing valve row when possible to keep the control layer compact.
    # Within the same row, stay close to the original flow midpoint and away from
    # route endpoints. For the first valve, prefer the lower of equally close rows.
    wps = get_connection_waypoints(connection)
    mid_ref = wps[len(wps) // 2] if wps else candidates[0]

    def score(pt: List[float]) -> Tuple[float, float, float, float]:
        endpoint_dist = min(euclidean(pt, wps[0]), euclidean(pt, wps[-1])) if len(wps) >= 2 else 0.0
        alignment_cost = (
            min(abs(pt[1] - preferred_y) for preferred_y in preferred_anchor_ys)
            if preferred_anchor_ys
            else 0.0
        )
        return (alignment_cost, euclidean(pt, mid_ref), pt[1], -endpoint_dist)

    for pt in sorted(candidates, key=score):
        if valve_position_is_clear(
            pt,
            bend_points,
            other_segments,
            layer1_obstacles,
            flow_port_obstacles,
            layer0_device_obstacles,
        ):
            return [round(pt[0], 6), round(pt[1], 6)]
    return None


def assign_valve_positions(data: Dict) -> List[Dict]:
    comp_map = component_by_id(data)
    conn_map = connection_by_id(data)

    records = []
    placed_anchor_ys = []
    for v in data.get("valves", []):
        valve_id = v["componentid"]
        cport_id = v.get("controlportid")
        control_connection_id = None
        if not cport_id:
            # Some MINT exports omit controlportid even though the layer-1
            # Cport-to-valve connection is present. Infer the unique endpoint.
            candidates = []
            for control_connection in data.get("connections", []):
                if not is_layer(control_connection, "1"):
                    continue
                source_id = control_connection.get("source", {}).get("component")
                sink_ids = [sink.get("component") for sink in control_connection.get("sinks", [])]
                if valve_id in sink_ids and source_id in comp_map:
                    candidates.append((source_id, control_connection.get("id")))
                elif source_id == valve_id:
                    candidates.extend(
                        (sink_id, control_connection.get("id"))
                        for sink_id in sink_ids
                        if sink_id in comp_map
                    )
            candidates = list(dict.fromkeys(candidates))
            if len(candidates) != 1:
                raise ValueError(
                    f"Cannot infer unique control port for valve {valve_id}: {candidates}"
                )
            cport_id, control_connection_id = candidates[0]
        conn_id = v["connectionid"]

        valve_comp = comp_map[valve_id]
        cport_comp = comp_map[cport_id]
        flow_conn = conn_map[conn_id]

        valve_params = valve_comp.setdefault("params", {})
        valve_params["width"] = VALVE_SIZE
        valve_params["length"] = VALVE_SIZE
        valve_params["rotation"] = 0.0

        anchor = find_valve_anchor_on_connection(data, flow_conn, valve_id, placed_anchor_ys)
        placement_failed = anchor is None
        if placement_failed:
            anchor = [-1.0, -1.0]
            valve_params["position"] = [-1, -1]
        else:
            valve_params["position"] = [anchor[0] - VALVE_SIZE / 2.0, anchor[1] - VALVE_SIZE / 2.0]
            placed_anchor_ys.append(anchor[1])

        records.append(
            {
                "valve_id": valve_id,
                "control_port_id": cport_id,
                "control_connection_id": control_connection_id or f"Ctrlchannel_{valve_id.split('_')[-1]}",
                "flow_connection_id": conn_id,
                "valve_anchor": anchor,
                "placement_failed": placement_failed,
                "valve_component": valve_comp,
                "control_port_component": cport_comp,
            }
        )

    return records


def place_cports_evenly(n_ports: int, x_span: float, y_span: float) -> List[List[float]]:
    n_left = (n_ports + 1) // 2
    n_right = n_ports - n_left

    def make_side(n: int, x0: float) -> List[List[float]]:
        if n == 0:
            return []
        total_h = n * PORT_SIZE + (n - 1) * PORT_GAP
        offset_y = max(0.0, (y_span - total_h) / 2.0)
        locs = []
        for i in range(n):
            locs.append([x0, offset_y + i * (PORT_SIZE + PORT_GAP)])
        return locs

    left_x = -PORT_GAP - PORT_SIZE
    right_x = x_span + PORT_GAP

    left = make_side(n_left, left_x)
    right = make_side(n_right, right_x)
    return left + right


def rect_area(rect: Tuple[float, float, float, float]) -> float:
    return max(0.0, rect[2] - rect[0]) * max(0.0, rect[3] - rect[1])


def union_bounds(rects: List[Tuple[float, float, float, float]]) -> Tuple[float, float, float, float]:
    return (
        min(r[0] for r in rects),
        min(r[1] for r in rects),
        max(r[2] for r in rects),
        max(r[3] for r in rects),
    )


def cport_rect(pos: List[float]) -> Tuple[float, float, float, float]:
    return (pos[0], pos[1], pos[0] + PORT_SIZE, pos[1] + PORT_SIZE)


def rect_center(rect: Tuple[float, float, float, float]) -> List[float]:
    return [(rect[0] + rect[2]) / 2.0, (rect[1] + rect[3]) / 2.0]


def distance_outside_bounds(rect: Tuple[float, float, float, float], bounds: Tuple[float, float, float, float]) -> float:
    return max(
        bounds[0] - rect[0],
        0.0,
        rect[2] - bounds[2],
        bounds[1] - rect[1],
        rect[3] - bounds[3],
    )


def cport_position_is_clear(
    pos: List[float],
    static_obstacles: List[Tuple[Tuple[float, float, float, float], float]],
    placed_cports: List[List[float]],
) -> bool:
    box = cport_rect(pos)
    for rect, clearance in static_obstacles:
        if rects_overlap(inflate_rect(box, clearance), rect):
            return False
    clearance_box = inflate_rect(box, DEVICE_CLEARANCE)
    for other_pos in placed_cports:
        if rects_overlap(clearance_box, cport_rect(other_pos)):
            return False
    return True


def round_to_grid(value: float) -> float:
    return round(value / GRID_STEP) * GRID_STEP


def add_cport_candidate(candidates: set[Tuple[float, float]], x: float, y: float) -> None:
    candidates.add((float(round_to_grid(x)), float(round_to_grid(y))))


def frange(start: float, stop: float, step: float) -> List[float]:
    if stop < start:
        return []
    count = int(math.floor((stop - start) / step)) + 1
    values = [start + i * step for i in range(count)]
    if values[-1] < stop:
        values.append(stop)
    return values


def generate_cport_candidates(
    base_bounds: Tuple[float, float, float, float],
    anchors: List[List[float]],
    n_ports: int,
) -> List[List[float]]:
    x_min, y_min, x_max, y_max = base_bounds
    pitch = PORT_SIZE + DEVICE_CLEARANCE
    max_dim = max(x_max - x_min, y_max - y_min, pitch)
    rings = max(4, int(math.ceil(math.sqrt(max(1, n_ports)))) + 3)

    candidates: set[Tuple[float, float]] = set()

    # Dense enough to discover legal Cport pockets inside the design, but still
    # aligned to the same routing grid used by the control router.
    for x in frange(x_min, x_max - PORT_SIZE, pitch):
        for y in frange(y_min, y_max - PORT_SIZE, pitch):
            add_cport_candidate(candidates, x, y)

    # Edge strips are where compact Cport rows usually fit. Use the routing
    # grid here instead of the coarse Cport pitch so adjacent Cports can pack
    # at exactly the required clearance.
    edge_xs = frange(x_min - PORT_SIZE - DEVICE_CLEARANCE, x_max + DEVICE_CLEARANCE, GRID_STEP)
    edge_ys = frange(y_min - PORT_SIZE - DEVICE_CLEARANCE, y_max + DEVICE_CLEARANCE, GRID_STEP)
    for x in edge_xs:
        add_cport_candidate(candidates, x, y_min)
        add_cport_candidate(candidates, x, y_max - PORT_SIZE)
    for y in edge_ys:
        add_cport_candidate(candidates, x_min, y)
        add_cport_candidate(candidates, x_max - PORT_SIZE, y)

    # Try local positions around every valve first. These are the candidates
    # that allow Cports to sit inside unused design pockets instead of being
    # pushed to the outer boundary.
    for anchor in anchors:
        valve_half = VALVE_SIZE / 2.0
        local_offsets = [
            (-(PORT_SIZE + DEVICE_CLEARANCE + valve_half), -PORT_SIZE / 2.0),
            (valve_half + DEVICE_CLEARANCE, -PORT_SIZE / 2.0),
            (-PORT_SIZE / 2.0, -(PORT_SIZE + DEVICE_CLEARANCE + valve_half)),
            (-PORT_SIZE / 2.0, valve_half + DEVICE_CLEARANCE),
        ]
        diagonal = PORT_SIZE + DEVICE_CLEARANCE + valve_half
        local_offsets.extend(
            [
                (-diagonal, -diagonal),
                (valve_half + DEVICE_CLEARANCE, -diagonal),
                (-diagonal, valve_half + DEVICE_CLEARANCE),
                (valve_half + DEVICE_CLEARANCE, valve_half + DEVICE_CLEARANCE),
            ]
        )
        for ring in range(3):
            extra = ring * pitch
            for dx, dy in local_offsets:
                if dx < 0:
                    x = anchor[0] + dx - extra
                elif dx > 0:
                    x = anchor[0] + dx + extra
                else:
                    x = anchor[0] + dx
                if dy < 0:
                    y = anchor[1] + dy - extra
                elif dy > 0:
                    y = anchor[1] + dy + extra
                else:
                    y = anchor[1] + dy
                add_cport_candidate(candidates, x, y)

    for ring in range(rings + 1):
        margin = DEVICE_CLEARANCE + ring * pitch
        left_x = x_min - margin - PORT_SIZE
        right_x = x_max + margin
        bottom_y = y_min - margin - PORT_SIZE
        top_y = y_max + margin

        for anchor in anchors:
            add_cport_candidate(candidates, anchor[0] - PORT_SIZE / 2.0, bottom_y)
            add_cport_candidate(candidates, anchor[0] - PORT_SIZE / 2.0, top_y)
            add_cport_candidate(candidates, left_x, anchor[1] - PORT_SIZE / 2.0)
            add_cport_candidate(candidates, right_x, anchor[1] - PORT_SIZE / 2.0)

        steps_x = max(1, int(math.ceil((x_max - x_min + 2.0 * margin + PORT_SIZE) / pitch)))
        steps_y = max(1, int(math.ceil((y_max - y_min + 2.0 * margin + PORT_SIZE) / pitch)))

        for i in range(steps_x + 1):
            x = left_x + i * pitch
            add_cport_candidate(candidates, x, bottom_y)
            add_cport_candidate(candidates, x, top_y)
        for i in range(steps_y + 1):
            y = bottom_y + i * pitch
            add_cport_candidate(candidates, left_x, y)
            add_cport_candidate(candidates, right_x, y)

    low_x = x_min - (rings + 2) * pitch - PORT_SIZE
    high_x = x_max + (rings + 2) * pitch
    low_y = y_min - (rings + 2) * pitch - PORT_SIZE
    high_y = y_max + (rings + 2) * pitch

    return [[x, y] for x, y in sorted(candidates) if low_x <= x <= high_x and low_y <= y <= high_y]


def place_cports_compact(data: Dict, records: List[Dict]) -> List[List[float]]:
    routable = [r for r in records if not r.get("placement_failed")]
    if not routable:
        return []

    flow_port_rects = get_layer0_port_obstacles(data)
    layer0_device_rects = layer0_non_port_component_obstacles(data)
    layer0_rects = flow_port_rects + layer0_device_rects
    layer0_connection_rects = layer0_connection_obstacles(data)
    valve_rects = [rect for rec in routable if (rect := valve_bbox(rec["valve_component"])) is not None]
    static_obstacles = (
        [(rect, CPORT_FLOW_PORT_CLEARANCE) for rect in flow_port_rects]
        + [(rect, CPORT_DEVICE_CLEARANCE) for rect in layer0_device_rects]
        + [(rect, CPORT_FLOW_CHANNEL_CLEARANCE) for rect in layer0_connection_rects]
        + [(rect, CPORT_VALVE_CLEARANCE) for rect in valve_rects]
    )
    base_bounds = union_bounds(layer0_rects) if layer0_rects else placed_component_bounds(data)
    anchors = [r["valve_anchor"] for r in routable]
    candidates = generate_cport_candidates(base_bounds, anchors, len(routable))

    current_rects = list(layer0_rects)
    placed: List[List[float]] = []

    # Harder valves first: central anchors have fewer area-preserving options.
    cx, cy = rect_center(base_bounds)
    routable.sort(key=lambda r: euclidean(r["valve_anchor"], [cx, cy]))

    for rec in routable:
        clear_candidates = [p for p in candidates if cport_position_is_clear(p, static_obstacles, placed)]
        if not clear_candidates:
            rec["placement_failed"] = True
            continue

        current_bounds = union_bounds(current_rects + [cport_rect(p) for p in placed]) if current_rects or placed else base_bounds
        current_area = rect_area(current_bounds)

        def score(pos: List[float]) -> Tuple[float, float, float, float]:
            pos_rect = cport_rect(pos)
            new_bounds = union_bounds([current_bounds, pos_rect])
            added_area = rect_area(new_bounds) - current_area
            outside_distance = distance_outside_bounds(pos_rect, base_bounds)
            port_center = cport_center(pos)
            valve_side = -1 if rec["valve_anchor"][0] < cx else 1
            port_side = -1 if port_center[0] < cx else 1
            side_penalty = 0.0 if valve_side == port_side else abs(port_center[0] - rec["valve_anchor"][0])
            return (added_area, outside_distance, side_penalty, euclidean(port_center, rec["valve_anchor"]))

        best = min(clear_candidates, key=score)
        rec["assigned_cport_pos"] = best
        rec["assigned_cport_center"] = cport_center(best)
        rec["control_port_component"].setdefault("params", {})["position"] = list(best)
        placed.append(best)

    reorder_cports_outer_valves_to_inner_ports(routable, base_bounds)
    snap_long_edge_cports_above_valves(routable, static_obstacles)
    return placed


def reorder_cports_outer_valves_to_inner_ports(
    records: List[Dict],
    base_bounds: Tuple[float, float, float, float],
) -> None:
    assigned = [r for r in records if not r.get("placement_failed") and "assigned_cport_pos" in r]
    if len(assigned) <= 1:
        return

    left = [r for r in assigned if cport_rect(r["assigned_cport_pos"])[2] <= base_bounds[0]]
    right = [r for r in assigned if cport_rect(r["assigned_cport_pos"])[0] >= base_bounds[2]]

    def apply_order(group: List[Dict], record_key, port_key) -> None:
        if len(group) <= 1:
            return
        records_sorted = sorted(group, key=record_key)
        ports_sorted = sorted(
            [(r["assigned_cport_pos"], r["assigned_cport_center"]) for r in group],
            key=lambda item: port_key(item[0], item[1]),
        )
        for rec, (pos, center) in zip(records_sorted, ports_sorted):
            rec["assigned_cport_pos"] = list(pos)
            rec["assigned_cport_center"] = list(center)
            rec["control_port_component"].setdefault("params", {})["position"] = list(pos)

    # Left side: smaller valve x is more outside; larger Cport x is more inside.
    apply_order(
        left,
        record_key=lambda r: (r["valve_anchor"][0], r["valve_anchor"][1]),
        port_key=lambda pos, center: (-center[0], center[1]),
    )
    # Right side: larger valve x is more outside; smaller Cport x is more inside.
    apply_order(
        right,
        record_key=lambda r: (-r["valve_anchor"][0], r["valve_anchor"][1]),
        port_key=lambda pos, center: (center[0], center[1]),
    )

    reorder_side_aligned_cports_by_valve_order(assigned, base_bounds)


def snap_long_edge_cports_above_valves(
    records: List[Dict],
    static_obstacles: List[Tuple[Tuple[float, float, float, float], float]],
) -> None:
    assigned = [r for r in records if not r.get("placement_failed") and "assigned_cport_pos" in r]
    if len(assigned) <= 1:
        return

    placed_by_id = {r["control_port_id"]: list(r["assigned_cport_pos"]) for r in assigned}

    for rec in assigned:
        anchor = rec["valve_anchor"]
        center = rec["assigned_cport_center"]
        horizontal_offset = abs(center[0] - anchor[0])
        if horizontal_offset <= PORT_SIZE:
            continue

        preferred = [
            round_to_grid(anchor[0] - PORT_SIZE / 2.0),
            round_to_grid(anchor[1] + VALVE_SIZE / 2.0 + DEVICE_CLEARANCE),
        ]
        other_positions = [
            pos
            for control_port_id, pos in placed_by_id.items()
            if control_port_id != rec["control_port_id"]
        ]
        if not cport_position_is_clear(preferred, static_obstacles, other_positions):
            continue

        rec["assigned_cport_pos"] = list(preferred)
        rec["assigned_cport_center"] = cport_center(preferred)
        rec["control_port_component"].setdefault("params", {})["position"] = list(preferred)
        placed_by_id[rec["control_port_id"]] = list(preferred)


def reorder_side_aligned_cports_by_valve_order(
    records: List[Dict],
    base_bounds: Tuple[float, float, float, float],
) -> None:
    """Keep Cport order consistent with valve order on each side-like band."""
    if len(records) <= 1:
        return

    x_min, y_min, x_max, y_max = base_bounds
    cx, cy = rect_center(base_bounds)

    def side_band(rec: Dict) -> str:
        center = rec["assigned_cport_center"]
        dist = {
            "left": abs(center[0] - x_min),
            "right": abs(center[0] - x_max),
            "bottom": abs(center[1] - y_min),
            "top": abs(center[1] - y_max),
        }
        side = min(dist, key=dist.get)
        if side in {"top", "bottom"}:
            return side
        return side if dist[side] <= min(x_max - x_min, y_max - y_min) * 0.25 else ("top" if center[1] >= cy else "bottom")

    groups: Dict[str, List[Dict]] = {}
    for rec in records:
        groups.setdefault(side_band(rec), []).append(rec)

    def apply_order(group: List[Dict], record_key, port_key) -> None:
        if len(group) <= 1:
            return
        records_sorted = sorted(group, key=record_key)
        ports_sorted = sorted(
            [(r["assigned_cport_pos"], r["assigned_cport_center"]) for r in group],
            key=lambda item: port_key(item[0], item[1]),
        )
        for rec, (pos, center) in zip(records_sorted, ports_sorted):
            rec["assigned_cport_pos"] = list(pos)
            rec["assigned_cport_center"] = list(center)
            rec["control_port_component"].setdefault("params", {})["position"] = list(pos)

    apply_order(
        groups.get("top", []),
        record_key=lambda r: (r["valve_anchor"][0], r["valve_anchor"][1]),
        port_key=lambda pos, center: (center[0], center[1]),
    )
    apply_order(
        groups.get("bottom", []),
        record_key=lambda r: (r["valve_anchor"][0], -r["valve_anchor"][1]),
        port_key=lambda pos, center: (center[0], -center[1]),
    )
    apply_order(
        groups.get("left", []),
        record_key=lambda r: (r["valve_anchor"][1], r["valve_anchor"][0]),
        port_key=lambda pos, center: (center[1], center[0]),
    )
    apply_order(
        groups.get("right", []),
        record_key=lambda r: (r["valve_anchor"][1], -r["valve_anchor"][0]),
        port_key=lambda pos, center: (center[1], -center[0]),
    )


def cport_center(cport_pos: List[float]) -> List[float]:
    return [cport_pos[0] + PORT_SIZE / 2.0, cport_pos[1] + PORT_SIZE / 2.0]


def euclidean(a: List[float], b: List[float]) -> float:
    return math.hypot(a[0] - b[0], a[1] - b[1])


def map_valves_to_cports(records: List[Dict], cport_positions: List[List[float]]) -> None:
    available = [{"idx": i, "pos": p, "center": cport_center(p)} for i, p in enumerate(cport_positions)]

    routable = [r for r in records if not r.get("placement_failed")]
    routable.sort(key=lambda r: (r["valve_anchor"][1], r["valve_anchor"][0]))

    for rec in routable:
        rec_anchor = rec["valve_anchor"]
        best = min(available, key=lambda item: euclidean(rec_anchor, item["center"]))
        rec["assigned_cport_pos"] = best["pos"]
        rec["assigned_cport_center"] = best["center"]
        rec["control_port_component"].setdefault("params", {})["position"] = list(best["pos"])
        available = [x for x in available if x["idx"] != best["idx"]]


def point_in_rect(x: float, y: float, rect: Tuple[float, float, float, float]) -> bool:
    return rect[0] <= x <= rect[2] and rect[1] <= y <= rect[3]


def point_strictly_in_rect(x: float, y: float, rect: Tuple[float, float, float, float]) -> bool:
    return rect[0] < x < rect[2] and rect[1] < y < rect[3]


def inflate_rect(rect: Tuple[float, float, float, float], margin: float) -> Tuple[float, float, float, float]:
    return (rect[0] - margin, rect[1] - margin, rect[2] + margin, rect[3] + margin)


def build_grid(
    bounds: Tuple[float, float, float, float],
    obstacles: List[Tuple[float, float, float, float]],
    margin: float = 0.0,
):
    x_min, y_min, x_max, y_max = bounds
    nx = int(round((x_max - x_min) / GRID_STEP)) + 1
    ny = int(round((y_max - y_min) / GRID_STEP)) + 1

    blocked = [[False for _ in range(nx)] for _ in range(ny)]

    if margin > 0.0:
        obs = [inflate_rect(r, margin) for r in obstacles]
    else:
        obs = list(obstacles)

    for gy in range(ny):
        y = y_min + gy * GRID_STEP
        for gx in range(nx):
            x = x_min + gx * GRID_STEP
            for rect in obs:
                if point_in_rect(x, y, rect):
                    blocked[gy][gx] = True
                    break

    return blocked, nx, ny


def to_grid(pt: List[float], bounds: Tuple[float, float, float, float]) -> Tuple[int, int]:
    x_min, y_min, _, _ = bounds
    gx = int(round((pt[0] - x_min) / GRID_STEP))
    gy = int(round((pt[1] - y_min) / GRID_STEP))
    return gx, gy


def to_coord(node: Tuple[int, int], bounds: Tuple[float, float, float, float]) -> List[float]:
    x_min, y_min, _, _ = bounds
    return [x_min + node[0] * GRID_STEP, y_min + node[1] * GRID_STEP]


def neighbors(node: Tuple[int, int], nx: int, ny: int) -> List[Tuple[int, int, int]]:
    x, y = node
    out = []
    for dir_idx, (dx, dy) in enumerate(DIRS):
        xx = x + dx
        yy = y + dy
        if 0 <= xx < nx and 0 <= yy < ny:
            out.append((xx, yy, dir_idx))
    return out


def manhattan_fallback(start: List[float], end: List[float]) -> List[List[float]]:
    x1, y1 = start
    x2, y2 = end
    if math.isclose(x1, x2) or math.isclose(y1, y2):
        return [list(start), list(end)]
    return [list(start), [x1, y2], list(end)]


def astar_route(
    start: List[float],
    end: List[float],
    bounds: Tuple[float, float, float, float],
    blocked: List[List[bool]],
    nx: int,
    ny: int,
) -> List[List[float]]:
    # Multi-criteria A*: keep routes compact first, then reduce bends.
    s = to_grid(start, bounds)
    t = to_grid(end, bounds)

    blocked[s[1]][s[0]] = False
    blocked[t[1]][t[0]] = False

    start_state = (s[0], s[1], -1)
    open_heap = []
    heapq.heappush(open_heap, ((0, 0, 0), start_state))
    best_cost = {start_state: (0, 0)}
    parent = {start_state: None}

    def h_steps(a: Tuple[int, int], b: Tuple[int, int]) -> int:
        return abs(a[0] - b[0]) + abs(a[1] - b[1])

    target_state = None

    while open_heap:
        _, cur_state = heapq.heappop(open_heap)
        cur_xy = (cur_state[0], cur_state[1])

        if cur_xy == t:
            target_state = cur_state
            break

        cur_steps, cur_bends = best_cost[cur_state]
        for nx1, ny1, next_dir in neighbors(cur_xy, nx, ny):
            if blocked[ny1][nx1]:
                continue

            bend_inc = 0
            if cur_state[2] != -1 and cur_state[2] != next_dir:
                bend_inc = 1

            cand = (cur_steps + 1, cur_bends + bend_inc)
            next_state = (nx1, ny1, next_dir)

            if next_state not in best_cost or cand < best_cost[next_state]:
                best_cost[next_state] = cand
                parent[next_state] = cur_state
                priority = (cand[0] + h_steps((nx1, ny1), t), cand[1], cand[0])
                heapq.heappush(open_heap, (priority, next_state))

    if target_state is None:
        return []

    path = []
    p = target_state
    while p is not None:
        path.append(to_coord((p[0], p[1]), bounds))
        p = parent[p]
    path.reverse()
    return path


def simplify_orthogonal_path(path: List[List[float]]) -> List[List[float]]:
    if len(path) <= 2:
        return path
    out = [path[0]]
    for i in range(1, len(path) - 1):
        x0, y0 = out[-1]
        x1, y1 = path[i]
        x2, y2 = path[i + 1]
        if (x0 == x1 == x2) or (y0 == y1 == y2):
            continue
        out.append(path[i])
    out.append(path[-1])
    return out


def _grid_segment_points(a: Tuple[int, int], b: Tuple[int, int]) -> List[Tuple[int, int]]:
    if a[0] == b[0]:
        step = 1 if b[1] >= a[1] else -1
        return [(a[0], y) for y in range(a[1], b[1] + step, step)]
    if a[1] == b[1]:
        step = 1 if b[0] >= a[0] else -1
        return [(x, a[1]) for x in range(a[0], b[0] + step, step)]
    return []


def _axis_clear(a: Tuple[int, int], b: Tuple[int, int], blocked: List[List[bool]]) -> bool:
    pts = _grid_segment_points(a, b)
    if not pts:
        return False
    h = len(blocked)
    w = len(blocked[0]) if h > 0 else 0
    for x, y in pts:
        if not (0 <= x < w and 0 <= y < h):
            return False
        if blocked[y][x]:
            return False
    return True


def shortcut_orthogonal_path(
    path: List[List[float]],
    bounds: Tuple[float, float, float, float],
    blocked: List[List[bool]],
) -> List[List[float]]:
    if len(path) <= 2:
        return path

    grid_pts = [to_grid(p, bounds) for p in path]
    simplified: List[Tuple[int, int]] = [grid_pts[0]]
    i = 0
    n = len(grid_pts)
    while i < n - 1:
        best_j = i + 1
        best_mid: Tuple[int, int] | None = None

        for j in range(n - 1, i + 1, -1):
            a = grid_pts[i]
            b = grid_pts[j]

            if (a[0] == b[0] or a[1] == b[1]) and _axis_clear(a, b, blocked):
                best_j = j
                best_mid = None
                break

            c1 = (a[0], b[1])
            c2 = (b[0], a[1])
            if _axis_clear(a, c1, blocked) and _axis_clear(c1, b, blocked):
                best_j = j
                best_mid = c1
                break
            if _axis_clear(a, c2, blocked) and _axis_clear(c2, b, blocked):
                best_j = j
                best_mid = c2
                break

        if best_mid is not None and (len(simplified) == 0 or simplified[-1] != best_mid):
            simplified.append(best_mid)
        if simplified[-1] != grid_pts[best_j]:
            simplified.append(grid_pts[best_j])
        i = best_j

    coords = [to_coord(p, bounds) for p in simplified]
    return simplify_orthogonal_path(coords)


def mark_path_as_blocked(
    path: List[List[float]],
    bounds: Tuple[float, float, float, float],
    blocked: List[List[bool]],
    clearance: float,
) -> None:
    if len(path) < 2:
        return

    radius = int(math.ceil(clearance / GRID_STEP))
    h = len(blocked)
    w = len(blocked[0]) if h > 0 else 0

    def mark_cell(cx: int, cy: int) -> None:
        for yy in range(cy - radius, cy + radius + 1):
            if yy < 0 or yy >= h:
                continue
            for xx in range(cx - radius, cx + radius + 1):
                if 0 <= xx < w:
                    blocked[yy][xx] = True

    for i in range(len(path) - 1):
        a = to_grid(path[i], bounds)
        b = to_grid(path[i + 1], bounds)
        seg_pts = _grid_segment_points(a, b)
        if not seg_pts:
            # Fallback for non-orthogonal tiny links.
            mark_cell(a[0], a[1])
            mark_cell(b[0], b[1])
            continue
        for x, y in seg_pts:
            mark_cell(x, y)


def path_clearance_rects(path: List[List[float]], clearance: float) -> List[Tuple[float, float, float, float]]:
    rects = []
    for i in range(len(path) - 1):
        x0, y0 = path[i]
        x1, y1 = path[i + 1]
        if math.isclose(x0, x1):
            rects.append((x0 - clearance, min(y0, y1) - clearance, x0 + clearance, max(y0, y1) + clearance))
        elif math.isclose(y0, y1):
            rects.append((min(x0, x1) - clearance, y0 - clearance, max(x0, x1) + clearance, y0 + clearance))
        else:
            rects.append(
                (
                    min(x0, x1) - clearance,
                    min(y0, y1) - clearance,
                    max(x0, x1) + clearance,
                    max(y0, y1) + clearance,
                )
            )
    return rects


def path_intersects_rects(path: List[List[float]], rects: List[Tuple[float, float, float, float]]) -> bool:
    for p0, p1 in get_path_segments(path):
        for rect in rects:
            if segment_intersects_rect(p0, p1, rect):
                return True
    return False


def get_path_segments(path: List[List[float]]) -> List[Tuple[List[float], List[float]]]:
    return [
        (path[i], path[i + 1])
        for i in range(len(path) - 1)
        if not (math.isclose(path[i][0], path[i + 1][0]) and math.isclose(path[i][1], path[i + 1][1]))
    ]


def valve_bbox(comp: Dict) -> Tuple[float, float, float, float] | None:
    pos = comp.get("params", {}).get("position", [-1, -1])
    if pos[0] == -1 and pos[1] == -1:
        return None

    x = float(pos[0])
    y = float(pos[1])

    params = comp.get("params", {})
    width = float(params.get("width", comp.get("x-span", 1230.0)))
    length = float(params.get("length", comp.get("y-span", 4920.0)))
    rotation = int(float(params.get("rotation", 0.0))) % 360
    if rotation in (90, 270):
        w = length
        h = width
    else:
        w = width
        h = length
    return (x, y, x + w, y + h)


def find_control_connection_for_valve(data: Dict, control_port_id: str, valve_id: str) -> Dict:
    for con in data.get("connections", []):
        if not is_layer(con, "1"):
            continue
        src = con.get("source", {}).get("component")
        sinks = con.get("sinks", [])
        sink_comp = sinks[0].get("component") if sinks else None
        if src == control_port_id and sink_comp == valve_id:
            return con
    raise ValueError(f"Cannot find control connection from {control_port_id} to {valve_id}")


def clear_control_connection_route(data: Dict, control_port_id: str, valve_id: str) -> None:
    con = find_control_connection_for_valve(data, control_port_id, valve_id)
    con.setdefault("params", {})
    con["params"]["start"] = ["Point", -1, -1]
    con["params"]["end"] = [-1, -1]
    con["params"]["wayPoints"] = [[-1, -1]]
    con["params"]["segments"] = [[[-1, -1], [-1, -1]]]
    con["paths"] = []


def write_control_path(data: Dict, rec: Dict, path: List[List[float]]) -> None:
    con = find_control_connection_for_valve(data, rec["control_port_id"], rec["valve_id"])
    con.setdefault("params", {})
    con["params"]["wayPoints"] = path
    con["params"]["start"] = path[0]
    con["params"]["end"] = path[-1]
    con["params"]["segments"] = [[path[i], path[i + 1]] for i in range(len(path) - 1)]
    con["paths"] = [{"source": con.get("source", {}), "sink": con.get("sinks", [{}])[0], "wayPoints": path}]


def fallback_track_route_failed_records(
    data: Dict,
    failed_records: List[Dict],
    reserved_path_obstacles: List[Tuple[float, float, float, float]],
    component_obstacles: List[Tuple[float, float, float, float]],
    obstacle_owner: List[str],
    obstacle_clearance: List[float],
    start_track_y: float,
) -> None:
    if not failed_records:
        return

    bounds = placed_component_bounds(data)
    center_x = (bounds[0] + bounds[2]) / 2.0
    left = [r for r in failed_records if r.get("assigned_cport_center", r["valve_anchor"])[0] <= center_x]
    right = [r for r in failed_records if r.get("assigned_cport_center", r["valve_anchor"])[0] > center_x]

    ordered = []
    ordered.extend(sorted(left, key=lambda r: (r["valve_anchor"][0], r["valve_anchor"][1])))
    ordered.extend(sorted(right, key=lambda r: (-r["valve_anchor"][0], r["valve_anchor"][1])))

    for idx, rec in enumerate(ordered):
        track_y = start_track_y + idx * CONTROL_TRACK_PITCH
        start = rec["assigned_cport_center"]
        end = rec["valve_anchor"]
        path = simplify_orthogonal_path([list(start), [start[0], track_y], [end[0], track_y], list(end)])
        static_blocked = [
            inflate_rect(rect, clearance)
            for rect, owner, clearance in zip(component_obstacles, obstacle_owner, obstacle_clearance)
            if owner not in {rec["valve_id"], rec["control_port_id"]}
        ]
        if path_intersects_rects(path, static_blocked + reserved_path_obstacles):
            continue

        write_control_path(data, rec, path)
        reserved_path_obstacles.extend(path_clearance_rects(path, ROUTE_CLEARANCE))
        rec.pop("routing_failed", None)
        rec.pop("routing_failed_reason", None)


def route_control_connections(data: Dict, records: List[Dict], obstacles: List[Tuple[float, float, float, float]]) -> None:
    records = [r for r in records if not r.get("placement_failed")]
    if not records:
        return

    x_span = float(data.get("params", {}).get("x-span", 0.0))
    y_span = float(data.get("params", {}).get("y-span", 0.0))

    x_min = -PORT_GAP - PORT_SIZE
    x_max = x_span + PORT_GAP + PORT_SIZE
    y_min = 0.0
    y_max = y_span

    for rec in records:
        anchor = rec.get("valve_anchor", [-1, -1])
        if anchor[0] >= 0 and anchor[1] >= 0:
            x_min = min(x_min, anchor[0] - PORT_GAP)
            x_max = max(x_max, anchor[0] + PORT_GAP)
            y_min = min(y_min, anchor[1] - PORT_GAP)
            y_max = max(y_max, anchor[1] + PORT_GAP)

        cpos = rec.get("assigned_cport_pos", [-1, -1])
        if cpos[0] >= 0 and cpos[1] >= 0:
            x_min = min(x_min, cpos[0] - PORT_GAP)
            x_max = max(x_max, cpos[0] + PORT_SIZE + PORT_GAP)
            y_min = min(y_min, cpos[1] - PORT_GAP)
            y_max = max(y_max, cpos[1] + PORT_SIZE + PORT_GAP)

    routing_margin = PORT_SIZE + 2.0 * PORT_GAP
    x_min -= routing_margin
    x_max += routing_margin
    y_min -= routing_margin
    y_max += routing_margin

    bounds = (x_min, y_min, x_max, y_max)

    component_obstacles = list(obstacles)
    obstacle_owner = ["layer0_port" for _ in obstacles]
    obstacle_clearance = [ROUTE_DEVICE_CLEARANCE for _ in obstacles]
    for rec in records:
        vbox = valve_bbox(rec["valve_component"])
        if vbox is not None:
            component_obstacles.append(vbox)
            obstacle_owner.append(rec["valve_id"])
            obstacle_clearance.append(ROUTE_DEVICE_CLEARANCE)

        cpos = rec.get("assigned_cport_pos", [-1, -1])
        if cpos[0] >= 0 and cpos[1] >= 0:
            component_obstacles.append((cpos[0], cpos[1], cpos[0] + PORT_SIZE, cpos[1] + PORT_SIZE))
            obstacle_owner.append(rec["control_port_id"])
            obstacle_clearance.append(DEVICE_CLEARANCE)

    center_x = (placed_component_bounds(data)[0] + placed_component_bounds(data)[2]) / 2.0
    records.sort(
        key=lambda r: (
            euclidean(r.get("assigned_cport_center", r["valve_anchor"]), r["valve_anchor"]),
            abs(r["valve_anchor"][0] - center_x),
            r["valve_anchor"][1],
        )
    )
    reserved_path_obstacles: List[Tuple[float, float, float, float]] = []
    failed_for_track_fallback: List[Dict] = []

    for rec in records:
        blocked_obstacles = [
            inflate_rect(rect, clearance)
            for rect, owner, clearance in zip(component_obstacles, obstacle_owner, obstacle_clearance)
            if owner not in {rec["valve_id"], rec["control_port_id"]}
        ]
        blocked_obstacles.extend(reserved_path_obstacles)
        blocked, nx, ny = build_grid(bounds, blocked_obstacles, margin=0.0)

        start_exact = rec["assigned_cport_center"]
        end_exact = rec["valve_anchor"]

        start_snap = to_coord(to_grid(start_exact, bounds), bounds)
        end_snap = to_coord(to_grid(end_exact, bounds), bounds)

        # Keep each net's own anchors routable even with inflated obstacles.
        s_gx, s_gy = to_grid(start_exact, bounds)
        e_gx, e_gy = to_grid(end_exact, bounds)
        if 0 <= s_gy < ny and 0 <= s_gx < nx:
            blocked[s_gy][s_gx] = False
        if 0 <= e_gy < ny and 0 <= e_gx < nx:
            blocked[e_gy][e_gx] = False

        core_path = astar_route(start_snap, end_snap, bounds, blocked, nx, ny)
        if len(core_path) < 2:
            rec["routing_failed"] = True
            rec["routing_failed_reason"] = "astar"
            clear_control_connection_route(data, rec["control_port_id"], rec["valve_id"])
            failed_for_track_fallback.append(rec)
            continue

        core_path = shortcut_orthogonal_path(core_path, bounds, blocked)

        # Compose final waypoints from exact anchors and only the interior routed
        # grid points. This avoids tiny snap-induced detours near Cport/valve anchors.
        interior = core_path[1:-1]
        path = [list(start_exact)]
        if len(interior) > 0:
            path.extend(manhattan_fallback(start_exact, interior[0])[1:])
            if len(interior) > 1:
                path.extend(interior[1:])
            path.extend(manhattan_fallback(path[-1], end_exact)[1:])
        else:
            path.extend(manhattan_fallback(start_exact, end_exact)[1:])

        path = simplify_orthogonal_path(path)

        if path_intersects_rects(path, blocked_obstacles):
            rec["routing_failed"] = True
            rec["routing_failed_reason"] = "overlap_check"
            clear_control_connection_route(data, rec["control_port_id"], rec["valve_id"])
            failed_for_track_fallback.append(rec)
            continue

        reserved_path_obstacles.extend(path_clearance_rects(path, ROUTE_CLEARANCE))
        write_control_path(data, rec, path)

    start_track_y = max(bounds[3], placed_component_bounds(data)[3]) + CONTROL_TRACK_PITCH
    fallback_track_route_failed_records(
        data,
        failed_for_track_fallback,
        reserved_path_obstacles,
        component_obstacles,
        obstacle_owner,
        obstacle_clearance,
        start_track_y,
    )
    

def visualize_layers(data: Dict, output_png: str) -> None:
    fig, ax = plt.subplots(figsize=(12, 8))

    xmin = float("inf")
    ymin = float("inf")
    xmax = float("-inf")
    ymax = float("-inf")

    layer0_positions = []
    for comp in data.get("components", []):
        if not is_layer(comp, "0"):
            continue
        pos = comp.get("params", {}).get("position", [-1, -1])
        if pos[0] == -1 and pos[1] == -1:
            continue
        layer0_positions.append((float(pos[0]), float(pos[1])))

    if layer0_positions:
        layer0_dx = min(p[0] for p in layer0_positions)
        layer0_dy = min(p[1] for p in layer0_positions)
    else:
        layer0_dx = 0.0
        layer0_dy = 0.0

    def display_xy(x: float, y: float) -> Tuple[float, float]:
        return x - layer0_dx, y - layer0_dy

    def valid_point(pt: List[float]) -> bool:
        return len(pt) >= 2 and float(pt[0]) >= 0 and float(pt[1]) >= 0

    def rotated_size(x_span: float, y_span: float, rotation: float) -> Tuple[float, float]:
        r = int(rotation) % 360
        if r in (90, 270):
            return y_span, x_span
        return x_span, y_span

    def transformed_port(
        comp_x: float,
        comp_y: float,
        x_port: float,
        y_port: float,
        x_span: float,
        y_span: float,
        rotation: float,
        mirror_x: bool,
    ) -> Tuple[float, float]:
        r = int(rotation) % 360
        if mirror_x:
            if r == 0:
                return comp_x + (x_span - x_port), comp_y + y_port
            if r == 90:
                return comp_x + (y_span - y_port), comp_y + (x_span - x_port)
            if r == 180:
                return comp_x + x_port, comp_y + (y_span - y_port)
            return comp_x + y_port, comp_y + x_port
        else:
            if r == 0:
                return comp_x + x_port, comp_y + y_port
            if r == 90:
                return comp_x + y_port, comp_y + (x_span - x_port)
            if r == 180:
                return comp_x + (x_span - x_port), comp_y + (y_span - y_port)
            return comp_x + (y_span - y_port), comp_y + x_port

    for comp in data.get("components", []):
        pos = comp.get("params", {}).get("position", [-1, -1])
        if pos[0] == -1 and pos[1] == -1:
            continue

        x_span = float(comp.get("x-span", 1400.0))
        y_span = float(comp.get("y-span", 1400.0))
        rotation = float(comp.get("params", {}).get("rotation", 0.0))
        mirror_x = bool(comp.get("params", {}).get("mirrorByX", False))

        layer0 = is_layer(comp, "0")
        px, py = display_xy(float(pos[0]), float(pos[1]))

        w, h = rotated_size(x_span, y_span, rotation)

        if is_layer(comp, "0"):
            color = "#4c78a8"
        elif is_layer(comp, "1"):
            color = "#f58518"
        else:
            color = "#8f8f8f"

        edge_style = "-" if layer0 else ("--" if mirror_x else "-")
        ax.add_patch(
            Rectangle(
                (px, py),
                w,
                h,
                edgecolor=color,
                facecolor="none",
                linewidth=1.1,
                linestyle=edge_style,
            )
        )

        xmin = min(xmin, px)
        ymin = min(ymin, py)
        xmax = max(xmax, px + w)
        ymax = max(ymax, py + h)

    for con in data.get("connections", []):
        if is_layer(con, "0"):
            line_color = "#54a24b"
        elif is_layer(con, "1"):
            line_color = "#e45756"
        else:
            line_color = "#9c9c9c"

        segs = con.get("params", {}).get("segments", [])
        if len(segs) > 0:
            for seg in segs:
                p0, p1 = seg[0], seg[1]
                if not valid_point(p0) or not valid_point(p1):
                    continue
                x0, y0 = display_xy(float(p0[0]), float(p0[1]))
                x1, y1 = display_xy(float(p1[0]), float(p1[1]))
                ax.plot([x0, x1], [y0, y1], color=line_color, linewidth=1.2)
                xmin = min(xmin, x0, x1)
                ymin = min(ymin, y0, y1)
                xmax = max(xmax, x0, x1)
                ymax = max(ymax, y0, y1)

            valid_segs = [seg for seg in segs if valid_point(seg[0]) and valid_point(seg[1])]
            if valid_segs:
                s0x, s0y = display_xy(float(valid_segs[0][0][0]), float(valid_segs[0][0][1]))
                s1x, s1y = display_xy(float(valid_segs[-1][1][0]), float(valid_segs[-1][1][1]))
                ax.scatter(s0x, s0y, c=line_color, s=8)
                ax.scatter(s1x, s1y, c=line_color, s=8)
        else:
            wps = con.get("params", {}).get("wayPoints", [])
            if len(wps) < 2:
                continue
            wps = [p for p in wps if valid_point(p)]
            if len(wps) < 2:
                continue
            points = [display_xy(float(p[0]), float(p[1])) for p in wps]
            xs = [p[0] for p in points]
            ys = [p[1] for p in points]
            ax.plot(xs, ys, color=line_color, linewidth=1.2)
            ax.scatter(xs[0], ys[0], c=line_color, s=8)
            ax.scatter(xs[-1], ys[-1], c=line_color, s=8)

            xmin = min(xmin, min(xs))
            ymin = min(ymin, min(ys))
            xmax = max(xmax, max(xs))
            ymax = max(ymax, max(ys))

    ax.set_title("Layer-0 and Layer-1 Visualization")
    if xmin < xmax and ymin < ymax:
        margin = 300
        ax.set_xlim(xmin - margin, xmax + margin)
        ax.set_ylim(ymin - margin, ymax + margin)
    ax.set_aspect("equal", adjustable="box")
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig(output_png, dpi=180)
    plt.close(fig)


def normalize_design_to_nonnegative(data: Dict) -> None:
    """Shift all real component and route coordinates so the output has no negative geometry."""
    xs: List[float] = []
    ys: List[float] = []

    def is_real_point(pt: object) -> bool:
        return (
            isinstance(pt, list)
            and len(pt) >= 2
            and isinstance(pt[0], (int, float))
            and isinstance(pt[1], (int, float))
            and not (float(pt[0]) == -1.0 and float(pt[1]) == -1.0)
        )

    def collect_point(pt: object) -> None:
        if is_real_point(pt):
            xs.append(float(pt[0]))
            ys.append(float(pt[1]))

    for comp in data.get("components", []):
        collect_point(comp.get("params", {}).get("position"))

    for con in data.get("connections", []):
        params = con.get("params", {})
        for pt in params.get("wayPoints", []) or []:
            collect_point(pt)
        for seg in params.get("segments", []) or []:
            if len(seg) >= 2:
                collect_point(seg[0])
                collect_point(seg[1])
        for path in con.get("paths", []) or []:
            for pt in path.get("wayPoints", []) or []:
                collect_point(pt)

    if not xs or not ys:
        return

    dx = -min(xs) if min(xs) < 0 else 0.0
    dy = -min(ys) if min(ys) < 0 else 0.0
    if dx == 0.0 and dy == 0.0:
        return

    shifted_points = set()

    def shift_point(pt: object) -> None:
        if is_real_point(pt):
            point_id = id(pt)
            if point_id in shifted_points:
                return
            shifted_points.add(point_id)
            pt[0] = float(pt[0]) + dx
            pt[1] = float(pt[1]) + dy

    for comp in data.get("components", []):
        shift_point(comp.get("params", {}).get("position"))

    for con in data.get("connections", []):
        params = con.get("params", {})
        for pt in params.get("wayPoints", []) or []:
            shift_point(pt)
        for seg in params.get("segments", []) or []:
            if len(seg) >= 2:
                shift_point(seg[0])
                shift_point(seg[1])
        for path in con.get("paths", []) or []:
            for pt in path.get("wayPoints", []) or []:
                shift_point(pt)


def update_design_extents(data: Dict) -> None:
    """Update declared spans to cover all placed components and routed paths."""
    xs: List[float] = []
    ys: List[float] = []

    for comp in data.get("components", []):
        rect = component_rect(comp)
        if rect is not None:
            xs.extend((rect[0], rect[2]))
            ys.extend((rect[1], rect[3]))

    for connection in data.get("connections", []):
        for p0, p1 in get_connection_segments(connection):
            xs.extend((p0[0], p1[0]))
            ys.extend((p0[1], p1[1]))

    if not xs or not ys:
        return

    params = data.setdefault("params", {})
    params["x-span"] = max(xs)
    params["y-span"] = max(ys)
    params["length"] = max(params["x-span"], params["y-span"])


def benchmark_result_dir(category: str, filename: str) -> str:
    repo_root = os.path.abspath(os.path.dirname(__file__))
    return os.path.join(repo_root, "Benchmarks", category, filename, "result")


def run(input_json: str, output_json: str, output_png: str) -> None:
    data = load_json(input_json)
    work = copy.deepcopy(data)

    obstacles = layer0_component_obstacles(work)
    records = assign_valve_positions(work)
    place_cports_compact(work, records)

    route_control_connections(work, records, obstacles)
    normalize_design_to_nonnegative(work)
    update_design_extents(work)

    save_json(output_json, work)
    visualize_layers(work, output_png)

    failed = [r for r in records if r.get("placement_failed") or r.get("routing_failed")]
    if failed:
        print("Cannot finish valid layer-1 synthesis for:")
        for rec in failed:
            reason = "routing" if rec.get("routing_failed") else "placement"
            detail = f":{rec.get('routing_failed_reason')}" if rec.get("routing_failed_reason") else ""
            print(
                f"- reason={reason}{detail} valve={rec['valve_id']} flow_connection={rec['flow_connection_id']} "
                f"control_port={rec['control_port_id']}"
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Synthesize control layer routing based on workflow.md")
    parser.add_argument("--category", default="case_control", help="Benchmark category used by tryreal.py")
    parser.add_argument("--filename", default="flow_and_control_demo_fromLFR", help="Benchmark filename used by tryreal.py")
    parser.add_argument("--input", default=None, help="Input result.json path")
    parser.add_argument("--output", default=None, help="Output json path")
    parser.add_argument("--plot", default=None, help="Output visualization png path")
    args = parser.parse_args()

    result_dir = benchmark_result_dir(args.category, args.filename)
    input_path = args.input or os.path.join(result_dir, "result.json")
    output_path = args.output or os.path.join(result_dir, "result_control.json")
    plot_path = args.plot or os.path.join(result_dir, "layer01_check.png")

    if not os.path.isabs(input_path):
        input_path = os.path.join(os.path.dirname(__file__), input_path)
    if not os.path.isabs(output_path):
        output_path = os.path.join(os.path.dirname(__file__), output_path)
    if not os.path.isabs(plot_path):
        plot_path = os.path.join(os.path.dirname(__file__), plot_path)

    run(input_path, output_path, plot_path)
    print(f"Done. Output JSON: {output_path}")
    print(f"Done. Layered plot: {plot_path}")

