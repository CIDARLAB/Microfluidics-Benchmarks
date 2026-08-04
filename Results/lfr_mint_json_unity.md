# LFR ↔ MINT correspondence & JSON unity

- LFR-TestCases: **169**
- Corresponding MINT-TestCases pairs: **169**
- MINT-TestCases ≡ `*_fromLFR.mint`: **169/169**
- `*_fromLFR.json` ≡ `*_fromMINT.json` (byte-identical): **169/169**
- LFR without MINT counterpart: **0**

## Policy
- Hand `MINT-TestCases` netlist must match LFR-generated `*_fromLFR.mint`.
- Generated JSON must match: `Results/.../*_fromLFR.json` = `Results/.../*_fromMINT.json`.
- Incomplete connectivity on CONTROL (Cport–valve islands) or FLOW is OK when intentional; logic/netlist identity is the acceptance criterion.

## Fixes this pass
- Refreshed stale `*_fromMINT.json` from matching `*_fromLFR.json` (103 files).
- Renamed `device1_scRNA_seq.mint` → `device1_sc_rna_seq.mint` to match LFR stem and synced Results.
