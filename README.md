# Microfluidics-Benchmarks

This repository includes microfluidic test cases and benchmarks in different categories. It is used by Neptune 2026 for compilation, place-and-route, and synthesis.

## Directory layout

### LFR-TestCases/

LFR (Liquid Flow Representation) format design files (`.lfr`). Each subfolder is a benchmark group:

| Folder | Description |
|--------|-------------|
| `test/` | Minimal test (e.g. `multi_input.lfr`) for quick runs |
| `dropx/` | DropX designs (dx1–dx15, dropx_test1–4) |
| `chthesis/` | Thesis benchmarks (grad_cells, hasty, logic04, multi_input, net_mux, rotary_cells, rotary16, tdroplet, etc.) |
| `COVID/` | COVID-related protocols (CRISPR, rt_pcr, etc.) |
| `distribute-expressions/`, `distribute-library/` | Distribution and library tests |
| `Expressions/` | Expression benchmarks |
| `GraphCoverage/`, `TechnologyMapping/` | Graph coverage and technology mapping |
| `mars/` | MARS platform designs (PCR, sorting, transformation, etc.) |
| `Protocols/`, `Transport Networks/` | Protocols and transport networks |
| `ghissues/`, `ParserTest/` | Parser and issue regression tests |
| `Ryuichi's designs/` | Assorted research designs |

### MINT-TestCases/

MINT format design files (`.mint`). Used when the pipeline starts from MINT instead of LFR:

| Folder | Description |
|--------|-------------|
| `test/` | Minimal test (e.g. `multi_input_fromLFR.mint` or hand-written MINT) |
| `dropx/` | DropX MINT (dx1–dx15, dropx_test1–3) |
| `dropx_ref/` | DropX reference cases (dx*_ref.mint) |
| `chthesis/` | Thesis benchmarks (flow_focus, grad_cells, hasty, logic04, multi_input, etc.) |
| `base/` | Base components and small nets (mux, transposer, tree tests, etc.) |
| `grid/`, `new_grid/` | Grid-based designs |
| `constraints/` | Layout constraint tests |
| `primitive/` | Primitive-level devices (mixer, valve, pump, etc.) |
| `LiteratureBenchmarks/` | Literature-based device benchmarks |

### Quick_Examples/

Small LFR examples for one-off runs and demos:

- `flow_only_demo.lfr` — flow layer only
- `flow_and_control_demo.lfr` — flow + control layer
- `test1.lfr` — simple test

See `Quick_Examples/README.md` in this repo for more detail.

### Results/

Generated outputs (MINT, JSON, placed/routed JSON, logs, SVG) produced by Neptune 2026 scripts. Structure mirrors the test cases: `Results/LFR-TestCases/<benchmark_folder>/<file_stem>/` and `Results/MINT-TestCases/<benchmark_folder>/<file_stem>/`.

---

Users can contribute new benchmarks to make this microfluidic design benchmark set more robust.
