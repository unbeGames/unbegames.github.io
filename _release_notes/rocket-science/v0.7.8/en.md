---
game: rocket-science
version: "0.7.8"
type: update
name: 'Regain Control'
release_date: 2020-03-12
lang: en
title: 'v0.7.8 "Regain Control" Release Notes'
permalink: /en/games/rocket-science/releases/v0.7.8/
---
### Features:

- added engine trust vector control for all engines except "Zarya-352" Liquid Fuel Engine;
- autocorrection system uses engines to turn spacecraft if TVC is available;
- added thrust limiter to engine window (previously it was just throttle with wrong name);
- added velocity and orientation markers on navball;
- you can remove parts using **Delete** hotkey in Assembly Shop;
- you can toggle auto stabilization using **T** hotkey;
- you can switch camera focus to any rocket part in the flight using **ALT + left mouse button click**;
- you can move camera along spacecraft using **ALT + mouse wheel**;
- you can reset camera focus to default position using **ALT + C**;
- the Moon can be seeing from the flight camera now (but it still not reachable yet :/ );
- added "remove spacecraft" and "enter into flight" buttons to the list of spacecrafts in the Control Center;
- new part category "adapters" in assembly shop;
- new connector type "rectangle".  

### New parts:

- basic fin;
- advanced nose cone;
- adapter 1.2m radius to 0.55m;
- adapter 0.35m radius to 0.55m;

### Changes:

- flight camera will focus at spacecraft's center of mass instead of command pod by default;
- to be consistent with the flight mode, hotkeys in Assembly Shop were changed:
- \- focusing camera on the part is **ALT + click** now instead of SHIFT + click;
- \- moving along the building is **ALT + mouse wheel**;
- some parts was moved from decouplers category to adapters;
- improved connector/slot selection during part attaching in assembly shop.

### Fixes:

- planet generation memory leak when orbiting around Earth a long time with in the time warp;
- one of the fuel tanks has incorrect connection position, which lead to rocket flip over;
- one-socket part can be incorrectly connected to triple connector part;
- rocket part outlines stays when switching to map;
- lightning artefacts on Earth on map view;
- parts sometimes stay connected to the rocket after removing;
- new part is not selected from list, when another part was detached from rocket and stayed selected;
- bottom visual slots on side fuel tank are missing;
- decoupler and adapter attached to command pod have wrong alighment;
- engine turn on after changing throttle, even if it was manually turned off;
- missing alpha gradients from orbits;
- spaceport camera stop rendering if selected spacecraft was removed in control center;
- selected value in dropdown sometimes not localized properly;
- wrong engine name in the tutorial;
- click on detached part opens part's window;
- close button not worked in spacecraft stats window.  

### Known issues:

- sometimes rocket receives huge side force on launch (need more evidence to solve this one). If you encounter this, you can try go to Control Center and remove any bugged spacecrafts;
- it is impossible to reattach part with socket from one connector to another (you can detach part and place it before attaching to another one as a workaround).

