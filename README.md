# Microfluidics-Benchmarks

This repository includes microfluidic test cases and benchmarks in different categories. It is used by Neptune 2026 for compilation, place-and-route, and synthesis.

## Directory layout

Each **category folder is flat**: one `Xxx_Yyy.lfr` / `Xxx_Yyy.mint` per case (no nested `Protocols/MARS/` trees). Former folders `Chthesis`, `Test`, `Hmlp`, `Parser_Test`, `Ryuichi's_Designs`, and `New_Grid` were merged into `CIDAR_Lab_Past_Devices/`. File-level rename map: `stat_plot/rename_map.md`.

**Two groupings.** Folders below are **provenance** (source suite). Application function is a **multi-label** numbered map in [`CategoryMapping.md`](CategoryMapping.md): classes 1–9 literature assays, 10–11 structural (multiplexed addressing, transposer), then Other. Paths in more than one class are marked `(multi-function included)`. Plots: `stat_plot/benchmark_counts_by_category.png` (provenance) and `stat_plot/benchmark_counts_by_function.png` (function; bar heights are assignments and need not sum to 176). Original Device 10 (protein–DNA) is omitted; class 10 is multiplexed addressing. Contributions of additional devices and labels are welcome.

Neptune batch scripts live in the parent repo (`Neptune_2026/scripts/`). From that repo root:

```bash
poetry run ./scripts/run_all_LFR.sh              # every LFR_TestCases/**/*.lfr → *_PR.json
poetry run ./scripts/run_all_MINT.sh             # every MINT_TestCases/**/*.mint → *_PR.json
poetry run ./scripts/run_all_Quick_Examples.sh   # top-level Quick_Examples demos only
poetry run ./scripts/run_all_Quick_Test.sh       # Quick_Test Category-A fanin repairs (+ Super_MUX)
poetry run ./scripts/run_all_LFR_no_PR.sh        # LFR compile only (no TREE-PLACE)
poetry run ./scripts/run_all_MINT_no_PR.sh       # MINT compile only (no TREE-PLACE)
poetry run ./scripts/run_all_Quick_Examples_no_PR.sh  # Quick_Examples compile only
ONLY_SUBFOLDER=Drop_Ref poetry run ./scripts/run_all_LFR.sh
```

### LFR_TestCases/

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

### MINT_TestCases/

MINT design files (`.mint`). **265** cases. Used when the pipeline starts from MINT instead of LFR. Shared category names match LFR_TestCases; extra MINT-only groups:

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

### Quick_Examples/

Small LFR/MINT demos for one-off runs. Neptune `run_all_Quick_Examples.sh` synthesizes **top-level** `*.lfr` / `*.mint` only (**28** LFR + native MINT demos → `*_PR.json`). One-off `fluigi` without `-o` writes `<Neptune>/Output/<stem>/` instead of `Results/`.

| Path | Role |
|------|------|
| `flow_only_demo.lfr` / `.mint` | Flow layer only |
| `flow_and_control_demo.lfr` / `.mint` | Flow + control. Native `.mint` may set MIXER `channelWidth` / `edgeBend*` for flush pipe ends in 3DuF. |
| `import_mixer_and_incubator.lfr`, `import_parallel_premix.lfr`, `import_droplet_reaction.lfr` | Compose `library/` modules via `` `import "library/..." `` |
| `long_mixer.lfr`, `multi_mixer.lfr`, `diy_with_mixer_demo.lfr`, `test_DIY_fork.lfr`, `test_DIY_crossing.lfr` | Mixer / DIY demos. 3-in mix: use `three_in_mixer.lfr` / `library/three_in_mixer.lfr` (former `mixer_3to1.lfr` removed as duplicate). `long_mixer.lfr`: one MIXER via `+` with `#CONSTRAIN "+" numberOfBends = 3` (no `#MAP`). `multi_mixer.lfr`: `+` then three unary `#MAP "MIXER" "~"` stages; per-stage `#CONSTRAIN "CHANNEL"` (stage2 width 600 + square ends; final width 200) does not leak onto the next mixer. DIY keepout: `componentSpacing`, default **2000** µm (`library/DIYcomponent.lfr`) |
| `map_mixer.lfr`, `map_pump.lfr`, `map_ytree.lfr`, `map_mux.lfr`, `map_via.lfr`, `map_droplet.lfr`, `constrain_mixer.lfr`, `constrain_pump.lfr` | `#MAP` / `#TERMINAL` / stacked `#CONSTRAIN` demos. `map_droplet.lfr` uses `#TERMINAL` role→net (no instantiate). Pump-like process = unary `#MAP "PUMP" "~"`, not a `pump` mode. `constrain_pump.lfr` sets `valveWidthY = 800`. Param list: Neptune `docs/LFR_TestCases_wiki/Compiler_Directives.md`. |
| `test_device_v1_MUX_4to1.lfr`, `test_device_v1_MUX_1to4.lfr`, `test_device_v2_2MUX.lfr`, `test_device_v3_2MUX_fork.lfr` | Distribute/MUX demos. v1 = standalone 4-to-1 / 1-to-4 trees; v2 = two MUX trunks joined; v3 = v2 plus a tap PORT on the mid join |
| `DIYcomponent.lfr`, `two_in_mixer.lfr`, `three_in_mixer.lfr`, `incubator.lfr`, `droplet_generator.lfr` | Standalone copies of `library/` modules (also synthesized by the batch). Library files keep snake_case stems (`library/mux4to1.lfr`, `library/mux1to4.lfr`). |
| `library/` | Canonical reusable LFR blocks for `` `import "library/..." `` — see `library/README.md` |
| `user_components_demo/` | `--component-library` black-box JSON demo. See `user_components_demo/README.md` |
| `prompt_test/` | LLM prompt experiments (not part of the batch suite) |

### Quick_Test/

Re-run suite for the **27 Category-A control-fanin repairs** (copies of `MINT_Illegal_Control_Fanin/**/*.mint`, one `VALVE3D` per `Cport_*`) plus optional top-level probes (`Super_MUX_8.mint`, `Super_MUX_128.mint`). Details: `Quick_Test/README.md`. From Neptune root:

```sh
poetry run ./scripts/run_all_Quick_Test.sh
# SKIP_TOPLEVEL=1  → only the 27 category-A cases
```

Results: `Results/Quick_Test/<Category>/<Stem>/`. Not part of `run_all_Quick_Examples.sh`.

### MINT_Illegal_Control_Fanin/

Archive of the 27 MINT cases that used to sink every `Ctrlchannel_*` on one `VALVE3D`. Sources under `MINT_TestCases/` were rewritten (one valve per Cport). See `MINT_Illegal_Control_Fanin/README.md`. Helper: Neptune `scripts/fix_mint_control_fanin.py`.

### Results/

Generated outputs (MINT, JSON, placed/routed JSON, logs, SVG) produced by Neptune 2026 scripts. Structure mirrors the test cases:

- `Results/LFR_TestCases/<Category>/<Stem>/`
- `Results/MINT_TestCases/<Category>/<Stem>/`
- `Results/Quick_Examples/<stem>/`
- `Results/Quick_Test/<Category>/<Stem>/` (from `run_all_Quick_Test.sh`)

`<Stem>` matches the source filename (`Dx_1`, `Mfd_005_Chip`, …). Inner artifacts (`dx1_fromLFR.json`, …) may still use the original module id until that case is recompiled. Neptune scripts glob `*_fromLFR.json` / `*_fromMINT.json` / `*_PR.json` so both names work.

**Port conventions in sources:** `CIDAR_Lab_Past_Devices/Rotary_16` YTREE leaves use ports 2–17 (trunk 1). `Base/Transposer_Test.mint` VIA control uses port 1. `Mars/Pre_Processor_Dump.mint` MIXER uses ports 1–2.

**Super_MUX series:** sources are `MINT_TestCases/Base/Super_MUX_{2,4,8,16,32,64,128,256,512,1024}.mint` (`leafSpace` 4000). TREE-PLACE order search is capped (`PRalgorithm/order_and_mirror.py`, `MAX_ORDER_SEARCH=4096`); n≥8 skips the n! permutation walk. Placed outputs live under `Results/MINT_TestCases/Base/Super_MUX_<n>/` as `Super_MUX_<n>_fromMINT.json`, `Super_MUX_<n>_fromMINT_PR.json`, and `Super_MUX_<n>_fromMINT_topology.pdf`. Batch logs are not kept in git.

---

Users can contribute new benchmarks to make this microfluidic design benchmark set more robust.
