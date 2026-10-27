---
game: rocket-science
version: "0.25.7"
type: update
name: 'Radiant Veil'
release_date: 2026-06-19
lang: en
title: 'v0.25.7 Release Notes'
permalink: /en/games/rocket-science/releases/v0.25.7/
---

### Features:

- added volumetric clouds;
- new ocean rendering;
- implemented buoyancy;
- new star rendering + all 119,613 stars from the HIG database are now rendered;
- new Milky Way rendering;
- updated atmosphere model;
- other celestial bodies now interact with atmospheres and cast reflected light;
- scaled-space planets received atmospheres;
- [Assembly] added a part offset tool;
- improved exposure and antialiasing;
- returned SSGI and made it available in the game settings;
- implemented RCS autostabilisation;
- added FOV slider for the flight camera.

### New rocket parts:

- "Traveler" Probe Core;
- Spherical Transfer Compartment;

### Changes:

- Updated game engine to Unity 6.0;
- the game now stores keymaps in settings.json instead of the registry and can fall back to default mappings when they are added in the future (previously, they remained empty);
- RCS now respects resource groups and does not consume monopropellant from the entire craft while ignoring the pass-resources state of docking ports and decouplers;
- enabling resource transfer on one docking port now automatically disables it on the attached docking port to prevent race conditions;
- [Assembly] part and symmetry selections no longer reset when switching between assembly modes;
- removed unnecessary custom passes that were previously used for rendering stars and distant planets;
- scaled-space and local-space atmosphere models were unified;
- the navball no longer switches out of the target state when the distance to the target exceeds 30 km and the flight state changes;
- when the main menu is open, most input actions are ignored;
- corrected thermal conductivity calculations by fixing mistakes in the formulas;
- part volumes, areas, and voxels are automatically calculated on startup, which should make importing custom parts easier;
- control settings are now saved in settings.json instead of the registry; this allows controls to be migrated in the future and keeps the registry clean;
- added a new part category — space stations;
- improved UI rendering performance when many icons or images are used.

### Part changes:

- adjusted the fuel volume of the FT-8000 Fuel Tank, FT-7990 Fuel Tank, and Side Fuel Block by approximately 5–10% to match part volume;
- deprecated the "Azimuth" and "Axis" Station Branching Modules;
- Docking Port 0: changed its shape;
- updated the model of the "Energia-C8.95" Liquid Fuel Engine (thanks to @valzay).

### Settings:

- reset focus on the map was changed from backquote to Alt+Backquote to be consistent with Alt+C for resetting camera focus during flight;
- because of the above change, pause is now bound to Backquote without the Alt modifier;
- added cloud settings.

### Fixes:

- probe cores losing the "control from here" flag when the pass-resources setting is changed on a docking port;
- resources still being consumed through two attached docking ports when one of them has pass resources disabled;
- an exception when trying to change something on an engine before attaching it to the rocket;
- rotation-handle synchronization on undo and redo;
- reflection-like artifacts on the planet surface when SSAO was enabled;
- Assembly: an exception when resetting a newly created rocket;
- planets losing their atmospheres when changing game settings;
- the Skycrane hole and floating disk after separation;
- an exception when switching between a rocket and a rover in flight;
- one spacecraft disappearing during docking if the other has an instrument not present on the current spacecraft;
- ocean quads flickering when moving quickly sideways at an altitude of 50 km;
- an exception when loading debris into flight mode and then switching to any other active craft;
- an exception when detaching cryocoolers when several of them are present on the rocket;
- rotation undo commands failing when several similar parts are attached to the same parent;
- spacecraft failing to load when a rocket has more than five heat shields (and probably also causing the saved game to crash);
- infinite exceptions when trying to rotate a part in some specific attachment configurations;
- quadruple symmetry not working on some attachments;
- Steam Workshop mods being impossible to disable;
- "SaHO" Probe Core module: incorrect appearance of the bottom sockets.

### Known issues:

- some spacecraft could crash the game after falling into water (please send me their rocket files).
