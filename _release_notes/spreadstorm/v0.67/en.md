---
game: spreadstorm
version: "0.67"
type: patch
release_date: 2018-01-15
lang: en
title: 'v0.67 Release Notes'
permalink: /en/games/spreadstorm/releases/v0.67/
---

### Features:

- Incremental save game system implemented: it will be much easer to migrate the savegames in the future releases.
- Savegames format changed from text to binary: x2.5 faster load and save process.
- New reset system based on checkpoints: every level is resetable now.
- Timer signal behavior changed so it is more consistent and less annoying.
- 6 new levels extending tutorial section of the game.
- Rotating items above the upgrade node added: it is harder to miss them.

### Changes:

- Common node model changed to show it connections.
- Uncapturable nodes now more noticeable than earlier.
- Invert signal is more noticeable when turning on/off nodes.
- Only inverter and redirector nodes can be fortified now.
- Reset hint was moved to the second level, new hints at the start of the game added.
- Redirector node can not be turned in the same direction as it has already turned.
- If redirector has no available directions to turn to, it will not show Redirect action.
- Double redirector node has only one "Turn" action now.
- Fortify and Autohack actions consumes energy after operation completion.
- Added a little delay when moving through nodes with actions. Stopping on them will be easer now.
- Node actions opens with a delay - no more flickering when moving through nodes.
- Module acquisition action is called "Acquire" now instead of "Activate".
- Camera angle and height tweaked to get more satisfying results.
- Arrow now highlighted when signals moves through node groups, attached to them.

### Fixes:

- Base speed is correctly calculated when the game starts.
- Camera a bit smoother now.
- Performance improvement and less memory consumption on large scenes and on save/load game.
- Due to access issues to Documents folder on some computers, saves and setting was moved to the AppData folder.
- Multiple clicks on game save or continue button will not load multiple instances of world anymore.
- Modules button does not appear on first levels after exiting and reentering the game.
- Options now work not only in the main menu.
- Fixed issue where game stuck on loading save with the finished game.
- Fixed move sounds.
- Fixed some UI bugs in 1280x720 resolution.

## [Game Update] v0.67.4 - 24.01.2018

### Fixes:

- Fixed scroll in updates window.
- Main Menu closes immideatly after selecting save slot.
- Alive enemies resumes movement after loading level.
- All interactive UI closes on character lost.
- Fortitfication now works properly.
- Fixed different bugs with Protection Panel.
