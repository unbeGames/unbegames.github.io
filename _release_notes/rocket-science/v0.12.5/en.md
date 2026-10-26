---
game: rocket-science
version: "0.12.5"
type: update
name: 'The Fourth Planet'
release_date: 2021-07-02
lang: en
title: 'v0.12.5 "The Fourth Planet" Release Notes'
permalink: /en/games/rocket-science/releases/v0.12.5/
---
### Features:

- added Mars, Phobos and Deimos to the game;
- added atmospheric pressure models for Mars and Venus;
- added space context menu with contextual Switch To, Focus and Set Target options;
- you can set target for spacecraft, two new autocorrection modes will appear (Target and Anti-target);
- ascending/descending nodes for spacecraft orbits with target set;
- redisigned navball UI + added tons of tooltips to it;
- new mod type: navball, new celestial bodies were also added to the surface mod;
- orbit raycast is now snapping to the closest orbit node (you can hold Alt key to disable this behaviour);
- significanly reduced game launch time, especially on old GPUs;
- imroved perfomance of spacecraft gravity, engines and drag calculations (again);
- flight loading time reduced by 3-5 seconds; when spacecraft is in a deep space it is almost instant now;
- max possible planet quadtree level now equals 30 (previously was 17), this means that the same LOD could be achieved on the planets with pretty much any radius;
- new engine parameter "Throttle limits" (for now it was only added to engine 4)  


### New rocket parts:

- "Vega-072" Liquid Fuel Engine;
- "Yuzhniy-348" Liquid Fuel Engine";
- "Dvutavr" Stroage Bay;
- Storage Fairing 1.4m;
- Adapter 4c-7s.  

### Changes:

- focused body no longer reset when closing and opening solar system map;
- real planet surface now loaded instead of the fake surface in the spaceport and assembly shop;
- perfomance settings now affect planet surface in the spaceport and assembly shop;
- unified sun look on map and during the flight;
- Sun disk has proper size now and depends on distance to the Sun;
- earth atmosphere on solar system map and startup system uses proper exposure and color correction;
- fixed exposure is used on the solar system map until different exposure modes will be implemented (back planet side will be a bit dark becuase of that);
- water quads under the planet surface will no longer render (perfomance improvement);
- changed planet's surface triangulation, it is less stretched along one axes right now;
- greatly decreased amount of geometry rendered during the flight (moderate perfomance improvement);
- changed how rocket part impact is calculated: now it is using force, applied to part to resolve collision and not just a relative velocity;
- added mod type icon to mods in the mods list;
- for some very small sattelites with no its mass data available set a minimum mass;
- for some very small sattelites with SOI less than radius set minimum SOI size equals 1.75 x radius.  


### Settings:

- added navball selector to the game settings;
- added hotkey: \` - reset focus on map;
- added hotkey: Alt + Shift - step increase throttle;
- added hotkey: Alt + Ctrl - step decrease throttle;
- changed hotkey: from \` to Alt + \` - pause/resume time;
- hold ALT key to disable maneuver snapping.  


### Fixes:

- encounter prediction doesn't work outside of Earth's SOI;
- distant celestial bodies dissappear when turning on any light during the flight;
- rectangle connector not attaching to heptahedron socket if it already have hexdual connector attached;
- planet's atmosphere disappeared when switching from spacecraft orbiting the Moon to spacecraft orbiting Earth;
- rocket parts exploded when decoupling them in the atmosphere at the speed over 5000 m/s;
- reattaching rocket part with symmetry turned on not creating symmetry parts;
- spacecraft fly into abyss if engine is working and spacecraft changes SOI;
- grounded spacecraft explode when starting engines;
- collisions between grounded spacecraft and active not work or work incorrectly;
- impact node sometimes displayed when shouldn't;
- impact node not showing after closing and opening map;
- orbit nodes sometimes placed incorrectly during encounter prediction;
- stars are too bright at night in the spaceport;
- predicted orbits are incorrectly scaled, if map scale was changed, when orbit was not active;
- camera keep high rotational damping, when changing camera mode and then switching to map and back;
- save panel is not showing in the surface mod constructor;
- Eris have no gravitational parameter;

