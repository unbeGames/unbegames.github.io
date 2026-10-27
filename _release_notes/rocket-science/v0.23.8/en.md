---
game: rocket-science
version: "0.23.8"
type: patch
release_date: 2025-01-14 20:00:00 +0300
lang: en
title: 'v0.23.8 Release Notes'
permalink: /en/games/rocket-science/releases/v0.23.8/
---

### Features:

- you can configure wheel steering angle and invert steering controls now;
- you can configure decoupler force percent;

### Changes:

- you need to hold ctrl to copy part now instead of shift, since shift is used for ignoring fixed attachments;
- reduced heat transfer from combustion chambers for biggest engines in the game, adding approximately 30-40 seconds of burn time for them;

### Fixes:

- you can't attach anything to the assembly if you attach existing part to already placed not connected part;
- positions become shifted if you attach existing rocket part group to already placed not connected part;
- some part names contain not assigned parameters like "{0}";
- some parts have missing names when selecting them in the assembly;
- probe core parameters have inconsistent order when selecting part from the list compared to selecting already placed part;
- time parameter is not a valid number error in the console every time you start a flight;
- rcs engines VFX is completely missing;
- spacecraft suddenly rotate on docking;
- warp to maneuver not working when time is paused;
- wrong TWR is calculated on active stage when orbiting any other body than Earth;
- spaceport lose global illumination and camera starts to jitter if double click on any surface object on the map other than space center;
- Structural Adapter Octahedron-Hexagon is missing side dynamic attachments;
- when attaching something to Wing or Inner Wing Type C1, attached part are floating far from wing surface.
- [Mods] surface object mod doesn't detect facilities change after first save;
- [Mods] facility get the wrong type when changing it to runway or parking;
- [Mods] facility marker have an incorrect position;
- corrected tooltip for F action (its changing pivot point now);
