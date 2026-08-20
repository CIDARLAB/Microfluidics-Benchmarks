# LFR functional-category mapping

The `Microfluidics-Benchmarks` tree is grouped **by provenance** (who contributed the case, or which historical suite it came from): `CIDAR_Lab_Past_Devices/`, `COVID/`, `Drop_Ref/`, `Literature_Benchmarks/`, `Mars/`, and so on. That is the layout Neptune batch scripts walk.

A second grouping is **by application function**, numbered sequentially:

- **Classes 1–9** — literature-motivated assays (Devices 1–9). Original Device 10 (protein–DNA interaction / Columba) has **no encoded LFR** and is omitted, not drawn as an empty bin.
- **Classes 10–11** — structural functions promoted from the former Other bin, filling that slot: multiplexed addressing and transposer. Tree networks and storage grids are **not** separate bins: they are already fully covered by classes 1, 6, and 9, so adding them would not change Other.
- **Other** — remaining compiler, expression, and issue-regression cases that match none of 1–11.

Every current LFR case — `LFR-TestCases/**/*.lfr` plus top-level `Quick_Examples/*.lfr` (**167** unique files) — is assigned to one or more of these classes. MINT files are not remapped here; they follow the same provenance folders as LFR.

Plot: `stat_plot/benchmark_counts_by_function.png` (machine-readable map: `stat_plot/functional_mapping.py`). Provenance census: `stat_plot/benchmark_counts_by_category.png`.

## Multi-label policy

One LFR file may implement plumbing that several assays share. Mapping is **multi-label**: a file is listed under every matching class. Paths that belong to more than one class are marked **`(multi-function included)`**. Bar heights in the functional plot are assignment counts and **need not sum to 167** (snapshot: **226** assignments from **167** unique files; **58** files are multi-function).

**Other** is exclusive: a file that matches any of classes 1–11 is removed from Other.

Classes are **not collapsed** when they share a motif. Organic synthesis (class 6; Lee / deMello) and protein crystallization (class 9; Abdallah) both use reagent trees; those files carry both assay labels rather than a third “tree network” class. Storage grids sit in scRNA-seq and/or protein crystallization rather than a separate grid class.

---

## Functional classes

### 1. scRNA-seq

Single-cell isolation, trapping, chamber arrays, and sequencing-prep topologies in which cells and barcoding/reagent streams are split, merged, and held. Literature exemplar: Jammes and Maerkl, *Microsystems & Nanoengineering* **6**, 45 (2020).

### 2. Artificial cells

Droplet, vesicle, and emulsification devices that compartmentalize aqueous reagents in oil or all-aqueous droplets. Literature exemplars: Ai et al., *Small* **16**, 1903940 (2020); Liu et al., *Small* **14**, 1801095 (2018). The same droplet style is also the hardware of combinatorial enzyme screening (class 7), so droplet LFR files are dual-labeled.

### 3. Directed evolution

Library construction, transformation, selection, and single-cell sorting loops. Literature exemplar: Zhou et al., *Talanta* **253**, 124044 (2023). Sorting cases are also labeled scRNA-seq.

### 4. Molecular diagnostics

Assay chips for nucleic-acid or immunoassay detection (PCR, CRISPR/DETECTR, ELISA, ligation, fluorescence), including the COVID protocol suite. Literature exemplar: Akgönüllü and Denizli, *Journal of Pharmaceutical and Biomedical Analysis* (2022). RNA-prep / lysis / digest files are also labeled nucleic-acid extraction.

### 5. Bacteria diagnostics

Microbial community or pathogen bioassays. Literature exemplar: Xiong et al., *Nature Communications* **9**, 1743 (2018). Not merged with molecular diagnostics.

### 6. Organic synthesis

Multi-reagent mix / react / incubate networks for chemical or cell-free synthesis. Experimental device: Lee et al., *Science* **310**, 1793–1796 (2005) (multistep synthesis of a radiolabeled imaging probe on an integrated chip). The same device figure is reprinted in the review deMello, *Nature* **442**, 394–402 (2006). Reagent-distribution trees are additionally labeled organic synthesis and protein crystallization (class 9). They are not given a separate tree-network class.

### 7. Enzyme screening

Combinatorial or high-throughput enzyme/reagent screening with gated inlets, droplet groups, and incubation. Literature exemplar: Zhang et al., TRANSDUCERS 2017, pp. 1797–1800. Droplet LFR files are dual-labeled with artificial cells.

### 8. Nucleic acid extraction

Lysis, digest, capture, and elution workflows. Literature exemplar: Chen, Cui, and Liu, *Electrophoresis* (2008), doi:10.1002/elps.200700551. The MEMS/porous-silicon chip is **not** encoded as LFR. Protocol-level lysis/digest/RNA-prep cases remain in this class (and in molecular diagnostics).

### 9. Protein crystallization

Actuated nanowell / crystallization-chamber arrays and the tree / bus / gradient feed networks that load them. Literature exemplar: Abdallah et al., *Crystal Growth & Design* **16**, 2074–2082 (2016). The published dense nanowell floorplan is not a one-to-one LFR replica; structurally corresponding tree, storage-grid, gradient, and chamber-array cases carry this label (and scRNA-seq or organic synthesis when the same plumbing is an assay holder). Device 6 (Lee / deMello) is **not** this class.

### 10. Multiplexed addressing

Independently addressing many flow channels with few control lines (Thorsen’s fluidic multiplexor). Class exemplars are **experimental chips**, not CAD synthesizers: Thorsen, Maerkl, and Quake, *Science* **298**, 580–584 (2002) fabricated an mLSI multiplexor (\(n\) flow channels from \(2\log_2 n\) control lines) and a 1000-chamber memory; Cooksey, Sip, and Folch, *Lab Chip* **9**, 417–426 (2009) ran a 16-inlet binary mux into a culture chamber; Lee and Cho, *Lab Chip* **9**, 1681–1686 (2009) fabricated high-radix muxes that address \(3\times3\) and \(4\times4\) well arrays. Gómez-Sjöberg et al., *Anal. Chem.* **79**, 8557–8563 (2007) is the experimental 96-chamber mux culture chip matching `Mux_96_Chambers.lfr`. Chamber-array chips that include a mux are multi-labeled with scRNA-seq and/or protein crystallization.

### 11. Transposer

N-lane permutation / crossbar elements that route any inlet to any outlet. Class exemplar is the **fabricated** transposer in Silva, Bhatia, and Densmore, *Lab Chip* **16**, 2730–2739 (2016) (design, PDMS fabrication, and operation of a single transposer, then a scaled routing fabric). Later EDA papers on fault-tolerant transposer fabrics are algorithms, not experimental device papers, and are not used as this class’s citation.

### Other

Compiler, language, and leftover CAD cases that match none of classes 1–11: LFR expression tests, issue regressions (`Ghissues/`), leftover technology-mapping toys, transport-network stubs, generic FLOW/CONTROL and DIY demos, and historical CIDAR chips whose function is culture hardware or language coverage rather than multiplexed addressing or transposer routing.

### Not plotted: protein–DNA interaction (original Device 10)

Tseng et al., Columba 2.0, *IEEE TCAD* **37**, 1588–1601 (2018). **No LFR case**, so the class is omitted; class 10 in this map is multiplexed addressing. Contributions of Columba-class or MITOMI-class LFR/MINT files are welcome.

---

## Mapping (functional order)

Counts are **assignments**. A whole provenance folder is listed when every file in it shares the same label set for that class.

### 1. scRNA-seq (21)

- `LFR-TestCases/Literature_Benchmarks/Device_1_Sc_Rna_Seq.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Hasty_Cell_Traps.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Grad_Cells.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Rotary_Cells.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Seeding.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Mux_96_Chambers.lfr` (multi-function included)
- `LFR-TestCases/Distribute_Library/Cell_Traps_4.lfr`
- `LFR-TestCases/Distribute_Library/Single_Storage_Grid_*.lfr` (multi-function included)
- `LFR-TestCases/Distribute_Library/Hv_Storage_Grid_*.lfr` (multi-function included)
- `LFR-TestCases/Protocols/Cell_Sorting.lfr` (multi-function included)
- `LFR-TestCases/Mars/Sorting.lfr` (multi-function included)

### 2. Artificial cells (28)

- `LFR-TestCases/Drop_Ref/` (entire folder) (multi-function included)
- `LFR-TestCases/Literature_Benchmarks/Device_2_Artificial_Cells.lfr` (multi-function included)
- `LFR-TestCases/Literature_Benchmarks/Device_7_Enzyme_Screening.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Dual_Lane_Droplet.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Microdroplet.lfr` (multi-function included)
- `Quick_Examples/import_droplet_reaction.lfr` (multi-function included)

### 3. Directed evolution (4)

- `LFR-TestCases/Protocols/Directed_Evolution.lfr`
- `LFR-TestCases/Protocols/Cell_Sorting.lfr` (multi-function included)
- `LFR-TestCases/Mars/Transformation.lfr`
- `LFR-TestCases/Mars/Sorting.lfr` (multi-function included)

### 4. Molecular diagnostics (18)

- `LFR-TestCases/COVID/` (entire folder; `Part_1_Rna_Prep.lfr` is multi-function included)
- `LFR-TestCases/Literature_Benchmarks/Device_4_Molecular_Diagnostics.lfr`
- `LFR-TestCases/Mars/Pcr.lfr`
- `LFR-TestCases/Mars/Fluorescence.lfr`
- `LFR-TestCases/Mars/Ligation.lfr`
- `LFR-TestCases/Mars/Cell_Lysis.lfr` (multi-function included)
- `LFR-TestCases/Mars/Dna_Digest.lfr` (multi-function included)

### 5. Bacteria diagnostics (3)

- `LFR-TestCases/Literature_Benchmarks/Device_5_Bacteria_Diagnostics.lfr`
- `LFR-TestCases/Mars/Antibiotic_Resistance.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Microalgal_Bioassay.lfr`

### 6. Organic synthesis (22)

Lee / deMello literature device (not dual-labeled with crystallization):

- `LFR-TestCases/Literature_Benchmarks/Device_6_Organic_Chemical_Synthesis.lfr`

Mix / incubate / synthesizer demos:

- `LFR-TestCases/CIDAR_Lab_Past_Devices/Microreactor.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Mix_Incubate_Express.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Three_Reagent_Mix.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Dna_Synthesizer.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Incubator.lfr`
- `Quick_Examples/mixer_3to1.lfr`
- `Quick_Examples/import_mixer_and_incubator.lfr`
- `Quick_Examples/import_parallel_premix.lfr`
- `Quick_Examples/diy_with_mixer_demo.lfr`

Tree / gradient plumbing (also class 9):

- `LFR-TestCases/CIDAR_Lab_Past_Devices/Gradient.lfr` (multi-function included)
- `LFR-TestCases/Graph_Coverage/` (entire folder) (multi-function included)
- `LFR-TestCases/Technology_Mapping/Tree_*.lfr` (multi-function included)
- `LFR-TestCases/Technology_Mapping/N_Less_M_Map.lfr` (multi-function included)
- `LFR-TestCases/Technology_Mapping/N_Greater_M_Map.lfr` (multi-function included)
- `LFR-TestCases/Transport_Networks/One_To_8.lfr` (multi-function included)

### 7. Enzyme screening (29)

- `LFR-TestCases/Literature_Benchmarks/Device_7_Enzyme_Screening.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Kinetics.lfr`
- `LFR-TestCases/Drop_Ref/` (entire folder) (multi-function included)
- `LFR-TestCases/Literature_Benchmarks/Device_2_Artificial_Cells.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Dual_Lane_Droplet.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Microdroplet.lfr` (multi-function included)
- `Quick_Examples/import_droplet_reaction.lfr` (multi-function included)

### 8. Nucleic acid extraction (3)

The MEMS extraction chip of Chen et al. (2008) is not present as an LFR file.

- `LFR-TestCases/Mars/Cell_Lysis.lfr` (multi-function included)
- `LFR-TestCases/Mars/Dna_Digest.lfr` (multi-function included)
- `LFR-TestCases/COVID/Part_1_Rna_Prep.lfr` (multi-function included)

### 9. Protein crystallization (25)

- `LFR-TestCases/Technology_Mapping/Tree_*.lfr` (multi-function included)
- `LFR-TestCases/Technology_Mapping/N_Less_M_Map.lfr` (multi-function included)
- `LFR-TestCases/Technology_Mapping/N_Greater_M_Map.lfr` (multi-function included)
- `LFR-TestCases/Graph_Coverage/` (entire folder) (multi-function included)
- `LFR-TestCases/Transport_Networks/One_To_8.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Gradient.lfr` (multi-function included)
- `LFR-TestCases/Distribute_Library/Single_Storage_Grid_*.lfr` (multi-function included)
- `LFR-TestCases/Distribute_Library/Hv_Storage_Grid_*.lfr` (multi-function included)
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Mux_96_Chambers.lfr` (multi-function included)

### 10. Multiplexed addressing (19)

- `LFR-TestCases/Distribute_Library/Mux_*.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Inlet_16.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Nine_To_One_Mux.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Net_Mux.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Multi_Input.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Hmlp_Dual_Bank.lfr`
- `LFR-TestCases/CIDAR_Lab_Past_Devices/Mux_96_Chambers.lfr` (multi-function included)
- `Quick_Examples/test_device_MUX4to1.lfr`

### 11. Transposer (7)

- `LFR-TestCases/Distribute_Library/Transposer_*.lfr`

### Other (47)

Whole provenance folders:

- `LFR-TestCases/Distribute_Expressions/`
- `LFR-TestCases/Expressions/`
- `LFR-TestCases/Ghissues/`

Remaining `Technology_Mapping/` (non-tree):

- `Cycle.lfr`, `Instance_Mapping.lfr`, `One_To_One_Mapping.lfr`

Remaining `Transport_Networks/`:

- `Distribute_Network_Examples.lfr`, `One_To_One.lfr`

Remaining `CIDAR_Lab_Past_Devices/`:

- `Chemostat_Chip.lfr`, `Genetic_Clock_Testing_Tool.lfr`, `Glycoform.lfr`, `Logic_04.lfr`, `Mfd_005_Chip.lfr`, `Number_Declarations.lfr`, `Olfactory.lfr`, `Pump_Passthrough.lfr`, `Ring.lfr`, `Root_Chip.lfr`, `Rotary_16.lfr`

Remaining `Quick_Examples/` demos:

- `flow_only_demo.lfr`, `flow_and_control_demo.lfr`, `test_DIY_crossing.lfr`, `test_DIY_fork.lfr`

---

## Summary counts

Unique LFR files: **167**. Assignments: **226**. Multi-function files: **58**.

| # | Functional class | Assignments | Of which multi-function |
|---|------------------|------------:|------------------------:|
| 1 | scRNA-seq | 21 | 15 |
| 2 | Artificial cells | 28 | 28 |
| 3 | Directed evolution | 4 | 2 |
| 4 | Molecular diagnostics | 18 | 3 |
| 5 | Bacteria diagnostics | 3 | 0 |
| 6 | Organic synthesis | 22 | 12 |
| 7 | Enzyme screening | 29 | 28 |
| 8 | Nucleic acid extraction | 3 | 3 |
| 9 | Protein crystallization | 25 | 25 |
| 10 | Multiplexed addressing | 19 | 1 |
| 11 | Transposer | 7 | 0 |
| — | Other | 47 | 0 |
| | **Assignment total** | **226** | |
| | **Unique files** | **167** | |

Original Device 10 (protein–DNA interaction) is not a row: it has no LFR case; class 10 is multiplexed addressing.
