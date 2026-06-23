# Pokerleven — AGENTS.md

## Mod info

- Balatro overhaul mod (Inazuma Eleven theme).
- **Dependencies**: Steamodded (>=1.0.0~BETA-0711a) + Lovely (>=0.6).
- **Mod ID / prefix**: `Pokerleven` / `ina`.
- **Entrypoint**: `Pokerleven.lua` — loads helpers, sprites, UI, then all content dirs.
- **Lua runtime**: LuaJIT. Linted via `.luacheckrc` (ignore codes: 111, 113, 212, 121, 421, 432).

## Content loading convention

Each content directory (managers, blinds, consumables, etc.) contains files that return `{ list = {} }` — the entrypoint iterates them and calls the corresponding `SMODS.*` constructor. **Adding a new file to any content dir automatically registers it.**

Exception: `players/` is split into season subdirectories (`players/IE1/`, `players/IE2/`, `players/IE9/`). The entrypoint's `load_joker_folder()` recurses automatically into subdirectories.

## Player definitions (`players/IE1/`, `players/IE2/`, `players/IE9/`)

Player files use the `J()` helper (from `helpers/smods_helper.lua`) for type hints — this is just an identity function, **not** an SMODS constructor. Same pattern for blinds (`B()`), vouchers (`V()`), poker hands (`P()`), challenges (`Ch()`), tags (`T()`), backs (`Ba()`).

Key properties on player jokers (set in the table passed to `J()`):
- `ptype` — element: `"Wind"` | `"Fire"` | `"Forest"` | `"Mountain"`
- `pposition` — position: `"FW"` | `"MF"` | `"DF"` | `"GK"`
- `pteam` — team name (e.g. `"Raimon"`, `"Zeus"`, etc.)
- `techtype` — `C.UPGRADES.Plus` | `C.UPGRADES.Number` | `C.UPGRADES.Grade`

## Localization files (`localization/`)

Each locale (`en-us`, `es_419`, `es_ES`) is split into 4 sub-files in its own subdirectory:
- **`Blind.lua`** — returns `{ Blind = { bl_ina_* = ... } }`
- **`Joker.lua`** — returns `{ Joker = { j_ina_* = ... } }`
- **`Descriptions.lua`** — returns all other `descriptions` sections (Back, Strat, Training, Edition, Enhanced, Other, Planet, Spectral, Stake, Tag, Tarot, Voucher)
- **`Misc.lua`** — returns `{ misc = { ... } }`

The main locale file (e.g. `en-us.lua`) is a one-liner that returns the pre-assembled table from `Pokerleven.locales["en-us"]`. Sub-file loading happens in the entrypoint (`Pokerleven.lua`) where `SMODS.current_mod` is available — because `SMODS.load_file` needs it, and locale files are loaded via `inject_class` where `SMODS.current_mod` is nil.

## Lovely patches (`lovely/`)

TOML patches that modify Balatro source at runtime. Priority values matter:
- `lovely.toml`: priority 1000 (core gameplay patches)
- `ui.toml`, `blinds.toml`, `challenges.toml`: priority 3
- `zones.toml`: priority 0
- `multiplayer.toml`: priority 2147483600, requires `Multiplayer`

`dump_lua = true` in all manifests — decompiled source is written to `lovely/dump/` for debugging.

## Debugging

- `sendDebugMessage("...")` — prints to Balatro console.
- `LeakScope.snap("label")` — memory/event/card leak tracker (prints to console).
- `ina_` prefix on all custom content keys; look in localization files when adding new keys.
- VS Code workspace uses custom Lua workspace library paths pointing to Steamodded SDK and Balatro source.

## Config

`config.lua` is persisted via `NFS.write()` when toggles change. Some toggles require restart (`winners_jokers`, `oc_jokers`), others are live (`custom_middle_blinds`, `middle_blinds_abilities`).

## Architecture quirks

- Custom card areas: `ina_manager_area`, `ina_bench_area`, `ina_scry_view` (all created in `helpers/zones_helper.lua` during `Game:start_run`).
- Managers are jokers with `ability.extra.special == "Manager"` — they live in the manager area, not `G.jokers`.
- Bench is a 3-slot swap area for jokers.
- Element/position stickers are applied via `apply_property_sticker`.
- Helper files under `helpers/` are auto-loaded, so **new helpers need a file, not a require**.

## No tests, no build

No test framework, no CI, no bundler. Install by extracting to Balatro's `mods/` folder. Verification is manual (run the game).
