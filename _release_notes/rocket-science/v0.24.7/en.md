---
game: rocket-science
version: "0.24.7"
type: update
name: 'Breaking Silence'
release_date: 2025-10-03
lang: en
title: 'v0.24.7 "Breaking Silence" Release Notes'
permalink: /en/games/rocket-science/releases/v0.24.7/
---

### Features:

- added space communications and antenna parts;
- Deep Space Network and default relays as an option on game start;
- implemented instruments system;
- added flight journal, that records all events that happened to the spacecraft during the flight;
- added milestones system, which replace simple contracts like reach orbit, land etc and group it by planet;
- added fuel / resource flow priority system;
- added part panels and instrument data rate requirement for probe cores;
- added rotation tracking module and solar panels that can track the Sun;
- added active cooling systems (cryo cooling, liquid will be added soon after);
- reworked navball: moved instrument buttons there and added more indicators that show additional information about spacecraft status;
- implemented radial to linear velocity conversion on decouple or undock;
- electricity overhaul: implemented better production / consumption routines, added total production / consumption information to resources;
- added basic game API and extension mods support;
- added methane fuel and engines that consume it.

### New rocket parts:

- command pod 2;
- probe core 5, 6
- decoupler 9
- structure 12;
- antenna 0, 1, 2, 3, 4, 5, 6, 7;
- cryocooler 0
- radiator 2
- thermal separator 0, 1
- instrument 0, 1;
- solar panel 5, 6;
- engine 12.

### New content:

- new “Communications 101” tutorial.

### Part changes:

- Payload Enclosed Cap GO-5 added dynamic attachments to the bottom of part;
- complete rework of command pod 1;
- rework of decoupler 3 and 5, so they are now smaller.

### Changes:

- conductive heat transfer now uses not average heat transfer coef but harmonic mean;
- thermal conductivity can now be configured separately for part skin;
- you can manually cut the parachute;
- parachute min pressure is now set in kilopascals and not in atmospheres;
- most of the contracts were converted to milestones;
- active stage TWR is now shown under the dV on action groups UI;
- spacecraft will maintain its auto correction rotation on very high time warp;
- reaction wheel power consumption no longer overconsume electricity on high time warp;
- battaries produce heat on recharge;
- wheels with motors produce heat when driving;
- docking ports can now transfer hydrazine;
- hydrazine is consumed evenly from tanks now;
- added "show target markers" button to UI;
- all ambient sounds now respect audio settings;
- date time format and input values now depends on system culture, but not on selected locale;
- all tooltips have consistent positioning relative to hovered item and size now;
- reworked font sizes and text clipping in control center and rocket lists;
- you can close control center map UI using ESC now;
- updated all physical constants using latest CDATA values;
- probe cores are now far more aerodynamically stable and will less likely to flip on atmosphere re-entry;
- part window module order is now stable;
- internally reworked part tooltip system, more data is shown in tooltips because of that;
- you can't see instrument and part panel values during the flight if you have no stored electricity or electricity production available;
- spacecraft now saves selected command module between game sessions;
- added some missing localization strings;
- you can deselect spacecraft in the spacecraft list by clicking on the list panel itself;
- [Assembly] improved part initial placement behaviour yet again;
- camera zoom now supports continuous controls.
- module panels and assembly configs now show units when applicable;
- HeatProductionSystem now operates on per part basis to support heat dissipation using coolers.

### Settings:

- [Audio] added master and ambient volume sliders;
- [Game] added culture selector;
- [Game] added map camera zoom sensitivity;
- [Quality] added FPS limiter toggle and slider;
- [Quality] SSGI is temporary disabled because it is broken in current Unity version (a lot of ghosting artefacts).

### Fixes:

- burn vector is incorrect for every maneuver on the orbit with eccentricity higher than 0.2.
- you can reset riteg decay by docking recently launched spacecraft and then undocking from other port;
- game stuck when decouple and switching to decoupled spacecraft and then quick load.
- sometimes values in part panels roll back after change with no reason;
- electricity consumption and production is changing proportionally to the number of installed batteries;
- celestial filter doesn't affect body tooltips;
- mach VFX is swapped with re-entry VFX when rocket part changes physics state and vice-versa;
- reentry and mach VFX not changing when part change shape in some cases;
- decoupler 4 looks wrong after separation.
- quick load is not working when trying to load in the space center and not a single spacecraft was selected;
- target orbit changes color when you set it as target and then unset;
- decouplers that split lead to NaN temperature after deploy;
- exception when dragging one fuel tank over two connected ones;
- some strings are not localizable on Chinese, because of font size;
- wheels produce electricity, when driving backwards;
- [Assembly] part config incorrectly sets values from the previous part when adding a new one;
- [Assembly] fuel level values are wrong when inspecting fuel tank with bigger capacity followed by the smaller one.
- some parts of Navball are changing brightness depending on camera exposure;
- you can't expand autocomplete dropdown manually, by pressing on the arrow;
- location name overflows when rocket or spacecraft have a very long name;
- parachute always fail to deploy when`another spacecraft is nearby;
- sometimes spacecraft is not interacting with separated parts after decouple;
- conductive heat transfer is slower, than expected;
- time panel stops updating when time was reversed backwards (for example, for tutorial).
- outline not including parts that have more than one submesh;
- landing strut 0 stuck on decoupler in some rocket configurations.

### Known issues:

- abnormal mesh bouns spam in the console, when you are flying very far from Earth and have an established link.
