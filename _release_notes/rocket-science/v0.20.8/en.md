---
game: rocket-science
version: "0.20.8"
type: patch
release_date: 2024-01-16
lang: en
title: 'v0.20.8 Release Notes'
permalink: /en/games/rocket-science/releases/v0.20.8/
---

### Part changes:

- rotation step for hexagon, heptahedron, star and heptahedron range sockets increased from 6 to 36 steps;

### Changes:

- updated to latest Unity patch version, increasing the game stability;
- removed CRC check on asset bundles, that can randomly prevent the game from starting up;
- removed some shader duplication wich should improve performance;
- update game input module to a version that fully supports current Unity Engine.

### Fixes:

- spacecraft item lose status line when spacecraft name is too long;
- newely created rocket could failed to save, if rocket with the same id did not load properly;
- game crashes on quit from flight or spaceport;
- black squares appears on windows in the assembly shop;
- orbit stats panel breaks when changing SOI from Earth to Moon;
- flipped socket for nano reaction wheel;
- visible tiling on skycrane material;
- crash on skycrane detach when spacecraft is on the ground;
