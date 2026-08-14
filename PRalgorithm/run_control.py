"""Command-line entry point for TREE-PLACE layer-1 control synthesis."""

from __future__ import annotations

import argparse
from pathlib import Path

from api import REPO_ROOT, case_paths, run_control


def _absolute(path: str) -> Path:
    candidate = Path(path).expanduser()
    return candidate.resolve() if candidate.is_absolute() else (REPO_ROOT / candidate).resolve()


def main() -> None:
    parser = argparse.ArgumentParser(description="在已有 flow 结果上运行 TREE-PLACE control 层综合")
    parser.add_argument("--category", default="case_control", help="默认输入/输出所用 benchmark 分类")
    parser.add_argument("--filename", default="flow_and_control_demo_fromLFR", help="默认输入/输出所用 case 名称")
    parser.add_argument("--input", help="flow 层 result.json；相对路径按仓库根目录解析")
    parser.add_argument("--output", help="control 层输出 JSON；相对路径按仓库根目录解析")
    parser.add_argument("--plot", help="layer0/layer1 检查图；相对路径按仓库根目录解析")
    args = parser.parse_args()

    defaults = case_paths(args.category, args.filename)
    input_json = _absolute(args.input) if args.input else defaults["flow_json"]
    output_json = _absolute(args.output) if args.output else defaults["control_json"]
    output_png = _absolute(args.plot) if args.plot else defaults["plot"]
    output_json, output_png = run_control(input_json, output_json, output_png)
    print(f"Done. Layer-0 + layer-1 JSON: {output_json}")
    print(f"Done. Layered plot: {output_png}")


if __name__ == "__main__":
    main()
