# LFR port emission, correction comments, and compile-time checks

## Rules
1. **Physical ports win.** Generated MINT/JSON FLOW + CONTROL port counts must realize the LFR function (no missing IO, channels, valves, or mint↔json drift).
2. **Any** LFR IO / control bit-width ≠ physical port count → MINT file starts with `// === PORT COUNT CORRECTION ===` (not only MUX).
3. Extra ports from mapping are OK; **missing** required ports/links are errors.

## Compile / synthesize hooks
- `compile_lfr` (`pylfr/lfr/api.py`) after writing MINT/JSON: annotate + validate
- `fluigi synthesize` / `compile_lfr` CLI / `synthesizeFromMINT`: same via `annotate_generated_artifacts`
- Validator: `fluigi/lfr_netlist_validate.py`
  - FLOW ports ≥ declared LFR IO
  - distribute+control ⇒ Cports ≥ declared bits, valves present, channel endpoints valid
  - MINT component ids ≡ JSON; no dangling CHANNEL/VALVE hosts
  - Soft warnings for `%` without nozzle / sorter heuristics

## Correction comment (example)
```
// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 5 (LFR module IO declared 3)
// CONTROL ports (Cport_*): 8 (LFR control bit width declared 3)
// …
//   - CONTROL expansion via distribute/MUX/…
//   - FLOW port count differs … metering / NOZZLE …
// === END PORT COUNT CORRECTION ===
```

## Constructs that change port counts
| Construct | Layer | Effect |
|-----------|-------|--------|
| distribute mux/demux/transposer / if-else | CONTROL | bit-width → one-hot Cports+valves |
| `%` metering → nozzle | FLOW | auxiliary FLOW PORTs |
| droplet sorter / discard | FLOW | waste/discard PORTs |
| multi-terminal `#MAP` (YTREE, …) | FLOW | usually matches bus; may add stubs |
