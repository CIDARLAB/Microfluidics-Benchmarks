"""Repair inconsistent source/sink roles on opposite device ports.

The row placer derives vertical hierarchy from connection direction.  If two
opposite physical ports of a device are both sources (or both sinks), their
external PORT components are assigned to the same side of the device.  This
preprocessor makes the roles on opposite sides complementary before P&R.
"""

from __future__ import annotations

import argparse
import copy
import json
from pathlib import Path
from typing import Any


def _is_flow_layer(item: dict[str, Any]) -> bool:
    if "layer" in item:
        return str(item.get("layer")) == "0"
    layers = item.get("layers")
    return not isinstance(layers, list) or any(str(layer) == "0" for layer in layers)


def _is_external_port(component: dict[str, Any]) -> bool:
    return str(component.get("entity", "")).upper() == "PORT" or str(component.get("id", "")).lower().startswith("port_")


def _port_side(component: dict[str, Any], port_label: Any, tolerance: float = 1e-6) -> str | None:
    width = float(component.get("x-span", component.get("params", {}).get("width", 0.0)))
    height = float(component.get("y-span", component.get("params", {}).get("length", 0.0)))
    port = next((p for p in component.get("ports", []) if str(p.get("label")) == str(port_label)), None)
    if port is None or width <= 0.0 or height <= 0.0:
        return None

    x, y = float(port.get("x", 0.0)), float(port.get("y", 0.0))
    # Prefer the vertical classification for an exact corner.  Ordinary MINT
    # device ports lie at side midpoints, so this tie-break is rarely needed.
    if abs(y) <= tolerance:
        return "bottom"
    if abs(y - height) <= tolerance:
        return "top"
    if abs(x) <= tolerance:
        return "left"
    if abs(x - width) <= tolerance:
        return "right"
    return None


def _flip_binary_connection(connection: dict[str, Any]) -> None:
    old_source = copy.deepcopy(connection["source"])
    old_sink = copy.deepcopy(connection["sinks"][0])
    connection["source"] = old_sink
    connection["sinks"] = [old_source]
    # Direction changes invalidate any route geometry already attached to the
    # input.  P&R will regenerate it from the corrected topology.
    connection["paths"] = []
    params = connection.setdefault("params", {})
    params["start"] = ["Point", -1, -1]
    params["end"] = [-1, -1]
    params["wayPoints"] = [[-1, -1]]
    params["segments"] = [[[-1, -1], [-1, -1]]]


def repair_opposite_port_directions(
    data: dict[str, Any],
    *,
    vertical_source_side: str = "bottom",
    horizontal_source_side: str = "left",
    include_horizontal: bool = False,
) -> dict[str, Any]:
    """Repair opposite-side role conflicts and return a structured report."""
    if vertical_source_side not in {"bottom", "top"}:
        raise ValueError("vertical_source_side must be 'bottom' or 'top'")
    if horizontal_source_side not in {"left", "right"}:
        raise ValueError("horizontal_source_side must be 'left' or 'right'")

    components = {component.get("id"): component for component in data.get("components", [])}
    records_by_component: dict[str, list[dict[str, Any]]] = {}
    skipped = []

    for connection in data.get("connections", []):
        if not _is_flow_layer(connection):
            continue
        source = connection.get("source", {})
        sinks = connection.get("sinks", [])
        if len(sinks) != 1:
            skipped.append({"connection": connection.get("id"), "reason": "not_one_to_one"})
            continue

        source_component = components.get(source.get("component"))
        sink_component = components.get(sinks[0].get("component"))
        if source_component is None or sink_component is None:
            skipped.append({"connection": connection.get("id"), "reason": "missing_component"})
            continue

        if _is_external_port(source_component) == _is_external_port(sink_component):
            continue

        if _is_external_port(source_component):
            device, endpoint, role = sink_component, sinks[0], "sink"
        else:
            device, endpoint, role = source_component, source, "source"

        side = _port_side(device, endpoint.get("port"))
        if side is None:
            skipped.append(
                {
                    "connection": connection.get("id"),
                    "component": device.get("id"),
                    "port": endpoint.get("port"),
                    "reason": "port_not_on_component_boundary",
                }
            )
            continue
        records_by_component.setdefault(device["id"], []).append(
            {"connection": connection, "port": endpoint.get("port"), "side": side, "role": role}
        )

    changes = []
    conflicts = []
    handled_connections: set[int] = set()
    # Rows encode vertical hierarchy. Therefore top/bottom conflicts are the
    # default repair target. Left/right normalization is available only as an
    # explicit option because forcing side ports onto different rows can itself
    # introduce a crossing after component mirroring.
    axes = [("vertical", "bottom", "top", vertical_source_side)]
    if include_horizontal:
        axes.append(("horizontal", "left", "right", horizontal_source_side))

    for component_id, records in records_by_component.items():
        for axis, side_a, side_b, preferred_source_side in axes:
            group_a = [record for record in records if record["side"] == side_a]
            group_b = [record for record in records if record["side"] == side_b]
            if not group_a or not group_b:
                continue

            roles_a = {record["role"] for record in group_a}
            roles_b = {record["role"] for record in group_b}
            if not (roles_a & roles_b):
                continue

            conflicts.append(
                {
                    "component": component_id,
                    "axis": axis,
                    "sides": [side_a, side_b],
                    "connections": [record["connection"].get("id") for record in group_a + group_b],
                }
            )

            candidates = []
            for source_side in (side_a, side_b):
                desired = {source_side: "source", side_b if source_side == side_a else side_a: "sink"}
                flips = sum(record["role"] != desired[record["side"]] for record in group_a + group_b)
                preference_penalty = 0 if source_side == preferred_source_side else 1
                candidates.append((flips, preference_penalty, source_side, desired))
            _, _, _, desired_roles = min(candidates, key=lambda item: (item[0], item[1]))

            for record in group_a + group_b:
                connection_key = id(record["connection"])
                desired_role = desired_roles[record["side"]]
                if record["role"] == desired_role or connection_key in handled_connections:
                    continue
                old_source = copy.deepcopy(record["connection"].get("source"))
                old_sink = copy.deepcopy(record["connection"].get("sinks", [None])[0])
                _flip_binary_connection(record["connection"])
                handled_connections.add(connection_key)
                changes.append(
                    {
                        "connection": record["connection"].get("id"),
                        "component": component_id,
                        "port": record["port"],
                        "side": record["side"],
                        "old_role": record["role"],
                        "new_role": desired_role,
                        "old_source": old_source,
                        "old_sink": old_sink,
                    }
                )
                record["role"] = desired_role

    return {"conflicts": conflicts, "changes": changes, "skipped": skipped}


def repair_file(
    input_path: str | Path,
    output_path: str | Path | None = None,
    *,
    in_place: bool = False,
    vertical_source_side: str = "bottom",
    horizontal_source_side: str = "left",
    include_horizontal: bool = False,
) -> dict[str, Any]:
    input_path = Path(input_path)
    data = json.loads(input_path.read_text(encoding="utf-8"))
    report = repair_opposite_port_directions(
        data,
        vertical_source_side=vertical_source_side,
        horizontal_source_side=horizontal_source_side,
        include_horizontal=include_horizontal,
    )
    if in_place:
        destination = input_path
    elif output_path is not None:
        destination = Path(output_path)
    else:
        destination = input_path.with_name(f"{input_path.stem}_direction_fixed{input_path.suffix}")
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json.dumps(data, indent=4), encoding="utf-8")
    report["input"] = str(input_path)
    report["output"] = str(destination)
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input_json")
    parser.add_argument("-o", "--output")
    parser.add_argument("--in-place", action="store_true")
    parser.add_argument("--check", action="store_true", help="Detect and report only; do not write JSON")
    parser.add_argument("--vertical-source-side", choices=("bottom", "top"), default="bottom")
    parser.add_argument("--horizontal-source-side", choices=("left", "right"), default="left")
    parser.add_argument(
        "--include-horizontal",
        action="store_true",
        help="Also normalize left/right pairs; disabled by default because rows encode vertical hierarchy",
    )
    parser.add_argument("--report-json", help="Optional path for the structured report")
    args = parser.parse_args()
    if args.in_place and args.output:
        parser.error("--in-place and --output are mutually exclusive")

    input_path = Path(args.input_json)
    data = json.loads(input_path.read_text(encoding="utf-8"))
    report = repair_opposite_port_directions(
        data,
        vertical_source_side=args.vertical_source_side,
        horizontal_source_side=args.horizontal_source_side,
        include_horizontal=args.include_horizontal,
    )
    if not args.check:
        destination = input_path if args.in_place else Path(args.output) if args.output else input_path.with_name(
            f"{input_path.stem}_direction_fixed{input_path.suffix}"
        )
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(json.dumps(data, indent=4), encoding="utf-8")
        report["output"] = str(destination)

    print(json.dumps(report, indent=2))
    if args.report_json:
        Path(args.report_json).write_text(json.dumps(report, indent=2), encoding="utf-8")
    return 2 if args.check and report["conflicts"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
