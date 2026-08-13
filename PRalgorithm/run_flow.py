"""Command-line entry point for TREE-PLACE layer-0 flow synthesis."""

from __future__ import annotations

import argparse

from api import run_flow


def main() -> None:
    parser = argparse.ArgumentParser(description="运行 TREE-PLACE flow 层放置与布线")
    parser.add_argument("--category", default="case_control", help="Benchmarks 下的分类相对路径")
    parser.add_argument("--filename", default="flow_and_control_demo_fromLFR", help="case 名称（不含 .json）")
    parser.add_argument("--input", help="可选：将任意输入 JSON 复制到标准 benchmark 位置后运行")
    parser.add_argument("--force", action="store_true", help="允许 --input 覆盖已存在的标准输入")
    parser.add_argument(
        "--no-normalize-external-ports",
        action="store_true",
        help="不把外部 PORT 端点的 null port 自动改为字符串 \"1\"",
    )
    args = parser.parse_args()

    output = run_flow(
        args.category,
        args.filename,
        input_json=args.input,
        normalize_external_ports=not args.no_normalize_external_ports,
        overwrite=args.force,
    )
    print(f"Done. Layer-0 JSON: {output}")


if __name__ == "__main__":
    main()
