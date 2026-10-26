---
game: rocket-science
version: "0.8.1"
release_date: 2020-08-25
lang: en
title: 'Release notes v0.8.1'
permalink: /en/games/rocket-science/releases/v0.8.1/
---
### Features:

- added support for interplanetary flight;
- added the Moon;
- implemented maneuver planner and encounters prediction;
- added 11 new tracks and improved playlist selection during flight;
- improved aerodynamics for rockets with small number of parts;
- added proper support for parabolic and hyperbolic orbits;
- game is now supporting up to 500 orbits rendering at the same time without dropping fps on the average PC;
- new orbit nodes: impact, encounter, escape;
- approach time to orbit nodes and maneuvers is showing now, when hovering mouse over them;
- added proper environment shadows during flight;
- new 16-bit temperature map for Earth, it will make planet texturing more smooth and reduce noisiness,
- new high quality color and normal maps for Moon on the Solar System map;
- added automatic camera exposure control and adjusted values during flight and on the Solar System map;
- added sun flares;
- updated main menu scene;
- animated rocket parts not only change visual appearance, but affect physics shape and rocket parameters;
- new autostabilization mode: maneuver;
- new socket types: rectangle, dualhex.

### New parts:

- Frontal Parachute is working now! (kinda of)
- "Feather" Landing Strut;
- Standard Reaction Wheel;
- Payload Fairing 3x7;
- Micro Decoupler with 3+2 variants
- two more variants of "Seeker" Decoupler.

### Part changes:

- "Vys" Command Module:
  - reduced max torque from 20 kN to 18 kN;
  - reduced consumed power from 0.53 to 0.48;
  - increased mass from 740 kg to 850 kg;
  - reduced electric charge amoun from 135 to 120;
- Small Reaction Wheel: increased max torque from 4.5kN to 6kN and consumed power from 0.1 to 0.14;
- reduced dry mass of all fuel tanks by ~15%;
- changed visual appearance of Adapter 1.2-0.55 C-4 to make the compartibility with "Clicker" Longitudinal Decoupler more obviuos;
- added single socket on top of the "Sputnik-2" Probe Core;
- "Energia-C8.95" Liquid Fuel Engine increased thrust and fuel consumption a bit (impulse didn't change).

### Settings:

- added orbit markers size configuration;
- added scroll sensitivity for manever planner handle;
- new hotkey G - to toggle landing gear;
- press "Delete" while on map view to remove selected maneuver node.

### Changes:

- changed collision detection method, it will no longer produce phantom colissions, but sometimes may miss collision on fast moving objects;
- rocket parts could explode on collision with each other;
- improved attachment search while assembling the rocket;
- spacecrafts with applied torque will continue infinitely rotate in space (if auto stabilization is turned off);
- rocket consumes correct amount of electric charge when it is in Math simulation;
- spacecrafts position is checking against planet heightmap in Math simulation;
- increased max possible angular speed of all bodies;
- orbit markers and text have the same size no matter how far they are from the camera;
- antialiasing is now applied to orbits;
- improved orbit colors and rendering;
- only section of orbit is generated and rendered in some cases (like when part of the orbit is bellow the surface);
- improved perfomance in spaceport;
- sun is more yellowish now in the map view;
- autocorrection in Math simulation is more precise;
- last activated stage in flight will be saved with spacecraft;
- reordering action groups shift folowing groups instead of swap;
- spaceport authorities have finally continued construction of launchpad!

### Fixes:

- rockets explode in air far from ground;
- stage activation breaks after some rocket stages was destroyed by impact;
- rocket can not be crashed onto launchpad (fixed for most of launchpad, except the exact start point to avoid rocket exploding on engine start);
- seams on planet, visible from certain distance and light angles;
- higher level of detail of planet surface sometimes doesn't load;
- when rocket flying on hyperbolic orbit, it is going into abyss after some time;
- game freezes when entering atmoshpere with huge time warp multipler;
- decoupled rocket part moves strangly to the sides sometimes;
- rocket fall through the surface of planet and continue flying sometimes;
- different artefacts on planet in flight mode on very high orbit;
- incorrect normals in map view on all planets;
- grid-like artefacts on oceans on Earth in the map view;
- ocean flickers a bit when rocket is falling down;
- rocket shadows not changing, when changing rockets in assembly shop;
- various light leaks in spaceport;
- broken shadows in spaceport during the summer;
- vcam popping on when changing view from spaceport to map;
- you can attach three "Raduga-52" engines to one fuel tank;
- different issues with action groups moving and updating;
- wrong spacecraft velocity after you reached speed of 5km/sec in the atmosphere;
- spacecraft flying sideways relative the ground under some conditions (again);
- Assembly Shop completely broken, when deleting rocket part using Delete key and not detaching it from the rocket before that;
- sometimes parts do not detach from the rocket in the Assembly Shop;
- part slots / connectors incorrectly highlighting in Assembly Shop or flight;
- orbit node text sometimes clipped by the planet.

### Known issues:

- incorrect rocket palcement on the launchpad during launch;
- part of the rocket explode below the surface, if the command module was destroyed.

## 26.08.2020

### Fixes:

- Fixed crash during roclet construction
- Fixed buildings not highlighting when hovering over them

