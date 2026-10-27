---
game: rocket-science
version: "0.23.4"
type: update
name: 'Ascended Assembly'
release_date: 2024-12-27
lang: en
title: 'v0.23.4 "Ascended Assembly" Release Notes'
permalink: /en/games/rocket-science/releases/v0.23.4/
---

**PREVIOUS SAVES ARE NOT COMPATIBLE WITH THIS VERSION OF THE GAME.**

If you want to continue plaing your save or you have problems with this update, please switch to v0.22.x branch.

**Spacecrafts in mods are not compatible with this version of the game. You need to remade them and republish your mod.**

### Features:

- added dynamic attachments for almost all rocket parts;
- implemented radial and linear snapping for dynamic attachments;
- added transonic / supersonic drag calculations;
- added reaching transonic / supersonic speed effects;
- added support for multiple launch sites;
- added rewards and unlocks system;
- added Baikonur launchpad (unlocked after completing Land on Moon contract);
- surface objects mod now support launch facilities;
- added WASD camera movement to the Assembly shop;
- you can recover vessels and debris from the surface of Earth.

### New rocket parts:

- "Hose" Longitudinal Decoupler
- FT "Cubatic" О

### New content:

- added tutorial explaining dynamic attachments system.

### Part changes:

- all part variants with side attachments are gone;
- removed line socket (as it no longer needed);
- F now sets the part pivot point to the next available attachment instead of just flipping the part;
- all cube and hexagon structures were decreased in size;
- payload fairings now can be attached to the side of fuel tank;
- changed longitude sockets on most reaction wheels, making them correspond to its size;
- "Rumble" Decoupler no longer consist from two parts and can be attached directly to the side;
- changed or reworked shape (or size) and basic properties for many parts, mostly in “structures” category.

### Changes:

- physics representation of rocket now loads synchronously;
- you can attach up to 65536 parts to another part (previously was 256);
- reduced amount of snapping during rocket assembly;
- improved color outlines highlighting during assembly;
- adjusted all tutorials because of dynamic attachments;
- changed how fuel consumption works: now engines consume fuel evenly relative to total volume between all tanks;
- added additional tutorial steps into basic tutorial.
- reworked how force for payload fairings is calculated, now it only account for total payload fairing mass, not the rocket mass.

### Settings:

- [Assembly] hotkey for "select" mode is now E instead of S (because S used for moving camera).

### Fixes:

- countless bugs related to part async loading when making quick changes to rocket in assembly;
- planet generation stop working when CPU have only 2 cores;
- symmetry not working on top of rovers;
- crash when switching heat shield type on not attached part;
- [Assembly] sometimes selection switches to another part when you try to rotate current part;
- [Assembly] attachment detection is working worse when the rocket is in the vertical orientation;
- [Assembly] game is broken when detaching engines when symmetry is enabled and then undo this action;
- exception when trying to save modified heightmap first time in the surface mod;
- engine flames sometimes slightly offset relative to combustion chamber;
- removed loud car honking from assembly ambient sounds;
- game loading stuck when mods with unsupported rockets is enabled.

### Known issues:

- facilities doesn’t properly save and update when created for the first time;
- facilities offset doesn’t match launch coordinates.
