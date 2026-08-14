"""Command-line entry point for the complete flow + control pipeline."""

from __future__ import annotations

import argparse
from pathlib import Path

from api import REPO_ROOT, run_flow_control


def _optional_absolute(path: str | None) -> Path | None:
    if path is None:
        return None
    candidate = Path(path).expanduser()
    return candidate.resolve() if candidate.is_absolute() else (REPO_ROOT / candidate).resolve()


def main() -> None:
    parser = argparse.ArgumentParser(description="依次运行 TREE-PLACE flow 层和 control 层")
    parser.add_argument("--category", default="case_control", help="Benchmarks 下的分类相对路径")
    parser.add_argument("--filename", default="flow_and_control_demo_fromLFR", help="case 名称（不含 .json）")
    parser.add_argument("--input", help="可选：复制到标准 benchmark 位置的原始输入 JSON")
    parser.add_argument("--output", help="可选：control 输出 JSON；相对路径按仓库根目录解析")
    parser.add_argument("--plot", help="可选：联合检查图；相对路径按仓库根目录解析")
    parser.add_argument("--force", action="store_true", help="允许 --input 覆盖已存在的标准输入")
    parser.add_argument(
        "--no-normalize-external-ports",
        action="store_true",
        help="不把外部 PORT 端点的 null port 自动改为字符串 \"1\"",
    )
    parser.add_argument(
        "--no-normalize-connection-directions",
        action="store_true",
        help="Do not repair top/bottom source/sink conflicts before flow P&R",
    )
    args = parser.parse_args()

    flow_json, control_json, plot = run_flow_control(
        args.category,
        args.filename,
        input_json=args.input,
        output_json=_optional_absolute(args.output),
        output_png=_optional_absolute(args.plot),
        normalize_external_ports=not args.no_normalize_external_ports,
        normalize_connection_directions=not args.no_normalize_connection_directions,
        overwrite=args.force,
    )
    print(f"Done. Layer-0 JSON: {flow_json}")
    print(f"Done. Layer-0 + layer-1 JSON: {control_json}")
    print(f"Done. Layered plot: {plot}")


if __name__ == "__main__":
    main()
