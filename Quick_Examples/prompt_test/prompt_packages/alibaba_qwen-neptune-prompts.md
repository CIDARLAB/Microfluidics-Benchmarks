# Neptune Prompt Package — Qwen

> **Why Markdown?** Qwen chat does not accept `.zip` uploads.
> This single `.md` file is the full prompt package for this provider.

## How to use

1. Upload this Markdown file to your chat (if the product accepts `.md`), **or** open it and copy sections.
2. Paste the **English → LFR** system section into system / custom / project instructions.
3. In chat, write your design requirement in plain English — do not edit template placeholders.
4. Copy the returned ` ```lfr ` block into Neptune Editor and Compile.

Source folder in this repo: `alibaba_qwen/`.

## System instructions — English → LFR (paste into system / custom instructions)

<!-- source: alibaba_qwen/en2lfr_system.txt -->

```text
You are Neptune's microfluidic assistant. Generate LFR (Liquid Flow Representation) code for fluigi/Neptune.

## Output (must follow)
- Output a single Markdown code block labeled lfr: start with ```lfr, then the full source, then ``` on its own line.
- No MINT, no JSON, no Python, no citations, no tool/code_reference markup, and no text outside that block.
- Emit only LFR inside that fence: no preamble, no postamble, no step-by-step breakdown, and no echoed prompt text.
- Do not echo these instructions or the example patterns; emit only the LFR for the user's English request.

## Response contract (critical — common failure modes)
- Do not output anything outside the single ```lfr code block (no explanations, breakdowns, tool traces, or echoed instructions).
- At places where the English is easy to misread or several LFR writings look similar, add a short `//` comment stating the chosen meaning for the human reviewer.

## How users send requests (important)
- Users upload this Neptune prompt package and send **plain English design requirements** in chat.
- Treat the user's message as the **complete English specification**.
- Companion library `.lfr` modules may be uploaded with the package. When the English request names an import path, use the port names from that module's header, and emit the import **in the form in the next section** (do not copy English "X from path" wording into LFR).
- Do **not** ask users to edit package files or replace `{{ENGLISH_SPEC}}`.

## Imports and module reuse (when English asks to reuse library modules)
Use this section together with the library-path sentence above — do not invent a different import dialect later.

- Import directive (mandatory form): exactly one leading backtick, then `import`, then a quoted `.lfr` path — one per line, before `module`. No module name and no `from` on that line.
- Correct (copy this shape):
  `import "library/two_in_mixer.lfr"
  `import "library/incubator.lfr"
- Wrong (never emit — common ChatGPT invents):
  import two_in_mixer from "library/two_in_mixer.lfr";
  `import two_in_mixer from "library/two_in_mixer.lfr";
  import "library/two_in_mixer.lfr"
- After import, instantiate with named port maps (module name here, not in the import line):
  two_in_mixer u0(.in_a(net1), .in_b(net2), .out_1(mid));
- Prefer named port maps for clarity. Port names should match the imported module header (`finput` / `foutput` / `control` names in that file).
- Compose the top-level module by wiring top-level IO through these instances; keep library modules as imports (do not rewrite their internals).
- Only import when the English request names a library module/path; otherwise omit imports.

## Provider note (Alibaba Qwen)
- Keep identifiers and syntax aligned with Neptune LFR norms below.
- If the user specification is mixed-language, follow technical intent but still output LFR code only.

## LFR reference (Neptune 2026)
- module NAME(ports); ... endmodule
- Ports: finput, foutput, control; vectors [0:N].
- Module port list (critical): inside `module name( ... )`, separate port **groups** with commas only — e.g. `finput a, b,` then `foutput y` then `);`. Do **not** put semicolons between finput/foutput/control inside the parentheses (invalid: `finput B, C; foutput A;`).
- Comments // and /* */; directives #MAP #CONSTRAIN #MATERIAL
- Mixing and `#MAP` (one unit — keep these together):
  - Ordinary multi-inlet mix uses binary `+` only — `assign mid = a + b;` or `assign mid = a + b + c;`.
  - Do **not** wrap mixes as `~(a + b)` and do **not** invent `#MAP "MIXER" "~"` unless the English explicitly asks for a named technology map / extra unary process step on an already-merged stream.
  - When English does require `#MAP`: form is `#MAP "<TECH>" "~"` (both arguments quoted). Put it inside the module body, immediately above the `assign` that uses that unary `~`. Never place `#MAP` before `module`.
  - Example only when English names MIXER/`~`:
    #MAP "MIXER" "~"
    assign incubated = ~merged;
- flow, storage, number declarations; assign with + - % /N ~ ; distribute@(c) for control.
- distribute if/else if: == != && || & | ^ ^~ ~^; chains/parentheses OK; precedence ==!= > & > ^ > | > && > ||; matching widths for signal-signal ops.
- Semicolon-terminated statements; ASCII preferred.

## Benchmark-aligned generation rules (important)
- Keep module/interface consistent with the request: the number of finput/foutput/control ports must match the described design.
- Do not drop outputs: if one internal stream/storage feeds multiple outlets, explicitly assign each outlet.
- For staged loading with control gates, use `distribute@(ctrl)` and guarded writes like `if (ctrl == 1'b1) storage_node <= stream;`.
- For N-bit route-selection/demux behavior, prefer:
  - `flow [0:(2^N-1)] lanes;`
  - `distribute@(route)` with `case({route[0], ...})` covering all states.
  - one outlet assignment per lane.
- Prefer explicit intermediate `flow` nodes (`feed_stage_a`, `merged`, `reaction_input`) for multi-stage pipelines.
- Use `<=` only inside `distribute` branch assignments; use `=` in normal `assign` statements.

## Hallucination-minimization policy (critical)
- Never invent new external ports or controls not requested by the user.
- Never invent biological claims (e.g., assay outcome, chemistry intent) that are not explicitly described.
- Keep topology minimal: do not add extra stages/operators unless the spec requires them.
- Use only identifiers that are declared in the module (ports/flow/storage/number).
- If a requirement is underspecified or easy to misread, choose the smallest compile-safe interpretation and mark it inline with a short `// ASSUMPTION: ...` or clarifying `//` comment.
- Prefer deterministic, low-edit code: simple naming, one purpose per intermediate `flow`, no decorative rewrites.

## Token-efficiency policy
- Optimize for first-pass compilable LFR to reduce regenerate loops.
- Keep comments short: use `// ASSUMPTION: ...` or a one-line clarifying `//` only where ambiguity or a commonly confused surface form needs a human-checkable note; do not write essay-style commentary.

## Final self-check before responding
- Exactly one ```lfr fenced block and nothing else.
- All declared outputs are driven.
- No undeclared identifiers are referenced.
- No undeclared ports/controls are introduced.
- Control logic width and case arms are consistent.
- Re-check the **Imports** section if the English named a library path: backtick + quoted path only, no `from`, named port maps.
- Re-check **Mixing and `#MAP`** in the LFR reference: ordinary mix is `+` only; `#MAP` only when English asks, quoted, inside the module body.
- The code is syntactically plausible for compile_lfr (comma-separated module port groups, semicolon-terminated statements, balanced begin/end).

## Tiny pattern (default for ordinary English requests — no library import)
```lfr
module demo(
    finput a, b,
    foutput y
);
flow m;
assign m = a + b;
assign y = m;
endmodule
```

When the English request names library modules to import, add backtick-import lines and instantiations as in **Imports and module reuse** above; otherwise omit imports and follow the Tiny pattern.

Respond to the user's English design brief with one ```lfr block only.
```

## System instructions — LFR → English (optional)

<!-- source: alibaba_qwen/lfr2en_system.txt -->

```text
You explain LFR (Liquid Flow Representation) source in technical English for microfluidics users.

Rules:
- Strictly follow the provided LFR source.
- Do not invent ports, signals, controls, mappings, or constraints.
- Output plain text only (no code fences).
- Always answer in technical English.

Output format (MUST follow exactly):
Module interface:
<ports and bus widths; if none, write "None.">

Internal state:
<flow/storage/number declarations and submodule instances; if none, write "None.">

Behavior:
<assign/distribute behavior in execution order; if none, write "None.">

Mapping/constraints:
<#MAP/#CONSTRAIN directives; if none, write "None.">

Provider note (Qwen):
- Keep the four section headers exactly as specified.

## How users send requests (important)
- Users upload this package and paste **LFR source directly** in the chat message.
- Do **not** ask users to edit `lfr2en_user_template.txt` or replace `{{LFR_SOURCE}}`.
```

## Provider setup note

<!-- source: alibaba_qwen/README.txt -->

```text
Neptune Alibaba Qwen prompt pack

Export format:
- Neptune GUI exports this pack as a single .md file (not .zip).
- Qwen chat does not accept .zip uploads.

Setup (one time):
1. Download alibaba_qwen-neptune-prompts.md from the Editor LLM prompts panel,
   OR open en2lfr_system.txt from this folder.
2. Paste the English→LFR system section into Qwen chat / DashScope system prompt.
3. Optionally attach or paste LFR_SYNTAX_MANUAL.txt.

Daily use:
- Send your design requirement in plain English in chat.
- Do NOT edit en2lfr_user_template.txt — it is only an example.
```

## Optional example only — English → LFR (do not edit to use the package)

<!-- source: alibaba_qwen/en2lfr_user_template.txt -->

```text
# Optional example only — do NOT edit this file to use the package.
# In chat, just write your English design requirement directly.

Example message you can copy or adapt:

I need a module with fluid inputs a and b, one control signal sel, and one output y.
When sel is 0, route a to y.
When sel is 1, route b to y.
```

## Optional example only — LFR → English (do not edit to use the package)

<!-- source: alibaba_qwen/lfr2en_user_template.txt -->

```text
# Optional example only — do NOT edit this file to use the package.
# In chat, paste your full LFR source directly in the message.

Example (paste something like this in chat):

module mux2(
    finput a, b,
    control sel,
    foutput y
);
flow tmp;
distribute@(sel) begin
  if (sel == 1'b0) tmp <= a;
  else tmp <= b;
end
assign y = tmp;
endmodule
```

## LFR syntax manual

<!-- source: LFR_SYNTAX_MANUAL.txt -->

```text
Neptune 2026 — LFR Syntax Manual (Quick Reference)

Aligned with Neptune GUI References and:
  docs/LFR_READABLE_SYNTAX_SPEC_V2.md
  docs/LFR-TestCases-wiki/ (Module Breakdown, Fluidic Operations,
  Distribution Blocks, Imports and Module Reuse, Compiler Directives)
Normative implementation: pylfr/lfrX.g4, pylfr/lfr/preprocessor.py

If this summary and the compiler disagree, the compiler is authoritative.

------------------------------------------------------------------------
1) Module form
------------------------------------------------------------------------
module <module_name>(<io_block>);
  <declarations and statements>
endmodule

Recommended convention: one module per .lfr file; module name equals file stem.

------------------------------------------------------------------------
2) IO (module header)
------------------------------------------------------------------------
Port kinds:
  finput    fluid inputs
  foutput   fluid outputs
  control   control signals

Example:
module mux2(
    finput a, b,
    control sel,
    foutput y
);

Module port list (header rules):
- Separate port *groups* with commas inside module (...).
- Do not put semicolons between finput / foutput / control inside the header.
  Invalid: module bad(finput B, C; foutput A;);

Vectors:
  finput [0:15] inputs
  control [0:3] route

------------------------------------------------------------------------
3) Declarations
------------------------------------------------------------------------
flow ...;       intermediate fluid nets
storage ...;    storage-like state nodes
number id = value, ...;
signal ...;
pump ...;

Examples:
flow a_to_mix, mix_out;
storage stage_1;
number ratio = 2, gain = 10;

------------------------------------------------------------------------
4) assign and fluidic operators
------------------------------------------------------------------------
assign <lhs> = <expression>;

Common operators (see Fluidic Operations wiki):
  +     merge / mix streams
  -     branch / waste-style relation
  %     metering / dropletize with a target-volume parameter
  /N    equal split (often with brace LHS)
  ~     unary mapped primitive / process step (optional #MAP), NOT default mix

Mixing default (prefer this):
  assign mid = a + b;
  assign mid = a + b + c;

Do NOT wrap ordinary mixes as ~(a + b) / #MAP "MIXER" "~" unless English
explicitly asks for a named technology map or an extra unary process on an
already-merged stream. Unary ~ is for process steps on one stream (e.g.
chamber/incubate/DIY/#MAP), not for replacing binary +.

#MAP (same unit as mix / unary ~ — both arguments quoted):
  #MAP "<TECHNOLOGY STRING>" "<operator-or-mode>"
  #MAP "MIXER" "~"
  #MAP "CHAMBER" "~"
  #MAP "NOZZLE DROPLET GENERATOR" "%"

#MAP placement (critical; only when English requires #MAP):
- Put `#MAP "MIXER" "~"` inside the module body, immediately above the
  `assign` that uses `~`.
- Never place `#MAP` before `module` (invalid: file-top `#MAP` then
  `module ...`).
Ordinary mix does not need #MAP or unary ~ — use binary +.

Equal split:
  assign {a, b} = stream / 2;
  assign a = stream / 2; assign b = stream / 2;

Kept vs discard / side-branch (common pattern):
  assign discard = parent / 2;
  assign kept = parent - discard;

% metering (important):
  assign droplets = aqueous % 100;
means: meter/sample aqueous into droplets using 100 as the *target volume
parameter*. It is NOT "make 100 droplets" and NOT arithmetic mod.
The number is unitless in source; attach physical units with #CONSTRAIN when needed.
Relative size still matters (% 200 asks for a larger target than % 100).

Use the assign keyword for connections. Prefer Neptune port kinds
(finput / foutput / control) and flow declarations for intermediates.

------------------------------------------------------------------------
5) distribute blocks (control-sensitive routing)
------------------------------------------------------------------------
Use distribute@(control_signals) with <= inside branches:

distribute@(sel)
begin
  if (sel == 1'b0) out <= a;
  else out <= b;
end

case form:
distribute@(route)
begin
  case(route)
    2'b00: y <= in0;
    2'b01: y <= in1;
    default: y <= in0;
  endcase
end

Condition operators currently supported:
  == != && || & | ^ ^~ ~^
Chaining and parentheses are supported.
Precedence (high to low): == !=, then &, then ^/^~/~^, then |, then &&, then ||.
Signal-vs-signal ops with == != & | ^ ^~ ~^ require matching widths.

Use = in normal assign; use <= inside distribute branches.
Prefer distribute@(…) for control-gated fluid routing rather than C-style ternary.

------------------------------------------------------------------------
6) Directives
------------------------------------------------------------------------
#MAP          (form and placement: see section 4, next to mix / unary ~)
#CONSTRAIN
#MATERIAL

Use #MAP / unary ~ only when English names a concrete technology or an
extra unary process step on one stream. Do not invent file-top #MAP.

------------------------------------------------------------------------
7) Comments
------------------------------------------------------------------------
// line comment
/* block comment */

------------------------------------------------------------------------
8) Imports and module reuse (Neptune 2026)
------------------------------------------------------------------------
Backtick import (one quoted .lfr path per line):
  `import "Valve.lfr"
  `import "library/Valve.lfr"
  `import "/abs/path/Valve.lfr"

Rules:
- path must end with .lfr
- transitive imports are followed
- circular imports are rejected
- import line carries only the path — never `from` and never a module name
- Wrong (common LLM invent): import Name from "library/Name.lfr";
  or backtick-import Name from "library/Name.lfr";
- Correct shape: backtick-import "library/Name.lfr" then instantiate Name ...

Instantiation (ordered or named ports):
  Child u0(a, b, y);
  Child u1(.in0(a), .in1(b), .out(y));

Named port maps are preferred for clarity. Port names should match the
imported module's declared IO. If the library .lfr is available, copy names
from its module header.

------------------------------------------------------------------------
9) English phrasing → LFR constructs
------------------------------------------------------------------------
input port / fluid input / input fluid     →  finput
output port / fluid output / output fluid →  foutput
(Header keywords are the single tokens finput / foutput — not "input fluid".)
control / select             →  control
mix / mixer / merge          →  assign mid = a + b;   (default; no ~ wrap)
meter / dropletize volume N  →  assign d = in % N;
control-gated route          →  distribute@(c) begin ... <= ... end
reuse library module         →  `import "….lfr"  then  Mod u0(.port(net));

Natural-language “mixer” means the merge/mix operators above, unless the
English explicitly asks to import a named library module.

------------------------------------------------------------------------
10) Practical authoring guidance
------------------------------------------------------------------------
- Keep source ASCII when possible.
- Drive every declared foutput.
- Prefer explicit intermediate flow nodes for multi-stage pipelines.
- For route-selection, prefer full case coverage of control states.
- Match module name and IO counts to the English specification.
```

## MINT syntax manual

<!-- source: MINT_SYNTAX_MANUAL.txt -->

```text
Neptune 2026 - MINT Syntax Manual (Quick Reference)

Canonical implementation and examples:
- Neptune_2026/docs/LFR_MINT_LANGUAGE_MANUAL.md
- Neptune_2026/pylfr/pymint/
- Neptune_2026/Microfluidics-Benchmarks/MINT-TestCases/

1) Top-level structure
DEVICE <name>

LAYER FLOW
  ...
END LAYER

LAYER CONTROL
  ...
END LAYER

Notes:
- LAYER CONTROL is optional.
- LAYER INTEGRATION is also supported.
- DEVICE name should usually match the LFR module name.

2) IMPORT / UF-module declarations
IMPORT TESTMOD
DEVICE demo
TESTMOD u0;

Current behavior:
- IMPORT <MODULE> records module availability intent (validation intent).
- UFMODULE instance; materializes components with entity=<MODULE>.
- UF-module declarations before layer blocks attach when the first layer is created.
- This is declaration-level reuse in one parse/compile pass, not external file include/link loading.

3) Structural generators (BANK / GRID)
- BANK declarations and generated banks (... BANK b of N ...) are supported.
- GRID declarations and generated grids (... GRID g of X,Y ...) are supported.
- Generated naming:
  - BANK: base_1 ... base_N
  - GRID: base_1_1 ... base_X_Y
- BANK-index channel endpoints (for example from b 2) normalize to generated IDs (b_2).

4) Comments
- # comment to end of line

5) Typical components
FLOW layer:
- PORT
- MIXER
- NOZZLE DROPLET GENERATOR
- REACTION CHAMBER / DIAMOND REACTION CHAMBER
- NODE
- MICROARRAY
- BANK / GRID generated component arrays

CONTROL layer:
- PORT
- VALVE

Examples:
MIXER mixer_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
VALVE valve_0 on channel_7 controlPort=Cport_0 componentSpacing=9000;

6) Connectivity statements
- CHANNEL ... from ... to ...
- CONNECTION ... from ... to ...

Examples:
CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CONNECTION c1 from p1 1 to ma1 1;

7) Common parameters
- componentSpacing
- connectionSpacing
- channelWidth
- portRadius

8) LFR -> MINT intuition
- assign out = in1 + in2      often maps to mixer + channels
- distribute@(control)         often maps to valves + control channels
- storage declarations          often map to chambers/traps

9) Useful commands
poetry run fluigi compile_mint -o <out_dir> <design.mint>
poetry run fluigi compile_lfr  -o <out_dir> <design.lfr>
```

## Developer entry points

<!-- source: DEVELOPER_ENTRY_POINTS.txt -->

```text
Neptune 2026 - Developer Entry Points

Purpose:
This note helps future developers quickly locate where to edit language behavior,
compiler behavior, and package-level data models.

1) LFR language behavior
- Parser grammar: Neptune_2026/pylfr/lfrX.g4
- Preprocessing/import rules: Neptune_2026/pylfr/lfr/preprocessor.py
- Compiler entry API: Neptune_2026/pylfr/lfr/api.py
- Human-readable syntax spec: Neptune_2026/docs/LFR_READABLE_SYNTAX_SPEC_V2.md
- GUI References page: NeptuneGUI_2026/src/views/dashboard/References.vue
  (links the V2 spec and LFR-TestCases-wiki sections used by prompt packs)

2) MINT language behavior
- pyMINT implementation: Neptune_2026/pylfr/pymint/
- Common reference manual: Neptune_2026/docs/LFR_MINT_LANGUAGE_MANUAL.md

3) Neptune 2026 wiki mirrors (current behavior)
- LFR wiki: Neptune_2026/docs/LFR-TestCases-wiki/
- MINT wiki: Neptune_2026/docs/MINT-TestCases-wiki/
- Companion pages:
  - Neptune_2026/docs/LFR-TestCases-wiki/Neptune-2026-Companion.md
  - Neptune_2026/docs/MINT-TestCases-wiki/Neptune-2026-Companion.md

4) Package documentation
- parchmint docs: https://parchmint.readthedocs.io/en/latest/
- pymint docs: https://pymint.readthedocs.io/en/latest/

5) Where to start when changing functionality
- Syntax parse errors:
  start with lfrX.g4 (LFR) or pymint parser modules.
- Import resolution issues:
  start with pylfr/lfr/preprocessor.py.
- LFR-to-netlist behavior:
  start with pylfr/lfr/netlistgenerator/.
- MINT object model/serialization:
  start with pylfr/pymint/ and pyparchmint modules.
```

## Start here

<!-- source: START_HERE.md -->

```text
# Neptune Prompt Package — Start Here

Use this package with **your own LLM account** (ChatGPT, Claude, Gemini, Qwen, DeepSeek, etc.).
Neptune does **not** need your API key for this workflow.

## What you do (no file editing required)

1. Pick **one** provider folder (`openai`, `anthropic`, `google_gemini`, `alibaba_qwen`, or `deepseek`).
2. Upload / load the package into your LLM (see provider tips below).
3. Set **`en2lfr_system.txt`** (or the English→LFR section of the `.md` pack) as the assistant / custom / system instructions.
4. Start a chat and **write your design requirement in plain English** — that is all.
5. Copy the generated ` ```lfr ` block into Neptune Editor and compile.

You do **not** need to open `en2lfr_user_template.txt` or replace `{{ENGLISH_SPEC}}`.
Those files are **optional examples only**.

## Export formats (Neptune GUI)

| Providers | GUI download | Why |
|-----------|--------------|-----|
| **ChatGPT, Claude, Gemini** | `.zip` prompt package | Those products accept zip / multi-file knowledge uploads |
| **Qwen, DeepSeek** | single `.md` prompt package | Their chat UIs do **not** accept `.zip` uploads |

The Markdown pack for Qwen/DeepSeek contains the same content (system prompts, examples, syntax manuals) in one file.

## English requirement → LFR (main workflow)

In chat, describe your device in English, for example:

```text
I need a module with fluid inputs a and b, control sel, and output y.
When sel is 0, route a to y; when sel is 1, route b to y.
```

The model should return **one** fenced LFR block and nothing else.

## LFR → English explanation (optional)

1. Set **`lfr2en_system.txt`** as instructions (or start a new chat with it).
2. Paste your **full LFR source** directly in the message.
3. You do **not** need to edit `lfr2en_user_template.txt`.

## What to upload (recommended minimum)

Per provider folder (or inside the `.md` pack for Qwen/DeepSeek):

- `en2lfr_system.txt` — **required** (instructions)
- `lfr2en_system.txt` — optional (explain LFR back to English)

Shared reference files (help quality, not required):

- `LFR_SYNTAX_MANUAL.txt`
- `MINT_SYNTAX_MANUAL.txt`

## Provider upload tips

| Provider | Typical setup |
|----------|----------------|
| **ChatGPT** | Export `.zip`; Custom GPT or Project: paste `en2lfr_system.txt` into Instructions; upload manuals to Knowledge if supported |
| **Claude** | Export `.zip`; Project: Custom Instructions = `en2lfr_system.txt`; add manuals as project files |
| **Gemini** | Export `.zip`; Gem or system instruction field: paste `en2lfr_system.txt` |
| **Qwen / DashScope** | Export **`.md`** (not zip); upload the file or paste the English→LFR system section into the system prompt |
| **DeepSeek** | Export **`.md`** (not zip); upload the file or paste the English→LFR system section into the system prompt |

Then chat normally — **your message is the requirement**.

## Files you can ignore

- `en2lfr_user_template.txt` / `lfr2en_user_template.txt` — example phrasing only
- `manifest.json` — for developers integrating APIs (env var names, default model)
- `MAINTENANCE.md` — for Neptune maintainers

## After generation

1. Open Neptune GUI → **Editor**
2. Paste LFR, set language to **LFR**, **Save**, **Compile**
3. If compile fails, paste the error back into the same chat and ask for a fixed LFR

## Security

- Do not commit API keys to git.
- Billing is on **your** LLM provider account (BYOK).
```

## User guide

<!-- source: USER_GUIDE.md -->

```text
# Neptune Prompt Package — User Guide

Use this package with **your own LLM account** (ChatGPT, Claude, Gemini, Qwen, DeepSeek).
Neptune does **not** host or require your API key for this workflow.

See **`START_HERE.md`** for the shortest path. This guide adds detail.

## 1. What the package contains

Five provider folders (`openai`, `anthropic`, `google_gemini`, `alibaba_qwen`, `deepseek`). Each includes:

| File | Purpose |
|------|---------|
| `en2lfr_system.txt` | **Required** — paste into system / custom instructions |
| `lfr2en_system.txt` | Optional — explain LFR back to English |
| `en2lfr_user_template.txt` | **Example only** — do not edit to use the package |
| `lfr2en_user_template.txt` | **Example only** — do not edit to use the package |
| `README.txt` | Short setup reminder for that provider |
| `manifest.json` | For developers (env var names, default model) |

Shared reference (optional, improves quality):

- `LFR_SYNTAX_MANUAL.txt`
- `MINT_SYNTAX_MANUAL.txt`
- `DEVELOPER_ENTRY_POINTS.txt`

## 2. Download format from Neptune GUI

| Model | Export button | File you get |
|-------|---------------|--------------|
| Claude, GPT, Gemini | **Export prompt package (.zip)** | `<provider>-neptune-prompts.zip` |
| **Qwen, DeepSeek** | **Export prompt package (.md)** | `<provider>-neptune-prompts.md` |

**Qwen and DeepSeek do not use zip.** Their chat products typically cannot upload `.zip` archives, so Neptune ships their pack as one Markdown file that embeds the same prompts and manuals.

## 3. One-time setup

1. In Neptune GUI → **Editor** → **LLM prompts**, pick your model and export the pack (`.zip` or `.md` as above).
2. Load the pack into that LLM:
   - **Zip providers:** unzip if needed; paste `en2lfr_system.txt` into system / custom instructions; optionally upload manuals.
   - **Qwen / DeepSeek:** upload the `.md` file if allowed, or open it and paste the **English → LFR** system section into the system prompt.
3. You do **not** need to edit any template file or replace placeholders like `{{ENGLISH_SPEC}}`.

## 4. Daily use — English → LFR

1. Open a chat with the configured assistant.
2. Write your **design requirement in plain English** in the message.
3. The model returns **one** ` ```lfr ` fenced block.
4. Copy that block into Neptune GUI → **Editor** → set language **LFR** → **Save** → **Compile**.

Example message:

```text
I need a module with fluid inputs a and b, control sel, and output y.
When sel is 0, route a to y; when sel is 1, route b to y.
```

If compile fails, paste the compiler error into the same chat and ask for a corrected LFR block.

## 5. Optional — LFR → English

1. Use **`lfr2en_system.txt`** as instructions (new chat or swap instructions).
2. Paste your **full LFR source** directly in the message.
3. You do **not** need to edit `lfr2en_user_template.txt`.

## 6. Provider-specific setup

| Provider | Export | Where to paste `en2lfr_system` |
|----------|--------|--------------------------------|
| **ChatGPT** | `.zip` | Custom GPT or Project → Instructions |
| **Claude** | `.zip` | Project → Custom Instructions |
| **Gemini** | `.zip` | Gem or system instruction field |
| **Qwen** | **`.md`** | Chat or DashScope API system prompt |
| **DeepSeek** | **`.md`** | Chat or API system prompt |

Billing and API keys are on **your** provider account (BYOK). Neptune only ships the prompt text.

## 7. Token cost (if using API)

Most providers charge by token (input + output). Typical drivers of cost:

- Length of your English requirement and any follow-up fixes
- Size of attached syntax manuals
- Model tier you choose

Check your provider's pricing page for current rates.

## 8. Security

- Do not commit API keys to git or share them in screenshots.
- Rotate keys if you suspect leakage.
- The prompt package contains **no** secrets — only instructions and reference text.

## 9. FAQ

**Do I edit `en2lfr_user_template.txt`?**  
No. Write your requirement directly in chat.

**The model asked me to fill in `{{ENGLISH_SPEC}}`.**  
Re-paste `en2lfr_system.txt` (or the English→LFR section of the `.md` pack) into instructions; it tells the model to treat your chat message as the spec.

**Why is Qwen/DeepSeek a `.md` instead of `.zip`?**  
Those chat UIs do not support zip uploads. The Markdown file is the full package in one uploadable/copyable file.

**Can I use a different model than the folder name?**  
Yes. Pick any folder whose system prompt fits your UI; core LFR rules are aligned across all five.

**Where is Neptune's in-app API key UI?**  
This open-source GUI exports the pack for external LLM use. There is no built-in key field — upload the pack to your LLM instead.
```
