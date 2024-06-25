---
author: Arugin
title: Update v0.13.0 "Space stations"
description: RCS and Docking Port together are one of space explorers oldest tools
date: 2021-10-08 22:19:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/5f4e37b39a8178f6380b457c75878f4ff365ae65_400x225.png
game: Rocket Science
---
This is the biggest update in terms of gameplay and new parts so far. I would say all previous updates were just a preparation for this one. Let’s get right into it.

## RCS

Reaction control system is a set of monopropellant-fuelled small thrusters primarily intended for vessel orientation and translation in a vacuum. Players have requested implementing RCS from day one. But it was not easy because of the game's rocket construction system. You need to place rcs engines precisely near the rocket’s center of mass or symmetrically from both sides of it or spacecraft will constantly get unwanted torque. But the fixed-slot attachment system doesn’t allow that. So the only solution I found is to implement an auto balancer, which will adjust the throttle value of each RCS thruster to minimize unwanted forces and fuel consumption.

I’ve done that, but my solution is far from ideal. It is very resource-intensive and could fail to solve the current set of constraints (for example, if some thrusters on some axis are missing). Also it requeres reasonable placement of rcs thrusters across the rocket (at least two in each axis). I will definitely improve it in the future versions of the game, but right now if you have any problems with that you can always switch to simple rcs mode, which will skip the autobalance step and just fire all thrusters according to user input. Note, that if autobalancer could not solve current RCS it will automatically fallback to the simple mode which could lead to unwanted torque.

![](https://media4.giphy.com/media/pTQpQQJKtRZihyf2r6/giphy.gif?cid=790b7611b18fd8ddb2553ac20899100b091ca168e24d0d27&rid=giphy.gif&ct=g)
_H and N to translate forwad/backward, I and K to translate up/down, J and K to left and right_

![](https://media3.giphy.com/media/AIOVjRfP6T6T5rhlqJ/giphy.gif?cid=790b7611b63e322bcd1ea6c2b2f19981ff1abd373206816f&rid=giphy.gif&ct=g)
_For rotation use regular keys_

You can turn on / off RCS by pressing the R key and switch to the simple mode using the new RCS panel near the Navball.  
![](https://media3.giphy.com/media/5lsevsxRm7EMBcIA8s/giphy.gif?cid=790b76116f82dc07fa52c5f2500be723147caec321ccabbb&rid=giphy.gif&ct=g)
_You can also control RCS modes separately for translation and rotation_

One more thing: currently rcs is not used by the autocorrection system, this will be implemented in the next update.

And one more. RCS thrusters consume monopropellant (hydrazine). It was added as an additional fuel configuration for all small fuel tanks.

## Docking port

Docking ports were previously missing because it is almost impossible to dock spacecraft without RCS. Also you should be able to connect two docking ports during rocket construction from the hatch side. Which again didn’t work well with the game’s slot system. After much thought I decided to introduce a new “docking” connection type. You can attach two docking ports to each other if they both have the same radius. No connector or slots needed for that.

So the docking port not only allows to couple two spacecrafts on the orbit, but also gives an ability to transfer fuel and oxidizer through it. You can also control spacecraft from the docking port. It will still use the spacecraft's command module, but it will reorient all controls and navball relative to it.

![](https://media4.giphy.com/media/yUkhEWn5gFy3cY7kjm/giphy.gif?cid=790b76113744cff1d0c5358840065ea03de6d3d83ff4a6be&rid=giphy.gif&ct=g)
_The docking process is surprisingly satisfying_

![](https://media2.giphy.com/media/G8IJ3k2eY6jstJ7hdp/giphy.gif?cid=790b7611874078ceeecc030e6a74233487f93bbd7acf7d30&rid=giphy.gif&ct=g)
_Resource transfer is as simple as that_

## Closest approach nodes

Another very important feature needed for docking. You need to predict intersection with target spacecraft orbit and also target position to be able to intercept it. Maneuver planner allows that and produces two new orbit nodes for that: **intersection node** and **target position at intersection node**.

![](https://media2.giphy.com/media/neDO2u3sQu4osc4mwv/giphy.gif?cid=790b7611a86f7e9041d1e99e5ce4554c394cf2f9810c7c4a&rid=giphy.gif&ct=g)
_None, one or two intersections could be found for any two orbits_

So, when these two nodes are combined during maneuver planning, you will be able to intercept target spacecraft.

![](https://media3.giphy.com/media/BTrwBlTdKZ64cDI57n/giphy.gif?cid=790b7611401e5edd1c6a39e181fad22ef70499ea53d486e5&rid=giphy.gif&ct=g)
_Notice how separation becomes much lower after both nodes was brought closer to each other_

## Target markings

All nearby spacecrafts will be marked for you. You can hover over the mark to get the spacecraft’s name and distance to it. You can change marking range in the game settings and turn it on and off by pressing F4. You can also set spacecraft as target by holding ALT and clicking on this mark. And switch to it by double clicking (same as on solar system map).

![](https://media1.giphy.com/media/SIJuUPV0ENiYmiwwfC/giphy.gif?cid=790b76117ac0f38f60d5b4697c1457b452b53823ac2c5e58&rid=giphy.gif&ct=g)
_Default range is 200m - 50km_

## Autocorrection improvements

Autocorrection system now accounts for forces produced from TVC, RCS and reaction wheels at the same time and produces more correct control action. It also works in the predictive mode now and tries to proactively predict the future rocket orientation and apply needed forces accounting for this knowledge. This should make autocorrection more stable especially during the physics time warp.

## New parts

This update introduces 18 new parts. That's almost as much as it was during the first game release! Let’s look at them.

![](https://clan.akamai.steamstatic.com/images//34094219/0f82c3fcadfe4acd577c8922acef218b2be23e57.png)
_New command module and probe core_

![](https://clan.akamai.steamstatic.com/images//34094219/a6391d94f0ca6dc2f28f3e4de78f26e2893740e6.png)
_Two RCS thrusters_

![](https://clan.akamai.steamstatic.com/images//34094219/839dc8280653da85febcd188a8d22e7fdb86d9fb.png)
_Two RCS mount points_

![](https://clan.akamai.steamstatic.com/images//34094219/7c2aa242c8b255fa3775555a12da908e80aa366b.png)
_Two docking ports_

![](https://clan.akamai.steamstatic.com/images//34094219/e03d1c5db26a8e248db73d34766394a992a3921b.png)
_Two new decouplers. The first one also splits in two halfs during decouple (for payload fairings)_

![](https://clan.akamai.steamstatic.com/images//34094219/f3d69c7902379882a4e851b74050d1a19cca551c.png)
_Two new fuel tanks_

![](https://clan.akamai.steamstatic.com/images//34094219/a9ba01df6d2f1f83bdef6194be963a655e79c15e.png)
_Two more structure parts_

![](https://clan.akamai.steamstatic.com/images//34094219/acd9e7da685161a4fa45a02326b5b4cead1f7194.png)
_Four space station sections_

![](https://clan.akamai.steamstatic.com/images//34094219/714575fd51678ab315bc21a799463aa392f234f7.png)
_And one adapter and battery_

The one thing I didn't have time to do again is to make a new tutorial. Game changed a lot since the initial release and many new features were added during all updates. I think the next update will be almost exclusively devoted to the new tutorial. And also probably to the part’s window system during the flight. But this is the story for another time.

As always there are a lot more in this update, like new heat emission effect for all rocket engines, new docking camera mode, more sounds for spacecraft and ui and tons of fixes and improvements as always. The game becomes bigger and more complex with each update. And it is almost impossible to test everything solo now. So you can expect a bunch of new bugs that I did not find during local verification. Just report them to me and they will be fixed ASAP. You can find full release notes below. I am waiting for your feedback and will see you soon.

---

## Release notes v0.13.0

### Features:

- added RCS and rcs control panel for navball;
- added docking port: it not only allow to dock two spacecrafts, but also can transfer fuel and oxidizer between them;
- new connection type: docking port;
- added intersection and position at intersection nodes to the maneuver planner;
- added "Target" navball mode and manual switch between navball modes;
- spacecraft markers are now shown within a radius of 50 km around current spacecraft during the flight (F4 to toggle);
- implemented RCS autobalancer: it will try to select such rcs throttle values, so spacecraft can be moved or rotated without unwanted forces, even if rcs engines were placed not optimally;
- added new fuel type — monopropellant (Hydrazine) used by RCS;
- autocorrection now works in the predictive mode, that should improve rocket stability, especially during time warp;
- autocorrection from tvc, rcs and reaction wheels now work coherently with each other;
- added new camera mode: docking;
- added new part category "Control" where rcs and reaction wheels are placed;
- rocket plume will change its shpe depending on atmospheric pressure;
- added heat emission effect to all engines;
- added more sounds to navball and flight UI;  

### New rocket parts:

- "Druzhba" Command Module;
- "Grezy" Probe Core;
- "Ruby" embedded RCS;
- "Citrine" external RCS;
- "Fenek" Docking Port;
- "Navarin" Docking Port;
- "Ochrea" Radial Decoupler;
- "Hornet" Decoupler;
- FT «Zvezda-tzilindr»;
- FT «Zvezda-parallelepiped»;
- Circular Connector Block;
- Circular Crisscross Block;
- RCS Mounting Block;
- RCS Mounting Point;
- Hexagonal adapter;
- "Azimuth" Station Branching Module;
- "Axis" Station Branching Module;
- Medium Battery.

### Part changes:

- "Siphon" Radial Decoupler visual rework;
- Micro Decoupler now have smaller size and also received visual rework;
- reduced length and mass for Adapter 0.35-0.6-H by 25%;
- deprecated C-2 and S-2 connection variants for "Seeker" Decoupler (it was replaced by "Hornet" Decoupler);
- added hydrazine configuration for fuel tanks FT-800 Fuel Tank, Series S Fuel Tank, FT «Zvezda-sfera»;
- reduced time between staging parachute and actual parachute spawning;
- parachute spwaner's mass is now reduced by the mass of parachute on deploy;
- increased power consumption for all reaction wheels;
- slightly increased mass for "Osnovanie" Probe Core  

### Changes:

- rocket landed on any surface object (except directly on launch area) will no longer disappear after exiting to spaceport;
- rocket part animations now properly animate physics (no more exploding landing legs on low framerate);
- \[Assembly\] reset button now also resets rocket name if it was changed;
- pressing Q will also repeat last placed subassembly;
- improved connection search performance in the assembly shop;
- changed order of part categories in the assembly shop;
- updated all icons for part categories in the assembly shop;
- added decouple sound for all decouplers;
- moved space context menu to UI, so it will no longer be hidden by planets on solar system map;
- orbit tooltip will update its position, if hovered node is moving;
- orbit raycast will be hided if mouse is hovered over spacecraft, press ALT, to show it anyway
- maneuver handle will change its color depending on selected maneuver;
- when active command module is destroyed it try to transfer control to other command module if it exists;  

### Settings:

- added RCS translation keys: **H** and **N** to translate forwad/backward, **I** and **K** to translate up/down,**J**and**K**to left and right;
- added toggle RCS **R**;
- added toggle targeting **F4**;
- added min and max distance setting for celestial target;
- ALT+click on spacecraft's marker during the flight or on solar system map to set it as a target;  

### Fixes:

- gimbal controls work incorrectly, when command module is rotated relative to rocket;
- when flying up to other spacecraft in the space it may suddenly warp at huge distance;
- parts sometimes acquire wrong parameters after another part of similar type was destroyed on rocket;
- connection section in rocket part tooltip is showing even if there are no connections available;
- \[assembly\] rocket name not saved if it was changed but save button not pressed:
- symmetry doesn't work for some cases: heptahedron connector + heptahedron socket and hexdual connector + rectangle socket;
- some parts have noticeable gaps on edges, especially colored in orange;
- some text is not localized in the assembly shop;
- rocket controls not reset, when control buttons were pressed and switching to another spacecraft during the flight;
- the lit status of solar panels doesn't change if autocorrection is disabled and the rocket is rotating;
- some inconsistencies in part materials;
- sometime predicted orbits looks broken;
- game stuck when trying to create subassembly from cloned part;
- sometimes batteries are not charging;
- sometimes decoupled parts disappear after main spacecraft crashes onto surface;  

### Known issues:

- resource separation is broken for crafts with decouplers that was saved as subassembly (including first command module) and then loaded (found today, will be fixed soon);
