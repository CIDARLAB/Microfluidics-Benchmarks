# MINT-TestCases ↔ LFR-TestCases correspondence check

- Corresponding pairs (exact/CI path match): **168**
- Hand MINT already fully connected: **106**
- Broken hand MINT synced from `*_fromLFR.mint`: **62**
- MINT-TestCases (corresponding) fully connected after sync: **168/168**
- Floating components in corresponding MINT sources: **0**
- Results/MINT JSON refreshed for synced cases: **62** (copied from matching LFR Results)
- Results JSON fully connected (valve-bridged): **168**; control-layer pair pattern OK: **0**; odd/float: **0**; missing: **0**

## Findings
Of 168 MINT files that mirror an LFR benchmark path/stem, **62** hand-written
`MINT-TestCases` netlists were disconnected (missing channels / unused ports),
while the LFR-generated `*_fromLFR.mint` was already fully connected.

Those 62 sources were replaced with the verified `fromLFR` MINT, and
`Results/MINT-TestCases/.../*_fromMINT.json` (+ PR) were refreshed from the
matching LFR Results artifacts (same netlist).

## Synced files
- `COVID/AJ_rtpcr_8primer.mint` ← `COVID/aj_rtpcr_8primer/aj_rtpcr_8primer_fromLFR.mint` ([6, 5, 5, 5, 5, 5, 5, 5, 5] → [29])
- `COVID/ARIZE.mint` ← `COVID/arize/arize_fromLFR.mint` ([20, 13, 1] → [39])
- `COVID/CRISPR.mint` ← `COVID/crispr/crispr_fromLFR.mint` ([8, 2, 2] → [12])
- `COVID/DETECTR.mint` ← `COVID/detectr/detectr_fromLFR.mint` ([16, 3, 2, 1] → [20])
- `COVID/ELISALFR.mint` ← `COVID/elisalfr/elisalfr_fromLFR.mint` ([3, 3, 1] → [8])
- `COVID/electro4.mint` ← `COVID/electro4/electro4_fromLFR.mint` ([6, 4, 1, 1, 1, 1, 1, 1, 1, 1] → [12])
- `COVID/part1_rna.mint` ← `COVID/part1_rna/part1_rna_fromLFR.mint` ([9, 1] → [10])
- `COVID/part2_lfr.mint` ← `COVID/part2_lfr/part2_lfr_fromLFR.mint` ([7, 1] → [8])
- `COVID/part3_gel.mint` ← `COVID/part3_gel/part3_gel_fromLFR.mint` ([4, 1, 1, 1, 1] → [12])
- `Expressions/expression1.mint` ← `Expressions/expression1/expression1_fromLFR.mint` ([5, 4, 1] → [6])
- `Expressions/expression12.mint` ← `Expressions/expression12/expression12_fromLFR.mint` ([3, 3, 3, 3, 3, 3, 3, 3, 1] → [26])
- `Expressions/expression14.mint` ← `Expressions/expression14/expression14_fromLFR.mint` ([5, 5, 5, 5, 5, 5, 5, 5] → [58])
- `Expressions/expression7.mint` ← `Expressions/expression7/expression7_fromLFR.mint` ([3, 3, 3, 1] → [11])
- `Expressions/expression8.mint` ← `Expressions/expression8/expression8_fromLFR.mint` ([7, 1, 1] → [10])
- `GraphCoverage/cycle.mint` ← `GraphCoverage/cycle/cycle_fromLFR.mint` ([1, 1, 1, 1, 1] → [6])
- `GraphCoverage/n_g_m_map.mint` ← `GraphCoverage/n_g_m_map/n_g_m_map_fromLFR.mint` ([1, 1] → [10])
- `GraphCoverage/n_l_m_map.mint` ← `GraphCoverage/n_l_m_map/n_l_m_map_fromLFR.mint` ([1, 1] → [10])
- `LiteratureBenchmarks/device2_artificial_cells.mint` ← `LiteratureBenchmarks/device2_artificial_cells/device2_artificial_cells_fromLFR.mint` ([2, 2, 2, 2, 2, 2, 2, 2, 1, 1] → [26])
- `LiteratureBenchmarks/device7_enzyme_screening.mint` ← `LiteratureBenchmarks/device7_enzyme_screening/device7_enzyme_screening_fromLFR.mint` ([3, 2, 2, 1, 1, 1, 1, 1, 1] → [19])
- `ParserTest/declarations.mint` ← `ParserTest/declarations/declarations_fromLFR.mint` ([1, 1] → [2])
- `Protocols/MARS/cell_lysis.mint` ← `Protocols/MARS/cell_lysis/cell_lysis_fromLFR.mint` ([9, 1, 1, 1, 1] → [8])
- `Protocols/directed_evolution.mint` ← `Protocols/directed_evolution/directed_evolution_fromLFR.mint` ([7, 5, 1, 1, 1, 1] → [24])
- `Ryuichi's designs/MFD005chip.mint` ← `Ryuichi's designs/mfd005chip/mfd005chip_fromLFR.mint` ([3, 2, 2, 1, 1, 1, 1, 1, 1] → [12])
- `Ryuichi's designs/chemostat_chip.mint` ← `Ryuichi's designs/chemostat_chip/chemostat_chip_fromLFR.mint` ([8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [28])
- `Ryuichi's designs/dnasynthesizer.mint` ← `Ryuichi's designs/dnasynthesizer/dnasynthesizer_fromLFR.mint` ([33, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [55])
- `Ryuichi's designs/genetic_clock_testing_tool.mint` ← `Ryuichi's designs/genetic_clock_testing_tool/genetic_clock_testing_tool_fromLFR.mint` ([6, 1, 1, 1] → [9])
- `Ryuichi's designs/glycoform.mint` ← `Ryuichi's designs/glycoform/glycoform_fromLFR.mint` ([5, 1, 1] → [13])
- `Ryuichi's designs/incubator.mint` ← `Ryuichi's designs/incubator/incubator_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [18])
- `Ryuichi's designs/inlet16.mint` ← `Ryuichi's designs/inlet16/inlet16_fromLFR.mint` ([24, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [40])
- `Ryuichi's designs/microalgal_bioassay.mint` ← `Ryuichi's designs/microalgal_bioassay/microalgal_bioassay_fromLFR.mint` ([12, 1] → [11])
- `Ryuichi's designs/microdroplet.mint` ← `Ryuichi's designs/microdroplet/microdroplet_fromLFR.mint` ([9, 2, 1, 1, 1, 1, 1, 1] → [17])
- `Ryuichi's designs/microreactor.mint` ← `Ryuichi's designs/microreactor/microreactor_fromLFR.mint` ([9, 1] → [8])
- `Ryuichi's designs/mux96chambers.mint` ← `Ryuichi's designs/mux96chambers/mux96chambers_fromLFR.mint` ([2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [146])
- `Ryuichi's designs/olfactory.mint` ← `Ryuichi's designs/olfactory/olfactory_fromLFR.mint` ([13, 1] → [10])
- `Ryuichi's designs/rootchip.mint` ← `Ryuichi's designs/rootchip/rootchip_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [20])
- `Ryuichi's designs/seeding.mint` ← `Ryuichi's designs/seeding/seeding_fromLFR.mint` ([8, 1] → [22])
- `TechnologyMapping/cycle.mint` ← `TechnologyMapping/cycle/cycle_fromLFR.mint` ([1, 1, 1, 1, 1] → [6])
- `chthesis/grad_cells.mint` ← `chthesis/grad_cells/grad_cells_fromLFR.mint` ([14, 6] → [8])
- `chthesis/logic04.mint` ← `chthesis/logic04/logic04_fromLFR.mint` ([28, 1, 1, 1, 1, 1, 1, 1, 1] → [24])
- `chthesis/multi_input.mint` ← `chthesis/multi_input/multi_input_fromLFR.mint` ([13, 1, 1] → [12])
- `chthesis/net_mux.mint` ← `chthesis/net_mux/net_mux_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [30])
- `chthesis/rotary16.mint` ← `chthesis/rotary16/rotary16_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [48])
- `chthesis/rotary_cells.mint` ← `chthesis/rotary_cells/rotary_cells_fromLFR.mint` ([6, 1, 1, 1, 1, 1] → [12])
- `chthesis/tdroplet.mint` ← `chthesis/tdroplet/tdroplet_fromLFR.mint` ([15, 1] → [12])
- `distribute-expressions/dist_expression2.mint` ← `distribute-expressions/dist_expression2/dist_expression2_fromLFR.mint` ([1, 1, 1] → [3])
- `distribute-expressions/dist_expression3.mint` ← `distribute-expressions/dist_expression3/dist_expression3_fromLFR.mint` ([1, 1, 1] → [3])
- `distribute-library/transposer_04.mint` ← `distribute-library/transposer_04/transposer_04_fromLFR.mint` ([22, 4] → [20])
- `dropgen/dropletgenerator2.mint` ← `dropgen/dropletgenerator2/dropletgenerator2_fromLFR.mint` ([2, 2, 1, 1, 1] → [15])
- `dropgen/dropletgenerator3.mint` ← `dropgen/dropletgenerator3/dropletgenerator3_fromLFR.mint` ([2, 2, 1, 1, 1, 1] → [22])
- `dropgen/dropletgenerator4.mint` ← `dropgen/dropletgenerator4/dropletgenerator4_fromLFR.mint` ([3, 1, 1, 1] → [12])
- `dropx/dx14.mint` ← `dropx/dx14/dx14_fromLFR.mint` ([14, 3] → [9])
- `ghissues/issue10.mint` ← `ghissues/issue10/issue10_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1] → [20])
- `ghissues/issue3.mint` ← `ghissues/issue3/issue3_fromLFR.mint` ([2, 1, 1, 1, 1, 1, 1] → [20])
- `ghissues/issue6.mint` ← `ghissues/issue6/issue6_fromLFR.mint` ([3, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [27])
- `ghissues/issue7.mint` ← `ghissues/issue7/issue7_fromLFR.mint` ([2, 2, 1, 1, 1, 1, 1, 1, 1, 1] → [44])
- `ghissues/issue8.mint` ← `ghissues/issue8/issue8_fromLFR.mint` ([15, 1, 1, 1, 1, 1, 1] → [48])
- `ghissues/issue9.mint` ← `ghissues/issue9/issue9_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [32])
- `hmlp/v0.mint` ← `hmlp/v0/v0_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [33])
- `mars/sorting.mint` ← `mars/sorting/sorting_fromLFR.mint` ([3, 1, 1] → [5])
- `test/dropletx.mint` ← `test/dropletx/dropletx_fromLFR.mint` ([6, 1, 1] → [9])
- `test/multi_input.mint` ← `test/multi_input/multi_input_fromLFR.mint` ([12, 1, 1] → [12])
- `test/ring.mint` ← `test/ring/ring_fromLFR.mint` ([7, 1] → [6])

## Left as-is (connected, PORT count differs from fromLFR)
- `LiteratureBenchmarks/device5_bacteria_diagnostics.mint` ports 6 vs fromLFR 4
- `LiteratureBenchmarks/device6_organic_chemical_synthesis.mint` ports 20 vs fromLFR 18
- `Ryuichi's designs/nine_to_one_mux.mint` ports 19 vs fromLFR 10
