# Quick_Test

Quick suite for re-running the **27 Category-A MINT control-fanin repairs**
(plus optional top-level probes such as `Super_MUX_*.mint`).

Sources: copies of `MINT_Illegal_Control_Fanin/**/*.mint` (one `VALVE3D` per
`Cport_*`, `Ctrlchannel_i → valve_i`). Same rewrite as under `MINT_TestCases/`.

## Run (from Neptune_2026 root)

```sh
./scripts/run_all_Quick_Test.sh
```

Results go to:

```text
Microfluidics-Benchmarks/Results/Quick_Test/<Category>/<Stem>/
  <Stem>_fromMINT.json
  <Stem>_fromMINT_PR.json
  ...
```

Useful env vars:

| Env | Effect |
|-----|--------|
| `SKIP_TOPLEVEL=1` | Only the 27 category-A cases (skip `Super_MUX_*`) |
| `ONLY_SUBFOLDER=Mars` | Only one category folder |

Example:

```sh
SKIP_TOPLEVEL=1 ./scripts/run_all_Quick_Test.sh
```
