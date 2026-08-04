# LFR ↔ MINT consistency report

- Pairs checked: **169**
- `MINT-TestCases` ≡ `*_fromLFR.mint`: **169/169**
- `*_fromLFR.json` ≡ `*_fromMINT.json`: **169/169**
- Hard issues: **0**
- Each LFR has matching MINT source + `*_fromLFR.{mint,json}` + `*_fromMINT.json`

## Criteria
1. `DEVICE` name == LFR `module` == JSON `name`
2. Hand MINT netlist matches LFR-generated MINT
3. JSON from LFR and from MINT are identical
4. Incomplete CONTROL/FLOW connectivity OK when intentional
5. Compile-time check: physical ports/components/connections realize LFR (no missing IO/links)
6. **Any** physical port count ≠ LFR IO/bit-width → MINT header `// === PORT COUNT CORRECTION ===` (MUX, metering, sorter, …)

## Details
- `lfr_mint_json_unity.md`
- `lfr_control_emission.md`
