# Quick_Test

Small MINT subset for batch regression via `scripts/run_all_Quick_Test.sh`.

## Current contents

- `Literature_Benchmarks/` — literature MINT devices for quick end-to-end `synthesizeFromMINT` checks:
  - Device_2 / Device_4 / Device_5 / Device_6 / Device_7 (canonical)
  - Device_5 / Device_6 use `NODE … componentSpacing=0 radius=0` so each valve owns one FLOW segment
  - `Device_4_Molecular_Diagnostics_node0.mint` — zero-keepout NODE contrast case (not a substitute for the canonical Device_4 result)

Outputs land under `Results/Quick_Test/<Category>/<Stem>/` (`*_fromMINT.json`, `*_fromMINT_PR.json`, topology PDF). Fluigi polish is off: only pure TREE-PLACE `*_PR.json` is written. Zero-keepout NODE behavior: Neptune `docs/NODE_ZERO_KEEPOUT_PR_NOTE.md`.

Env for the batch script:

- `ONLY_SUBFOLDER` — restrict to one category folder
- `SKIP_TOPLEVEL=1` — skip any `*.mint` directly under `Quick_Test/`
