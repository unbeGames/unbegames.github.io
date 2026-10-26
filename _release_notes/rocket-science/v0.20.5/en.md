---
game: rocket-science
version: "0.20.5"
release_date: 2023-12-29
lang: en
title: 'v0.20.5 release notes'
permalink: /en/games/rocket-science/releases/v0.20.5/
---
### Features:

- added Ceres;  
- added Vesta;  
- Mars textures rework  
- added scaled space filters;  
- added celestial bodies list into Control center;  
- added search functionality to tracked objects list in the Control center;  
- added panel for manual adjustments of the selected maneuver dV during the flight;  
- resources panel can display all resources, that spacecraft has;  
- added orbit info panel during the flight;  
- predicted orbits are displayed relative to target frame of reference now, when you focus camera on it;  
- added correct ambient light when flying over surface of the planet;  
- added manual brakes for wheels and the corresponding indicator to navball (use ALT+B to toggle).

### New rocket parts:

- V-1 Sky Crane Base;  
- "Rumble" Decoupler and "Rumble" Decoupler Adapter;  
- "Aragna-6410" Liquid Fuel Engine;  
- "Electron-0210" Liquid Fuel Engine;  
- FT "Bublik";  
- FT "Piston";  
- "Gektoplast-A" Solar Panel;  
- "Gektoplast-M" Solar Panel;  
- Payload Enclosed Base GO-5;  
- Payload Enclosed Cap GO-5;  
- Payload Enclosed Section GO-5 1.4m;  
- Nano Reaction Wheel;  
- Adapter 1.2-5.

### Part changes:

- Zarya engine geometry rework;  
- "Mgnovenie" Probe Core decreased in size;  
- batteries slightly reduced height and mass;  
- simplified all engine colliders;  
- adjusted size of combustion chamber on some engines.

### Changes:

- added safeguard, that should check if any spacecraft received a NaN position during orbit calculations and destroy that;  
- parachute auto cut now triggers when spacecraft touches the ground, instead of near zero speed check;  
- rocket command module selection will prioritize ordinal command modules if there are cockpit or rover present alongside;  
- riteg will calculate decay time from launch not from the time it is created in the assembly shop;  
- you can toggle on/off delete hotkey for tracked objects list now;  
- improved control center tracked objects list UI;  
- improved loading times, when entering spaceport or assembly shop;  
- game consumes on average 400 Mb less memory;  
- "time" debug command now supports input date in string format;  
- added support for DirectX12 and Vulkan API (that can be faster on some PCs), that can be enabled via command line parameters:  
\-force-d3d12  
\-force-vulkan

### Fixes:

- planet surface disappears if you quit to main menu from the assembly shop in blueprint mode;  
- exception when trying to attach something on top of engine 4;  
- spacecraft with wheels no longer transitions into sleep state when it is no longer moving and after steering was used once;  
- rocket can still receive wheel commands even when command module is destroyed;  
- maneuver sometimes not placed via context menu;  
- orbit planner sometimes predict wrong intersect nodes;  
- crash when setting the Sun as a target;  
- you can't unset target when surface object was set as a target;  
- riteg uses part attachment date as a decay start instead of launch day;  
- Circular Extended Unit has wrong orientation for radial dual attachments;  
- time warp not working, if spacecraft's lights are on and there is little electricity left  
- different typos and missing translations in assembly;

### Known issues:

- navball text changes brightness depending on exposure (unity bug);  
- SSAO is mostly turned off during the flight because of artifacts (unity bug);

