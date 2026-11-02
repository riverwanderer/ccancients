# Commands & Colors: Ancients – VASSAL module, version 4 line

Archive of every v4 build of the C&C Ancients VASSAL module that could be found (VASSAL module library and Mark Benson's own machine), as the basis for 4.4 development.

## How the archive is organised
- **Git history**: one commit per module version, dated by the module's own *dateSaved*. Each commit holds the module's text: `module/buildFile.xml`, `module/moduledata` and `module/MANIFEST.txt` (every file in the .vmod with its size and CRC32, so image and predefined-setup changes show up in diffs too). The .vmod files are too big for git (100 MB limit).
- **Tags**: one per version (`v4.3.34`, …). Compare any two with `git diff v4.3.33 v4.3.34 -- module/buildFile.xml`.
- **Releases**: the original **.vmod** for each tag is attached to the release of the same name (byte-for-byte copies; md5 in the commit message). Tags and releases are created by `tools/make_releases.sh` (run on the Mac; it checks every file's md5 before upload).
- **Branches**
  - `main`: published releases in order.
  - `v4.4-beta`: 4.4.0beta (Aug 2025, from 4.3.30) and 4.4.0beta2 (Jul 2026), the single Draw & End button line.
  - `v4.4`: the new 4.4 line rebuilt on 4.3.34 (4.4.0a01 onwards).
  - Development snapshots and variants are tags on side commits off the release they followed.
- `docs/`: the v4 change log (latest, from 4.3.34), the 4.1 change list and the 4.1f2 release notes.

## Versions
| Tag | moduledata version | Saved | VASSAL | Kind | .vmod | Size | Source |
|---|---|---|---|---|---|---|---|
| `v4.0` | 4.1 | 2018-12-13 | 3.2.17 | release | [CCAncientsV4.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.0) | 34 MB | VASSAL library (listed as 4.0; moduledata says 4.1) |
| `v4.1` | 4.1 | 2019-03-06 | 3.2.17 | release | [CCAncientsV41.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.1) | 48 MB | VASSAL library |
| `v4.1-resaved-3.4.0b1` | 4.1 | 2020-08-26 | 3.4.0-beta1 | dev / variant | [CCAncientsV41-resaved-3.4.0b1.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.1-resaved-3.4.0b1) | 48 MB | Mac: Documents – old/Vassal Modules |
| `v4.1f1` | 4.1f1 | 2020-10-20 | 3.4.6 | release | [CCAncientsV41f1.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.1f1) | 48 MB | VASSAL library (same file in Mac: Vassal Modules) |
| `v4.1f1-lockdown` | 4.1f1 | 2020-10-20 | 3.4.6 | dev / variant | [CCAncientsV41f1-lockdown.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.1f1-lockdown) | 48 MB | Mac iCloud: Vassal Logs/CCA Lockdown Epics |
| `v4.2.6` | 4.2.6 | 2022-10-25 | 3.6.7 | release | [CCAncientsV4-2-6.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.2.6) | 209 MB | VASSAL library |
| `v4.3.12` | 4.3.12 | 2024-02-24 | 3.6.19 | release | [CCAncientsV4-3-12.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.12) | 238 MB | Mac: Vassal Modules |
| `v4.3.14a03-auto-side-test` | 4.3.14a03root12 | 2024-03-27 | 3.7.9 | dev / variant | [CCAncientsV4-3-14a03-AUTO-SIDE-TEST.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.14a03-auto-side-test) | 242 MB | Mac: Documents/Miscellaneous Unsorted (file named 4-3-13 AUTO SIDE TEST) |
| `v4.3.17a001` | 4.3.17a001 | 2024-06-28 | 3.7.12 | dev / variant | (buildFile only) | – | Mac: Documents/C&C Ancients/CCAncientsV4-3-17 (unpacked folder; buildFile and moduledata only) |
| `v4.3.22` | 4.3.22 | 2024-08-12 | 3.7.13 | release | [CCAncientsV4-3-22.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.22) | 119 MB | VASSAL library |
| `v4.3.23` | 4.3.23 | 2025-01-22 | 3.7.15 | release | [CCAncientsV4-3-23.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.23) | 109 MB | VASSAL library |
| `v4.3.24` | 4.3.24 | 2025-01-22 | 3.7.15 | release | [CCAncientsV4-3-24.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.24) | 120 MB | VASSAL library |
| `v4.3.25` | 4.3.25 | 2025-03-06 | 3.7.15 | release | [CCAncientsV4-3-25.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.25) | 121 MB | VASSAL library |
| `v4.3.26` | 4.3.26 | 2025-03-12 | 3.7.15 | release | [CCAncientsV4-3-26.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.26) | 121 MB | VASSAL library |
| `v4.3.27` | 4.3.27 | 2025-05-02 | 3.7.16 | release | [CCAncientsV4-3-27.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.27) | 121 MB | VASSAL library |
| `v4.3.28` | 4.3.28 | 2025-05-18 | 3.7.16 | release | [CCAncientsV4-3-28.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.28) | 121 MB | VASSAL library |
| `v4.3.29` | 4.3.29 | 2025-05-21 | 3.7.16 | release | [CCAncientsV4-3-29.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.29) | 121 MB | VASSAL library (same file on Mac iCloud) |
| `v4.3.30` | 4.3.30 | 2025-08-03 | 3.7.16 | release | [CCAncientsV4-3-30.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.30) | 121 MB | VASSAL library (same file in Mac Downloads and Desktop) |
| `v4.3.31beta` | 4.3.31beta | 2025-08-21 | 3.7.16 | dev / variant | [CCAncientsV4-3-31beta.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.31beta) | 115 MB | Mac: Documents/Miscellaneous Unsorted (file named 4-3-31 OLD) |
| `v4.4.0beta` | 4.4.0beta | 2025-08-22 | 3.7.16 | 4.4 dev branch | [CCAncientsV4-4-0beta.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.4.0beta) | 121 MB | Mac iCloud: Vassal Module Library (file named 4-4-0GOOD.zip) |
| `v4.3.31` | 4.3.31 | 2025-12-12 | 3.7.18 | release | [CCAncientsV4-3-31.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.31) | 121 MB | VASSAL library (same file on Mac iCloud) |
| `v4.3.32` | 4.3.32 | 2026-07-16 | 3.7.24 | release | [CCAncientsV4-3-32.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.32) | 129 MB | VASSAL library |
| `v4.4.0beta2` | 4.4.0beta2 | 2026-07-16 | 3.7.24 | 4.4 dev branch | [CCAncientsV4-4-0beta2.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.4.0beta2) | 122 MB | Mac: Desktop/Vassal Test Release Archive/C&C Ancients |
| `v4.3.33` | 4.3.33 | 2026-07-21 | 3.7.22 | release | [CCAncientsV4-3-33.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.33) | 135 MB | VASSAL library (same file on Mac iCloud) |
| `v4.3.34` | 4.3.34 | 2026-09-04 | 3.7.26 | release | [CCAncientsV4-3-34.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.3.34) | 135 MB | VASSAL library (same file on Mac iCloud) |
| `v4.4.0a01` | 4.4.0a01 | 2026-11-02 | 3.7.26 | 4.4 dev branch | [CCAncientsV4-4-0a01.vmod](https://github.com/riverwanderer/ccancients/releases/tag/v4.4.0a01) | 105 MB | Claude build, 2 Nov 2026 (4.3.34 + Scenario Options, setup cards, evade fix) |

## Gaps
Not found anywhere: 4.1f2, 4.2.0–4.2.5, 4.3.0–4.3.11, 4.3.13–4.3.21 (except the 4.3.14a03 and 4.3.17a001 dev builds). The VASSAL library keeps no older file revisions. Release announcements for several of these are on the VASSAL forum.

Not included (not v4 module builds): the pre-v4 modules (v3.x, CCA_Epic, Italian), `CCAncientsV41-Nap Conversion.vmod` (a CCN development module), and folders of predefined setups without a module (`CCAncientsV4-2-0a73-GOLD SCENARIOS`, `CCAncientsV4-2-0 PDS`).

## Credits
Module creator Bill Bennett; v4 Alessandro Crespi; v4.2+ Mark Benson. GMT Games holds the copyright to the game's images and materials, used with permission.
