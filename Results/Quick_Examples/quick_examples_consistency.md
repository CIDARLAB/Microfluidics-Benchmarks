# Quick_Examples consistency

Audit of `Quick_Examples/` against the same LFR↔MINT policy as TestCases:
physical ports authoritative; PORT COUNT CORRECTION when LFR IO ≠ physical;
required components/connections present for LFR function.

## Summary

- Top-level LFR demos: **5/5** validate OK (0 errors / 0 warnings).
- FLOW single-island (connected): **5/5**.
- Native `flow_and_control_demo.mint` ≡ fromLFR body (sans correction comments): **True**.
- `flow_and_control_demo` fromLFR.json ≡ fromMINT.json component ids: **True**.
- `user_components_demo` compile_mint: **OK**.

## Per-demo

| demo | validate | FLOW ports | CONTROL | correction | FLOW islands | notes |
|------|----------|------------|---------|------------|--------------|-------|
| `flow_and_control_demo` | OK | 4/4 | 2/1 | yes | 1 | port expand, if/else → 2 Cports |
| `flow_only_demo` | OK | 3/3 | 0/0 | no | 1 | — |
| `import_droplet_reaction` | OK | 7/5 | 0/0 | yes | 1 | NOZZLE, port expand, library % meter+oil |
| `import_mixer_and_incubator` | OK | 3/3 | 0/0 | no | 1 | — |
| `import_parallel_premix` | OK | 6/6 | 0/0 | no | 1 | — |

## Fixes applied

1. **`library/droplet_generator.lfr`**: `#MAP "NOZZLE DROPLET GENERATOR" "&"` / binary `&` was wrong
   (NOZZLE is InteractionType.METER → `%`). Rewrote as `aqueous % 100` then `+ oil`.
   Recompile restored a connected netlist with a real NOZZLE (was disconnected mixer island
   + orphan REACTION CHAMBER).
2. **`flow_and_control_demo`**: annotated PORT COUNT CORRECTION (control 1 → 2 Cports);
   synced native `.mint` to fromLFR body (correction comments omitted in native source
   because the MINT parser rejects `//` comment blocks).
3. **`user_components_demo/TopDesign.mint`**: fixed missing spaces in PORT decls;
   added CONTROL channel to gadget terminal 4; now compiles with `--component-library lib/`.

## Library modules

Pre-load only (`run_all_Quick_Examples.sh --pre-load`); not compiled as standalone devices.
`two_in_mixer`, `three_in_mixer`, `incubator`, `droplet_generator` — comments present;
incubator `#MAP "INCUBATOR"` realizes as REACTION CHAMBER (same as LFR-TestCases).

