#!/usr/bin/env python3
"""Count Neptune 2026 LFR/MINT benchmarks by category and plot grouped bars.

Categories are the top-level folders under LFR-TestCases/ and MINT-TestCases/,
plus Quick_Examples (top-level source files only). Generated copies under
Results/, prompt_test/, and nested Quick_Examples run artifacts are excluded.

Colors follow Neptune Nature CS bar-pair E (steel vs sand)
(`.cursor/skills/nature-cs-figures/palette.md`).
"""

from __future__ import annotations

from collections import defaultdict
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

SCRIPT_DIR = Path(__file__).resolve().parent
BENCHMARK_ROOT = SCRIPT_DIR.parent
LFR_ROOT = BENCHMARK_ROOT / "LFR-TestCases"
MINT_ROOT = BENCHMARK_ROOT / "MINT-TestCases"
QUICK_ROOT = BENCHMARK_ROOT / "Quick_Examples"

# Nature CS bar-pair E (MAPLE): steel vs sand.
LFR_COLOR = "#6FA2C4"
MINT_COLOR = "#F1B671"
TEXT_COLOR = "#1A1A1A"
AXIS_COLOR = "#333333"
GRID_COLOR = "#E6E6E6"

# Directories that are not benchmark groups (JSON router tests, empty placeholders).
SKIP_CATEGORY_DIRS = {"Aarf_Router_Test"}

# Folder name on disk -> label used in the plot and printed table.
# Multiple folders may map to one display name; their counts are summed.
DISPLAY_NAMES = {
    "Mars": "Igem_2017_Boston_U_Devices",
    "Protocols": "Igem_2017_Boston_U_Devices",
    "Graph_Coverage": "Technology_Mapping",
}


def count_by_top_folder(root: Path, suffix: str) -> dict[str, int]:
    counts: dict[str, int] = defaultdict(int)
    if not root.is_dir():
        return counts
    for path in root.rglob(f"*{suffix}"):
        if not path.is_file():
            continue
        try:
            rel = path.relative_to(root)
        except ValueError:
            continue
        category = rel.parts[0]
        if category in SKIP_CATEGORY_DIRS:
            continue
        counts[category] += 1
    return dict(counts)


def count_quick_examples() -> tuple[int, int]:
    """Count only top-level source files, not generated/nested copies."""
    if not QUICK_ROOT.is_dir():
        return 0, 0
    lfr_n = sum(1 for p in QUICK_ROOT.glob("*.lfr") if p.is_file())
    mint_n = sum(1 for p in QUICK_ROOT.glob("*.mint") if p.is_file())
    return lfr_n, mint_n


def collect_counts() -> tuple[list[str], list[int], list[int]]:
    lfr_counts = count_by_top_folder(LFR_ROOT, ".lfr")
    mint_counts = count_by_top_folder(MINT_ROOT, ".mint")
    quick_lfr, quick_mint = count_quick_examples()
    if quick_lfr or quick_mint:
        lfr_counts["Quick_Examples"] = quick_lfr
        mint_counts["Quick_Examples"] = quick_mint

    def remap(raw: dict[str, int]) -> dict[str, int]:
        merged: dict[str, int] = defaultdict(int)
        for folder, n in raw.items():
            merged[DISPLAY_NAMES.get(folder, folder)] += n
        return dict(merged)

    lfr_counts = remap(lfr_counts)
    mint_counts = remap(mint_counts)

    categories = sorted(set(lfr_counts) | set(mint_counts), key=str.lower)
    lfr_vals = [lfr_counts.get(cat, 0) for cat in categories]
    mint_vals = [mint_counts.get(cat, 0) for cat in categories]
    return categories, lfr_vals, mint_vals


def print_summary(categories: list[str], lfr_vals: list[int], mint_vals: list[int]) -> None:
    name_w = max(len("Category"), *(len(c) for c in categories))
    print(f"{'Category':<{name_w}}  {'LFR':>5}  {'MINT':>5}  {'Total':>5}")
    print("-" * (name_w + 20))
    for cat, n_lfr, n_mint in zip(categories, lfr_vals, mint_vals):
        print(f"{cat:<{name_w}}  {n_lfr:5d}  {n_mint:5d}  {n_lfr + n_mint:5d}")
    print("-" * (name_w + 20))
    print(
        f"{'TOTAL':<{name_w}}  {sum(lfr_vals):5d}  {sum(mint_vals):5d}  "
        f"{sum(lfr_vals) + sum(mint_vals):5d}"
    )


def plot_counts(
    categories: list[str],
    lfr_vals: list[int],
    mint_vals: list[int],
    outfile: Path,
) -> None:
    x = np.arange(len(categories))
    width = 0.28
    fig, ax = plt.subplots(figsize=(16.5, 7.0))

    bars_lfr = ax.bar(
        x - width / 2,
        lfr_vals,
        width,
        label=f"LFR (total = {sum(lfr_vals)})",
        color=LFR_COLOR,
        edgecolor="white",
        linewidth=0.3,
        zorder=3,
    )
    bars_mint = ax.bar(
        x + width / 2,
        mint_vals,
        width,
        label=f"MINT (total = {sum(mint_vals)})",
        color=MINT_COLOR,
        edgecolor="white",
        linewidth=0.3,
        zorder=3,
    )

    ax.set_ylabel("Number of benchmarks", fontsize=12, color=TEXT_COLOR)
    ax.set_xlabel("Benchmark category", fontsize=13, color=TEXT_COLOR)
    ax.set_title("Neptune 2026 benchmark counts by category", fontsize=14, pad=12, color=TEXT_COLOR)
    ax.set_xticks(x)
    ax.set_xticklabels(
        categories, rotation=45, ha="right", rotation_mode="anchor", fontsize=12, color=AXIS_COLOR
    )
    ax.tick_params(axis="y", labelsize=11, colors=AXIS_COLOR)
    ax.legend(frameon=False, fontsize=12, loc="upper right")
    ax.yaxis.grid(True, linestyle="--", linewidth=0.6, color=GRID_COLOR, zorder=0)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color(AXIS_COLOR)
    ax.spines["bottom"].set_color(AXIS_COLOR)
    ax.set_xlim(-0.7, len(categories) - 0.3)
    ymax = max(lfr_vals + mint_vals)
    ax.set_ylim(0, ymax * 1.18 if ymax else 1)
    label_offset = (ymax * 0.018) if ymax else 0

    lfr_labels = []
    mint_labels = []
    for n_lfr, n_mint in zip(lfr_vals, mint_vals):
        if n_lfr == n_mint:
            lfr_labels.append("")
            mint_labels.append("")
        else:
            lfr_labels.append(n_lfr if n_lfr else "")
            mint_labels.append(n_mint if n_mint else "")
    ax.bar_label(bars_lfr, labels=lfr_labels, padding=3, fontsize=11)
    ax.bar_label(bars_mint, labels=mint_labels, padding=3, fontsize=11)

    for xi, n_lfr, n_mint in zip(x, lfr_vals, mint_vals):
        if n_lfr == n_mint and n_lfr:
            ax.text(
                xi,
                n_lfr + label_offset,
                str(n_lfr),
                ha="center",
                va="bottom",
                fontsize=11,
                color=TEXT_COLOR,
                clip_on=False,
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
    categories, lfr_vals, mint_vals = collect_counts()
    print_summary(categories, lfr_vals, mint_vals)
    plot_counts(
        categories,
        lfr_vals,
        mint_vals,
        SCRIPT_DIR / "benchmark_counts_by_category.png",
    )


if __name__ == "__main__":
    main()
