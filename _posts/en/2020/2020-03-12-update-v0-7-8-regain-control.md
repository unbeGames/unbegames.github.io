---
author: Arugin
title: Update v0.7.8 "Regain Control"
description: Better late, than late
date: 2020-03-12 22:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/dccb450b212dd3502ab5bf66d4e0bddd56773baa_400x225.jpg
game: Rocket Science
---
Hello, guys.

It was supposed to be another patch and I planned to release it last week, but some changes to the game required implementing missing features, some new features added more things to fix, some fixed bugs showed, that the game needs more changes and so on. I didn’t even notice, how all this work suddenly become an update.

I started dealing with the most common complaint: rockets are hard to control, especially in the lower atmosphere. It was pretty obvious, that reaction wheels alone can't handle it. So I needed to implement thrust vector control (TVC) for engines. While changing the angle of engine’s nozzle was simple, a lot of problems appeared when I tried to add TVC to spacecraft auto stabilization system. The problem is that the torque, generated using TVC is much stronger, than if you are using reaction wheels. And it depends not only from engine thrust and nozzle tilt, but from the engine position relative to the center of mass of the spacecraft. Thus I spent days trying to make stabilization system responsive, but so that it does not overshoot or wobble all the time. Only after I started to calculate all possible torque, that engines can generate, I could send correct values to PID controllers, that auto stabilization system uses, and spacecraft became more or less stable in the flight. As a result you can finally start to make gravity turn pretty much at any moment if you have enough engines with TVC and positioned them correctly on the spacecraft.

![](https://media.giphy.com/media/Jn3zfikEEoLqn0gc5t/giphy.gif)
_Such turns and stabilization after it would be impossible without TVC on that altitude_

After that the second problem immediately arose. Because of how camera is locked on the rocket and since there are no other references in the flight except spacecraft itself, there's the illusion that the center of mass of the spacecraft is located at the camera focus point. And since the rocket is turning pretty fast right now, it was painful to see. So I rewrote camera targeting system and now it focuses at spacecraft CoM by default. And you can switch it to any rocket part or move along the spacecraft during the flight.

![](https://media.giphy.com/media/W3TM7VyirO371MxQdF/giphy.gif)
_The top of the engine is in the camera focus right now. And there is an illusion, that CoM in that point too_

There are a lot more, that I did during the past two weeks (like velocity and orientation markers on navball, oh yes), but you can read about this in the update notes bellow. A small note about this update. I’ve tried to not introduce breaking changes to the game, so your save games should work, but all the spacecrafts you’ve created will not receive new features like TVC or changed stabilization parameters. So it is better to create the new ones. Also some new key bindings could be missing because of how controls settings saving are working. So it is better to check it or just reset controls to defaults.

Now I want to tell you about future plans a bit. The next most important features are: the Moon landing, improvements to orbit system, maneuver planner and symmetry tools for rocket construction. While the Moon are almost there (I need to fix a bunch of bugs and prepare textures for it), other systems are pretty big. Also I need to rewrite a mathematics simulation (when you are on orbit and engines are turned off) a bit, because I created it almost a year ago and it does not properly support a lot of new systems that I added later (like electricity, or checking spacecraft collision with the planet surface). Because of that I have currently no ETA for the next update, but I hope it will be in April and it definitely be huge.

That’s all for now, I hope you will enjoy this update!

## v0.7.8 release notes

### Features:

- added engine trust vector control for all engines except "Zarya-352" Liquid Fuel Engine;
- autocorrection system uses engines to turn spacecraft if TVC is available;
- added thrust limiter to engine window (previously it was just throttle with wrong name);
- added velocity and orientation markers on navball;
- you can remove parts using **Delete** hotkey in Assembly Shop;
- you can toggle auto stabilization using **T** hotkey;
- you can switch camera focus to any rocket part in the flight using **ALT + left mouse button click**;
- you can move camera along spacecraft using **ALT + mouse wheel**;
- you can reset camera focus to default position using **ALT + C**;
- the Moon can be seeing from the flight camera now (but it still not reachable yet :/ );
- added "remove spacecraft" and "enter into flight" buttons to the list of spacecrafts in the Control Center;
- new part category "adapters" in assembly shop;
- new connector type "rectangle".  

### New parts:

- basic fin;
- advanced nose cone;
- adapter 1.2m radius to 0.55m;
- adapter 0.35m radius to 0.55m;

### Changes:

- flight camera will focus at spacecraft's center of mass instead of command pod by default;
- to be consistent with the flight mode, hotkeys in Assembly Shop were changed:
- \- focusing camera on the part is **ALT + click** now instead of SHIFT + click;
- \- moving along the building is **ALT + mouse wheel**;
- some parts was moved from decouplers category to adapters;
- improved connector/slot selection during part attaching in assembly shop.

### Fixes:

- planet generation memory leak when orbiting around Earth a long time with in the time warp;
- one of the fuel tanks has incorrect connection position, which lead to rocket flip over;
- one-socket part can be incorrectly connected to triple connector part;
- rocket part outlines stays when switching to map;
- lightning artefacts on Earth on map view;
- parts sometimes stay connected to the rocket after removing;
- new part is not selected from list, when another part was detached from rocket and stayed selected;
- bottom visual slots on side fuel tank are missing;
- decoupler and adapter attached to command pod have wrong alighment;
- engine turn on after changing throttle, even if it was manually turned off;
- missing alpha gradients from orbits;
- spaceport camera stop rendering if selected spacecraft was removed in control center;
- selected value in dropdown sometimes not localized properly;
- wrong engine name in the tutorial;
- click on detached part opens part's window;
- close button not worked in spacecraft stats window.  

### Known issues:

- sometimes rocket receives huge side force on launch (need more evidence to solve this one). If you encounter this, you can try go to Control Center and remove any bugged spacecrafts;
- it is impossible to reattach part with socket from one connector to another (you can detach part and place it before attaching to another one as a workaround).
