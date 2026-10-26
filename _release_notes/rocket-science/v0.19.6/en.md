---
game: rocket-science
version: "0.19.6"
type: update
name: 'Awakened Assembly'
release_date: 2023-07-04
lang: en
title: 'v0.19.6 "Awakened Assembly" Release Notes'
permalink: /en/games/rocket-science/releases/v0.19.6/
---
**PREVIOUS SAVES ARE NOT COMPATIBLE WITH THIS VERSION OF THE GAME.**  
If you want to continue plaing your save or you have problems with this update, please switch to v0.18.x branch.

### Features:

- added parts for rovers;  
- slots and connectors on part attachments unified into one type, called sockets;  
- added blueprint mode for assembly shop, where you have no limits in rocket size;  
- added vertical assembly option when in blueprint mode;  
- added grid for rocket assembly and ability to toggle it on and off;  
- line socket used in planes was reworked and supports attachment at any point on the line;  
- line socket is used for side connections for most parts now;  
- added socket type filter for rocket parts in the assembly shop;  
- added star and butterfly sockets;  
- wheels can now have electric motors;  
- time panel was reworked and includes more info, pause buttons and map / blueprint toggle depending on the context;  
- added "Relaunch last selected flight" button to the time panel;  
- context menu now works for orbits on Solar system map;  
- you can set as target orbits from contracts now;  
- you can share your rockets via Steam workshop using rocket mods;  
- added rover "launch facility".

### New rocket parts:

- "Lunohod-2" Chassis;  
- "Lubopytstvo" Chassis;  
- L1 Twin Interplanetary Wheel;  
- L1 Interplanetary Wheel;  
- K2 Interplanetary Wheel;  
- Solar Panel SIGO-249;  
- Central Mini Rack;  
- Angled Extension Rack;  
- "SOHO" Probe Core;  
- "Mgnovenie" Probe Core;  
- Multi-mission RITEG;  
- "Om" Illuminating Device;  
- "Krater-B08-RM" Monopropellant Thruster;  
- "Delta" Adapter.

### New content:

- added "Land on Venus" contract;  
- added "Reach SSO orbit" contract.

### Part changes:

- most part variants that had a difference only in slot / connector in the attachment was removed due to sockets rework;  
- all deprecated rocket parts in previous updates had been removed;  
- some parts with dual and triple side sockets got line sockets instead;  
- increased range for pressure for the default parachute, so it could be used in the Martian atmosphere;  
- improved visuals for RS-05 Steerable Landing Gear suspension;  
- reduced power consumption for all probe cores;  
- reduced power production for all solar panels by 30%, to make them more realistic;  
- made "Sputnik-2" Probe Core smaller and better looking.

### Changes:

- rocket schema holds only state data now, as a result we get smaller rocket files and no need to write a migration, when changing part configs;  
- you can rename spacecrafts not only from control center, but also during the flight, by ALT+clicking on the name of the spacecraft on the time panel;  
- you can no longer remove spacecraft in the control center by right-clicking on it, you need to use Delete button;  
- renaming rocket during editing is changed to alt+left click to be consistent to the rest of the game;  
- part attachment movement smoothed when reattaching them from rocket part to rocket part;  
- symmetry now checks on reattach/detach, that the symmetric part have not only the same connection shape, but also the same type;  
- symmetry now properly handles all cases, when rocket part is reattached within one connection;  
- you can flip rocket part during rocket assembly using a hotkey now;  
- docking ports are represented with their own socket type now and have respective image;  
- reworked connection icons in the rocket part tooltip;  
- all engines, that previously have no throttle limits, received lower 5% throttle bound;  
- renamed game data folder from HDYLIEM to Rocket Science;  
- increased the distance you can zoom out the camera in the assembly shop;  
- camera no longer focus on attached part in the assembly, it moves along rocket's central axis instead.

### Settings:

- added **B** shortcut, that will switch blueprint assembly mode;  
- added forward **W** and backward **S** buttons to control wheel motors;  
- added **F** shortcut, to quickly flip the rocket part during the assembly.

### Fixes:

- you can't focus camera on not attached parts to the rocket using alt + click, while in assembly shop;  
- rocket part appears in the middle of assembly shop for a few frames when using symmetry;  
- rectangle socket sometimes is not connecting to hexagon socket;  
- you can't reattach already attached part to the same parent connection but different self connection;  
- target periapsis goal is set to 0 in the velocity vectors tutorial UI;  
- some rocket parts still flip when connecting top of the part to the bottom of the another one;  
- payload adapters are broken and don't handle attachments;  
- scene where you are making a custom navball is broken;  
- you can reattach part to a "hidden one" when symmetry is enabled.  
- when reattaching part from symmetric attachment to the non-symmetric one, detach symmetry doesn't work;  
- when reattaching part from non-symmetric to the symmetric one, attach symmetry doesn't work;  
- assembly shop become broken if you are stop editing the rocket and rocket part is still moving by the cursor.  
- rocket part could constantly switch between two attachments on alignment when user doesn't move their mouse;  
- crash when removing attaching part using Delete key, or when part was very close to the parts panel in some specific cases.

### Known issues:

- Rocket sometimes is not generating lift, when using relaunch button and there was a previous rocket on it.

