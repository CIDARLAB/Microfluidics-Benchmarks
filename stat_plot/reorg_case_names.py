#!/usr/bin/env python3
"""Rename cryptic LFR/MINT case stems to Xxx_Yyy and sync Results 1:1 with sources."""

from __future__ import annotations

import re
import shutil
import subprocess
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
NEPTUNE = ROOT.parent
LFR = ROOT / "LFR-TestCases"
MINT = ROOT / "MINT-TestCases"
RES_LFR = ROOT / "Results" / "LFR-TestCases"
RES_MINT = ROOT / "Results" / "MINT-TestCases"
FLUIGI = Path("/home/cidar-ron/.cache/pypoetry/virtualenvs/fluigi-1YeczOhn-py3.10/bin/fluigi")

SEMANTIC = {
    "v0": "Hmlp_Dual_Bank",
    "hasty": "Hasty_Cell_Traps",
    "tdroplet": "Dual_Lane_Droplet",
    "dropletx": "Three_Reagent_Mix",
    "expresstest": "Mix_Incubate_Express",
    "pumpstat": "Pump_Passthrough",
    "declarations": "Number_Declarations",
    "mfd005chip": "Mfd_005_Chip",
    "dnasynthesizer": "Dna_Synthesizer",
    "dna_digest": "Dna_Digest",
    "mux96chambers": "Mux_96_Chambers",
    "inlet16": "Inlet_16",
    "rotary16": "Rotary_16",
    "logic04": "Logic_04",
    "rootchip": "Root_Chip",
    "dropletgenerator": "Droplet_Generator",
    "dropletgenerator2": "Droplet_Generator_2",
    "dropletgenerator3": "Droplet_Generator_3",
    "dropletgenerator4": "Droplet_Generator_4",
    "dropx_test1": "Dropx_Test_1",
    "dropx_test2": "Dropx_Test_2",
    "dropx_test3": "Dropx_Test_3",
    "dropx_test4": "Dropx_Test_4",
    "elisalfr": "Elisa",
    "electro4": "Gel_Electrophoresis",
    "part1_rna": "Part_1_Rna_Prep",
    "part2_lfr": "Part_2_Rt_Step",
    "part3_gel": "Part_3_Gel",
    "n_g_m_map": "N_Greater_M_Map",
    "n_l_m_map": "N_Less_M_Map",
    "device1_sc_rna_seq": "Device_1_Sc_Rna_Seq",
    "test": "Three_Port_Channel",
    "test01": "Node_Long_Cell_Trap_01",
    "test02": "Square_Cell_Trap_Ports",
    "test03": "Node_Long_Cell_Trap_03",
    "test04": "Node_Long_Cell_Trap_04",
    "test05": "Long_Cell_Trap_Two_Port",
    "test06": "Node_Long_Cell_Trap_06",
    "test_chambers": "Square_Cell_Trap_Chambers",
    "hmux01": "Horizontal_Mux_01",
    "xing_h": "Crossing_H",
    "xing_v": "Crossing_V",
    "portbank01": "Port_Bank_01",
    "mux8": "Mux_8",
    "simple": "Droplet_Merger_Simple",
    "simple_var0": "Mixer_Trap_Simple",
    "port": "Single_Port",
    "pre_processor_dump": "Pre_Processor_Dump",
    "mux3d": "Mux_3d",
    "pump3d": "Pump_3d",
    "ytree": "Y_Tree",
    "rotarymixer": "Rotary_Mixer",
    "aj_rtpcr_8primer": "Aj_Rtpcr_8_Primer",
    "grad_gen_h": "Grad_Gen_H",
    "grad_gen_v": "Grad_Gen_V",
    "grid_4_mixer": "Grid_4_Mixer",
    "cell_sorting": "Cell_Sorting",
    "crispr": "Crispr",
    "detectr": "Detectr",
    "arize": "Arize",
    "covid_crispr": "Covid_Crispr",
    "rt_pcr": "Rt_Pcr",
    "hybri_detect": "Hybri_Detect",
}

_COLLAPSED_SEMANTIC = {re.sub(r"[^a-z0-9]", "", k): v for k, v in SEMANTIC.items()}


def norm(s: str) -> str:
    return re.sub(r"[^a-z0-9]", "", s.lower())


def to_xxx_yyy(stem: str) -> str:
    key = stem.lower()
    if key in SEMANTIC:
        return SEMANTIC[key]
    collapsed = re.sub(r"[^a-z0-9]", "", key)
    if collapsed in _COLLAPSED_SEMANTIC:
        return _COLLAPSED_SEMANTIC[collapsed]
    parts = re.split(r"[_\-\s]+", key)
    token_re = re.compile(r"[a-z]+|[0-9]+")
    tokens: list[str] = []
    for part in parts:
        if not part:
            continue
        tokens.extend(token_re.findall(part) or [part])
    out: list[str] = []
    for t in tokens:
        if t.isdigit():
            out.append(t)
        else:
            out.append(t[:1].upper() + t[1:])
    return "_".join(out) if out else stem


def rewrite_identity(text: str, old: str, new: str) -> str:
    if old == new:
        return text
    text = re.sub(rf"\bmodule\s+{re.escape(old)}\b", f"module {new}", text)
    text = re.sub(rf"\bDEVICE\s+{re.escape(old)}\b", f"DEVICE {new}", text, flags=re.I)
    return text


def file_count(path: Path) -> int:
    if not path.exists():
        return 0
    return sum(1 for p in path.rglob("*") if p.is_file())


def force_merge(src: Path, dst: Path) -> None:
    if not src.exists():
        return
    if src.resolve() == dst.resolve():
        return
    dst.mkdir(parents=True, exist_ok=True)
    for item in list(src.iterdir()):
        target = dst / item.name
        if item.is_dir():
            force_merge(item, target)
        elif target.exists():
            if item.stat().st_size > target.stat().st_size:
                target.unlink()
                item.rename(target)
            else:
                item.unlink()
        else:
            item.rename(target)
    try:
        src.rmdir()
    except OSError:
        shutil.rmtree(src, ignore_errors=True)


def flatten_mars() -> None:
    for root, suffix in ((LFR, ".lfr"), (MINT, ".mint")):
        mars = root / "Protocols" / "MARS"
        if not mars.is_dir():
            continue
        for p in list(mars.glob(f"*{suffix}")):
            dest = root / "Protocols" / p.name
            if dest.exists() and dest != p:
                print(f"  skip flatten, exists {dest.relative_to(root)}")
                continue
            p.rename(dest)
            print(f"  flatten {p.relative_to(root)} -> Protocols/{p.name}")
        leftover = [x for x in mars.rglob("*") if x != mars]
        if not leftover:
            mars.rmdir()


def rename_sources() -> list[tuple[str, str, str]]:
    log: list[tuple[str, str, str]] = []
    for kind, root, suffix in (("LFR", LFR, ".lfr"), ("MINT", MINT, ".mint")):
        files = sorted(p for p in root.rglob(f"*{suffix}") if p.is_file())
        planned: list[tuple[Path, Path, str]] = []
        for p in files:
            new_stem = to_xxx_yyy(p.stem)
            dest = p.with_name(new_stem + suffix)
            planned.append((p, dest, new_stem))
        seen: dict[Path, Path] = {}
        for p, dest, _new_stem in planned:
            if dest in seen and seen[dest] != p:
                raise SystemExit(f"name collision: {seen[dest]} and {p} -> {dest}")
            seen[dest] = p

        temps: list[tuple[Path, Path, str, str]] = []
        for i, (p, dest, new_stem) in enumerate(planned):
            if p.name == dest.name:
                continue
            text = rewrite_identity(p.read_text(encoding="utf-8", errors="replace"), p.stem, new_stem)
            tmp = p.with_name(f".rename_tmp_{i}_{new_stem}{suffix}")
            tmp.write_text(text, encoding="utf-8")
            rel_old = str(p.relative_to(root))
            p.unlink()
            temps.append((tmp, dest, rel_old, str(dest.relative_to(root))))
        for tmp, dest, rel_old, rel_new in temps:
            if dest.exists():
                dest.unlink()
            tmp.rename(dest)
            log.append((kind, rel_old, rel_new))
            print(f"  [{kind}] {rel_old} -> {rel_new}")
    return log


def source_stems(src_root: Path, cat: str, suffix: str) -> dict[str, str]:
    """norm(stem) -> current source stem for files in this category."""
    src_by_norm: dict[str, str] = {}
    src_cat = src_root / cat
    if not src_cat.is_dir():
        return src_by_norm
    for p in src_cat.rglob(f"*{suffix}"):
        if p.is_file() and p.relative_to(src_root).parts[0] == cat:
            src_by_norm[norm(p.stem)] = p.stem
    return src_by_norm


def match_source_stem(name: str, src_by_norm: dict[str, str], stems: set[str]) -> str | None:
    n = norm(name)
    if n in src_by_norm:
        return src_by_norm[n]
    cand = to_xxx_yyy(Path(name).stem)
    if cand in stems:
        return cand
    return None


def rename_results() -> None:
    def walk(res_root: Path, src_root: Path, suffix: str) -> None:
        if not res_root.is_dir():
            return
        for catdir in list(res_root.iterdir()):
            if not catdir.is_dir() or catdir.name.startswith("run_logs"):
                continue
            src_by_norm = source_stems(src_root, catdir.name, suffix)
            stems = set(src_by_norm.values())

            mars = catdir / "MARS"
            if mars.is_dir():
                for child in list(mars.iterdir()):
                    tgt = match_source_stem(child.name, src_by_norm, stems)
                    if child.is_dir() and tgt:
                        dest = catdir / tgt
                        print(f"  [Res] {child.relative_to(res_root)} -> {dest.relative_to(res_root)}")
                        force_merge(child, dest)
                    elif child.is_dir():
                        shutil.rmtree(child)
                        print(f"  drop nested leftover {child.relative_to(res_root)}")
                    else:
                        child.unlink()
                shutil.rmtree(mars, ignore_errors=True)

            groups: dict[str, list[Path]] = defaultdict(list)
            for child in list(catdir.iterdir()):
                if not child.is_dir():
                    continue
                tgt = match_source_stem(child.name, src_by_norm, stems)
                if tgt:
                    groups[tgt].append(child)

            for new_stem, dirs in groups.items():
                dirs.sort(key=file_count, reverse=True)
                dest = catdir / new_stem
                for d in dirs:
                    if not d.exists():
                        continue
                    if d.resolve() == dest.resolve():
                        continue
                    print(f"  [Res] {d.relative_to(res_root)} -> {dest.relative_to(res_root)}")
                    force_merge(d, dest)

    walk(RES_LFR, LFR, ".lfr")
    walk(RES_MINT, MINT, ".mint")


def delete_orphans() -> list[str]:
    removed: list[str] = []

    def valid(src_root: Path, suffix: str) -> set[tuple[str, str]]:
        out = set()
        for p in src_root.rglob(f"*{suffix}"):
            if p.is_file():
                cat = p.relative_to(src_root).parts[0]
                out.add((cat, p.stem.lower()))
        return out

    extra_top = RES_LFR / "fluidic_mixer_fromLFR"
    if extra_top.exists():
        shutil.rmtree(extra_top)
        removed.append("LFR-Results/fluidic_mixer_fromLFR")
        print("  delete leftover LFR-Results/fluidic_mixer_fromLFR")

    def sweep(res_root: Path, src_root: Path, suffix: str, label: str) -> None:
        if not res_root.is_dir():
            return
        ok = valid(src_root, suffix)
        src_cats = {p.name for p in src_root.iterdir() if p.is_dir()}
        for catdir in list(res_root.iterdir()):
            if not catdir.is_dir() or catdir.name.startswith("run_logs"):
                continue
            for child in list(catdir.iterdir()):
                if not child.is_dir():
                    continue
                if (catdir.name, child.name.lower()) not in ok:
                    shutil.rmtree(child)
                    removed.append(f"{label}/{catdir.name}/{child.name}")
                    print(f"  delete orphan {label}/{catdir.name}/{child.name}")
            for child in list(catdir.iterdir()):
                if child.is_file():
                    child.unlink()
                    removed.append(f"{label}/{catdir.name}/{child.name}")
                    print(f"  delete stray file {label}/{catdir.name}/{child.name}")
            leftover = list(catdir.iterdir())
            if not leftover and catdir.name not in src_cats:
                catdir.rmdir()

    sweep(RES_LFR, LFR, ".lfr", "LFR-Results")
    sweep(RES_MINT, MINT, ".mint", "MINT-Results")
    return removed


def missing_or_empty() -> list[tuple[str, Path, Path]]:
    out: list[tuple[str, Path, Path]] = []
    for kind, src_root, suffix, res_root in (
        ("LFR", LFR, ".lfr", RES_LFR),
        ("MINT", MINT, ".mint", RES_MINT),
    ):
        for p in sorted(src_root.rglob(f"*{suffix}")):
            if not p.is_file():
                continue
            cat = p.relative_to(src_root).parts[0]
            dest = res_root / cat / p.stem
            if file_count(dest) == 0:
                out.append((kind, p, dest))
    return out


def compile_one(kind: str, src: Path, dest: Path) -> tuple[bool, str]:
    dest.mkdir(parents=True, exist_ok=True)
    if kind == "LFR":
        cmd = [
            str(FLUIGI),
            "compile_lfr",
            "--outpath",
            str(dest),
            "--variant",
            "0",
            "--pre-load",
            str(LFR),
            str(src),
        ]
    else:
        cmd = [
            str(FLUIGI),
            "compile_mint",
            "--assign-terminals",
            "true",
            "--generate-graph-view",
            "--outpath",
            str(dest),
            str(src),
        ]
    proc = subprocess.run(cmd, cwd=str(NEPTUNE), capture_output=True, text=True)
    log = (proc.stdout or "") + (proc.stderr or "")
    ok = proc.returncode == 0 and file_count(dest) > 0
    return ok, log[-4000:]


def main() -> None:
    print("=== flatten Protocols/MARS ===")
    flatten_mars()
    print("=== rename sources ===")
    log = rename_sources()
    print("=== rename/merge results ===")
    rename_results()
    print("=== delete orphan results ===")
    removed = delete_orphans()

    print("=== compile missing/empty results ===")
    compiled: list[str] = []
    failed: list[str] = []
    compile_logs: list[str] = []
    todo = missing_or_empty()
    print(f"  {len(todo)} cases need compile")
    for kind, src, dest in todo:
        print(f"  compile [{kind}] {src.relative_to(ROOT)} -> {dest.relative_to(ROOT)}")
        ok, clog = compile_one(kind, src, dest)
        compile_logs.append(f"===== {kind} {src} rc_ok={ok} =====\n{clog}\n")
        rel = str(src.relative_to(ROOT))
        if ok:
            compiled.append(rel)
            print(f"    ok ({file_count(dest)} files)")
        else:
            failed.append(rel)
            print(f"    FAILED")

    out = ROOT / "stat_plot" / "rename_map.md"
    lines = [
        "# Case filename renames (Xxx_Yyy)\n",
        "| Kind | Old | New |",
        "|------|-----|-----|",
    ]
    for kind, old, new in log:
        lines.append(f"| {kind} | `{old}` | `{new}` |")
    lines.append("\n## Deleted orphan Results\n")
    for r in removed:
        lines.append(f"- `{r}`")
    lines.append("\n## Compiled missing/empty Results\n")
    for c in compiled:
        lines.append(f"- ok `{c}`")
    for c in failed:
        lines.append(f"- FAIL `{c}`")
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    (ROOT / "stat_plot" / "compile_missing.log").write_text("".join(compile_logs), encoding="utf-8")
    print(f"Wrote {out} ({len(log)} renames, {len(removed)} orphans, {len(compiled)} compiled, {len(failed)} failed)")


if __name__ == "__main__":
    main()
