"""Functional-category mapping for LFR benchmarks (multi-label).

Canonical prose: ../CategoryMapping.md
Used by plot_benchmark_counts_by_function.py

Classes 1–9 are literature application assays (Device 10 protein–DNA omitted:
no encoded LFR). Classes 10–11 are structural functions promoted from the
former Other bin (multiplexed addressing, transposer). Tree and storage-grid
cases stay inside classes 1/6/9 rather than as extra bins. Other remains only
for files that match none of those classes.
"""

from __future__ import annotations

from pathlib import Path

MUX = "Multiplexed addressing"

# Display order: literature assays 1–9, then structural classes 10–11, then Other.
FUNCTIONAL_CATEGORIES: list[str] = [
    "scRNA-seq",
    "Artificial cells",
    "Directed evolution",
    "Molecular diagnostics",
    "Bacteria diagnostics",
    "Organic synthesis",
    "Enzyme screening",
    "Nucleic acid extraction",
    "Protein crystallization",
    MUX,
    "Transposer",
    "Other",
]

APPLICATION_CLASSES: frozenset[str] = frozenset(
    c for c in FUNCTIONAL_CATEGORIES if c != "Other"
)

# Whole source folders: every file gets this label set unless overridden.
FOLDER_TO_FUNCTION: dict[str, tuple[str, ...]] = {
    "Drop_Ref": ("Artificial cells", "Enzyme screening"),
    "COVID": ("Molecular diagnostics",),
}

# Longest-prefix wins (checked before folder default).
PREFIX_TO_FUNCTION: dict[str, tuple[str, ...]] = {
    "Distribute_Library/Mux_": (MUX,),
    "Distribute_Library/Transposer_": ("Transposer",),
    "Distribute_Library/Single_Storage_Grid_": (
        "Protein crystallization",
        "scRNA-seq",
    ),
    "Distribute_Library/Hv_Storage_Grid_": (
        "Protein crystallization",
        "scRNA-seq",
    ),
    "Distribute_Library/Cell_Traps_": ("scRNA-seq",),
    "Technology_Mapping/Tree_": (
        "Protein crystallization",
        "Organic synthesis",
    ),
    "Graph_Coverage/Tree_": (
        "Protein crystallization",
        "Organic synthesis",
    ),
}

# Per-file overrides. Keys are paths relative to LFR-TestCases/ or Quick_Examples/.
FILE_TO_FUNCTION: dict[str, tuple[str, ...]] = {
    # Literature exemplars
    "Literature_Benchmarks/Device_1_Sc_Rna_Seq.lfr": ("scRNA-seq",),
    "Literature_Benchmarks/Device_2_Artificial_Cells.lfr": (
        "Artificial cells",
        "Enzyme screening",
    ),
    "Literature_Benchmarks/Device_4_Molecular_Diagnostics.lfr": (
        "Molecular diagnostics",
    ),
    "Literature_Benchmarks/Device_5_Bacteria_Diagnostics.lfr": (
        "Bacteria diagnostics",
    ),
    "Literature_Benchmarks/Device_6_Organic_Chemical_Synthesis.lfr": (
        "Organic synthesis",
    ),
    "Literature_Benchmarks/Device_7_Enzyme_Screening.lfr": (
        "Enzyme screening",
        "Artificial cells",
    ),
    # Protocols / Mars
    "Protocols/Directed_Evolution.lfr": ("Directed evolution",),
    "Protocols/Cell_Sorting.lfr": ("Directed evolution", "scRNA-seq"),
    "Mars/Transformation.lfr": ("Directed evolution",),
    "Mars/Sorting.lfr": ("Directed evolution", "scRNA-seq"),
    "Mars/Pcr.lfr": ("Molecular diagnostics",),
    "Mars/Fluorescence.lfr": ("Molecular diagnostics",),
    "Mars/Ligation.lfr": ("Molecular diagnostics",),
    "Mars/Antibiotic_Resistance.lfr": ("Bacteria diagnostics",),
    "Mars/Cell_Lysis.lfr": ("Nucleic acid extraction", "Molecular diagnostics"),
    "Mars/Dna_Digest.lfr": ("Nucleic acid extraction", "Molecular diagnostics"),
    "COVID/Part_1_Rna_Prep.lfr": (
        "Molecular diagnostics",
        "Nucleic acid extraction",
    ),
    # CIDAR application devices
    "CIDAR_Lab_Past_Devices/Hasty_Cell_Traps.lfr": ("scRNA-seq",),
    "CIDAR_Lab_Past_Devices/Grad_Cells.lfr": ("scRNA-seq",),
    "CIDAR_Lab_Past_Devices/Rotary_Cells.lfr": ("scRNA-seq",),
    "CIDAR_Lab_Past_Devices/Seeding.lfr": ("scRNA-seq",),
    "CIDAR_Lab_Past_Devices/Mux_96_Chambers.lfr": (
        MUX,
        "scRNA-seq",
        "Protein crystallization",
    ),
    "CIDAR_Lab_Past_Devices/Inlet_16.lfr": (MUX,),
    "CIDAR_Lab_Past_Devices/Nine_To_One_Mux.lfr": (MUX,),
    "CIDAR_Lab_Past_Devices/Net_Mux.lfr": (MUX,),
    "CIDAR_Lab_Past_Devices/Multi_Input.lfr": (MUX,),
    "CIDAR_Lab_Past_Devices/Hmlp_Dual_Bank.lfr": (MUX,),
    "CIDAR_Lab_Past_Devices/Dual_Lane_Droplet.lfr": (
        "Artificial cells",
        "Enzyme screening",
    ),
    "CIDAR_Lab_Past_Devices/Microdroplet.lfr": (
        "Artificial cells",
        "Enzyme screening",
    ),
    "CIDAR_Lab_Past_Devices/Microalgal_Bioassay.lfr": ("Bacteria diagnostics",),
    "CIDAR_Lab_Past_Devices/Microreactor.lfr": ("Organic synthesis",),
    "CIDAR_Lab_Past_Devices/Mix_Incubate_Express.lfr": ("Organic synthesis",),
    "CIDAR_Lab_Past_Devices/Three_Reagent_Mix.lfr": ("Organic synthesis",),
    "CIDAR_Lab_Past_Devices/Dna_Synthesizer.lfr": ("Organic synthesis",),
    "CIDAR_Lab_Past_Devices/Gradient.lfr": (
        "Organic synthesis",
        "Protein crystallization",
    ),
    "CIDAR_Lab_Past_Devices/Incubator.lfr": ("Organic synthesis",),
    "CIDAR_Lab_Past_Devices/Kinetics.lfr": ("Enzyme screening",),
    "Technology_Mapping/N_Less_M_Map.lfr": (
        "Protein crystallization",
        "Organic synthesis",
    ),
    "Technology_Mapping/N_Greater_M_Map.lfr": (
        "Protein crystallization",
        "Organic synthesis",
    ),
    "Transport_Networks/One_To_8.lfr": (
        "Protein crystallization",
        "Organic synthesis",
    ),
    # Quick_Examples (top-level demos)
    "Quick_Examples/import_droplet_reaction.lfr": (
        "Artificial cells",
        "Enzyme screening",
    ),
    "Quick_Examples/mixer_3to1.lfr": ("Organic synthesis",),
    "Quick_Examples/import_mixer_and_incubator.lfr": ("Organic synthesis",),
    "Quick_Examples/import_parallel_premix.lfr": ("Organic synthesis",),
    "Quick_Examples/diy_with_mixer_demo.lfr": ("Organic synthesis",),
    "Quick_Examples/test_device.lfr": (MUX,),
    "Quick_Examples/flow_only_demo.lfr": ("Other",),
    "Quick_Examples/flow_and_control_demo.lfr": ("Other",),
    "Quick_Examples/test_DIY_crossing.lfr": ("Other",),
    "Quick_Examples/test_DIY_fork.lfr": ("Other",),
}


def _normalize(labels: tuple[str, ...]) -> tuple[str, ...]:
    """Drop Other when any application class is present; keep category order."""
    apps = [c for c in FUNCTIONAL_CATEGORIES if c in labels and c != "Other"]
    if apps:
        return tuple(apps)
    return ("Other",)


def classify_lfr(rel_posix: str) -> tuple[str, ...]:
    """Return one or more functional classes for a path relative to LFR-TestCases
    or prefixed Quick_Examples/."""
    if rel_posix in FILE_TO_FUNCTION:
        return _normalize(FILE_TO_FUNCTION[rel_posix])
    best_prefix = ""
    best_labels: tuple[str, ...] | None = None
    for prefix, labels in PREFIX_TO_FUNCTION.items():
        if rel_posix.startswith(prefix) and len(prefix) > len(best_prefix):
            best_prefix = prefix
            best_labels = labels
    if best_labels is not None:
        return _normalize(best_labels)
    folder = Path(rel_posix).parts[0]
    if folder in FOLDER_TO_FUNCTION:
        return _normalize(FOLDER_TO_FUNCTION[folder])
    return ("Other",)


def is_multi_function(labels: tuple[str, ...]) -> bool:
    return len(labels) > 1
