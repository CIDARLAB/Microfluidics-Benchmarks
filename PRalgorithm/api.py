"""Stable Python API around the legacy TREE-PLACE flow/control implementation."""

from __future__ import annotations

import json
import os
import shutil
import sys
import copy
from contextlib import contextmanager
from pathlib import Path
from typing import Iterator

try:
    from .normalize_connection_directions import repair_file as repair_connection_directions_file
except ImportError:  # Support direct execution via PRalgorithm/run_*.py.
    from normalize_connection_directions import repair_file as repair_connection_directions_file


PACKAGE_DIR = Path(__file__).resolve().parent
CORE_DIR = PACKAGE_DIR / "core"
REPO_ROOT = PACKAGE_DIR.parent

# The algorithms only save figures; a GUI backend makes headless/CI runs fail.
# Respect an explicit caller choice while providing a safe default.
os.environ.setdefault("MPLBACKEND", "Agg")
CLUSTER_SPACING = 2000.0


def _load_core() -> None:
    """Make the consolidated legacy modules importable with their original names."""
    core = str(CORE_DIR)
    if core not in sys.path:
        sys.path.insert(0, core)


@contextmanager
def _repo_working_directory() -> Iterator[None]:
    """Run legacy flow code from the repository root, where it expects Benchmarks/."""
    previous = Path.cwd()
    os.chdir(REPO_ROOT)
    try:
        yield
    finally:
        os.chdir(previous)


def _safe_category(category: str) -> Path:
    category_path = Path(category)
    if category_path.is_absolute() or ".." in category_path.parts:
        raise ValueError("category 必须是 Benchmarks 下不含 '..' 的相对路径")
    return category_path


def _safe_filename(filename: str) -> str:
    if not filename or Path(filename).name != filename or filename in {".", ".."}:
        raise ValueError("filename 必须是不含目录分隔符的 case 名称")
    return filename


def case_paths(category: str, filename: str) -> dict[str, Path]:
    """Return the canonical input/result paths for one benchmark case."""
    category_path = _safe_category(category)
    filename = _safe_filename(filename)
    case_dir = REPO_ROOT / "Benchmarks" / category_path / filename
    result_dir = case_dir / "result"
    return {
        "case_dir": case_dir,
        "input": case_dir / f"{filename}.json",
        "result_dir": result_dir,
        "flow_json": result_dir / "result.json",
        "control_json": result_dir / "result_control.json",
        "plot": result_dir / "layer01_check.png",
    }


def normalize_null_external_ports(input_json: str | Path) -> int:
    """Replace null external PORT endpoints with port id ``"1"`` in-place."""
    path = Path(input_json)
    with path.open("r", encoding="utf-8") as stream:
        data = json.load(stream)

    def is_external_port(component_id: object) -> bool:
        return isinstance(component_id, str) and component_id.lower().startswith("port_")

    changed = 0
    for connection in data.get("connections", []):
        source = connection.get("source", {})
        if is_external_port(source.get("component")) and source.get("port") is None:
            source["port"] = "1"
            changed += 1
        for sink in connection.get("sinks", []):
            if is_external_port(sink.get("component")) and sink.get("port") is None:
                sink["port"] = "1"
                changed += 1

    if changed:
        with path.open("w", encoding="utf-8") as stream:
            json.dump(data, stream, indent=4, ensure_ascii=False)
            stream.write("\n")
    return changed


def _stage_input(source: str | Path, destination: Path, overwrite: bool) -> None:
    source_path = Path(source).expanduser().resolve()
    if not source_path.is_file():
        raise FileNotFoundError(f"输入 JSON 不存在: {source_path}")
    if source_path == destination.resolve():
        return
    destination.parent.mkdir(parents=True, exist_ok=True)
    if destination.exists() and not overwrite:
        raise FileExistsError(f"目标输入已存在: {destination}；如需覆盖请传 overwrite=True/--force")
    shutil.copy2(source_path, destination)


def _layer0_clusters(data: dict, is_layer0) -> list[set[str]]:
    ids = {component.get("id") for component in data.get("components", []) if is_layer0(component)}
    graph = {component_id: set() for component_id in ids}
    for connection in data.get("connections", []):
        if not is_layer0(connection):
            continue
        endpoints = [connection.get("source", {}).get("component")]
        endpoints.extend(sink.get("component") for sink in connection.get("sinks", []))
        endpoints = [endpoint for endpoint in endpoints if endpoint in ids]
        for index, source in enumerate(endpoints):
            for target in endpoints[index + 1 :]:
                graph[source].add(target)
                graph[target].add(source)

    clusters = []
    seen = set()
    for component_id in sorted(ids):
        if component_id in seen:
            continue
        pending = [component_id]
        seen.add(component_id)
        cluster = set()
        while pending:
            current = pending.pop()
            cluster.add(current)
            for neighbor in graph[current]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    pending.append(neighbor)
        clusters.append(cluster)
    return clusters


def _cluster_design(data: dict, cluster_ids: set[str], is_layer0) -> dict:
    selected = copy.deepcopy(data)
    layer1_ids = set()
    selected_connections = []
    for connection in data.get("connections", []):
        if is_layer0(connection):
            source = connection.get("source", {}).get("component")
            sinks = [sink.get("component") for sink in connection.get("sinks", [])]
            if source in cluster_ids and all(sink in cluster_ids for sink in sinks):
                selected_connections.append(copy.deepcopy(connection))
                for valve in connection.get("params", {}).get("valves", []) or []:
                    if valve.get("componentid"):
                        layer1_ids.add(valve["componentid"])

    changed = True
    while changed:
        changed = False
        for connection in data.get("connections", []):
            if is_layer0(connection):
                continue
            endpoints = {connection.get("source", {}).get("component")}
            endpoints.update(sink.get("component") for sink in connection.get("sinks", []))
            if endpoints & layer1_ids:
                before = len(layer1_ids)
                layer1_ids.update(endpoint for endpoint in endpoints if endpoint)
                changed = changed or len(layer1_ids) != before

    for connection in data.get("connections", []):
        if is_layer0(connection):
            continue
        endpoints = {connection.get("source", {}).get("component")}
        endpoints.update(sink.get("component") for sink in connection.get("sinks", []))
        if endpoints and endpoints <= layer1_ids:
            selected_connections.append(copy.deepcopy(connection))
    keep_ids = cluster_ids | layer1_ids
    selected["components"] = [copy.deepcopy(c) for c in data.get("components", []) if c.get("id") in keep_ids]
    selected["connections"] = selected_connections
    return selected


def _design_bounds(data: dict, component_rect) -> tuple[float, float, float, float]:
    rects = [rect for component in data.get("components", []) if (rect := component_rect(component)) is not None]
    points = [(rect[0], rect[1]) for rect in rects] + [(rect[2], rect[3]) for rect in rects]
    for connection in data.get("connections", []):
        params = connection.get("params", {})
        for point in params.get("wayPoints", []) or []:
            if len(point) >= 2 and point != [-1, -1]:
                points.append((float(point[0]), float(point[1])))
        for path in connection.get("paths", []) or []:
            for point in path.get("wayPoints", []) or []:
                if len(point) >= 2 and point != [-1, -1]:
                    points.append((float(point[0]), float(point[1])))
    if not points:
        return (0.0, 0.0, 0.0, 0.0)
    return (min(p[0] for p in points), min(p[1] for p in points), max(p[0] for p in points), max(p[1] for p in points))


def _transform_design(data, bounds, target_x, target_y, rotation, component_rect, transform_rect, transform_point):
    for component in data.get("components", []):
        rect = component_rect(component)
        if rect is None:
            continue
        transformed = transform_rect(rect, bounds, target_x, target_y, rotation)
        component.setdefault("params", {})["position"] = [transformed[0], transformed[1]]
        if rotation:
            old = int(float(component.get("params", {}).get("rotation", 0))) % 360
            component["params"]["rotation"] = (old + rotation) % 360

    def point(value):
        if not isinstance(value, list) or len(value) < 2 or value == [-1, -1]:
            return value
        local = transform_point(value, bounds, rotation)
        return [target_x + local[0], target_y + local[1]]

    for connection in data.get("connections", []):
        params = connection.get("params", {})
        if "wayPoints" in params:
            params["wayPoints"] = [point(p) for p in params.get("wayPoints", []) or []]
        if "segments" in params:
            params["segments"] = [[point(s[0]), point(s[1])] for s in params.get("segments", []) or [] if len(s) >= 2]
        for path in connection.get("paths", []) or []:
            path["wayPoints"] = [point(p) for p in path.get("wayPoints", []) or []]


def run_flow(
    category: str,
    filename: str,
    *,
    input_json: str | Path | None = None,
    normalize_external_ports: bool = True,
    normalize_connection_directions: bool = True,
    overwrite: bool = False,
) -> Path:
    """Run layer-0 placement/routing and return ``result.json``."""
    paths = case_paths(category, filename)
    if input_json is not None:
        _stage_input(input_json, paths["input"], overwrite)
    if not paths["input"].is_file():
        raise FileNotFoundError(f"找不到 benchmark 输入: {paths['input']}")

    if normalize_external_ports:
        changed = normalize_null_external_ports(paths["input"])
        if changed:
            print(f'Normalized {changed} null external PORT endpoint(s) to "1".')

    if normalize_connection_directions:
        direction_report = repair_connection_directions_file(paths["input"], in_place=True)
        if direction_report["changes"]:
            changed_ids = ", ".join(change["connection"] for change in direction_report["changes"])
            print(
                f"Reversed {len(direction_report['changes'])} connection(s) with opposite-port "
                f"direction conflicts: {changed_ids}."
            )

    _load_core()
    from flow_syn import gen_PR_developing

    with _repo_working_directory():
        gen_PR_developing(str(_safe_category(category)).replace("\\", "/"), _safe_filename(filename))

    result = paths["flow_json"]
    if not result.is_file():
        raise RuntimeError("flow 层未生成 result.json；请检查此前日志中的重排或路由失败信息")
    return result


def run_control(
    input_json: str | Path,
    output_json: str | Path,
    output_png: str | Path,
) -> tuple[Path, Path]:
    """Run layer-1 control synthesis on an existing layer-0 JSON."""
    input_path = Path(input_json).expanduser().resolve()
    output_path = Path(output_json).expanduser().resolve()
    plot_path = Path(output_png).expanduser().resolve()
    if not input_path.is_file():
        raise FileNotFoundError(f"flow 结果不存在: {input_path}")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    plot_path.parent.mkdir(parents=True, exist_ok=True)

    _load_core()
    from control_syn import run as synthesize_control

    synthesize_control(str(input_path), str(output_path), str(plot_path))
    if not output_path.is_file() or not plot_path.is_file():
        raise RuntimeError("control 层未生成预期的 JSON/PNG 输出")
    return output_path, plot_path


def _run_clustered_flow_control(category: str, filename: str, paths: dict[str, Path], data: dict, clusters):
    _load_core()
    from flow_syn import (
        _json_is_layer0,
        _pack_subgraph_blocks,
        _transform_local_point,
        _transform_rect,
        gen_PR_developing,
        visualize_final_layer0,
    )
    from control_syn import component_rect, run as synthesize_control, update_design_extents, visualize_layers

    cluster_root = paths["case_dir"] / "clusters"
    if cluster_root.exists():
        shutil.rmtree(cluster_root)
    cluster_root.mkdir(parents=True)
    results = []
    with _repo_working_directory():
        for index, cluster_ids in enumerate(clusters):
            cluster_name = f"{filename}__cluster_{index:02d}"
            cluster_dir = cluster_root / cluster_name
            cluster_dir.mkdir()
            cluster_data = _cluster_design(data, cluster_ids, _json_is_layer0)
            cluster_input = cluster_dir / f"{cluster_name}.json"
            # Legacy core/readjson.py uses the platform default encoding.
            # Keep temporary inputs ASCII-only so they are portable on Windows.
            cluster_input.write_text(json.dumps(cluster_data, indent=4, ensure_ascii=True), encoding="utf-8")
            cluster_category = cluster_dir.parent.relative_to(REPO_ROOT / "Benchmarks").as_posix()
            cluster_paths = case_paths(cluster_category, cluster_name)
            print(f"Running independent cluster {index + 1}/{len(clusters)}: {sorted(cluster_ids)}")

            if len(cluster_ids) == 1 and not any(_json_is_layer0(c) for c in cluster_data.get("connections", [])):
                cluster_paths["result_dir"].mkdir(parents=True, exist_ok=True)
                singleton = copy.deepcopy(cluster_data)
                only_id = next(iter(cluster_ids))
                for component in singleton.get("components", []):
                    if component.get("id") == only_id:
                        component.setdefault("params", {})["position"] = [0.0, 0.0]
                (cluster_dir / "tree.json").write_text(
                    json.dumps({"maxrow": 1, "items": [{"name": only_id, "row": 0, "idinrow": 0, "rotation": 0}]}, indent=4),
                    encoding="utf-8",
                )
                singleton["IsPlacedAndRouted"] = True
                update_design_extents(singleton)
                cluster_paths["flow_json"].write_text(json.dumps(singleton, indent=4), encoding="utf-8")
                visualize_final_layer0(singleton, str(cluster_paths["result_dir"] / "9_result_sym_compact_final.png"))
            else:
                gen_PR_developing(cluster_category, cluster_name)

            synthesize_control(str(cluster_paths["flow_json"]), str(cluster_paths["control_json"]), str(cluster_paths["plot"]))
            results.append(json.loads(cluster_paths["control_json"].read_text(encoding="utf-8")))

    blocks = []
    for result in results:
        bounds = _design_bounds(result, component_rect)
        blocks.append({
            "bounds": bounds,
            "area": (bounds[2] - bounds[0]) * (bounds[3] - bounds[1]),
            "allowed_rotations": (0, 90),
        })
    placements = _pack_subgraph_blocks(blocks, spacing=CLUSTER_SPACING)
    for index, result in enumerate(results):
        placement = placements[index]
        _transform_design(
            result,
            blocks[index]["bounds"],
            placement["rect"][0],
            placement["rect"][1],
            placement["rotation"],
            component_rect,
            _transform_rect,
            _transform_local_point,
        )

    merged = copy.deepcopy(data)
    merged["components"] = [component for result in results for component in result.get("components", [])]
    merged["connections"] = [connection for result in results for connection in result.get("connections", [])]
    merged["IsPlacedAndRouted"] = True
    update_design_extents(merged)

    placed_components = {c.get("id"): c for c in merged["components"] if _json_is_layer0(c)}
    placed_connections = {c.get("id"): c for c in merged["connections"] if _json_is_layer0(c)}
    flow_only = copy.deepcopy(data)
    flow_only["components"] = [copy.deepcopy(placed_components.get(c.get("id"), c)) for c in data.get("components", [])]
    flow_only["connections"] = [copy.deepcopy(placed_connections.get(c.get("id"), c)) for c in data.get("connections", [])]
    flow_only["IsPlacedAndRouted"] = True
    update_design_extents(flow_only)

    paths["result_dir"].mkdir(parents=True, exist_ok=True)
    paths["flow_json"].write_text(json.dumps(flow_only, indent=4), encoding="utf-8")
    paths["control_json"].write_text(json.dumps(merged, indent=4), encoding="utf-8")
    visualize_final_layer0(flow_only, str(paths["result_dir"] / "9_result_sym_compact_final.png"))
    visualize_layers(merged, str(paths["plot"]))
    return paths["flow_json"], paths["control_json"], paths["plot"]


def run_flow_control(
    category: str,
    filename: str,
    *,
    input_json: str | Path | None = None,
    output_json: str | Path | None = None,
    output_png: str | Path | None = None,
    normalize_external_ports: bool = True,
    normalize_connection_directions: bool = True,
    overwrite: bool = False,
) -> tuple[Path, Path, Path]:
    """Run layer 0 followed by layer 1 and return all principal outputs."""
    paths = case_paths(category, filename)
    if input_json is not None:
        _stage_input(input_json, paths["input"], overwrite)
    if not paths["input"].is_file():
        raise FileNotFoundError(f"找不到 benchmark 输入: {paths['input']}")
    if normalize_external_ports:
        normalize_null_external_ports(paths["input"])
    if normalize_connection_directions:
        direction_report = repair_connection_directions_file(paths["input"], in_place=True)
        if direction_report["changes"]:
            changed_ids = ", ".join(change["connection"] for change in direction_report["changes"])
            print(
                f"Reversed {len(direction_report['changes'])} connection(s) with opposite-port "
                f"direction conflicts: {changed_ids}."
            )

    _load_core()
    from flow_syn import _json_is_layer0
    data = json.loads(paths["input"].read_text(encoding="utf-8"))
    clusters = _layer0_clusters(data, _json_is_layer0)
    if len(clusters) > 1:
        print(f"Detected {len(clusters)} disconnected layer-0 cluster(s); running each independently.")
        flow_json, default_control, default_plot = _run_clustered_flow_control(category, filename, paths, data, clusters)
        control_json = Path(output_json).expanduser().resolve() if output_json else default_control
        plot = Path(output_png).expanduser().resolve() if output_png else default_plot
        if control_json != default_control:
            control_json.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(default_control, control_json)
        if plot != default_plot:
            plot.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(default_plot, plot)
        return flow_json, control_json, plot

    flow_json = run_flow(
        category,
        filename,
        normalize_external_ports=False,
        normalize_connection_directions=False,
    )
    control_json = Path(output_json).expanduser().resolve() if output_json else paths["control_json"]
    plot = Path(output_png).expanduser().resolve() if output_png else paths["plot"]
    control_json, plot = run_control(flow_json, control_json, plot)
    return flow_json, control_json, plot
