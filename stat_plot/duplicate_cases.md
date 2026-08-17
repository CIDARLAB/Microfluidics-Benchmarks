# Duplicate LFR / MINT cases

Same `stem` (case-insensitive) in more than one category folder.
One copy kept (preferred category); extras deleted from `LFR-TestCases` / `MINT-TestCases`.

Removed **29** files across **29** duplicate stems (6 byte-identical, 23 same name with different content).

Keep priority: Mars > Technology_Mapping > Grid > Chthesis > Transport_Networks > Primitive > Base > Ryuichi's_Designs > Graph_Coverage > Protocols > Test > New_Grid.

After deletion, leftover files in mostly-duplicate folders are still on disk (`Graph_Coverage` tree_fanin/tree_fanout; `Protocols` directed_evolution/cell_sorting; `New_Grid` grid_02). The plot merges those remnants so empty-looking categories are not shown:

- `Graph_Coverage` → `Technology_Mapping`
- `Protocols` → `Igem_2017_Boston_U_Devices`
- `New_Grid` → `CIDAR_Lab_Past_Devices` (already)

| Kind | Stem | Content | Kept | Removed |
|------|------|---------|------|---------|
| LFR | `cell_lysis` | different | `Mars/cell_lysis.lfr` | `Protocols/MARS/cell_lysis.lfr` |
| LFR | `cycle` | different | `Technology_Mapping/cycle.lfr` | `Graph_Coverage/cycle.lfr` |
| LFR | `dna_digest` | different | `Mars/dna_digest.lfr` | `Protocols/MARS/dna_digest.lfr` |
| LFR | `fluorescence` | different | `Mars/fluorescence.lfr` | `Protocols/MARS/fluorescence.lfr` |
| LFR | `ligation` | identical | `Mars/ligation.lfr` | `Protocols/MARS/ligation.lfr` |
| LFR | `multi_input` | different | `Chthesis/multi_input.lfr` | `Test/multi_input.lfr` |
| LFR | `n_g_m_map` | different | `Technology_Mapping/n_g_m_map.lfr` | `Graph_Coverage/n_g_m_map.lfr` |
| LFR | `n_l_m_map` | different | `Technology_Mapping/n_l_m_map.lfr` | `Graph_Coverage/n_l_m_map.lfr` |
| LFR | `one_to_one` | different | `Transport_Networks/one_to_one.lfr` | `Graph_Coverage/one_to_one.lfr` |
| LFR | `pcr` | identical | `Mars/pcr.lfr` | `Protocols/MARS/pcr.lfr` |
| LFR | `transformation` | different | `Mars/transformation.lfr` | `Protocols/MARS/transformation.lfr` |
| LFR | `tree_bus` | different | `Technology_Mapping/tree_bus.lfr` | `Graph_Coverage/tree_bus.lfr` |
| MINT | `cell_lysis` | different | `Mars/cell_lysis.mint` | `Protocols/MARS/cell_lysis.mint` |
| MINT | `cycle` | different | `Technology_Mapping/cycle.mint` | `Graph_Coverage/cycle.mint` |
| MINT | `dna_digest` | different | `Mars/DNA_Digest.mint` | `Protocols/MARS/dna_digest.mint` |
| MINT | `fluorescence` | different | `Mars/fluorescence.mint` | `Protocols/MARS/fluorescence.mint` |
| MINT | `grid_04` | different | `Grid/grid_04.mint` | `New_Grid/grid_04.mint` |
| MINT | `grid_08` | different | `Grid/grid_08.mint` | `New_Grid/grid_08.mint` |
| MINT | `grid_16` | different | `Grid/grid_16.mint` | `New_Grid/grid_16.mint` |
| MINT | `ligation` | identical | `Mars/ligation.mint` | `Protocols/MARS/ligation.mint` |
| MINT | `multi_input` | different | `Chthesis/multi_input.mint` | `Test/multi_input.mint` |
| MINT | `n_g_m_map` | identical | `Technology_Mapping/n_g_m_map.mint` | `Graph_Coverage/n_g_m_map.mint` |
| MINT | `n_l_m_map` | identical | `Technology_Mapping/n_l_m_map.mint` | `Graph_Coverage/n_l_m_map.mint` |
| MINT | `one_to_one` | different | `Transport_Networks/one_to_one.mint` | `Graph_Coverage/one_to_one.mint` |
| MINT | `pcr` | identical | `Mars/pcr.mint` | `Protocols/MARS/pcr.mint` |
| MINT | `pre_processor_dump` | different | `Mars/pre_processor_dump.mint` | `Ryuichi's_Designs/pre_processor_dump.mint` |
| MINT | `transformation` | different | `Mars/transformation.mint` | `Protocols/MARS/transformation.mint` |
| MINT | `transposer` | different | `Primitive/transposer.mint` | `Base/transposer.mint` |
| MINT | `tree_bus` | different | `Technology_Mapping/tree_bus.mint` | `Graph_Coverage/tree_bus.mint` |

