---
game: rocket-science
version: "0.22.1"
type: update
name: 'Foundation'
release_date: 2024-09-02
lang: en
title: 'v0.22.1 "Foundation" Release Notes'
permalink: /en/games/rocket-science/releases/v0.22.1/
---

**Some spacecrafts may be broken because of these changes.**

### Features:

- thermodynamics was introduced to the game;
- added re-entry effect;
- extended Earth and Mars atmospheres density, pressure and temperature calculations up to its maximum altitudes supported by models;
- [Flight] total rework of all part windows;
- [Assembly] rocket stages now support undo / redo;
- [Assembly] added an ability to change root part;
- [Assembly] you can change side attachments on already placed part;
- [Assembly] you can configure any module on placed part;
- [Map] you can now pin any tooltip on right mouse click;
- fins are aerodynamic surfaces now that can be used to control the rocket;
- you can disable and hibernate probe cores now to reduce electricity consumption;
- you can disable reaction wheels;
- added new fuel pair: kerosene - lox and engines that support it;
- engine plume was completely reworked;
- all tutorial windows can be dragged now;
- added new thermal part category.

### New rocket parts:

- "Razryad-518", “Zaryad-021”, “Duga-8” liquid fuel engines;
- General-Purpose Heat Source (RTG) and Multihundred-watt RTG;
- Payload Fairing Strait Base GO-5;
- Small Fin;
- Passive Heat Shields for 0.55 m, 1.2 m and 2.5 m
- Passive Radiator Panel and Passive Radiator R-2.

### Part changes:

- Basic Fin now have control surfaces
- “Vega-072” engine was made bigger and now requires star socket to attach to;
- tweaked ISP and thrust for “Iskra-758”, “Energia-C8.95” and "Yuzhniy-348" engines to be inline with real analogs;
- Structural Adapter 1.2-Cube and Structural Adapter 1.2-Module were moved from structures category to adapters.

### Changes:

- flight part window now opens on right mouse click for consistency with assembly;
- engine system performance was increased by a factor of 5 in some cases;
- engine heat emission is no longer fake;
- reworked "warp to" algorithm, it is now much more precise;
- improved precision at which drag data is baked;
- reaction wheels consume energy evenly (previously small wheels consumed first);
- camera will continue to follow spacecraft if its command module was destroyed;
- [Assembly] you can now open part config by right clicking on part;
- [Assembly] removed angle restrictions from all socket types for attached part rotation;
- [Assembly] you can't reattach already attached part to another one;
- [Assembly] significantly improved "Reset all stages" algorithm, that composes stages better now;
- all selection and hover outlines now brighter;
- increased electricity capacity up to 2x for all batteries, probe cores and command modules;
- collapsed solar panel partially produce electricity, reduced by amount of area hidden from the Sun;
- solar panels energy production now depends on distance to the Sun.
- added "burnTime" into engines tooltip. This is the amount of time an engine can burn in vacuum continuously without overheating.
- added area and volume parameters to all tooltips;
- all single side attachments were rotated 90 degrees to be consistent with the direction of line attachments;
- some positions of side attachments were swapped to better support changing them on already placed part;
- cleanup a lot of code and assets related to old timeline system;
- build size was reduced by 2 GB.

### Fixes:

- when clicking on item on parts panel, click event happens twice;
- reaction wheels consume 2x time more energy than in spec under heavy load;
- Rocket does not reset if you make changes to it and then exit to space center via main menu;
- if you create new rocket, not make any changes to it and then try to exit from editing mode, not saved window is not shown;
- orbit raycast sometimes not working on highly eccentric orbits (again).
- game freezes when entering atmosphere on high time warp;
- sometimes rocket parts suddenly rotate after coupling;
- [Assembly] center markers get wrong positions if you move spacecraft and then attach any part to it;
- [Assembly] part resets its rotation when reattaching from one socket to other;
- navball autocorrection buttons not change state, when autocorrection was changed from command module window;
- Seeker Decoupler can not be clicked during the flight
- exception when changing part config when part is not attached to the rocket;
- sometimes fuel indicator near navball stuck after decoupling;
- rocket with extended landing struts / solar panels has incorrect bounds when loading from save;
- wrong tooltip for reaction wheel status indicator;
- countless bugs tied to old flight window system;
- stage loses selection outline, when stage button was pressed and there are no more stages left;
- all aerodynamic surfaces have wrong position of lift force application point;
- if aero surface had no control surface, it doesn't change when selecting any other one in part config;
- you can not hover or select engine during the flight if it was placed inside tail block 0 and was smaller that it;
- when spacecraft is in physics simulation, time in spaceport is at 10x speed, not 1x
- infinite exception loop, when you have part selected with symmetry, and then closing spacecraft with changes reset;
- exception related to orbit panel when you first time load flight.
