#!/usr/bin/env sh
# One-command CSV summary (run from anywhere; switches to Neptune repo root).
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
exec poetry run python Microfluidics-Benchmarks/generate_benchmark_csvs.py "$@"
