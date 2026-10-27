---
game: rocket-science
version: "0.21.4"
type: patch
release_date: 2024-04-08
lang: en
title: 'v0.21.4 Release Notes'
permalink: /en/games/rocket-science/releases/v0.21.4/
---

### Features:

- added additional configuration to side boosters **Side Fuel Block** and **Conic Fuel Block** so they can be decoupled from rocket without using a dedicated decoupler;
- added one more time warp step in between 1 day and 1 month, equal to 1 week;
- added toggle to orbit stats panel that switches orbit inclination display mode from the ecliptic to equatorial plane and vice versa;

### Changes:

- re-enable thrust limiter slider for all engines in the engine parameters window during the flight.
- all "Reach orbit" contracts now have correct inclination set relative equatorial plane (previously was incorrectly set to ecliptic plane);
- Molniya and Tundra contracts now have correct periapsis and orbital periods;

### Fixes:

- Molniya and Tundra contracts can't be completed;
- game stuck after completing any "Reach orbit" contract and trying to exit to main menu or quit the game;
- crash when changing from select mode to grab mode removing previously selected part and switching back to select mode;
- sometimes there is no missing fuel warning displayed when attaching some engines to the fuel tank that have no required fuel for them;
- mods list window have no background;
- navball is black in the navball mod scene;
- some translation strings are missing;
- some tutorial steps have outdated information;
- fixed missing caption in one of the advanced tutorials

### Known issues::

- switching pass resources mode in the attached parts using “Select” tool, doesn’t work (mode switches, but part continue to work in the previous mode);
