---
author: Arugin
title: Update v0.9.0 "Make it Easy"
description: Better late than late, part II
date: 2020-09-29 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/70de82fad569617ce91b3855703ccc2558fb1675_400x225.png
game: Rocket Science
---
Greetings.

Today’s update is the first step in making rocket construction a more enjoyable experience. I have also rewritten a lot of game internals which allowed me to implement new features that weren't possible before. Below I will focus on the most impactful changes, and the full patch notes will be at the end of the post.

## Assembly Shop

Yes it’s finally here. You can build your rockets, using symmetry now! Since rocket parts can be attached to each other only using attachment points, symmetry in “How do you like it, Elon Musk?” works a bit differently than in other games.

First of all, there is a new symmetry control panel where you can change symmetry count in different ways.

![](https://media0.giphy.com/media/2dpBUvEiyg0WUeOjSH/giphy.gif)  
_You can also use **X** and **Shift-X** to do the same thing_

Radial symmetry supported not only on side attachments:

![](https://media1.giphy.com/media/XfGDb2eTXNr2aaGqhc/giphy.gif)

but also on one attachment with several slots.

![](https://media1.giphy.com/media/Rm2SewNIllsPpe4XvR/giphy.gif)

More complex cases are supported too:

![](https://media1.giphy.com/media/D1hV7v7tI4zglRhUQx/giphy.gif)

Lastly, you can cycle symmetry count just before connecting the parts:

![](https://media2.giphy.com/media/JYXN0dEQnCTMxgkdtT/giphy.gif)

But there are some constraints to this system. If symmetry count does not match with available attachments or one of the attachments is already occupied, it will not work. Also symmetry is calculated relative to the root part. Root part is the first part of the rocket. Since there are no constraints on what part could be the first at this moment, symmetry can give you weird results, if you start building your rocket from the fin, for example.

One thing that is missing right now is the symmetric part removing. This is a bit more complicated, because I store no info about what parts were added using symmetry. So you need to set symmetry before removing and it will remove all parts that will match the symmetry count. I need to think about it and test this feature a bit more before shipping.

The next feature that this update brings is parts copying. Press **Shift** and click or drag any part to copy it and all connected to it parts.

![](https://media0.giphy.com/media/VXkseYyuyxi5EZLXHq/giphy.gif)

I’ve also added a toggle to show the rocket center of mass, improved tools panel and fixed some bugs (especially with undo/redo).

## Flights

After a bunch of refactorings the data about each part position and rotation relative to the rocket is now available in the spacecraft simulation system. This allowed me to implement several features that were not possible before.

First of all, I can correctly calculate rocket bounds now. This means that spacecrafts in most configurations will be precisely placed on the launchpad (no more floating in the air).

Secondly, since solar panels orientation is available in the simulation, their energy production depends on angle between panel and Sun. Solar panels also no longer produce energy, while the Sun is occluded by the planet.

Lastly, payload fairing and cargo modules start to actually protect the parts placed into them from the atmospheric drag! This is a huge change, because this makes a whole class of parts useful during rocket construction.

And finally, command pod or probe core can have any orientation relative to the rocket. Navball and velocity markers will be oriented relative command pod orientation and not rocket up direction, like before.

Last change is also very impactful, because you can finally put satellites into orbit, using a launch vehicle.

![](https://media3.giphy.com/media/LoZM2NGaa8yxN5BIPv/giphy.gif)
_Decoupling on orbit is one of the most beautifull parts of the flight_

## General

There are many changes here, but here are some most interesting:

- rockets in the assembly are sorted by update time now, spacecrafts in the control center are sorted by mission time (newest first);
- added icons for ships, probes and debris in the control center and for the Solar system map. I will add proper spacecrafts filters in the next update, so you could show and hide spacecrafts by category;
- added 4 new rocket parts and changed the shape or parameters of some fuel tanks and adapters.

And last thing I want to point out is the game size on disk. Previously it was around 8Gb and I managed to reduce it by 2Gb using compression for Earth and Moon heightmaps. If you don’t see the change in size after the update, try to reinstall the game (Steam sometimes doesn't remove redundant files).

Once you've downloaded the update, you may need to restart your Steam client. In the off chance the game isn't working properly for you after the update, please try verifying the game files:

- right-click on How do you like it, Elon Musk? in your Steam Library
- select 'Properties...', then select the 'Local Files' tab
- select 'Verify Integrity of Game Files...'

That's all for today, I hope you will enjoy this update.

P.S. **Note**: saves from the previous versions of the game doesn't compatible with current version. I will think about adding save migration tool in the next update.

## Release notes v0.9.0

### Features:

- reduced build size by 2 GB by applying compression for planet heightmaps;
- \[Assembly shop\] symmetry tools are available during rocket construction;
- \[Assembly shop\] you can duplicate part or part group using hotkey;
- \[Assembly shop\] added toggle to show rocket center of mass;
- \[Assembly shop\] undo and redo now supports rocket part rotations;
- \[Assembly shop\] spacecraft will keep rotation that was set for it (after exiting an edit mode and during the flight);
- angular drag is now calculated and applied to rockets flying in the atmosphere;
- payload fairing and cargo modules start to actually protect the parts placed into them from the atmospheric drag;
- spacecrafts support any command pod rotation relative to the rocket and will appropriately orient navball, markers and direct controls;
- added icons for ships, probes and debris in the Control Center and for the Solar system map;
- total playtime is recorded into save slot (not counting loading time).

### New parts:

- Adapter 1.2-0.35;
- Series S Fuel Tank;
- Spherical Fuel Tank;
- L-shaped Block.

### Part changes:

- increased radius of Payload Fairing;
- reduced energy capcity for probe core "Sputnik-2" from 42 to 36;
- decreased diameter of "FT-800 Fuel Tank" from, 1.2m to 0.7m and adjusted its paramters;
- changed shape of Adapter 1.2-H and renamed to Adapter 0.35-0.6-H;
- added porthole to "Vys" Command Module;
- decreased length of "Adapter 0.35-0.55";
- changed shape of "Basic adapter" and added 3 more connection variants for it.

### Settings:

- \[Assembly shop\] hold Shift and click or drag rocket part to duplicate part and all connected to it parts;
- \[Assembly shop\] Press Ctrl+S to save the rocket;
- \[Assembly shop\] Press X to cycle through symmetry count;
- \[Assembly shop\] Press Shift+X to cycle through symmetry count backwards;

### Changes:

- changed the way rocket bounds is calculated, as a result fixed floating rockets over launchpad before launch;
- solar panels don't produce energy, while Sun is occluded by planet;
- solar panels energy production depends on angle between panel and Sun;
- added status, occlusion and production values into solar panel control window;
- improved parts attachment positioning for all the parts with only one attachment during rocket assembly;
- \[Assembly shop\] rocket parts keep pivot during rotation;
- \[Assembly shop\] added undo and redo buttons on UI;
- \[Assembly shop\] added sorting by update time for rockets in the Assembly Shop (last updated goes first);
- \[Assembly shop\] changed spacecraft orientation, so the command pod porthole is turned up;
- mission time for spacecraft is now calculated since liftoff;
- \[Control Center\] added sorting by mission time for spacecrafts (newest spacecrafts go first);
- improved performance of drag calculations (5-10x speedup);
- decoupler no longer disappears after use;
- decoupler is applying force to original rocket too during activation;
- reduced memory consumption, when there are a lot of rockets in the Math simulation;
- probe cores constantly consume electric charge, they will not recieve any control commands without it;
- rockets without command pod or probe core (for example, debris) could not receive any commands or open part windows.

### Fixes:

- reaction wheels not working if the spacecraft was decoupled from other spacecraft;
- rocket sometimes fall through Earth surface after collision on high speed;
- a lot of issues, when using "Undo" and "Redo" in the Assembly shop;
- exception thrown, if the rocket on the launchpad was removed through Control Center, and the next one was launched;
- some elliptic orbits flicker, when time lapse is enabled;
- rocket constantly move between Physics and Math world, if it landed and one of the rocket parts was destroyed at the same time;
- spacecraft icon sometimes is not shown on the map;
- rockets from previous save appear in the new save, if save slot was not cleared before starting new game;
- sometimes game freezes, when trying to launch spacecraft with a lot of parts.
