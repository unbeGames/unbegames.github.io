---
game: rocket-science
version: "0.18.2"
type: update
name: 'Connectivity'
release_date: 2023-03-17
lang: en
title: 'v0.18.2 "Connectivity" Release Notes'
permalink: /en/games/rocket-science/releases/v0.18.2/
---
### Features:

- total refactoring of the rocket assembly system, it is based on simpler code, is more stable and feels much better to work with;  
- you can change selected connection during rocket assembly by using hotkeys, if there is more than one variant;  
- added attachment/detachment smoothing during rocket assembly;  
- added global thrust limiter to the navball, you can change it by holding ALT and dragging throttle indicator or using **ALT**+**SHIFT** / **CTRL**.

### New rocket parts:

- Hexagonal Cargo I-beam;  
- Fibre Cargo Bay Cap.

### Part changes:

- reworked "Dvutavr" Cargo Bay;  
- reworked "Fibre" Cargo Bay Section and "Fibre" Cargo Bay Middle Section;  
- increased size for Cargo Fairing 1.4m

### Changes:

- changed how attachment points works on payload fairings (this will break the orientation of current fairings, you just need to reattach them);  
- symmetry rotation now works for parts, connected to one attachment;  
- you can change throttle by clicking on or dragging throttle indicator on the navball;  
- added rotation sound for not connected parts, if rotation step is above 1 degree;  
- removed dual_big socket and connector as they are not used anymore;  
- improved game launch time a bit.

### Settings:

- two new hotkeys for assembly Next Connection . and Prev Connection ,  
- changed hide UI shortcut from **ALT**+**Z** to **ALT**+**V**;  
- changed hotkeys for throttle step increase and decrease;  
- added hotkeys for setting global thrust limiter.

### Fixes:

- sun flares shine through the navball;  
- navball text changes brightness depending on camera exposure;  
- connecting two-connector part to heptahedron range slot is unstable and produces a lot of redundant sounds;  
- it is hard to select a slot during part attachment on high camera angles relative to rocket part;  
- wrong position for the part is assigned when connecting part with slots onto part with connectors;  
- sometimes parts stop to connect to each other;  
- various exceptions that happened during rocket assembly after which you need to reset the rocket;  
- collider offset calculations are missing for some parts during the bake when this should not be the case;  
- game sometimes crash on starting loading screen;  
- rare crash on game start.

