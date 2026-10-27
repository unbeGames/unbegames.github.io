---
game: rocket-science
version: "0.21.9"
type: patch
release_date: 2024-04-17
lang: en
title: 'v0.21.9 Release Notes'
permalink: /en/games/rocket-science/releases/v0.21.9/
---

### Features:

- added time to apoapsis/periapsis/impact to the orbit stats panel;
- added third rocket assembly tutorial;
- navball mod now supports black colors for numbers and have a separate intensities for each channel.

### Changes:

- added expand/collapse button to orbit panel which will toggle visibility of additional orbit parameters;
- reduced assembly colliders of "Raduga-52" and "Vega-072" engines so they can be attached to big fuel tanks in more different ways;
- engines are now grouped by fuel pair first and then by thrust on the parts panel.
- added fuel name and image to rcs tooltip;
- increased camera exposure compensation range that could be set during the flight and on the map;
- improved memory allocations on assembly shop scene;
- improved "Citrine" external RCS plume effect;
- reduced mass for "Clap" Longitudinal Decoupler;
- added hydrazine fuel variant to "The little one" Fuel Tank FT-0;
- removed fog from assembly blueprint scene;
- automatic time warp is no longer interrupted by physics simulation, it is just capped at 10x speed;
- part name properly updates when changing its config using select tool;
- increased resolution of navball texture and tweaked colors a bit.

### Fixes:

- big memory leak on spacecraft mode scene;
- switching pass resources mode in the attached parts using “Select” tool, doesn’t work (mode switches, but part continue to work in the previous mode);
- not being able to open context menu and raycast highly eccentric orbits;
- equatorial inclination doesn't account for orbit's longitude of ascending node and can produce incorrect results;
- part rotation is lost when detaching part and then using undo;
- sometimes assembly stuck when constantly switching from grab to select mode and back and clicking on different parts;
- 1.2m radius parts could not be attached to the bottom of rover_fairing_0;
- command module porthole shows Earth's water through the part;
- some props are missing in the control center;
- engine thrust effects and sounds start playing when turning on engines end time is paused;
- center of lift and center of drag forces overlays are swapped between each other;
- ALT+click on rocket part doesn't focus camera, when "Select" or "Rotate" mode was selected;
- game loads in initial 10x time warp and then switches back to 1x;
- sometimes game stuck when quitting to desktop or main menu;
- sometimes game stuck after using Select tool and selecting one of the parts;
- buttons are vertically stretched on instruments panel on surface and navball mods;
- stages are cut off by the bottom of the screen in the ultra-wide resolution;
- game stuck when several parts was selected using symmetry and then they were removed by pressing undo;
