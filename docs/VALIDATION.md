# Validation record

## Repository and deployment folders (2026-10-03)

The repository folder and local deployment folder are `mouse-cursor-ps5-xbox`.
`tools/deploy.ps1` now configures the folder separately from the metadata ID,
`MouseCursorPs5Xbox`. README and deployment paths in the documentation use the
new folder name. Canonical version remains **14**: runtime code, manifests,
assets, controls, preferences and load order are unchanged. Existing boolean
`DEBUG_LOGS=false` and `DEBUG_INPUT=false` are unchanged; no runtime logs were added.

- `luac -p` passed for all **17 payload/test Lua files**, PowerShell parsing passed,
  and the host suites passed **84 behavior + 56 settings/motion checks**.
- Two consecutive deployments verified all **12 payload files** by SHA-256 in
  `%APPDATA%/Surviving Mars Relaunched/Mods/mouse-cursor-ps5-xbox`, including
  ownership validation on redeployment. No files were deleted; neither the old
  repository-named folder nor the ID-named folder exists in local Mods.
- Inspected the installed `CommonLua/Modding/Mod.lua` read-only: `ModsReloadDefs`
  reads metadata from each folder and derives mounted content paths from `def.id`.
  The folder name therefore does not require a new game identity.
- Reviewed `Mars.exe-20261003-19.33.49-6aad2d75.log` and
  `MarsDebug.exe-20261003-19.34.30-6aad2de6-GED-GedModManager-47740.log` before
  deployment. The retail log lists the v14 definition; neither log certifies
  cursor gameplay after this folder change. Logs were retained.
- Protected/game sources, original assets, instruction files and generated
  historical evidence in `tests/results/` were not edited. Old names in that
  evidence remain historical. No native-engine or console test was run.

Manual check: restart the game, enable Mouse Cursor PS5 Xbox, open its Controls
settings, then toggle mouse mode on and off and confirm controls are restored.

## Version 14: name and prefix (2026-10-03)

Renamed the mod to **Mouse Cursor PS5 Xbox**, its mod ID to
`MouseCursorPs5Xbox`, the entry file to `Code/MouseCursorPs5Xbox.lua`, supporting
files/assets to `mcpx_`, and runtime classes, UI IDs and test-report globals to
`MCPX`. Metadata and editor manifests retain the same eight-module load order.
The GitHub repository is `facazevedo/SMR-mouse-cursor-ps5-xbox`.

- `luac -p` passed for all **17 payload and test Lua files**. The existing host
  suites passed **84 behavior + 56 settings/motion checks**, covering manifest
  ordering, input, cursor movement, exact-boolean logs and vanilla restoration.
  The PowerShell deployment script and Python asset tool also passed parsing.
- All 15 code/test files were compared with their previous committed contents:
  only the requested name and prefix substitutions changed. The SVG and PNG
  cursor files were renamed with byte-for-byte identical content. The test
  preview, instruction files, ignore rules and preview documentation are unchanged.
- The existing local installation matched all 12 source-file hashes before
  migration. Its folder and affected files were renamed without deletion; all
  **12 updated payload files** were deployed and SHA-256 verified under
  `%APPDATA%/Surviving Mars Relaunched/Mods/mouse-cursor-ps5-xbox`.
- `DEBUG_LOGS=false` and `DEBUG_INPUT=false` remain explicit booleans. No new
  runtime log operations were added; the log prefix now uses the new mod name.
- Read-only `CommonLua/Modding/Mod.lua` in the installed ModTools sources confirms
  that mounted content paths, enabled-mod selections and persistent preferences
  are keyed by mod ID. This is intentionally a new identity: enable it in-game
  and reconfigure preferences; existing saves may still refer to the prior ID.
- Reviewed `MarsDebug.exe-20261003-19.08.09-6aad2de6.log`: it loaded the preceding
  v13 identity and records unrelated whale-import `svn info` process errors.
  It is not runtime evidence for v14. Logs were retained; game, generated,
  third-party and harness source files were not edited.
- No v14 native-engine, console-hardware, save/reload or store-upload test was
  run. Restart the game, enable the new identity, open Options > Controls >
  Mouse Cursor PS5 Xbox, configure/apply preferences, hold/release LS for boost,
  toggle twice, and check disable/re-enable plus save/reload restoration. Inspect
  the fresh game log for load failures or Lua errors.

Names and source paths in older sections below use the current naming. Their
test counts, dates and runtime claims apply only to the stated historical versions.

## Version 11: native size and full square travel

Restored standard option sizes, removed permanent preview text, centered the
square in the right half and fixed position margins reducing cursor travel.
Passed 35 native settings and 25 entry checks, including all four corners,
native-size comparison, square centering and 15 visible rows. Syntax and 129
host checks passed. See [settings validation](SETTINGS.md) for evidence and limits.

## Version 10: all settings beside a square preview

All 15 settings fit in the left column without scrolling or an Advanced page.
A large 1:1 preview occupies the right side. Native checks passed for square
geometry, full row visibility, D-pad navigation, stick isolation and restoring
the Options container on exit: 27 settings and 25 entry checks. Syntax and all
129 host checks passed. See [settings validation](SETTINGS.md) for the screenshot,
read-only game references, logs, deployment and remaining manual checks.

## Version 9: immediate preview movement

The basic settings page now reserves the left stick for the test-area cursor
without a separate Test cursor action; the D-pad edits settings and Advanced
retains native stick navigation. Simulated-controller native settings and
Controls-entry suites each passed 24 checks. Syntax and 129 host checks passed;
see [settings validation](SETTINGS.md) for runtime evidence and manual checks.

## Version 8: Controls entry alignment

The Mouse Cursor PS5 Xbox entry now aligns with vanilla Controls labels on the
first visit and during hover/focus. A fresh debug-game run passed all 24 native
entry checks; see [settings validation](SETTINGS.md) for the screenshot, startup
crash evidence and manual console check.

## Version 7: settings text alignment

The settings action rows, instructions, preview area and status share the slider
label column immediately on opening and during hover/focus. Native geometry and
visual checks are recorded in [settings validation](SETTINGS.md).

## Version 6: native Options layout

Cursor settings now retain the native Options shell, animated background,
breadcrumb and footer. Syntax, 129 host checks and 43 native UI/settings checks
passed; basic and scrolling Advanced pages were visually reviewed in the Windows
engine. See [settings validation](SETTINGS.md) for evidence and manual checks.

## Version 5: Controls-only settings

Removed the duplicate general Mod Options registration. The private Controls
page keeps all 15 properties and existing storage; see [settings validation](SETTINGS.md).

## Version 4: Controls menu entry

Options > Controls now contains Mouse Cursor PS5 Xbox as its first row. See
[settings validation](SETTINGS.md) for the menu-visibility fix, 136 host checks,
39 native menu/settings checks, deployment and remaining manual checks.

## Version 3: settings and cursor tuning

See [settings validation](SETTINGS.md) for 120 passing host checks, 49 passing
native checks, visual review, persistence boundaries, source references and
remaining console tests. [Publishing validation](PUBLISHING.md) records the
final eleven-file native package and hash comparison.

## Version 2: trigger boost and menus

2026-09-27: added hold-L2/LT cursor acceleration (250%, configurable), with
current controller state polled every frame. Release restores normal speed even
if a button-up event is missed; disabling boost or exiting mouse mode clears the
boost state. Trigger names and their threshold come from the shipped
`CommonLua/UI/xinput.lua` (`AnalogsAsButtons`, `GetButtonTreshold`,
`IsCtrlButtonPressed`). No new engine API was invented or required.

Removed the colony-only activation gate. R3 now toggles mouse mode at the native
first main menu (Tutorial / New Game / Load Game) and in setup screens. Mouse
mode remains active through new-game, load-game, map-change and return-to-menu
messages; those transitions release held clicks and cancel wheel repeats.
Focus loss, controller disconnection, explicit toggle-off and unloading still
restore previous controls. Loading screens retain the engine's input/visibility
restrictions. No saved preference or save-data schema was added.

Changed the configuration, cursor movement, input eligibility, lifecycle and
message wiring, metadata, README and tests. Metadata version is now **2**;
`items.lua` and the explicit load order are unchanged. `DEBUG_LOGS` and
`DEBUG_INPUT` remain boolean `false` by default; boost start/stop logs require
both flags to be exactly `true`. Transition logs use `DEBUG_LOGS`.

Validation: Lua 5.4 syntax checks passed for all payload and test Lua files;
**79 host assertions** passed, including exact 2.5x movement, release, dead zone,
boost disable, multiplier/binding validation, held-trigger cleanup and mode
retention across screen-transition messages. **21 native Windows engine checks**
passed on revision 405907, including the real first main menu with no colony
eligibility stub, acceleration/release in the live cursor loop, and native UI
mouse dispatch. Only controller state is simulated in that native suite.

Read and retained the previous `MarsDebug.exe-20260927-08.06.21-6aad2de6.log`
and fresh `MarsDebug.exe-20260927-08.22.54-6aad2de6.log`, plus launch log
`daemon-20260927-122254.log`; the fresh game log contains no `[LUA ERROR]` or
`Assertion failed` matches. The first native input probe after loading reported
a hidden cursor; a subsequent probe after the menu settled passed the same
visibility check and recorded the native cursor image and visibility reasons.
That failed probe is retained as `tests/results/native-input-v2.json`; the final
passing report is `tests/results/native-input-v2-final.json`. Console rendering
and physical input remain unverified; these results do not certify every screen
transition or an actual save/load/new-colony sequence.

The eight-file local payload was syntax-checked and deployed with hash
verification. Protected/game/third-party sources and local instruction files
were not edited. As requested, `AGENTS.md` and `CLAUDE.md` are now ignored and
removed from Git's current tree, with local copies preserved. Earlier commits
are not rewritten. No logs were deleted. Manual checks, including trigger boost
and the first main menu, are listed in the README.

## Version 1 evidence

Initial implementation, metadata version 1, 2026-09-27.

## Project discovery

The starting folder contained only `AGENTS.md` and `CLAUDE.md`; it had no mod code
or Git repository. Both instruction files were read and left unchanged. A local
Git repository was initialized for the required initial version commit.

Display name: Mouse Cursor PS5 Xbox. Main file: `Code/MouseCursorPs5Xbox.lua`.
Prefix: `mcpx_`. Canonical version: `metadata.lua` (`version = 1`). Payload source:
the eight explicitly selected files at project root and `Code/`. Local target:
`%APPDATA%/Surviving Mars Relaunched/Mods/mouse-cursor-ps5-xbox`. Logs:
`%APPDATA%/Surviving Mars Relaunched/logs`. No vendored or third-party code is
part of the payload. Game installation and neighboring projects are reference
material, not editable mod source.

## Shipped engine references

Read-only inspection of `C:/Games/Surviving Mars Relaunched/ModTools/Src` confirmed:

| Source | Evidence used |
| --- | --- |
| `CommonLua/X/MouseViaGamepad.lua` | Software XImage cursor, gamepad dynamic position modifier, paired mouse events and position updates |
| `Lua/UI/MarsGamepad.lua` | Active mouse-position wrapper, UI-style handling, camera lock counts; the large older Mars virtual-cursor implementation is commented out and was not treated as callable |
| `CommonLua/Core/terminal.lua` | TerminalTarget registration, priority dispatch, mouse event metadata, mouse-move final-event flag, repeat handling |
| `CommonLua/UI/xinput.lua` | Normalized console button names, LeftThumb state, disconnect message and controller APIs |
| `CommonLua/gamelib.lua`, `CommonLua/Core/options.lua` | Transient UI-style change distinct from persisted account options |
| `CommonLua/X/XDesktop.lua`, `CommonLua/Core/mouse.lua` | Mouse routing, cursor-image messages, visibility reasons and focus-loss message |
| `CommonLua/X/XRollover.lua` | Console disconnected-mouse rollover suspension and resume APIs |
| `CommonLua/X/XWindow.lua` | Window lifecycle and managed thread cleanup |
| `Lua/UI/GamepadCursor.lua`, `Lua/Config/camera.lua` | Native gamepad cursor and camera ownership conventions |
| `Data/XDef/GameShortcuts.lua` | R3's existing pause binding and Escape menu shortcut |
| `CommonLua/Core/map.lua`, `CommonLua/Modding/Mod.lua` | Map transitions, mod sandbox, metadata loading, reload/unload messages; unpacked console mods are not supported |
| ModTools sample `Shadowed Solar Panels` | ModDef and ModItemCode manifest format |

Game API usage follows these sources; no game installation, third-party source,
or existing instruction file was edited. No asset was replaced or generated.

## Executed checks

- Lua 5.4.6 `luac -p` on every payload Lua file and test helper.
- Host suite: **55 behavioral assertions passed**, including manifest ordering,
  movement/dead zone, independent sticks, click pairing/doubles, wheel repeats,
  held-input quarantine, conflicting bindings, missing APIs, other-controller
  isolation, disabled flag, exact boolean logging, and restoration.
- Actual Windows `MarsDebug.exe`, Lua revision **405907**, loaded this mod with
  `ModsLoadCodeErrorsMessage=false`, an input target registered, and runtime
  API validation passing. Existing SuperBigMap remained in the test loadout;
  no external mod source was edited.
- Native integration suite: **17 checks passed** with actual game UI classes,
  terminal dispatch, threads and gamepad-to-keyboard-to-gamepad style transitions.
  Only controller state and colony eligibility were simulated within this mod's
  environment. Checks include software-cursor creation, left-stick-only movement,
  matching queried/drawn cursor positions, native UI clicks/double clicks/wheel,
  held-click release on toggle, camera counter restoration, disconnect, shutdown
  and reinstallation. No physical controller was attached.
- A native test exposed a one-frame hardware mouse-warp lag. The scoped query
  override fixes that difference; the subsequent native test reported matching
  software, queried and drawing coordinates.
- Deployment copied and SHA-256 verified all **8 payload files**. The deploy
  script excludes docs, tests, tooling, instructions and Git files. No deletion.
- Native diagnostics found no crash or active native assertion incident.

Native reports are retained locally under `tests/results/` and ignored by Git.
The hidden-game screenshot captured a loading frame and is **not visual evidence
of cursor rendering**. Visibility and native cursor-image properties were tested;
appearance must still be checked on a rendered colony and console hardware.

## Logs and test limitations

Read the previous `MarsDebug.exe-20260927-07.53.59-6aad2de6.log`: it contains existing
shader-cache errors and ends with an orderly shutdown. There was no pre-existing
Mouse Cursor PS5 Xbox code to diagnose.

Read the fresh `MarsDebug.exe-20260927-08.06.21-6aad2de6.log` and the harness launch
log `daemon-20260927-120621.log`. Early versions of **test helpers**, not payload
code, emitted new-global assertions and an invalid `AsyncStringToFile` call due
to misreading the JSON encoder's return values. The helpers were corrected to
register diagnostic globals explicitly and return reports through the harness.
Those original log entries are preserved, not counted as successful validation.
The corrected final native integration run passed without a new payload error.
No game logs were deleted; no automatic deletion workflow is configured.

No console execution, physical controller input, rendered-colony visual review,
construction/unit selection, camera zoom, dragging real game controls, or actual
save/reload gameplay has been certified. Message-driven restoration was covered
by host checks, not a complete console lifecycle. The README lists the remaining
manual acceptance steps. Nothing has been uploaded to a mod store.
