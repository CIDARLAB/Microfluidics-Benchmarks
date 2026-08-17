# Microfluidics-Benchmarks

This repository includes microfluidic test cases and benchmarks in different categories. It is used by Neptune 2026 for compilation, place-and-route, and synthesis.

## Directory layout

### LFR-TestCases/

LFR (Liquid Flow Representation) format design files (`.lfr`). Each subfolder is a benchmark group:

| Folder | Description |
|--------|-------------|
| `CIDAR_Lab_Past_Devices/` | CIDAR historical devices (former Chthesis, Test, Hmlp, Parser_Test, Ryuichi's_Designs) |
| `Drop_Ref/` | DropX + droplet-generator designs (Dx_1–Dx_15, Dropx_Test_1–4, Droplet_Generator*) |
| `COVID/` | COVID-related protocols (CRISPR, rt_pcr, etc.) |
| `Distribute_Expressions/`, `Distribute_Library/` | Distribution and library tests |
| `Expressions/` | Expression benchmarks |
| `Literature_Benchmarks/` | Literature-derived LFR benchmarks (e.g. scRNA-seq, molecular diagnostics, bacteria diagnostics) |
| `Graph_Coverage/`, `Technology_Mapping/` | Graph coverage and technology mapping |
| `Mars/` | MARS / iGEM 2017 BostonU devices (PCR, sorting, transformation, etc.) |
| `Protocols/`, `Transport_Networks/` | Protocols and transport networks |
| `Ghissues/` | Issue regression tests |

### MINT-TestCases/

MINT format design files (`.mint`). Used when the pipeline starts from MINT instead of LFR:

| Folder | Description |
|--------|-------------|
| `CIDAR_Lab_Past_Devices/` | CIDAR historical devices (including former New_Grid leftovers) |
| `Drop_Ref/` | DropX, DropX reference (`dx*_ref`), and droplet-generator MINT |
| `Base/` | Base components and small nets (mux, transposer, tree tests, etc.) |
| `Grid/` | Grid-based designs |
| `Constraints/` | Layout constraint tests |
| `Primitive/` | Primitive-level devices (mixer, valve, pump, etc.) |
| `Literature_Benchmarks/` | Literature-based device benchmarks |

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
