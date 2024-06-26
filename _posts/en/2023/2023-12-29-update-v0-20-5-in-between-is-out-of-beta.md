---
author: Arugin
title: Update v0.20.5 "In Between" is out of Beta!
description: In between of nowhere
date: 2023-12-29 23:11:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/6d549db17eb257eb230d7b7dad72ead8e53cd1fc_400x225.png
game: Rocket Science
---
This was a very hard beta cycle. Unity 2022.3 kept raining bugs, different problems and unexpected changes that constantly broke the game in different places. I couldn’t hope that those issues would be solved on the engine side in time, because even getting a reply from Unity staff is almost impossible nowadays, so I needed to find workarounds to them. Should I mention that most of the issues that I reported in August are still not fixed?

Anyway, I think this update is ready to come out. I’ve described most of its features in the [previous post](/en/posts/2023/update-v0-20-0-in-between-public-beta/), so let’s talk about the new parts that were not part of the beta and will be available in this release.

## New engines and fuel tanks

I’ve added two new engines this time. The process of adding them is pretty hard, because every single engine in the game is based on the parameters of the real ones and I spend a lot of the time on research of existing technology. These ones have a much higher ISP and are best suited for second and third stages of rockets. They have their own drawbacks and should not become the only and obvious choice during rocket assembly (at least I hope so).

![](https://clan.akamai.steamstatic.com/images//34094219/9dd229de6c1e87475738e56a06a75ea1a3cf2e94.png)
_"Electron-0210" Liquid Fuel Engine_

![](https://clan.akamai.steamstatic.com/images//34094219/ce0bcd8ff8bab60ac2308b6615f486dfeb061471.png)
_"Aragna-6410" Liquid Fuel Engine_

The only catch, that they should use a hydrogen-oxygen fuel pair. While the game was designed around different fuel pairs, some game systems are still not fully reworked to support that. For example, stage dV calculation, fuel level indicators, maneuver dv calculations is expecting a single UDMH/N2O4 pair. Also there are no warnings during rocket construction that will indicate that current engines are missing fuel. So, to simplify things, I decided to not add a new fuel pair for now, but I will definitely do it in the next update with the necessary improvements and reworks.

![](https://clan.akamai.steamstatic.com/images//34094219/47f0fd55413cc386e958d372010cf0e7db0717f6.png)
_FT "Piston"_

![](https://clan.akamai.steamstatic.com/images//34094219/cece9093620325ef7545a8b3d730fc5ad8859d62.png)
_FT "Bublik"_

## New decoupler, fairings and adapter

5 m diameter is getting more love now. New Apollo-style decoupler for that radius will make your rockets look much cooler and more convenient for use. Note that it actually consists of two separate parts, like payload fairings.

![](https://clan.akamai.steamstatic.com/images//34094219/3ac88d3a9bdb8b6b9becb5980b9289e8ff479684.png)
_"Rumble" Decoupler Adapter_

![](https://clan.akamai.steamstatic.com/images//34094219/312ec7c46e7da0bd4d1c5809ecbbdc28ff2e1d50.png)
_"Rumble" Decoupler_

I’ve also added another 5 m payload fairing set that should be easier to use for placing rovers inside.

![](https://clan.akamai.steamstatic.com/images//34094219/721746ffef77eff4e957d009e38c7197494f0f80.png)
_Payload Enclosed Base GO-5_

![](https://clan.akamai.steamstatic.com/images//34094219/e058d8294a42c4605248dfef907a6085ffb1ba71.png)
_Payload Enclosed Section GO-5 1.4m_

![](https://clan.akamai.steamstatic.com/images//34094219/dc2aada11c1f4ec8388d4f3349394733e0e5e858.png)
_Payload Enclosed Cap GO-5_

And the first 2.4 to 5 m adapter will provide you more choice while designing your rocket of dreams.

![](https://clan.akamai.steamstatic.com/images//34094219/5b90295a96964e935ec29641c3ec60c09e60394a.png)
_Adapter 1.2-5_

## New solar panels

There are two new solar panels that are not only compatible with each other, but can be perfectly tiled on a hexagonal connection.

![](https://clan.akamai.steamstatic.com/images//34094219/fa6998448dfd623c92019481c3ecceca1ab7adcc.png)
_"Gektoplast-A" Solar Panel_

![](https://clan.akamai.steamstatic.com/images//34094219/9aed56344e6d12c8281dcde953a9b76bae78f2bc.png)
_"Gektoplast-M" Solar Panel_

They are also very light and could be used on a spacecraft, where each kilogram counts

![](https://clan.akamai.steamstatic.com/images//34094219/ae839392f3f058b1bf986d781b1caabb318f2ac6.png)
_Combinatorial examples_

## Parts for skycrane

I released rovers in the previous update, but the game lacked some important parts to build fully functional skycrane. Using the next two parts combined with the rover payload fairing, you should be able to finally do it now.

![](https://clan.akamai.steamstatic.com/images//34094219/274eee2d9a55487083e06e67f4b1fe1b9bbe74f9.png)
_V-1 Sky Crane Base_

![](https://clan.akamai.steamstatic.com/images//34094219/e55d264d855355608523e8e0faa692862ab27612.png)
_Nano Reaction Wheel_

![](https://clan.akamai.steamstatic.com/images//34094219/c767be5ad0872aa0d6623140f1171e1dd5a39c15.png)
_Putting those parts into good use_

There are a lot of changes made to the game during this five month cycle, so I expect that not all bugs were hunted down. So if you encounter something strange, please report it to our discord or on the steam forums and I will try to fix it as soon as possible.

You can find full release notes down below. Another year has come to an end and I wish you good fortune in the year to come. Thanks for playing and see you in the next one.

![](https://clan.akamai.steamstatic.com/images//34094219/b8d8d10b3a3fd275d76f1b8ff191bcdd23e2edd2.png)
_Flying over Ceres_

![](https://clan.akamai.steamstatic.com/images//34094219/80864ff231a1f53c8b892935b852aa8cb2083b30.png)
_Flying over Vesta_

---

## v0.20.5 release notes

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
