---
game: rocket-science
version: "0.13.2"
type: patch
release_date: 2021-10-11
lang: en
title: 'v0.13.2 Release Notes'
permalink: /en/games/rocket-science/releases/v0.13.2/
---

### Features:

- added tooltip for all time warp buttons;
- added a small indicator for all probe cores for better orientation readability;
- construction of the launchpad continues! Workers made a little progress here;
- Adapter 1.2-0.5 was splited into two new parts with different set of connections;
- Adapter 1.2-0.35 was splited too;

### New rocket parts:

- Adapter Square-hexagonal;
- FT "Sticky" O

### Part changes:

- fixed effective volume for fuel tank FT "Zvezda-parallelepiped" О: it was two times capacious, than it should be;
- changed bottom sockets for Standard Reaction Wheel from hexagon to heptahedron;

### Changes:

- improved localization loading error messages;
- fixed "out of view frustum" erros spamming into console while loading the first scene of the game;
- reduced same game internal resources recreation on return to spaceport and then back to flight (should slightly improve loading speed);

### Fixes:

- exceptions in the console when rocket start exploding and quitting to the assembly shop at the same time;
- broken ascending / descending lines if two orbits have the same inclination;
- spacecraft is placed not in the exact center of a launchpad;
- "hide UI" doesn't work for the time panel in the spaceport.
- Phobos and Deimos missing surface textures;
