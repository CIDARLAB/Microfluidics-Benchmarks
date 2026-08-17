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
- `Graph_Coverage/cycle.mint` ← `Graph_Coverage/cycle/cycle_fromLFR.mint` ([1, 1, 1, 1, 1] → [6])
- `Graph_Coverage/n_g_m_map.mint` ← `Graph_Coverage/n_g_m_map/n_g_m_map_fromLFR.mint` ([1, 1] → [10])
- `Graph_Coverage/n_l_m_map.mint` ← `Graph_Coverage/n_l_m_map/n_l_m_map_fromLFR.mint` ([1, 1] → [10])
- `Literature_Benchmarks/device2_artificial_cells.mint` ← `Literature_Benchmarks/device2_artificial_cells/device2_artificial_cells_fromLFR.mint` ([2, 2, 2, 2, 2, 2, 2, 2, 1, 1] → [26])
- `Literature_Benchmarks/device7_enzyme_screening.mint` ← `Literature_Benchmarks/device7_enzyme_screening/device7_enzyme_screening_fromLFR.mint` ([3, 2, 2, 1, 1, 1, 1, 1, 1] → [19])
- `Parser_Test/declarations.mint` ← `Parser_Test/declarations/declarations_fromLFR.mint` ([1, 1] → [2])
- `Protocols/MARS/cell_lysis.mint` ← `Protocols/MARS/cell_lysis/cell_lysis_fromLFR.mint` ([9, 1, 1, 1, 1] → [8])
- `Protocols/directed_evolution.mint` ← `Protocols/directed_evolution/directed_evolution_fromLFR.mint` ([7, 5, 1, 1, 1, 1] → [24])
- `Ryuichi's_Designs/MFD005chip.mint` ← `Ryuichi's_Designs/mfd005chip/mfd005chip_fromLFR.mint` ([3, 2, 2, 1, 1, 1, 1, 1, 1] → [12])
- `Ryuichi's_Designs/chemostat_chip.mint` ← `Ryuichi's_Designs/chemostat_chip/chemostat_chip_fromLFR.mint` ([8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [28])
- `Ryuichi's_Designs/dnasynthesizer.mint` ← `Ryuichi's_Designs/dnasynthesizer/dnasynthesizer_fromLFR.mint` ([33, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [55])
- `Ryuichi's_Designs/genetic_clock_testing_tool.mint` ← `Ryuichi's_Designs/genetic_clock_testing_tool/genetic_clock_testing_tool_fromLFR.mint` ([6, 1, 1, 1] → [9])
- `Ryuichi's_Designs/glycoform.mint` ← `Ryuichi's_Designs/glycoform/glycoform_fromLFR.mint` ([5, 1, 1] → [13])
- `Ryuichi's_Designs/incubator.mint` ← `Ryuichi's_Designs/incubator/incubator_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [18])
- `Ryuichi's_Designs/inlet16.mint` ← `Ryuichi's_Designs/inlet16/inlet16_fromLFR.mint` ([24, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [40])
- `Ryuichi's_Designs/microalgal_bioassay.mint` ← `Ryuichi's_Designs/microalgal_bioassay/microalgal_bioassay_fromLFR.mint` ([12, 1] → [11])
- `Ryuichi's_Designs/microdroplet.mint` ← `Ryuichi's_Designs/microdroplet/microdroplet_fromLFR.mint` ([9, 2, 1, 1, 1, 1, 1, 1] → [17])
- `Ryuichi's_Designs/microreactor.mint` ← `Ryuichi's_Designs/microreactor/microreactor_fromLFR.mint` ([9, 1] → [8])
- `Ryuichi's_Designs/mux96chambers.mint` ← `Ryuichi's_Designs/mux96chambers/mux96chambers_fromLFR.mint` ([2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [146])
- `Ryuichi's_Designs/olfactory.mint` ← `Ryuichi's_Designs/olfactory/olfactory_fromLFR.mint` ([13, 1] → [10])
- `Ryuichi's_Designs/rootchip.mint` ← `Ryuichi's_Designs/rootchip/rootchip_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [20])
- `Ryuichi's_Designs/seeding.mint` ← `Ryuichi's_Designs/seeding/seeding_fromLFR.mint` ([8, 1] → [22])
- `Technology_Mapping/cycle.mint` ← `Technology_Mapping/cycle/cycle_fromLFR.mint` ([1, 1, 1, 1, 1] → [6])
- `Chthesis/grad_cells.mint` ← `Chthesis/grad_cells/grad_cells_fromLFR.mint` ([14, 6] → [8])
- `Chthesis/logic04.mint` ← `Chthesis/logic04/logic04_fromLFR.mint` ([28, 1, 1, 1, 1, 1, 1, 1, 1] → [24])
- `Chthesis/multi_input.mint` ← `Chthesis/multi_input/multi_input_fromLFR.mint` ([13, 1, 1] → [12])
- `Chthesis/net_mux.mint` ← `Chthesis/net_mux/net_mux_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [30])
- `Chthesis/rotary16.mint` ← `Chthesis/rotary16/rotary16_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [48])
- `Chthesis/rotary_cells.mint` ← `Chthesis/rotary_cells/rotary_cells_fromLFR.mint` ([6, 1, 1, 1, 1, 1] → [12])
- `Chthesis/tdroplet.mint` ← `Chthesis/tdroplet/tdroplet_fromLFR.mint` ([15, 1] → [12])
- `Distribute_Expressions/dist_expression2.mint` ← `Distribute_Expressions/dist_expression2/dist_expression2_fromLFR.mint` ([1, 1, 1] → [3])
- `Distribute_Expressions/dist_expression3.mint` ← `Distribute_Expressions/dist_expression3/dist_expression3_fromLFR.mint` ([1, 1, 1] → [3])
- `Distribute_Library/transposer_04.mint` ← `Distribute_Library/transposer_04/transposer_04_fromLFR.mint` ([22, 4] → [20])
- `Dropgen/dropletgenerator2.mint` ← `Dropgen/dropletgenerator2/dropletgenerator2_fromLFR.mint` ([2, 2, 1, 1, 1] → [15])
- `Dropgen/dropletgenerator3.mint` ← `Dropgen/dropletgenerator3/dropletgenerator3_fromLFR.mint` ([2, 2, 1, 1, 1, 1] → [22])
- `Dropgen/dropletgenerator4.mint` ← `Dropgen/dropletgenerator4/dropletgenerator4_fromLFR.mint` ([3, 1, 1, 1] → [12])
- `Dropx/dx14.mint` ← `Dropx/dx14/dx14_fromLFR.mint` ([14, 3] → [9])
- `Ghissues/issue10.mint` ← `Ghissues/issue10/issue10_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1] → [20])
- `Ghissues/issue3.mint` ← `Ghissues/issue3/issue3_fromLFR.mint` ([2, 1, 1, 1, 1, 1, 1] → [20])
- `Ghissues/issue6.mint` ← `Ghissues/issue6/issue6_fromLFR.mint` ([3, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [27])
- `Ghissues/issue7.mint` ← `Ghissues/issue7/issue7_fromLFR.mint` ([2, 2, 1, 1, 1, 1, 1, 1, 1, 1] → [44])
- `Ghissues/issue8.mint` ← `Ghissues/issue8/issue8_fromLFR.mint` ([15, 1, 1, 1, 1, 1, 1] → [48])
- `Ghissues/issue9.mint` ← `Ghissues/issue9/issue9_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [32])
- `Hmlp/v0.mint` ← `Hmlp/v0/v0_fromLFR.mint` ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] → [33])
- `Mars/sorting.mint` ← `Mars/sorting/sorting_fromLFR.mint` ([3, 1, 1] → [5])
- `Test/dropletx.mint` ← `Test/dropletx/dropletx_fromLFR.mint` ([6, 1, 1] → [9])
- `Test/multi_input.mint` ← `Test/multi_input/multi_input_fromLFR.mint` ([12, 1, 1] → [12])
- `Test/ring.mint` ← `Test/ring/ring_fromLFR.mint` ([7, 1] → [6])

## Left as-is (connected, PORT count differs from fromLFR)
- `Literature_Benchmarks/device5_bacteria_diagnostics.mint` ports 6 vs fromLFR 4
- `Literature_Benchmarks/device6_organic_chemical_synthesis.mint` ports 20 vs fromLFR 18
- `Ryuichi's_Designs/nine_to_one_mux.mint` ports 19 vs fromLFR 10
