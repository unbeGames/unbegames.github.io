---
author: Arugin
title: Update v0.16.8 "The First Planet" is out of Beta!
description: done -y
date: 2022-06-17 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/e65902cc5bac32ccaa3676c47496ce82749b35af_400x225.jpg
game: Rocket Science
---

Two weeks ago I've released ["The First Planet" update](/en/posts/2022/update-v0.16.2-the-first-planet-public-beta/) into public beta. Thanks to the game community, I got great feedback and received a ton of bug reports during the beta. All the critical ones where successfully fixed and the game is now much more polished and stable.

Here is a quick summary of major changes in v0.16 version: Mercury, procedural texturing rework for Earth and Moon, rocket staging improvements, new payload fairings, contracts enhancement, new rocket parts and so many fixes as the game has ever seen.

Below are patch release notes and full release notes. Thank you for playing the game and helping to improve it!

![](https://clan.akamai.steamstatic.com/images//34094219/e949066371a95b43b500ca34be2f2bf1ab7c9185.png)

## Full release notes v0.16.8

### Features:

- added Mercury and reworked its textures on solar system map;
- reworked Earth and Moon procedural texturing;
- added ability to collapse and expand stages during rocket assembly and flight;
- added approximate deltaV and TWR calculations for stages, that contains engines;
- payload fairings rework: they are section based now and can be any length;
- payload fairings are present in the rocket staging;
- you can focus camera on surface objects and set them as a target;
- added target markers for surface objects during the flight;
- contracts with "land in distance" goal will now add a surface object marker, if it wasn't already added (via mods, for example);
- contracts with "reach an orbit" goal will now add a target orbit that needs to be reached;
- added camera exposure compensation settings for flight and map cameras;
- added Venus heightmap to the game, this is a first step to actually adding Venus;
- new solver for hyperbolic orbits, that can handle all edge cases and is much faster;
- improved Earth's atmosphere colors, making it more physically accurate;
- added Focus button to the map context menu for currently active spacecraft;
- slightly increased a size of planet collision on the Solar system map;
- added fuel depletion sound for engines;
- added 9 new bodies (mostly transneptunian objects) to the Solar system map.  

### New rocket parts:

- Payload Fairing Base GO-1;
- Payload Fairing Section GO-1 1.4m;
- Payload Fairing Section GO-1 3.5m;
- Payload Fairing Cap GO-1;
- Payload Fairing Base GO-5;
- Payload Fairing Section GO-5 2.1m;
- Payload Fairing Section GO-5 5.25m;
- Payload Fairing Cap GO-5;
- Payload Fairing Adapter GO-1-5;
- Payload Fairing Adapter GO-5-1;
- Circular Extended Unit;
- "Fluffy" Landing Strut;
- Mini Decoupler;
- "Clap" Longitudinal Decoupler.  

### New content:

- added reach "Molniya" orbit contract;
- added reach "Tundra" orbit contract;
- added land on Mercury contract.  

### Part changes:

- deprecated Payload Fairing 3x7  

### Changes:

- the process of destroying a part by dragging it to the parts panel has been improved;
- improved rocket action group visuals;
- spacecraft will no longer create a ton of new spacecrafts if it was destroyed not in main simulation;
- added sounds for rocket stages UI;
- some parts of the game engine were updated to the newer version, which will help to migrate to the new Unity version in the future;
- stage tooltip will now use engines throttle in the calculations for active stage;
- stage tooltip on an active stage will be updated when hovered;
- rockets with broken orbits will not load after game restart;
- improved perfomance of encounter search for spacecrafts;
- imrpoved perfomance of high-value time warps.  

### Fixes:

- rocket receives incorrect center of mass and could loose control after decoupling parts in some cases;
- if you remove maneuver in the middle of maneuvers chain, following manuvers can become invalid and just disappear, leaving orbit in the incorrect state;
- visible seams on the surface of planets in some places;
- \[Control Center\] sun light leaks into new buildings at summer;
- sometimes separated parts are positioned incorrectly during rocket explosion;
- \[Assembly Shop\] connection points are flickering;
- splitted decoupler sometimes explode on deploy;
- payload fairings explode on deploy without any reason;
- forces not applied to the decoupled rocket from docking port;
- context menu appears in the incorrect position when grounded spacecraft is selected;
- contract button stays in hovered state when contract was canceled or completed and the new one was accepted;
- game crashes, when the surface mod editor is loading and the left mouse button is pressed;
- can not scroll camera to Makemake;
- \[partial\] lens flares could be seen through the planet;
- incorrect space context menu position when you select currently active spacecraft and rotate the camera;
- rocket trigger crash multiple times when time warp enabled and player is in the control center;
- missing some locale strings;
- exception when opened control center launch window and selected rocket were removed before that;
- rare exception when rocket is changing SOI in some strange conditions;
- dark lines in the atmoshpere on a low sun angles and high altitudes;
- rockets that are leaving body's SOI could accidenetely warp to their sattelites
- Pluto's sattelites are not hoverable on the map;
- Makemake has no mass;
- splited decoupler receives incorrect positioning after decouple, if it was placed far from rocket origin.
