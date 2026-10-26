---
game: rocket-science
version: "0.21.0"
type: update
name: 'Essentials'
release_date: 2024-03-29
lang: en
title: 'v0.21.0 "Essentials" Release Notes'
permalink: /en/games/rocket-science/releases/v0.21.0/
---
### Features:

- added H2 and O2 fuel pair;  
- added Select mode for Assembly and ability to change rocket part configigration for already attached parts;  
- full rebalance pass on all fuel tanks parameters;  
- added 8-way symmetry and part variants, that support it;  
- added warp to maneuver button and start burn indicators to maneuver panel;  
- all planets, that still have no surface, now use textures from the scaled space model, instead of just a white sphere;  
- added Callisto, Ganymede, Io and Europa solar map textures;  
- improved all gas giants solar map textures;  
- \[Space context menu\] added warp to point option;  
- added two indicators to the time panel, that will show if the game is running physics simulation or if auto time warp is used;  
- added more sfx to the game;  
- redesign of some old interfaces;  
- added irregular moon celestial body type and corresponding map filter.

### New rocket parts:

- "DVK-1" Liquid Fuel Engine;
- Octagonal Prism O-100;
- Octagonal Prism O-200;
- Structural Adapter Octahedron-Hexagon;
- "Mini-Prizm" Fuel Adapter;
- "Mini-Cone" Fuel Adapter.

### Part changes:

- engine 6 and engine 7 now uses H2+O2 fuel pair;  
- corrected engine_skycrane hydrazine consumption;  
- adjusted visuals and slot positions for decoupler_radial_1.

### Changes:

- significantly improved fuel tanks attachment stability, when trying to connect it to the radial decoupler;  
- advanced assembly tutorial received additional tutorial steps, clarifying some assembly mechanics;  
- advanced assembly tutorial was split into two parts, to reduce its size;  
- stage groups with engines now have fuel type indicators;  
- collapsed stage groups are now grouped by fuel type;  
- stage fuel navball indicator now works with any fuel that engines consume;  
- stage fuel navball indicator now calculate amount and % for entire fuel pair instead of only fuel alone;  
- added indication that engines have no required fuel in the stage to stage group;  
- base time warp in the spaceport is 1 now (previously was x10);  
- time warp acceleration / deceleration is frame rate independent now;  
- game will unpause if you click pause button a second time;  
- changing time warp using hotkeys will also unpause the game if it was paused;  
- orbit raycast no longer processed if orbit point is behind the celestial body;  
- small improvements to scaled space atmosphere computation, that will improve its quality;  
- added window for parts, that contain kerosene;  
- improved UI for widescreen displays.

### Fixes:

- symmetry not working when trying to detach / reattach fuel tank from decoupler;  
- sometimes you can notice a strait line on a planet surface;  
- sometimes there is a wrong ambient light color when flying over the planet;  
- dV is not calculated for hydrazine engine on stages;  
- dV is incorrectly calculated when stage contains more fuel or oxidizer than required by engine's consumption ratio ;  
- sometimes maneuver placed using orbit context menu, appeared in the wrong place or not appear at all;  
- orbit raycast distance is resolution-dependent;  
- orbit with section sometimes looks broken;  
- orbit raycast doesn't work on high eccentric orbits with no sections;  
- orbit with encounter doesn’t reset it's shape after switching to spacecraft with this orbit and to another one;  
- wrong door connection between coal generator and elevator;  
- sun flares are visible through solid geometry, when the sun is near the edge of the screen;  
- fuel transfer in docking port window doesn't work;  
- placeable actions subpanel remains visible, when exiting to rocket list and assembly was in Select or Rotate mode.

