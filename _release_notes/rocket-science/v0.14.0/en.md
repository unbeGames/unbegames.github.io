---
game: rocket-science
version: "0.14.0"
release_date: 2021-12-24
lang: en
title: 'Release notes v0.14.0'
permalink: /en/games/rocket-science/releases/v0.14.0/
---
### Features:

- added Winter Holidays event which will last from December 24 to January 14;
- launch site was completely reworked it is closer to reality and has more buildings and structures;
- reworked space center above the ground, it now exactly match launch site structures;
- added more buildings into space center;
- surface objects mods now support surface height painting;
- added simple wasd controls to move camera when working with surface mods;
- all default fixed bodies will be loaded when creating or editing amy surface object mod;
- tutorial improvements: added fallback steps when player failed to follow instructions (he had one job!);
- improved control settings window and categorised input actions for better readability;
- added support for exclusive fullscreen mode;
- separated display resolution from refresh rate settings;
- added a bunch of new quality settings which will help to solve some of performance problems on older GPUs;  

### Part changes:

- landing strut was moved 10 cm lower relative to the connection;  

### Changes:

- camera is respecting surface object collisions now and tries to avoid it;
- controls settings window now fully supports localization;
- added space (and also hotkey) for the one more time scale on the time panel (will be implemented in the future);
- profile picture moved to the time panel;
- planet will be generated 2 times faster on CPUs with 6+ cores;
- camera speed in the spaceport no longer depends on game's FPS;
- increased camera movement bounds in the space center;
- shore lines will always have slightly higher LOD for better quality now;
- reduced RAM and video memory consumption in the spaceport;
- the game will fallback to English instead of Russian when localization files are invalid or some locale keys are missing;
- significantly improved quality of save game and mod previews;
- added "enter assembly shop" and "back to spaceport" buttons when viewing the rocket list in the spaceport.  

### Fixes:

- game stuck on loading very rarely;
- control center UI is completely missing;
- light leaks from control center into small storage;
- light leaks appear at morning and evening in the space center;
- staff levels are broken on staff panel in the control center or storage;
- stars are jittering in the main menu;
- sometimes shadows are too dark in the surface mods;
- \[assembly\] part variants ordering of categories sometimes changes.

