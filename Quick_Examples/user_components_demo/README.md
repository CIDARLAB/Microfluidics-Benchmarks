# User-Defined JSON Components Demo

This demo shows how to plug a custom ("black-box") component into a Fluigi
design without modifying the 3DuF primitives server.

## Files

- `lib/MyGadget.json` — user-defined component `MyGadget` (ParchMint v1.2).
  The filename stem (`MyGadget`) is the entity name that top-level designs
  reference. Every `entity: "PORT"` component inside the JSON becomes an
  external terminal of the black box; the top-level `x-span` / `y-span`
  (or `params.width` / `params.length`) is the black-box bounding box.
- `TopDesign.mint` — a MINT design that instantiates `MYGADGET gadget_1`
  and connects three flow channels plus one control line to its `inA`,
  `inB`, `out`, and `ctrl` terminals.

## Expected terminals

`MyGadget.json` declares four ports (matched by their `name` field):

| label | layer    | offset (x, y) |
| ----- | -------- | ------------- |
| inA   | FLOW     | (0, 2500)     |
| inB   | FLOW     | (0, 7500)     |
| out   | FLOW     | (20000, 5000) |
| ctrl  | CONTROL  | (10000, 0)    |

Bounding box: `x-span = 20000`, `y-span = 10000`.

## Running the demo

```bash
fluigi compile_mint TopDesign.mint \
    --component-library lib/ \
    -o out/
```

The compile step:

1. Parses `TopDesign.mint`.
2. For every component, consults `lib/` first; if a matching
   `<Entity>.json` file exists, its `x-span`, `y-span`, and external
   ports are used. Otherwise falls back to the 3DuF primitives server.
3. Raises `UnknownComponentError` at the end if any entity could not be
   resolved by either source, listing the missing entities and every
   directory that was searched.

## Negative example

Remove the `--component-library lib/` argument (or point it at an empty
directory) and re-run. The compile will end with a clear error
message listing `MYGADGET` as an unresolved component type, along with
all search paths consulted.

## Notes

- This is a *black-box* integration: Fluigi uses the component's bounding
  box, params, and terminals to place and route, but does not expand or
  merge the component's internal features into the top design. A later
  pass can be added to splice the user-supplied JSON into the final
  integration output.
- Port labels must match between the custom JSON and the top design: the
  top design's `CHANNEL ... to gadget_1 inA` reaches the terminal whose
  label is `inA`, which is derived from the `name` of the PORT component
  inside `MyGadget.json`.
