#!/usr/bin/env python3
"""Count LFR benchmarks by literature functional class (multi-label).

Companion to plot_benchmark_counts.py (source-folder census). Mapping:
  CategoryMapping.md and functional_mapping.py

Bar height is the number of LFR files assigned to that class. Because a file
may carry several application labels, bar heights need not sum to the unique
file count. Colors: Nature CS bar-pair E steel.
"""

from __future__ import annotations

import argparse
import sys
from collections import Counter, defaultdict
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from functional_mapping import (  # noqa: E402
    FUNCTIONAL_CATEGORIES,
    classify_lfr,
    is_multi_function,
)

BENCHMARK_ROOT = SCRIPT_DIR.parent
LFR_ROOT = BENCHMARK_ROOT / "LFR-TestCases"
QUICK_ROOT = BENCHMARK_ROOT / "Quick_Examples"

LFR_COLOR = "#6FA2C4"
TEXT_COLOR = "#1A1A1A"
AXIS_COLOR = "#333333"
GRID_COLOR = "#E6E6E6"


def collect_lfr_paths() -> list[Path]:
    paths: list[Path] = []
    if LFR_ROOT.is_dir():
        paths.extend(sorted(p for p in LFR_ROOT.rglob("*.lfr") if p.is_file()))
    if QUICK_ROOT.is_dir():
        paths.extend(sorted(p for p in QUICK_ROOT.glob("*.lfr") if p.is_file()))
    return paths


def relative_key(path: Path) -> str:
    try:
        return path.relative_to(LFR_ROOT).as_posix()
    except ValueError:
        return f"Quick_Examples/{path.name}"


def collect_assignments() -> dict[str, tuple[str, ...]]:
    assigned: dict[str, tuple[str, ...]] = {}
    for path in collect_lfr_paths():
        key = relative_key(path)
        assigned[key] = classify_lfr(key)
    return assigned


def collect_counts(
    assigned: dict[str, tuple[str, ...]],
) -> tuple[list[str], list[int], list[int]]:
    counts: Counter[str] = Counter()
    multi_counts: Counter[str] = Counter()
    for labels in assigned.values():
        multi = is_multi_function(labels)
        for lab in labels:
            counts[lab] += 1
            if multi:
                multi_counts[lab] += 1
    values = [counts.get(cat, 0) for cat in FUNCTIONAL_CATEGORIES]
    multi_values = [multi_counts.get(cat, 0) for cat in FUNCTIONAL_CATEGORIES]
    return FUNCTIONAL_CATEGORIES, values, multi_values


def print_summary(
    assigned: dict[str, tuple[str, ...]],
    categories: list[str],
    values: list[int],
    multi_values: list[int],
) -> None:
    n_files = len(assigned)
    n_assign = sum(values)
    n_multi_files = sum(1 for labs in assigned.values() if is_multi_function(labs))
    name_w = max(len("Functional class"), *(len(c) for c in categories))
    print(f"{'Functional class':<{name_w}}  {'LFR':>5}  {'multi':>5}")
    print("-" * (name_w + 14))
    for cat, n, m in zip(categories, values, multi_values):
        print(f"{cat:<{name_w}}  {n:5d}  {m:5d}")
    print("-" * (name_w + 14))
    print(f"{'ASSIGNMENTS':<{name_w}}  {n_assign:5d}")
    print(f"{'UNIQUE FILES':<{name_w}}  {n_files:5d}")
    print(f"{'MULTI-FUNCTION FILES':<{name_w}}  {n_multi_files:5d}")
    if n_files != len(collect_lfr_paths()):
        raise SystemExit("assignment dict size != file count")
    empty = [c for c, n in zip(categories, values) if n == 0]
    if empty:
        raise SystemExit(f"empty classes should have been dropped: {empty}")


def print_class_lists(assigned: dict[str, tuple[str, ...]]) -> None:
    by_class: dict[str, list[str]] = defaultdict(list)
    for key, labels in sorted(assigned.items()):
        for lab in labels:
            by_class[lab].append(key)
    print("\n=== files per class ===")
    for cat in FUNCTIONAL_CATEGORIES:
        print(f"\n## {cat} ({len(by_class[cat])})")
        for key in by_class[cat]:
            tags = assigned[key]
            extra = "  (multi-function included)" if is_multi_function(tags) else ""
            print(f"  {key}{extra}")


def plot_counts(
    categories: list[str],
    values: list[int],
    multi_values: list[int],
    n_files: int,
    outfile: Path,
) -> None:
    x = np.arange(len(categories))
    exclusive = [n - m for n, m in zip(values, multi_values)]
    fig, ax = plt.subplots(figsize=(14.2, 6.6))
    ax.bar(
        x,
        exclusive,
        width=0.62,
        color=LFR_COLOR,
        edgecolor="white",
        linewidth=0.3,
        zorder=3,
        label="Single-function",
    )
    ax.bar(
        x,
        multi_values,
        width=0.62,
        bottom=exclusive,
        color=LFR_COLOR,
        edgecolor="white",
        linewidth=0.3,
        hatch="///",
        zorder=3,
        label="Multi-function included",
    )
    bars_for_labels = ax.bar(
        x,
        values,
        width=0.62,
        color="none",
        edgecolor="none",
        zorder=4,
    )
    ax.set_ylabel("Number of LFR assignments", fontsize=12, color=TEXT_COLOR)
    ax.set_xlabel("Functional class", fontsize=13, color=TEXT_COLOR)
    ax.set_title(
        "LFR benchmarks by application class (multi-label)",
        fontsize=14,
        pad=12,
        color=TEXT_COLOR,
    )
    ax.set_xticks(x)
    ax.set_xticklabels(
        categories,
        rotation=45,
        ha="right",
        rotation_mode="anchor",
        fontsize=10,
        color=AXIS_COLOR,
    )
    ax.tick_params(axis="y", labelsize=11, colors=AXIS_COLOR)
    ax.yaxis.grid(True, linestyle="--", linewidth=0.6, color=GRID_COLOR, zorder=0)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color(AXIS_COLOR)
    ax.spines["bottom"].set_color(AXIS_COLOR)
    ax.set_xlim(-0.7, len(categories) - 0.3)
    ymax = max(values) if values else 1
    ax.set_ylim(0, ymax * 1.22)
    ax.bar_label(bars_for_labels, labels=[str(n) for n in values], padding=3, fontsize=11)
    ax.legend(
        frameon=False,
        fontsize=11,
        loc="upper right",
        title=f"Unique LFR = {n_files}",
        title_fontsize=11,
    )

    fig.tight_layout()
    outfile.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(outfile, dpi=300, bbox_inches="tight", facecolor="white")
    pdf_path = outfile.with_suffix(".pdf")
    fig.savefig(pdf_path, bbox_inches="tight", facecolor="white")
    plt.close(fig)
    print(f"\nSaved {outfile}")
    print(f"Saved {pdf_path}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--list",
        action="store_true",
        help="Print per-class file lists",
    )
    args = parser.parse_args()
    assigned = collect_assignments()
    categories, values, multi_values = collect_counts(assigned)
    print_summary(assigned, categories, values, multi_values)
    if args.list:
        print_class_lists(assigned)
    plot_counts(
        categories,
        values,
        multi_values,
        len(assigned),
        SCRIPT_DIR / "benchmark_counts_by_function.png",
    )


if __name__ == "__main__":
    main()
