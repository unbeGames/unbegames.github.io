---
game: rocket-science
version: "0.23.16"
type: patch
release_date: 2025-02-13 20:00:00 +0300
lang: en
title: 'v0.23.16 Release Notes'
permalink: /en/games/rocket-science/releases/v0.23.16/
---

### Features:

- added craft validation and cleanup on load, wich will be able to fix and load broken spacecrafts with missing attachments, parts, etc.;
- added "clear" command to console.

### Changes:

- changed all pivot position of command modules and probe cores to the bottom socket;
- thermodynamics calculations deltaTime now clamped to 2 days / sec max, otherwise it becomes very unstable and parts start exploding;
- further reduced thermal production coefficient on some engines;
- slightly reduced collision radius for dynamic attachments so small parts like rcs mounting point now can fit rcs engines without problems.

### Fixes:

- NaN temperature on crafts where some parts were placed inside the payload fairing after fairings were installed;
- NaN temperature after decoupling part of the craft and then time warping (in case you switch to decoupled craft);
- last time warp button with time warp 1 month / sec sets warp to 7 days /sec;
- missing burn time values for some Hydrolox engines;
- "Rumble" and "Hose" decouplers stay coupled after separation if they were attached using second radial attachment pivot point;
- symmetry stops working when RCS block was mounted longitudinally and other parts attached to it.
- reentry and mach effect suddenly disappears sometimes;
- heat shield stops protecting rocket parts after undocking;
- wrong position of center of thrust and lift if you move craft to the side and then attach engine / wing;
- crash when loading any mod then returning to main menu and then continuing the game;
- improve memory consumption and performance in some cases.
