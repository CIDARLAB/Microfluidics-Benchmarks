# Quick_Examples/library — reusable LFR building blocks

Small single-purpose LFR modules designed to be pulled into larger designs
via the LFR backtick-import directive.

## Import syntax

LFR uses a backtick-prefixed import directive that takes a quoted relative
path to another `.lfr` file. The literal form is:

```
<backtick>import "library/two_in_mixer.lfr"
<backtick>import "library/incubator.lfr"
```

(Each directive sits on its own line inside the top-level `.lfr` source,
*outside* of any comment block. The LFR preprocessor finds each directive
with a regex and inlines the referenced file before ANTLR runs — note that
this means any occurrence of the literal directive text is treated as an
import, even if it appears inside a `//` comment.)

Rules that must be obeyed for imports to resolve:

- **One file, one module, same name.** Every library file defines exactly
  one `module` whose name matches the file stem (`two_in_mixer.lfr` ->
  `module two_in_mixer`). The preprocessor enforces this convention so the
  importer can instantiate the module without surprise.
- **snake_case everywhere.** Filenames and module names both use
  `snake_case` to stay consistent with the rest of the codebase and with
  the LFR compiler's own canonical output form (`NameGenerator` converts
  MINT entity keywords to `lower().replace(" ", "_")` when generating
  instance names, so e.g. `NOZZLE DROPLET GENERATOR` becomes
  `nozzle_droplet_generator_N`).
- **Path resolution.** The spec inside the quotes is resolved (in order)
  against: (1) an absolute path if given, (2) the directory of the importing
  file, and (3) any directory passed to fluigi via `--pre-load`.
- **Transitive imports.** If a library file itself imports another library
  file, the preprocessor pulls in the second one automatically.

## Available modules

| File                       | Module               | Role                                            | Primitive mapping                   |
|----------------------------|----------------------|-------------------------------------------------|-------------------------------------|
| `DIYcomponent.lfr`         | `DIYcomponent`       | User black box (size + keepout, four sides)     | `DIYCOMPONENT` via `~`              |
| `two_in_mixer.lfr`         | `two_in_mixer`       | Mix two input streams                           | `MIXER` via `~`                     |
| `three_in_mixer.lfr`       | `three_in_mixer`     | Mix three input streams                         | `MIXER` via `~`                     |
| `incubator.lfr`            | `incubator`          | Hold a stream for a reaction / incubation       | `INCUBATOR` via `&`                 |
| `droplet_generator.lfr`    | `droplet_generator`  | 4-port nozzle (3-port oil/oil/water junction → 1-port droplet horn) | `NOZZLE DROPLET GENERATOR` via `~` |
| `mux4to1.lfr`              | `mux4to1`            | 4→1 distribute tree (control bits → one-hot valves) | distribute / `VALVE3D`          |
| `mux1to4.lfr`              | `mux1to4`            | 1→4 distribute tree                             | distribute / `VALVE3D`              |

The same stems are also copied to top-level `Quick_Examples/*.lfr` so
`run_all_Quick_Examples.sh` can synthesize them standalone. Prefer
`` `import "library/...." `` from composition demos; edit the canonical copy
under `library/` first.

## Example compositions

- `test_DIY_fork.lfr` / `test_DIY_crossing.lfr` / `diy_with_mixer_demo.lfr`
  — `DIYcomponent` black box. Instance parameters (µm): `length`, `width`,
  `height`, and `componentSpacing` (keepout halo, **default 1000**). Override
  with e.g. `#(length=10000, width=8000, height=2000, componentSpacing=3000)`.
  See `library/DIYcomponent.lfr`.

- `import_mixer_and_incubator.lfr` — premix + incubate, smallest example.
- `import_parallel_premix.lfr`     — two parallel premix lanes merged into a
  single 3-inlet mixer (same module imported twice).
- `import_droplet_reaction.lfr`    — 3-inlet mix -> 4-port droplet generator
  (facing oil pair + water on the 3-port junction, droplets out the horn) ->
  one pipe into a reaction chamber (`c_in` valve) -> one pipe out to
  `outlet` (`c_out` valve).
- `test_device_MUX4to1.lfr` / `test_device_two_MUX4to1.lfr` — inline distribute
  MUX demos (not library instances; distribute inside an imported module does
  not emit valves/Cports).

Compile from the **repo root**. `--pre-load Quick_Examples` is enough for
any top-level demo that does `` `import "library/...." ``. `--variant`
defaults to `0`. Do not add `--pre-load LFR-TestCases` here.

One-shot LFR → placed `*_fromLFR_PR.json` (open this in 3DuF):

```sh
poetry run fluigi synthesize \
  --pre-load Microfluidics-Benchmarks/Quick_Examples \
  Microfluidics-Benchmarks/Quick_Examples/import_droplet_reaction.lfr
# → Results/Quick_Examples/import_droplet_reaction/import_droplet_reaction_fromLFR_PR.json
```

Compile only (unplaced JSON, no P&R):

```sh
poetry run fluigi compile_lfr \
  --pre-load Microfluidics-Benchmarks/Quick_Examples \
  -o Microfluidics-Benchmarks/Results/Quick_Examples/import_droplet_reaction \
  Microfluidics-Benchmarks/Quick_Examples/import_droplet_reaction.lfr
```

or the scripts:

```sh
./scripts/testLFR.sh Microfluidics-Benchmarks/Quick_Examples/import_droplet_reaction.lfr
./scripts/run_all_Quick_Examples.sh   # every top-level *.lfr / *.mint → *_PR.json
```
