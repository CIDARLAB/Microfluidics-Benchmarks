# Microfluidics-Benchmarks

This repository includes microfluidic test cases and benchmarks in different categories. It is used by Neptune 2026 for compilation, place-and-route, and synthesis.

## Directory layout

Each **category folder is flat**: one `Xxx_Yyy.lfr` / `Xxx_Yyy.mint` per case (no nested `Protocols/MARS/` trees). Former folders `Chthesis`, `Test`, `Hmlp`, `Parser_Test`, `Ryuichi's_Designs`, and `New_Grid` were merged into `CIDAR_Lab_Past_Devices/`. File-level rename map: `stat_plot/rename_map.md`.

**Two groupings.** Folders below are **provenance** (source suite). Application function is a **multi-label** numbered map in [`CategoryMapping.md`](CategoryMapping.md): classes 1–9 literature assays, 10–11 structural (multiplexed addressing, transposer), then Other. Paths in more than one class are marked `(multi-function included)`. Plots: `stat_plot/benchmark_counts_by_category.png` (provenance) and `stat_plot/benchmark_counts_by_function.png` (function; bar heights are assignments and need not sum to 176). Original Device 10 (protein–DNA) is omitted; class 10 is multiplexed addressing. Contributions of additional devices and labels are welcome.

Neptune batch scripts live in the parent repo (`Neptune_2026/scripts/`). From that repo root:

```bash
poetry run ./scripts/run_all_LFR.sh              # every LFR-TestCases/**/*.lfr → *_PR.json
poetry run ./scripts/run_all_MINT.sh             # every MINT-TestCases/**/*.mint → *_PR.json
poetry run ./scripts/run_all_Quick_Examples.sh   # top-level Quick_Examples demos only
poetry run ./scripts/run_all_LFR_no_PR.sh        # LFR compile only (no TREE-PLACE)
poetry run ./scripts/run_all_MINT_no_PR.sh       # MINT compile only (no TREE-PLACE)
ONLY_SUBFOLDER=Drop_Ref poetry run ./scripts/run_all_LFR.sh
```

### LFR-TestCases/

LFR (Liquid Flow Representation) design files (`.lfr`). **157** cases. Each subfolder is a benchmark group:

| Folder | Description |
|--------|-------------|
| `CIDAR_Lab_Past_Devices/` | CIDAR historical devices (former Chthesis, Test, Hmlp, Parser_Test, Ryuichi's_Designs) |
| `Drop_Ref/` | DropX + droplet-generator designs (`Dx_1`–`Dx_15`, `Dropx_Test_1`–`4`, `Droplet_Generator*`) |
| `COVID/` | COVID-related protocols (CRISPR, RT-PCR, ELISA, …) |
| `Distribute_Expressions/`, `Distribute_Library/` | Distribution expressions and reusable mux / grid / transposer library |
| `Expressions/` | Expression benchmarks |
| `Literature_Benchmarks/` | Encoded literature devices (scRNA-seq, artificial cells, molecular diagnostics, bacteria diagnostics, organic synthesis, enzyme screening). Numbered functional remap (assays 1–9, structural 10–11, Other): `CategoryMapping.md` |
| `Graph_Coverage/` | Leftover coverage cases (`Tree_Fanin`, `Tree_Fanout`) |
| `Technology_Mapping/` | Technology-mapping benchmarks |
| `Mars/` | MARS / iGEM 2017 BostonU devices (PCR, sorting, transformation, …) |
| `Protocols/` | Remaining protocol cases (`Cell_Sorting`, `Directed_Evolution`) |
| `Transport_Networks/` | Transport-network examples |
| `Ghissues/` | Issue regression tests |

### MINT-TestCases/

MINT design files (`.mint`). **257** cases. Used when the pipeline starts from MINT instead of LFR. Shared category names match LFR-TestCases; extra MINT-only groups:

| Folder | Description |
|--------|-------------|
| `CIDAR_Lab_Past_Devices/` | CIDAR historical devices (including former New_Grid leftovers) |
| `Drop_Ref/` | DropX, DropX reference (`Dx_*_Ref`), and droplet-generator MINT |
| `Base/` | Base components and small nets (mux, transposer, tree tests, …) |
| `Grid/` | Grid-based designs |
| `Constraints/` | Layout constraint tests |
| `Primitive/` | Primitive-level devices (mixer, valve, pump, …) |
| `COVID/`, `Distribute_Expressions/`, `Distribute_Library/`, `Expressions/` | Same groups as LFR |
| `Literature_Benchmarks/`, `Mars/`, `Protocols/`, `Technology_Mapping/`, `Transport_Networks/`, `Ghissues/`, `Graph_Coverage/` | Same groups as LFR |
| `Aarf_Router_Test/` | Router JSON fixtures (`test0.json`, …) — **not** `.mint`; skipped by `run_all_MINT.sh` |

### Quick_Examples/

Small LFR/MINT demos for one-off runs. Neptune `run_all_Quick_Examples.sh` synthesizes **top-level** `*.lfr` / `*.mint` only (latest batch: **19** LFR + **2** native MINT → `*_PR.json`).

| Path | Role |
|------|------|
| `flow_only_demo.lfr` / `.mint` | Flow layer only |
| `flow_and_control_demo.lfr` / `.mint` | Flow + control (default `testLFR.sh` / `testMINT.sh` input). Native `.mint` may set MIXER `channelWidth` / `edgeBend*` for flush pipe ends in 3DuF. |
| `import_mixer_and_incubator.lfr`, `import_parallel_premix.lfr`, `import_droplet_reaction.lfr` | Compose `library/` modules via `` `import "library/..." `` |
| `mixer_3to1.lfr`, `diy_with_mixer_demo.lfr`, `test_DIY_fork.lfr`, `test_DIY_crossing.lfr` | Mixer / DIY demos. DIY keepout: `componentSpacing`, default **1000** µm (`library/DIYcomponent.lfr`) |
| `test_device.lfr`, `test_device_MUX4to1.lfr`, `test_device_two_MUX4to1.lfr` | Distribute/MUX demos (`mux_hub`/`demux_hub` VIA storages on the two-MUX case) |
| `DIYcomponent.lfr`, `two_in_mixer.lfr`, `three_in_mixer.lfr`, `incubator.lfr`, `droplet_generator.lfr`, `mux4to1.lfr`, `mux1to4.lfr` | Standalone copies of `library/` modules (also synthesized by the batch) |
| `library/` | Canonical reusable LFR blocks for `` `import "library/..." `` — see `library/README.md` |
| `user_components_demo/` | `--component-library` black-box JSON demo. See `user_components_demo/README.md` |
| `prompt_test/` | LLM prompt experiments (not part of the batch suite) |

Consistency notes: `Quick_Examples/quick_examples_consistency.md`.

### Results/

Generated outputs (MINT, JSON, placed/routed JSON, logs, SVG) produced by Neptune 2026 scripts. Structure mirrors the test cases:

- `Results/LFR-TestCases/<Category>/<Stem>/`
- `Results/MINT-TestCases/<Category>/<Stem>/`
- `Results/Quick_Examples/<stem>/`

`<Stem>` matches the source filename (`Dx_1`, `Mfd_005_Chip`, …). Inner artifacts (`dx1_fromLFR.json`, …) may still use the original module id until that case is recompiled. Neptune scripts glob `*_fromLFR.json` / `*_fromMINT.json` / `*_PR.json` so both names work.

---

Users can contribute new benchmarks to make this microfluidic design benchmark set more robust.
