---
author: Arugin
title: Rocket Science v0.18.2 is now live!
description: Design pillar improved
date: 2023-03-17 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/a9a99780a64174ba545493b89586af8708236d6f_400x225.png
game: Rocket Science
---
Hello everyone!

It is finally time to release v0.18.2 "Connectivity" to the masses! Following a period of open beta testing where the invaluable help from you guys I now feel that it is ready for delivery. A huge thank you to everyone that's been participating in the open beta, providing me with feedback and bug reporting!

This update brings one major change — total refactoring of the rocket assembly system and a bunch of smaller fixes, part redisings and gameplay adjustments. You can read more about rocket assembly refactoring in the [previous developer update](/en/posts/2023/rocket-assembly-rework-stage-1/). But I want to point out several things.

1.  Your payload fairing will be broken, because I’ve changed how their attachment points work under the hood. All you have to do is to remove old broken fairings and install the new ones.
2.  This is only the first stage of rocket assembly rework. The next update the connector-slot system will be heavily modified and I will have to revisit every single rocket part and adjust it accordingly. That’s why there aren't many new parts in this update — I just don’t want to do the same work twice. I hope that after this change making rocket parts become easier and we will see more of them in the future.
3.  I will tell you about rocket assembly refactoring stage 2 in the following dev update, when I will have more things to show. But I can already say that the next game version will not be compatible with the current saves, because it is not feasible to write a save migration for those changes.  


Also I had to reset the game’s controls settings because I’ve changed a bunch of hotkeys. I need to add controls settings migration system, to avoid such resets, but unfortunately it needs at least a week of work to do it properly. Maybe some time in the future.

The full release notes are below. Please let me know if you will encounter any issues or bugs. See you next time.

![](https://clan.akamai.steamstatic.com/images//34094219/c1f4b8ca522b3f29e45df3317cd51153d238195d.png)
_Screenshot by BigManu2000_

---

## v0.18.2 release notes

### Features:

- total refactoring of the rocket assembly system, it is based on simpler code, is more stable and feels much better to work with;  
- you can change selected connection during rocket assembly by using hotkeys, if there is more than one variant;  
- added attachment/detachment smoothing during rocket assembly;  
- added global thrust limiter to the navball, you can change it by holding ALT and dragging throttle indicator or using **ALT**+**SHIFT** / **CTRL**.

### New rocket parts:

- Hexagonal Cargo I-beam;  
- Fibre Cargo Bay Cap.

### Part changes:

- reworked "Dvutavr" Cargo Bay;  
- reworked "Fibre" Cargo Bay Section and "Fibre" Cargo Bay Middle Section;  
- increased size for Cargo Fairing 1.4m

### Changes:

- changed how attachment points works on payload fairings (this will break the orientation of current fairings, you just need to reattach them);  
- symmetry rotation now works for parts, connected to one attachment;  
- you can change throttle by clicking on or dragging throttle indicator on the navball;  
- added rotation sound for not connected parts, if rotation step is above 1 degree;  
- removed dual_big socket and connector as they are not used anymore;  
- improved game launch time a bit.

### Settings:

- two new hotkeys for assembly Next Connection . and Prev Connection ,  
- changed hide UI shortcut from **ALT**+**Z** to **ALT**+**V**;  
- changed hotkeys for throttle step increase and decrease;  
- added hotkeys for setting global thrust limiter.

### Fixes:

- sun flares shine through the navball;  
- navball text changes brightness depending on camera exposure;  
- connecting two-connector part to heptahedron range slot is unstable and produces a lot of redundant sounds;  
- it is hard to select a slot during part attachment on high camera angles relative to rocket part;  
- wrong position for the part is assigned when connecting part with slots onto part with connectors;  
- sometimes parts stop to connect to each other;  
- various exceptions that happened during rocket assembly after which you need to reset the rocket;  
- collider offset calculations are missing for some parts during the bake when this should not be the case;  
- game sometimes crash on starting loading screen;  
- rare crash on game start.
