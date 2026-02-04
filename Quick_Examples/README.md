# LFR Compilation Examples: Flow-Layer and Control-Layer

This directory contains two minimal LFR examples to verify that **flow-layer** and **control-layer** compile correctly to MINT and JSON.

## Example Files

| File | Description |
|------|-------------|
| `flow_only_demo.lfr` | Flow-layer only: two inlets mixed to one outlet |
| `flow_and_control_demo.lfr` | Flow + control: `distribute@(c)` with if/else and control port `c` |

## How to Run Compilation

Output directory follows **Microfluidics-Benchmarks**: `./Microfluidics-Benchmarks/Results/<benchmark_name>/`. This example uses `benchmark_name=Quick_Examples`. Run from the **project root** (dependencies required, e.g. `poetry install` or see INSTALL_TROUBLESHOOTING):

```bash
# 1. Flow-only example
poetry run fluigi compile_lfr -o ./Microfluidics-Benchmarks/Results/Quick_Examples Microfluidics-Benchmarks/Quick_Examples/flow_only_demo.lfr

# 2. Flow+control example
poetry run fluigi compile_lfr -o ./Microfluidics-Benchmarks/Results/Quick_Examples Microfluidics-Benchmarks/Quick_Examples/flow_and_control_demo.lfr
```

Both commands write to the same output directory; generated files are under the `variant_0` subdirectory (same as `scripts/compile_lfr.sh`).

**Or run the test scripts from project root:**
```bash
./scripts/testlfr_flow_only_demo.sh        # flow_only_demo.lfr only
./scripts/testlfr_flow_and_control_demo.sh # flow_and_control_demo.lfr only
```

**Output locations (aligned with Microfluidics-Benchmarks):**

| Input | Output directory | Generated files |
|-------|------------------|-----------------|
| `flow_only_demo.lfr` | `./Microfluidics-Benchmarks/Results/Quick_Examples/flow_only_demo/variant_0/` | `flow_only_demo.mint`, `flow_only_demo_fromLFR.json` |
| `flow_and_control_demo.lfr` | `./Microfluidics-Benchmarks/Results/Quick_Examples/flow_and_control_demo/variant_0/` | `flow_and_control_demo.mint`, `flow_and_control_demo_fromLFR.json` |

Without poetry, set `PYTHONPATH` from project root and call Python:

```bash
export PYTHONPATH="./pylfr:./pylfr/pymint:./pylfr/pyparchmint:$PYTHONPATH"
python -c "
from pathlib import Path
from lfr.api import compile_lfr
compile_lfr(
    input_files=['Microfluidics-Benchmarks/Quick_Examples/flow_only_demo.lfr'],
    outpath=str(Path('Microfluidics-Benchmarks/Results/Quick_Examples').absolute()),
    technology='dropx',
    library_path='./pylfr/library',
)
"
```

## Current Behavior Summary

### 1. Flow-layer (fully supported)

- **flow_only_demo.lfr** produces:
  - **MINT**: `LAYER FLOW` with MIXER, PORT, CHANNEL, etc.
  - **JSON**: ParchMINT format with `components`, `connections`, `layers`; `valves: []` when there are no valves.
- Output: `./Microfluidics-Benchmarks/Results/Quick_Examples/flow_only_demo/variant_0/` → `flow_only_demo.mint`, `flow_only_demo_fromLFR.json`.

### 2. Control-layer (supported)

- **flow_and_control_demo.lfr**:
  - Parses `control c` and `distribute@(c) begin ... end`.
  - Builds state table and AND/OR/NOT annotations.
  - Calls **compute_control_mapping()**: assigns 1:1 valve and control port per controlled edge.
  - **generate_control_network()** adds CONTROL layer at netlist generation, creates valves on the corresponding flow connections and **Cport_0, Cport_1, ...** (control-layer ports, distinct from flow PORTs).
- **MINT output**: includes `LAYER CONTROL` with:
  - `PORT Cport_0;`, `PORT Cport_1;`, … (control-layer ports, Cport naming)
  - `VALVE valve_i on channel_… controlPort=Cport_i;` (valve–Cport mapping)
- **JSON output**: `valves` array entries have `componentid`, `connectionid`, `type`, `controlportid` (Cport name); components include valve and Cport (layer `"1"` is CONTROL).

### 3. How to confirm control mapping is computed

When compiling flow_and_control_demo, output like the following indicates control mapping is correct:

```
Control mapping: 2 edge(s) -> valve/control_port (1:1)
  mixer -> outlet  :  valve_0  <-  ctrl_0
  inlet3 -> outlet  :  valve_1  <-  ctrl_1
```

## Output file locations (aligned with Microfluidics-Benchmarks)

- Output root: `./Microfluidics-Benchmarks/Results/Quick_Examples/`
- flow-only: `.../flow_only_demo/variant_0/flow_only_demo.mint`, `flow_only_demo_fromLFR.json`
- flow+control: `.../flow_and_control_demo/variant_0/flow_and_control_demo.mint`, `flow_and_control_demo_fromLFR.json`

## Implementation notes (control integration)

- **netlist_generation.generate_device()** returns `cn_component_mapping` (construction node → device component IDs) for control mapping.
- **netlist_generation.generate_control_network()**: from `module.FIG.state_tables` and `get_control_mapping()`, creates valves on the corresponding flow connections, CONTROL layer and **Cport_0, Cport_1, ...**, and calls `device.set_valve_control_port(valve_id, cport_name)` for JSON export.
- **parchmint Device**: `_valve_control_port_map` and `set_valve_control_port()`; JSON export writes `controlportid` on each valve.

---

## Why the extra FLOW-layer PORT was removed (and why that is correct)

- **Semantics**: FLOW layer describes **fluid** inlets/outlets and connections; control signal `c` is pneumatic/electrical input, not a fluid port. Adding a PORT for `c` in FLOW would incorrectly imply a fluid port for control.
- **Port count**: In `flow_and_control_demo`, fluid ports are only inlet1, inlet2, inlet3, outlet (**4**). A 5th PORT was created because the compiler treated `control c` as an IONode in the FIG that “must be covered by flow layer.”
- **Control has its own layer**: CONTROL layer already has `Cport_0`, `Cport_1`, etc.; control logic should not add a PORT in FLOW.
- **Implementation**: CONTROL-type IONodes are excluded from the “must be covered by flow primitives” set in the construction graph, and no FLOW PORT is created for them (see `is_fig_fully_covered` in `constructiongraph.py` and skipping “control-only” matches in `variant_generator.py`). FLOW layer then keeps only real fluid ports.

**Conclusion**: Removing the extra FLOW PORT is correct; keeping it would cause wrong semantics and port count.

---

## Verification: compilation results

- **flow_only_demo**: Compiles with FLOW layer **1 MIXER + 4 PORTs** (inlets/outlet), CHANNELs correct.
- **flow_and_control_demo**: Compiles with 4 fluid ports + 1 MIXER in FLOW; CONTROL layer has `Cport_*` and `VALVE ... controlPort=Cport_*`. If your local MINT still shows 5 FLOW PORTs, re-run `compile_lfr` in the same output directory to overwrite.

---

## Is the primitives server required for compile_lfr?

**No.**  
`compile_lfr` (LFR → MINT/JSON) uses only the in-repo mapping library (e.g. dropx) and pylfr/pymint/pyparchmint; it does **not** connect to the 3DuF primitives server (localhost:6060).  
The primitives server is used in **later** steps: e.g. after `compile_mint` for place & route, or when 3DuF needs component dimensions. For LFR compilation checks only, you do not need to start the primitives server.
