# Quick_Test

Small MINT subset for batch regression via `scripts/run_all_Quick_Test.sh`.

## Current contents

- `Literature_Benchmarks/` — five literature MINT devices used for quick end-to-end `synthesizeFromMINT` checks.

Outputs land under `Results/Quick_Test/<Category>/<Stem>/` (`*_fromMINT.json`, `*_fromMINT_PR.json`, topology PDF). Fluigi polish is off: only pure TREE-PLACE `*_PR.json` is written.

Env for the batch script:

- `ONLY_SUBFOLDER` — restrict to one category folder
- `SKIP_TOPLEVEL=1` — skip any `*.mint` directly under `Quick_Test/`
