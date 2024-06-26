---
author: Arugin
title: Update v0.21.0 "Essentials" is now live!
description: I don’t know what you could say about a day in which you have seen the release of an update for Rocket Science
date: 2024-03-29 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/4a149e2df854fd813192ba04047d7c383f656ef3_400x225.png
game: Rocket Science
---

Hi, there! Three months have passed in a blink of an eye and it is time to publish the next update. This is a medium-sized update but it has a lot of changes under the hood. Because most of the changes were localized and there were no engine version updates, I decided to release this update without the beta cycle. We will see how it goes, but without further ado let’s dive into it.

## Support for different fuel types

As I mentioned in the [previous update](/en/posts/2023/update-v0-20-5-in-between-is-out-of-beta/), all the engines in the game are based on real world counterparts. And the last two engines I’ve added have a much higher ISP, but should consume a hydrogen / oxygen fuel pair instead of UDMH / dinitrogen tetroxide all the other engines use. But while the game was designed around different fuel pairs, some game systems were still not fully reworked to support that. For this update I’ve added a hydrogen / oxygen fuel pair and support for every single one of them. For example, stage dV calculation, fuel level indicators, maneuver dV calculations and even fuel transfer in docking ports are working not only for the H2 / O2 pair but for any other one I will add in the future.

![](https://clan.akamai.steamstatic.com/images//34094219/4bb77875fab9e8a8c7a7e18284327185dcd5dd1d.png)
_All engines and fuel tanks tooltips have color coded fuel indicators now_

This change would greatly affect the rocket design. See, liquid hydrogen has a very small density and mass. At the same time engines that use it have much higher ISP which means they are more efficient. So the upper stages of a typical rocket will be much lighter, but carry less fuel for the same volume. Because of that you will probably build smaller lower stages or could make the upper ones bigger depending on your need. I'm looking forward to seeing screenshots of your new designs.

![](https://clan.akamai.steamstatic.com/images//34094219/0a55ddeeaa202bc5a15425afcc6e8532d458a8cf.png)
_Stages now grouped by fuel consumption, have fuel indicators too and change color to red, when the stage doesn't have fuel that engine use_

It is also interesting that the USSR designed and built only three different engine models that used hydrogen as a fuel. So I’ve added the missing one. But it looks like another popular fuel pair is just around the corner.

![](https://clan.akamai.steamstatic.com/images//34094219/4e1b6a8caf1b35949d9949bb5667a7f9f74cef97.png)
_Meet 1-socket "DVK-1" Liquid Fuel Engine_

## Assembly improvements

You can finally change configuration for already attached parts. All you need to do is to switch to “Select mode” on the instruments panel and then click on the part you want to change. Symmetry is working too.**Note**, that at this moment, only existing configurations are supported. For example, you can change fuel type, decoupler resources pass mode or control surface parameters for the attached part. I will add full configuration support for all the parts in the next update, because it will be easier to change by combining it with the redesign of the rocket part flight windows.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExejdiM2NnZnYxY3I3bnFhaG95ZW1pYWN0cjZtbTA4a25tMDhrd3JxcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/79jE1DhnbNPqQFxPre/giphy.gif)
_Just switch to the Select mode and click on part you want to change_

I’ve also added support for 8-way radial symmetry. It is a bit awkward because it can produce buggy looking results when trying to attach 8 fuel tanks that have the same size as a central one. But this is not the only use case for that and it opens more design space, so why not.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNzl0bnAxcTR4NGQ4dnhwOXdsZHcwbmoyc2Z4YWxvazI0aGxnZmJ0MCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/XJGWOeVrFumM6Vclzz/giphy.gif)

Below some new parts structure parts, made with 8-way symmetry in mind.

![](https://clan.akamai.steamstatic.com/images//34094219/25865ca8efe6f0946c20952dfb44c1b0050e477d.png)
_Octagonal Prism O-100_

![](https://clan.akamai.steamstatic.com/images//34094219/74b7ffd1601c5305d93abd908bf317225b9d09bb.png)
_Octagonal Prism O-200_

![](https://clan.akamai.steamstatic.com/images//34094219/fcb736e77c8abbebb8f91bce8e7c75420dad8790.png)
_Structural Adapter Octahedron-Hexagon_

I’ve also made a full rebalance pass on all fuel tanks in the game. I have developed several formulas and carefully recalculated all part parameters, including mass, surface area and volume, making it much more consistent. Thanks to this change, most of the tanks, especially medium sized ones, can hold more fuel now. I also found a bug in the calculations that made all cubic-shaped tanks hold two times less fuel than they should do. And now it is fixed too.

## Flight changes

Another one most requested feature is to warp to a point on the orbit. And now you can finally do it!

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExY2VjaDBjNGV2cDgzampsYWY0aGFvdWJ1MHFvN3k0djE2bHZqc2RqbSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/1gvv1B9RR69B8GzROC/giphy.gif)
_I can't even imagine how I lived without this feature before_

I’ve also added a button to the maneuver panel, so you can warp 10 seconds before the start of engine burn. Not only that, but there are a set of indicators with sounds that will help to make your maneuvers much more precise.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYmR3bDNhdWlkbDVoNXg1OHpwY3pvZ3F3ODR1dTdyMHlqZDF1N29nOSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/iEaLGjD0MQzMwGvvIW/giphy.gif)
_Making maneuvers become very enjoyable process_

I’ve also added two more indicators to the time panel. One will light up every time the game is in physics simulation. Another one – when automatic time warp was initiated. I hope this will answer a common question, why time warp sometimes is not working as expected.

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExOGw0bGx4M3F5YmkwaGRraTEzcGh0MjBicWdoZmV3d2txc28xMDg1cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9QwuJyz57Bsuu5wXEg/giphy.gif)
_The third indicator is reserved, I haven't figured out what it can be used for yet_

## More UI redesign

Assembly shop and main menu UI was visually redesigned to approach the quality standard set by the flight UI. There are plenty of old interfaces left in the game, but I will deal with them sooner or later.

![](https://clan.akamai.steamstatic.com/images//34094219/ab2658fbeae4a6254b338c1878fd158e2b2b55d9.png)
_Parts, rockets, spacecrafts and assembly lists were greatly improved_

![](https://clan.akamai.steamstatic.com/images//34094219/76db48cfc92241f4cb9c96ae013ab61bd4b73054.png)
_As well as some smaller UI elements_

## Textures improvement

Solar map textures of all gas giants were improved. I’ve also added solar map materials to 4 biggest Jupiter satellites.

![](https://clan.akamai.steamstatic.com/images//34094219/30f0713f06bdbbc8bcda71fdf4daa645ad1c16af.png)
_If a planet still has no surface materials, it will load solar map texture now. I think it is better that just a white sphere, despite it has very limited resolution_

As always, there is much more that this update brings. You can find full patch notes below. Thanks for playing and stay safe!

⚠️**Important!**  
Your old save file is compatible, but it is highly recommended to rebuild all your rockets, because old ones will not recive updated paramters or simply could not work properly.

---

## v0.21.0 release notes

### Features:

- added H2 and O2 fuel pair;  
- added Select mode for Assembly and ability to change rocket part configigration for already attached parts;  
- full rebalance pass on all fuel tanks parameters;  
- added 8-way symmetry and part variants, that support it;  
- added warp to maneuver button and start burn indicators to maneuver panel;  
- all planets, that still have no surface, now use textures from the scaled space model, instead of just a white sphere;  
- added Callisto, Ganymede, Io and Europa solar map textures;  
- improved all gas giants solar map textures;  
- \[Space context menu\] added warp to point option;  
- added two indicators to the time panel, that will show if the game is running physics simulation or if auto time warp is used;  
- added more sfx to the game;  
- redesign of some old interfaces;  
- added irregular moon celestial body type and corresponding map filter.

### New rocket parts:

- "DVK-1" Liquid Fuel Engine;
- Octagonal Prism O-100;
- Octagonal Prism O-200;
- Structural Adapter Octahedron-Hexagon;
- "Mini-Prizm" Fuel Adapter;
- "Mini-Cone" Fuel Adapter.

### Part changes:

- engine 6 and engine 7 now uses H2+O2 fuel pair;  
- corrected engine_skycrane hydrazine consumption;  
- adjusted visuals and slot positions for decoupler_radial_1.

### Changes:

- significantly improved fuel tanks attachment stability, when trying to connect it to the radial decoupler;  
- advanced assembly tutorial received additional tutorial steps, clarifying some assembly mechanics;  
- advanced assembly tutorial was split into two parts, to reduce its size;  
- stage groups with engines now have fuel type indicators;  
- collapsed stage groups are now grouped by fuel type;  
- stage fuel navball indicator now works with any fuel that engines consume;  
- stage fuel navball indicator now calculate amount and % for entire fuel pair instead of only fuel alone;  
- added indication that engines have no required fuel in the stage to stage group;  
- base time warp in the spaceport is 1 now (previously was x10);  
- time warp acceleration / deceleration is frame rate independent now;  
- game will unpause if you click pause button a second time;  
- changing time warp using hotkeys will also unpause the game if it was paused;  
- orbit raycast no longer processed if orbit point is behind the celestial body;  
- small improvements to scaled space atmosphere computation, that will improve its quality;  
- added window for parts, that contain kerosene;  
- improved UI for widescreen displays.

### Fixes:

- symmetry not working when trying to detach / reattach fuel tank from decoupler;  
- sometimes you can notice a strait line on a planet surface;  
- sometimes there is a wrong ambient light color when flying over the planet;  
- dV is not calculated for hydrazine engine on stages;  
- dV is incorrectly calculated when stage contains more fuel or oxidizer than required by engine's consumption ratio ;  
- sometimes maneuver placed using orbit context menu, appeared in the wrong place or not appear at all;  
- orbit raycast distance is resolution-dependent;  
- orbit with section sometimes looks broken;  
- orbit raycast doesn't work on high eccentric orbits with no sections;  
- orbit with encounter doesn’t reset it's shape after switching to spacecraft with this orbit and to another one;  
- wrong door connection between coal generator and elevator;  
- sun flares are visible through solid geometry, when the sun is near the edge of the screen;  
- fuel transfer in docking port window doesn't work;  
- placeable actions subpanel remains visible, when exiting to rocket list and assembly was in Select or Rotate mode.
