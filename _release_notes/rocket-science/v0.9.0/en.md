---
game: rocket-science
version: "0.9.0"
release_date: 2020-09-29
lang: en
title: 'Release notes v0.9.0'
permalink: /en/games/rocket-science/releases/v0.9.0/
---
### Features:

- reduced build size by 2 GB by applying compression for planet heightmaps;
- \[Assembly shop\] symmetry tools are available during rocket construction;
- \[Assembly shop\] you can duplicate part or part group using hotkey;
- \[Assembly shop\] added toggle to show rocket center of mass;
- \[Assembly shop\] undo and redo now supports rocket part rotations;
- \[Assembly shop\] spacecraft will keep rotation that was set for it (after exiting an edit mode and during the flight);
- angular drag is now calculated and applied to rockets flying in the atmosphere;
- payload fairing and cargo modules start to actually protect the parts placed into them from the atmospheric drag;
- spacecrafts support any command pod rotation relative to the rocket and will appropriately orient navball, markers and direct controls;
- added icons for ships, probes and debris in the Control Center and for the Solar system map;
- total playtime is recorded into save slot (not counting loading time).

### New parts:

- Adapter 1.2-0.35;
- Series S Fuel Tank;
- Spherical Fuel Tank;
- L-shaped Block.

### Part changes:

- increased radius of Payload Fairing;
- reduced energy capcity for probe core "Sputnik-2" from 42 to 36;
- decreased diameter of "FT-800 Fuel Tank" from, 1.2m to 0.7m and adjusted its paramters;
- changed shape of Adapter 1.2-H and renamed to Adapter 0.35-0.6-H;
- added porthole to "Vys" Command Module;
- decreased length of "Adapter 0.35-0.55";
- changed shape of "Basic adapter" and added 3 more connection variants for it.

### Settings:

- \[Assembly shop\] hold Shift and click or drag rocket part to duplicate part and all connected to it parts;
- \[Assembly shop\] Press Ctrl+S to save the rocket;
- \[Assembly shop\] Press X to cycle through symmetry count;
- \[Assembly shop\] Press Shift+X to cycle through symmetry count backwards;

### Changes:

- changed the way rocket bounds is calculated, as a result fixed floating rockets over launchpad before launch;
- solar panels don't produce energy, while Sun is occluded by planet;
- solar panels energy production depends on angle between panel and Sun;
- added status, occlusion and production values into solar panel control window;
- improved parts attachment positioning for all the parts with only one attachment during rocket assembly;
- \[Assembly shop\] rocket parts keep pivot during rotation;
- \[Assembly shop\] added undo and redo buttons on UI;
- \[Assembly shop\] added sorting by update time for rockets in the Assembly Shop (last updated goes first);
- \[Assembly shop\] changed spacecraft orientation, so the command pod porthole is turned up;
- mission time for spacecraft is now calculated since liftoff;
- \[Control Center\] added sorting by mission time for spacecrafts (newest spacecrafts go first);
- improved performance of drag calculations (5-10x speedup);
- decoupler no longer disappears after use;
- decoupler is applying force to original rocket too during activation;
- reduced memory consumption, when there are a lot of rockets in the Math simulation;
- probe cores constantly consume electric charge, they will not recieve any control commands without it;
- rockets without command pod or probe core (for example, debris) could not receive any commands or open part windows.

### Fixes:

- reaction wheels not working if the spacecraft was decoupled from other spacecraft;
- rocket sometimes fall through Earth surface after collision on high speed;
- a lot of issues, when using "Undo" and "Redo" in the Assembly shop;
- exception thrown, if the rocket on the launchpad was removed through Control Center, and the next one was launched;
- some elliptic orbits flicker, when time lapse is enabled;
- rocket constantly move between Physics and Math world, if it landed and one of the rocket parts was destroyed at the same time;
- spacecraft icon sometimes is not shown on the map;
- rockets from previous save appear in the new save, if save slot was not cleared before starting new game;
- sometimes game freezes, when trying to launch spacecraft with a lot of parts.

