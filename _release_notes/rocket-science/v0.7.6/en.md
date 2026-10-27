---
game: rocket-science
version: "0.7.6"
type: patch
release_date: 2020-02-26
lang: en
title: 'v0.7.6 Release Notes'
permalink: /en/games/rocket-science/releases/v0.7.6/
---

### Features:

- added fuel amount indicators to stages;
- added three more connection variants for "Heavy" Fuel Tank;
- new options category "Performance", where you can change:
  - planets surface level of detail;
  - planets collision mesh resolution;
  - camera collision mesh resolution;
  - maximum number of parallel physics worlds (every active spacecraft uses one world).
- added sensitivity settings for assembly, map and flight cameras (Options -> Game);
- two new auto stabilization modes: radial in and radial out;
- new "reset rocket position" button in Assembly shop. It will reset Y and Z axis of spacecraft, retaining value of X axis.

_* because of many crashes during rocket launch, planets surface LOD was set to "medium" by default. But if you had no problems with it earlier, you can switch it back to "high"._

### Changes:

- Assembly Shop was increased in size;
- settings are saved not only on quiting the game, but when closing options menu too;
- changed how all cameras process the input in the game;
- part category filters work like a toggles in assembly shop now;
- camera will no longer change position when rocket part was detached.

### Fixes:

- memory leak on planet generation on some PC configurations, which lead to crash in some cases;
- spacecraft spawned in the middle of nowhere in some cases;
- spacecraft stuck on launchpad and persist during next launches (I don't think I found all possible scenarios tho);
- navball is not updating on the map view;
- time scale changes unpredictably on switching between physics and mathematics simulation;
- solar panels retract, when switching to map view;
- rocket stuck in assembly shop, when returning to the list of rockets and reset changes for the edited one;
- auto stabilization turn off when switching from another mode;
- rocket parts doesn't position correctly in Assembly shop, when the camera is close to the rocket;
- "pass resources" doesn't work for decouplers in some cases;
- save button doesn't appear, when the changes was made to rocket stages;
- rocket stages doesn't reset when reset rocket was pressed;
- spelling errors in the tutorial;
- some strings are not localized;
- one of the engine sounds doesn't loop properly;
- wrong tooltip on spacecraft stats button;
- changes to game controls is not saved between the sessions.

### Known critical issues:

- game sometimes stuck when rocket exits atmoshpere on some PCs. Still investigating, need more logs to find a problem.
