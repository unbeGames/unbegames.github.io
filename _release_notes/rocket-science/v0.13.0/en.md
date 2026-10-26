---
game: rocket-science
version: "0.13.0"
release_date: 2021-10-08
lang: en
title: 'Release notes v0.13.0'
permalink: /en/games/rocket-science/releases/v0.13.0/
---
### Features:

- added RCS and rcs control panel for navball;
- added docking port: it not only allow to dock two spacecrafts, but also can transfer fuel and oxidizer between them;
- new connection type: docking port;
- added intersection and position at intersection nodes to the maneuver planner;
- added "Target" navball mode and manual switch between navball modes;
- spacecraft markers are now shown within a radius of 50 km around current spacecraft during the flight (F4 to toggle);
- implemented RCS autobalancer: it will try to select such rcs throttle values, so spacecraft can be moved or rotated without unwanted forces, even if rcs engines were placed not optimally;
- added new fuel type — monopropellant (Hydrazine) used by RCS;
- autocorrection now works in the predictive mode, that should improve rocket stability, especially during time warp;
- autocorrection from tvc, rcs and reaction wheels now work coherently with each other;
- added new camera mode: docking;
- added new part category "Control" where rcs and reaction wheels are placed;
- rocket plume will change its shpe depending on atmospheric pressure;
- added heat emission effect to all engines;
- added more sounds to navball and flight UI;  

### New rocket parts:

- "Druzhba" Command Module;
- "Grezy" Probe Core;
- "Ruby" embedded RCS;
- "Citrine" external RCS;
- "Fenek" Docking Port;
- "Navarin" Docking Port;
- "Ochrea" Radial Decoupler;
- "Hornet" Decoupler;
- FT «Zvezda-tzilindr»;
- FT «Zvezda-parallelepiped»;
- Circular Connector Block;
- Circular Crisscross Block;
- RCS Mounting Block;
- RCS Mounting Point;
- Hexagonal adapter;
- "Azimuth" Station Branching Module;
- "Axis" Station Branching Module;
- Medium Battery.

### Part changes:

- "Siphon" Radial Decoupler visual rework;
- Micro Decoupler now have smaller size and also received visual rework;
- reduced length and mass for Adapter 0.35-0.6-H by 25%;
- deprecated C-2 and S-2 connection variants for "Seeker" Decoupler (it was replaced by "Hornet" Decoupler);
- added hydrazine configuration for fuel tanks FT-800 Fuel Tank, Series S Fuel Tank, FT «Zvezda-sfera»;
- reduced time between staging parachute and actual parachute spawning;
- parachute spwaner's mass is now reduced by the mass of parachute on deploy;
- increased power consumption for all reaction wheels;
- slightly increased mass for "Osnovanie" Probe Core  

### Changes:

- rocket landed on any surface object (except directly on launch area) will no longer disappear after exiting to spaceport;
- rocket part animations now properly animate physics (no more exploding landing legs on low framerate);
- \[Assembly\] reset button now also resets rocket name if it was changed;
- pressing Q will also repeat last placed subassembly;
- improved connection search performance in the assembly shop;
- changed order of part categories in the assembly shop;
- updated all icons for part categories in the assembly shop;
- added decouple sound for all decouplers;
- moved space context menu to UI, so it will no longer be hidden by planets on solar system map;
- orbit tooltip will update its position, if hovered node is moving;
- orbit raycast will be hided if mouse is hovered over spacecraft, press ALT, to show it anyway
- maneuver handle will change its color depending on selected maneuver;
- when active command module is destroyed it try to transfer control to other command module if it exists;  

### Settings:

- added RCS translation keys: **H** and **N** to translate forwad/backward, **I** and **K** to translate up/down,**J**and**K**to left and right;
- added toggle RCS **R**;
- added toggle targeting **F4**;
- added min and max distance setting for celestial target;
- ALT+click on spacecraft's marker during the flight or on solar system map to set it as a target;  

### Fixes:

- gimbal controls work incorrectly, when command module is rotated relative to rocket;
- when flying up to other spacecraft in the space it may suddenly warp at huge distance;
- parts sometimes acquire wrong parameters after another part of similar type was destroyed on rocket;
- connection section in rocket part tooltip is showing even if there are no connections available;
- \[assembly\] rocket name not saved if it was changed but save button not pressed:
- symmetry doesn't work for some cases: heptahedron connector + heptahedron socket and hexdual connector + rectangle socket;
- some parts have noticeable gaps on edges, especially colored in orange;
- some text is not localized in the assembly shop;
- rocket controls not reset, when control buttons were pressed and switching to another spacecraft during the flight;
- the lit status of solar panels doesn't change if autocorrection is disabled and the rocket is rotating;
- some inconsistencies in part materials;
- sometime predicted orbits looks broken;
- game stuck when trying to create subassembly from cloned part;
- sometimes batteries are not charging;
- sometimes decoupled parts disappear after main spacecraft crashes onto surface;  

### Known issues:

- resource separation is broken for crafts with decouplers that was saved as subassembly (including first command module) and then loaded (found today, will be fixed soon);

