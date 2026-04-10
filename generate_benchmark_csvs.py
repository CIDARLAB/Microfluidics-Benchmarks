#!/usr/bin/env python3
"""
Build BenchmarkLFRInfo.csv and BenchmarkMINTInfo.csv from source cases and routed JSON.

Run from Neptune repo root (same as other poetry commands):

    poetry run python Microfluidics-Benchmarks/generate_benchmark_csvs.py

Results under a custom tree (e.g. Results/QuickTest/...)::

    poetry run python Microfluidics-Benchmarks/generate_benchmark_csvs.py \\
      --lfr-results-root Microfluidics-Benchmarks/Results/QuickTest/LFR-TestCases \\
      --mint-results-root Microfluidics-Benchmarks/Results/QuickTest/MINT-TestCases \\
      --lfr-csv Microfluidics-Benchmarks/BenchmarkLFRInfo_QuickTest.csv \\
      --mint-csv Microfluidics-Benchmarks/BenchmarkMINTInfo_QuickTest.csv

Or:

    ./Microfluidics-Benchmarks/generate_benchmark_csvs.sh [args...]
"""

from __future__ import annotations

import argparse
import contextlib
import csv
import io
import json
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence, Tuple

# Repo root (parent of Microfluidics-Benchmarks/)
_REPO_ROOT = Path(__file__).resolve().parent.parent
_BM = _REPO_ROOT / "Microfluidics-Benchmarks"

if str(_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPO_ROOT))

from fluigi.evaluation_metric import compute_layout_evaluation_scores

# ---------------------------------------------------------------------------
# Global: suite folder names under LFR-TestCases/ and MINT-TestCases/.
# Leave empty [] to include every immediate subfolder (union of both trees), same as the
# synthesize script. Set e.g. ["test", "dropx"] to limit CSV rows.
# ---------------------------------------------------------------------------
BENCHMARK_FOLDERS: List[str] = []


def _discover_benchmark_folders() -> List[str]:
    names: set[str] = set()
    for sub in ("LFR-TestCases", "MINT-TestCases"):
        root = _BM / sub
        if not root.is_dir():
            continue
        for p in root.iterdir():
            if p.is_dir() and not p.name.startswith("."):
                names.add(p.name)
    return sorted(names)


def _benchmark_folders_effective() -> List[str]:
    if BENCHMARK_FOLDERS:
        return list(BENCHMARK_FOLDERS)
    discovered = _discover_benchmark_folders()
    if not discovered:
        raise SystemExit(
            "No benchmark folders found under LFR-TestCases/ or MINT-TestCases/."
        )
    return discovered

# Evaluation sub-scores in the same column order as fluigi.evaluation_metric.record_device_score
SCORE_HEADERS = [
    "Area Score",
    "Connection Length Score",
    "Position Score",
    "Symmetry Score",
    "Bend Score",
    "Overall Score",
]

CSV_COLUMNS = [
    "Format",
    "Benchmark Name",
    "Input Lines",
    "Num Components (layout)",
    "Flow-layer Components",
    "Control-layer Components",
    *SCORE_HEADERS,
]


def _count_input_lines(path: Path) -> int:
    try:
        text = path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return 0
    if not text:
        return 0
    return len(text.splitlines())


def _layer_counts_from_components(
    components: Sequence[dict],
) -> Tuple[int, int, int]:
    """Returns (total, flow_layer_count, control_layer_count)."""
    n_flow = 0
    n_control = 0
    for c in components:
        layers = c.get("layers") or []
        if "1" in layers:
            n_control += 1
        if "0" in layers or not layers:
            n_flow += 1
    return len(components), n_flow, n_control


def _read_layout_stats(pr_path: Path) -> Optional[Tuple[int, int, int]]:
    if not pr_path.is_file():
        return None
    try:
        data = json.loads(pr_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return None
    comps = data.get("components") or []
    return _layer_counts_from_components(comps)


def _scores_for_row(pr_path: Path) -> Dict[str, str]:
    out = {h: "" for h in SCORE_HEADERS}
    # Suppress noisy stdout from dependencies (e.g. cairo/PIL) during scoring.
    with contextlib.redirect_stdout(io.StringIO()):
        metrics = compute_layout_evaluation_scores(str(pr_path))
    if metrics is None:
        return out
    key_map = {
        "Area Score": "area_score",
        "Connection Length Score": "connection_length_score",
        "Position Score": "position_score",
        "Symmetry Score": "symmetry_score",
        "Bend Score": "bend_score",
        "Overall Score": "overall_score",
    }
    for hdr, mkey in key_map.items():
        v = metrics.get(mkey)
        if v is not None:
            out[hdr] = f"{float(v):.3f}"
    return out


def _resolve_under_repo(p: Path) -> Path:
    if p.is_absolute():
        return p.resolve()
    return (_REPO_ROOT / p).resolve()


def _iter_lfr_jobs(
    folders: Sequence[str],
    *,
    lfr_cases_root: Path,
    lfr_results_root: Path,
) -> List[Tuple[Path, Path, Path]]:
    """(source_lfr, expected_pr_json, stem)"""
    jobs: List[Tuple[Path, Path, Path]] = []
    for folder in folders:
        root = lfr_cases_root / folder
        if not root.is_dir():
            continue
        for lfr in sorted(root.rglob("*.lfr")):
            rel = lfr.relative_to(root)
            stem = lfr.stem
            if rel.parent == Path("."):
                pr_dir = lfr_results_root / folder / stem
            else:
                pr_dir = lfr_results_root / folder / rel.parent / stem
            pr_json = pr_dir / f"{stem}_fromLFR_PR.json"
            jobs.append((lfr, pr_json, stem))
    return jobs


def _iter_mint_jobs(
    folders: Sequence[str],
    *,
    mint_cases_root: Path,
    mint_results_root: Path,
) -> List[Tuple[Path, Path, Path]]:
    jobs: List[Tuple[Path, Path, Path]] = []
    for folder in folders:
        root = mint_cases_root / folder
        if not root.is_dir():
            continue
        for mint in sorted(root.rglob("*.mint")):
            rel = mint.relative_to(root)
            stem = mint.stem
            if rel.parent == Path("."):
                pr_dir = mint_results_root / folder / stem
            else:
                pr_dir = mint_results_root / folder / rel.parent / stem
            pr_json = pr_dir / f"{stem}_fromMINT_PR.json"
            jobs.append((mint, pr_json, stem))
    return jobs


def _write_csv(path: Path, rows: List[Dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=CSV_COLUMNS, extrasaction="ignore")
        w.writeheader()
        w.writerows(rows)


def _parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Build BenchmarkLFRInfo.csv / BenchmarkMINTInfo.csv from PR JSON."
    )
    p.add_argument(
        "--lfr-results-root",
        type=Path,
        default=_BM / "Results" / "LFR-TestCases",
        metavar="DIR",
        help=(
            "Directory that mirrors LFR-TestCases layout (contains suite folders with "
            "*_fromLFR_PR.json). Default: Microfluidics-Benchmarks/Results/LFR-TestCases"
        ),
    )
    p.add_argument(
        "--mint-results-root",
        type=Path,
        default=_BM / "Results" / "MINT-TestCases",
        metavar="DIR",
        help=(
            "Directory that mirrors MINT-TestCases layout. Default: "
            "Microfluidics-Benchmarks/Results/MINT-TestCases"
        ),
    )
    p.add_argument(
        "--lfr-testcases-root",
        type=Path,
        default=_BM / "LFR-TestCases",
        metavar="DIR",
        help="Where to discover .lfr sources (for rows and line counts).",
    )
    p.add_argument(
        "--mint-testcases-root",
        type=Path,
        default=_BM / "MINT-TestCases",
        metavar="DIR",
        help="Where to discover .mint sources.",
    )
    p.add_argument(
        "--lfr-csv",
        type=Path,
        default=_BM / "BenchmarkLFRInfo.csv",
        metavar="PATH",
        help="Output CSV path for LFR rows.",
    )
    p.add_argument(
        "--mint-csv",
        type=Path,
        default=_BM / "BenchmarkMINTInfo.csv",
        metavar="PATH",
        help="Output CSV path for MINT rows.",
    )
    return p.parse_args()


def main() -> int:
    args = _parse_args()
    lfr_results_root = _resolve_under_repo(args.lfr_results_root)
    mint_results_root = _resolve_under_repo(args.mint_results_root)
    lfr_cases_root = _resolve_under_repo(args.lfr_testcases_root)
    mint_cases_root = _resolve_under_repo(args.mint_testcases_root)
    lfr_csv = _resolve_under_repo(args.lfr_csv)
    mint_csv = _resolve_under_repo(args.mint_csv)

    folders = _benchmark_folders_effective()
    print(f"Suite folders ({len(folders)}): {', '.join(folders)}")
    print(f"LFR results root: {lfr_results_root}")
    print(f"MINT results root: {mint_results_root}")
    lfr_rows: List[Dict[str, Any]] = []
    for lfr_path, pr_path, stem in _iter_lfr_jobs(
        folders,
        lfr_cases_root=lfr_cases_root,
        lfr_results_root=lfr_results_root,
    ):
        lines = _count_input_lines(lfr_path)
        stats = _read_layout_stats(pr_path)
        if stats is None:
            n_tot = n_flow = n_ctrl = ""
        else:
            n_tot, n_flow, n_ctrl = stats
        row: Dict[str, Any] = {
            "Format": "LFR",
            "Benchmark Name": stem,
            "Input Lines": lines,
            "Num Components (layout)": n_tot,
            "Flow-layer Components": n_flow,
            "Control-layer Components": n_ctrl,
        }
        if pr_path.is_file():
            row.update(_scores_for_row(pr_path))
        else:
            for h in SCORE_HEADERS:
                row[h] = ""
        lfr_rows.append(row)

    mint_rows: List[Dict[str, Any]] = []
    for mint_path, pr_path, stem in _iter_mint_jobs(
        folders,
        mint_cases_root=mint_cases_root,
        mint_results_root=mint_results_root,
    ):
        lines = _count_input_lines(mint_path)
        stats = _read_layout_stats(pr_path)
        if stats is None:
            n_tot = n_flow = n_ctrl = ""
        else:
            n_tot, n_flow, n_ctrl = stats
        row = {
            "Format": "MINT",
            "Benchmark Name": stem,
            "Input Lines": lines,
            "Num Components (layout)": n_tot,
            "Flow-layer Components": n_flow,
            "Control-layer Components": n_ctrl,
        }
        if pr_path.is_file():
            row.update(_scores_for_row(pr_path))
        else:
            for h in SCORE_HEADERS:
                row[h] = ""
        mint_rows.append(row)

    _write_csv(lfr_csv, lfr_rows)
    _write_csv(mint_csv, mint_rows)
    print(f"Wrote {lfr_csv} ({len(lfr_rows)} rows)")
    print(f"Wrote {mint_csv} ({len(mint_rows)} rows)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
