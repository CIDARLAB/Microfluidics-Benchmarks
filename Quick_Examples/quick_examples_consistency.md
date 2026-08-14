# Quick_Examples consistency

Audit of `Quick_Examples/` against the same LFR↔MINT policy as TestCases:
physical ports authoritative; PORT COUNT CORRECTION when LFR IO ≠ physical;
required components/connections present for LFR function.

**Port columns (`FLOW ports`, `CONTROL`):** values are `physical / LFR-declared`
(FLOW IO count, or CONTROL bit-width). Equal means a match; unequal means synthesis
expanded ports (if/else→one-hot Cports, NOZZLE metering auxiliaries, etc.) and a
`PORT COUNT CORRECTION` block is expected (`correction=yes`).

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

## Library modules

Three top-level demos use `` `import `` from `library/`:
`import_mixer_and_incubator.lfr`, `import_parallel_premix.lfr`, `import_droplet_reaction.lfr`.

Example (same `--pre-load` as `run_all_Quick_Examples.sh`):

```sh
fluigi synthesize --outpath Results/Quick_Examples/import_droplet_reaction \
  --pre-load Microfluidics-Benchmarks/Quick_Examples \
  Microfluidics-Benchmarks/Quick_Examples/import_droplet_reaction.lfr
```

