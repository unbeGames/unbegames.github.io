---
game: rocket-science
version: "0.22.5"
type: patch
release_date: 2024-09-16
lang: en
title: 'v0.22.5 Release Notes'
permalink: /en/games/rocket-science/releases/v0.22.5/
---

### Features:

- added ablative configuration variant for all heat shields;
- you can change pass resources state on decoupler during the flight;
- quick load during the flight will load directly into the flight;
- state indicator on probe cores now change color depending on the state of probe core;
- you can directly switch to select mode when right click on the part and the assembly is in rotate mode;
- heat shields now glow when heated;
- added "Lock thrust limiter" toggle to engines, so when it is enabled engines will ignore any global thrust limiter changes and keep its configured value;
- added several additional tutorial steps to the base tutorial that explain side attachments and part configuration;
- added protective "shadow cone" for heat shields, so side attached parts will not receive heating if they are covered by reentry shadow from the heat shield.

### Changes:

- improved bluntness calculations for reentry: partially occluded surfaces should not receive increased reentry heating like it was before;
- significantly optimized spacecrafts list in the control center if it contains a lot of spacecrafts;
- optimized thermodynamics system performance on time warps greater than 1h/sec
- improved heat shield part tooltip in the assembly shop;
- adjusted heat shields center of mass to make them more stable;
- parts no longer heat at when they are oriented at 85-90 degrees relative to airflow;
- increased max internal temperature for all decouplers;
- scroll speed is the same in both directions, when adjusting maneuver using scroll wheel;
- improved logging when rocket part is destroyed because of overheating;
- activating the next stage will no longer override thrust limiter if it was previously set to any value other than 100%;
- twr and burn time now recalculated for stage when changing the thrust limiter for engine in the assembly;
- thrust limiter in part config in the assembly now have proper rangnes;
- moved center of mass for all probe cores down a bit, to make them more aerodynamically stable;
- tweaked parameters of parachute, so it is more resistant to reentry heating.

### Fixes:

- unstable thermodynamic simulation on high time warp;
- exception after that part stats stop properly update in the part window;
- "Clap" longitudinal decoupler not passing resources after docking;
- sometimes game crashes when quick loading;
- a lot of small bugs related to resource transfer via docking port module;
- sudden rotation around y axis of spacecrafts when docking;
- empty dropdowns in the navball mod;
- fonts have different sizes in the surface mod;
- part attachment systems sometimes breaks when reattaching small parts;
- rare crash on reentry;
- negative total mass when adding some parts, changing variants and then removing it;
- planet atmosphere disappears in main menu if you replace spacecraft with custom one;
- rotated heat shields generate wrong heat shadow;
- fixed Earth losing its atmosphere on SOI change;
- greatly reduced dot artifacts on planet surface on high altitudes;
- Rumble decoupler overheat very quickly;
- rocket state in flight (amount of fuel, etc) reset after save loading;
- fins used as a rudder work incorrectly on some attachments;
- fins control surfaces not correctly shown when symmetry is enabled;
- infinite exception loop when trying to change side booster parameters;
- combustion chamber rotates around up axis for no reason;
- thrust limiter is showing as 0 in flight / assembly windows, when it set exactly to 50%;
- memory leak when duplicating rocket;
- tutorial stuck if you attached more parts to the rocket than was requested by the tutorial;
- exception when opening the map using button in the control center (and back to spaceport);
- engines attached to cockpit or rover become start rotating 90 degrees down if they have TVC;
- not saved window close button doesn't work (Assembly);
- can't attach anything small into side slots of Adapter 1.2-0.55;
- when changing fuel tank attachments and it is a root part, attachment positions become broken;
- removed launch button from the UI in the rocket assembly mod;
- "in", "out" buttons and fuel amount slider doesn't update and change state in docking port window.

### Known issues:

- game crashes when opening any mod preview and then trying to continue the game (Unity issue, can't do much about it for now)
