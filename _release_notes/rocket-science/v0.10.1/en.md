---
game: rocket-science
version: "0.10.1"
release_date: 2020-12-24
lang: en
title: 'Release notes v0.10.1'
permalink: /en/games/rocket-science/releases/v0.10.1/
---
### Features:

- added mods support for surface objects and localization;
- added Steam Workshop support;
- added 166 new celestial bodies to the solar system map (6 dwarf planets and moons of giant planets);
- Solar system map improvements:
  - added tooltips for all celestial bodies and spacecrafts with name and useful info;
  - added marks and tooltips for surface objects;
  - several tooltip items will be shown if there is more than one object under the mouse pointer;
  - tooltips are colored the same way as the orbit node under it now;
- added Milky Way;
- improved autocorrection PID controller: it works much more precisely and equally well on rockets of any mass and shape;
- implemented save migration system: no more broken saves on small data format changes!
- added support for ultrawide aspect ratios like 21:9;
- added Japanese, Korean, Simplified Chinese and Traditional Chinese fonts to the game.

### Changes:

- added predicted impact coordinates to the tooltip for impact node;
- remaining rocket parts from previous stage will be moved to the new one during the staging;
- rocket no longer moved into Physics simulation, when you rotate it using direct controls in space;
- added two more save slots;
- increased size of assembly shop;
- changed assembly shop architecture a bit;
- improved performance for rockets with a lot of parts;
- improved performance of noise functions, used during planet generation;
- reduced aliasing on UI icons and small UI elements;
- unify font sizes in most game interfaces;
- applied kerning to fonts;
- improved dropdown visuals;
- added smooth transition when exiting to main menu;
- marker size settings affect all markers on the solar system map now.

### Fixes:

- game stuck when selecting any far planet and then the Sun on the Solar system map;
- huge artefacts on planet surface in areas where fields transition to hills and hills transition to mountains;
- game stuck on spacecraft launch, when previous spacecraft stayed on the launchpad and was manually removed from control center;
- sometimes second launchpad appeared in totally wrong orientation when launching the rocket;
- building and rocket parts outlines sometimes stop working, when you are in the spaceport and at least one rocket is landed on Moon;
- solar system map not properly updated, when time is paused and you have selected another celestial body or spacecraft;
- atmosphere sometimes not switch off, when selecting another planet without atmosphere;
- rocket incorrectly decouples, when the parent rocket is in space and was rotated after the engines are off;
- rocket incorrectly positioned after rotation on 180 degrees in space and turning engines on;
- bad performance in assembly shop for old GPUs;
- rotational period for planets with sync rotation is incorrect;
- height sampling is incorrect in certain areas of the planet, that can lead to rocket explosion in the air or fall through the surface;
- orientation of most planets and moons except Earth is incorrect;
- light leaks on certain sun angles in the assembly shop;
- exception in the console, if one of the rocket parts was destroyed during the flight at the distance around 1000 km from the launch pad;
- parachute sometimes breaks when deployed on low altitude, even if the speed was acceptable;
- missing localization of force and duration units in the engine module window.

