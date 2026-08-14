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
| `two_in_mixer.lfr`         | `two_in_mixer`       | Mix two input streams                           | `MIXER` via `~`                     |
| `three_in_mixer.lfr`       | `three_in_mixer`     | Mix three input streams                         | `MIXER` via `~`                     |
| `incubator.lfr`            | `incubator`          | Hold a stream for a reaction / incubation       | `INCUBATOR` via `&`                 |
| `droplet_generator.lfr`    | `droplet_generator`  | Emulsify an aqueous stream into droplets        | `NOZZLE DROPLET GENERATOR` via `&`  |

## Example compositions

The top-level examples under `Quick_Examples/` demonstrate how to compose
these blocks:

- `import_mixer_and_incubator.lfr` — premix + incubate, smallest example.
- `import_parallel_premix.lfr`     — two parallel premix lanes merged into a
  single 3-inlet mixer (same module imported twice).
- `import_droplet_reaction.lfr`    — 3-inlet mix -> droplet generator ->
  incubator, three separate library imports in one pipeline.

Compile any of them with the Quick_Examples flow:

```sh
./scripts/testLFR.sh Microfluidics-Benchmarks/Quick_Examples/import_droplet_reaction.lfr
```

or the batch driver:

```sh
./scripts/compile_lfr.sh     # compiles every *.lfr at the top of Quick_Examples
```
