---
author: Arugin
title: Update v0.8.1 "To the Moon!"
description: That's one hard update for developer, one giant leap in quality for the game
date: 2020-08-25 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/3371d8e8989ace69840b7e58094650d90ef6463b_400x225.png
game: Rocket Science
---
So the update is finally here. I couldn’t even imagine that it would take so long, but I am far more satisfied with the current state of the game, than with the original release. So let's talk about new features and changes that this update brings.

## The Moon and interplanetary flights

New celestial body to explore and new challenges to overcome. While first stable orbit around and first impact into no-Moon were already achieved by [Admiral Andre](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DyQRyFnkvOJY) in February, landing, let alone returning to Earth after that, is like playing in the hardmode with enabled Iron Man right now. That’s because there are not enough rocket parts and tools to precisely configure your spacecraft for such mission. Also you have no way save during the flight and to revert the game to the last save point. It is an interesting experience, but it always feels bad, if you lost your spacecraft during landing, because of some unfortunate bug. So I will add the ability to save current flight and revert it to that save point in one of the following updates. More parts and better tools are in the roadmap too.

![](https://media3.giphy.com/media/jql9taPrNPxJUgFisM/giphy.gif)
_On the high Lunar orbit_

![](https://clan.akamai.steamstatic.com/images//34094219/e6a628917cab7ac142084622cd4bf98bd7d9e1d3.png)
_One of the many Moon's craters_

## Obits system rework and Maneuver Planner

Orbits have a solid foundation right now. I am pretty happy with the current performance and quality of this system. Maneuver Planner is based on that foundation, and despite its a bit rough state, it is great and must-have addition to the game. There are plenty of features that are missing right now, for example, ascending and descending nodes, closest approach nodes, target system, etc... But this will be relatively easy to add in the future. By the way, you can use Maneuver Planner directly in the Control Center without going into flight mode. Pausing the game (~ by default) will help with that.

![](https://media2.giphy.com/media/jTwOZeCgWdyI2Bzitg/giphy.gif)

## Better interaction between spacecraft and the world

Spacecrafts no longer explode 10 meters above the ground. Part animation, like extending solar panels, will change physics shape and part parameters. Rocket parts could explode on collision with each other during the flight, if impact force will exceed the impact tolerance of the part.

![](https://media3.giphy.com/media/MdM9qiPMhYVoZKAsk5/giphy.gif)

## Improved aerodynamics

The game is calculating up to three drag force vectors per rocket part and applying it to the actual physics shape, instead of only one combined vector, applied to the part’s center of mass. As a result, rockets with a small number of parts will be more affected by aerodynamics, than before.

![](https://media0.giphy.com/media/KCMH1QTjDshPXuqj9g/giphy.gif)
_In the previous version of the game command module would receive no torque at all_

## Rocket assembly improvements

Not much here, but I fixed two critical bugs during rocket construction. Also I improved attachments raycasting, so it will be a bit easier to attach parts to the rocket.

## New parts and parts changes

Parachute and landing struts were a new challenge to implement, because they have internal state and animation, they should react to the world around and be aware of the main spacecraft state too. But despite all problems, they are in the game now. Another important addition is the new probe core, which is much lighter than “Vys” command module, but has no builtin reaction wheels and very little electric charge. This probe core also introduces a new rectangle socket, which will perfectly combine with some other existing connectors. Last but not least, the dry mass of all fuel tanks was reduced by around 15%. It should help you to put more payload into an orbit.

![](https://media2.giphy.com/media/XEI3Xk8bCdQkGer9DP/giphy.gif)

## Extended soundtrack

11 new tracks were added into the game along with new ingame music system that would track your spacecraft state position and will change tracks depending on that. These tracks were also added into “How do you like it, Elon Musk? Soundtrack”, so all owners of this package will automatically receive them for free.

![](https://clan.akamai.steamstatic.com/images//34094219/a9c665d2a55c2b8d081bb3f2b216c735a3a1dd1c.png)
_A bunch of rockets were destroyed during development of this update_

There are a lot of other changes, fixes and improvements (as well as new bugs =/). You can see the full changelog below. But I want to talk about what's next. The weakest part of the game right now is the rocket construction. As I said earlier, it has a lot of missing tools and quality of life features. It also requires rewriting some parts of the whole assembly system, to make things like symmetry and saving subassemblies possible. This will be my top priority goal and I will focus on it the next month or two. Before that I will probably release small update, that will add analytics into the game, so I could see, which rocket parts are popular, and which have never been used

That’s all for today. **Thank you all for your support, feedback and reviews!** This update wouldn’t be possible without that. See you in the next one.

P.S. If you have any problems with this update, try to verify integrity of game files first. Sometimes Steam doesn’t download a file or two for some reason. Also this update is compatible with old save files, but rocket part changes will not affect already constructed rockets. So if you have problems there, try to start the new game.

## Release notes v0.8.1

### Features:

- added support for interplanetary flight;
- added the Moon;
- implemented maneuver planner and encounters prediction;
- added 11 new tracks and improved playlist selection during flight;
- improved aerodynamics for rockets with small number of parts;
- added proper support for parabolic and hyperbolic orbits;
- game is now supporting up to 500 orbits rendering at the same time without dropping fps on the average PC;
- new orbit nodes: impact, encounter, escape;
- approach time to orbit nodes and maneuvers is showing now, when hovering mouse over them;
- added proper environment shadows during flight;
- new 16-bit temperature map for Earth, it will make planet texturing more smooth and reduce noisiness,
- new high quality color and normal maps for Moon on the Solar System map;
- added automatic camera exposure control and adjusted values during flight and on the Solar System map;
- added sun flares;
- updated main menu scene;
- animated rocket parts not only change visual appearance, but affect physics shape and rocket parameters;
- new autostabilization mode: maneuver;
- new socket types: rectangle, dualhex.

### New parts:

- Frontal Parachute is working now! (kinda of)
- "Feather" Landing Strut;
- Standard Reaction Wheel;
- Payload Fairing 3x7;
- Micro Decoupler with 3+2 variants
- two more variants of "Seeker" Decoupler.

### Part changes:

- "Vys" Command Module:
  - reduced max torque from 20 kN to 18 kN;
  - reduced consumed power from 0.53 to 0.48;
  - increased mass from 740 kg to 850 kg;
  - reduced electric charge amoun from 135 to 120;
- Small Reaction Wheel: increased max torque from 4.5kN to 6kN and consumed power from 0.1 to 0.14;
- reduced dry mass of all fuel tanks by ~15%;
- changed visual appearance of Adapter 1.2-0.55 C-4 to make the compartibility with "Clicker" Longitudinal Decoupler more obviuos;
- added single socket on top of the "Sputnik-2" Probe Core;
- "Energia-C8.95" Liquid Fuel Engine increased thrust and fuel consumption a bit (impulse didn't change).

### Settings:

- added orbit markers size configuration;
- added scroll sensitivity for manever planner handle;
- new hotkey G - to toggle landing gear;
- press "Delete" while on map view to remove selected maneuver node.

### Changes:

- changed collision detection method, it will no longer produce phantom colissions, but sometimes may miss collision on fast moving objects;
- rocket parts could explode on collision with each other;
- improved attachment search while assembling the rocket;
- spacecrafts with applied torque will continue infinitely rotate in space (if auto stabilization is turned off);
- rocket consumes correct amount of electric charge when it is in Math simulation;
- spacecrafts position is checking against planet heightmap in Math simulation;
- increased max possible angular speed of all bodies;
- orbit markers and text have the same size no matter how far they are from the camera;
- antialiasing is now applied to orbits;
- improved orbit colors and rendering;
- only section of orbit is generated and rendered in some cases (like when part of the orbit is bellow the surface);
- improved perfomance in spaceport;
- sun is more yellowish now in the map view;
- autocorrection in Math simulation is more precise;
- last activated stage in flight will be saved with spacecraft;
- reordering action groups shift folowing groups instead of swap;
- spaceport authorities have finally continued construction of launchpad!

### Fixes:

- rockets explode in air far from ground;
- stage activation breaks after some rocket stages was destroyed by impact;
- rocket can not be crashed onto launchpad (fixed for most of launchpad, except the exact start point to avoid rocket exploding on engine start);
- seams on planet, visible from certain distance and light angles;
- higher level of detail of planet surface sometimes doesn't load;
- when rocket flying on hyperbolic orbit, it is going into abyss after some time;
- game freezes when entering atmoshpere with huge time warp multipler;
- decoupled rocket part moves strangly to the sides sometimes;
- rocket fall through the surface of planet and continue flying sometimes;
- different artefacts on planet in flight mode on very high orbit;
- incorrect normals in map view on all planets;
- grid-like artefacts on oceans on Earth in the map view;
- ocean flickers a bit when rocket is falling down;
- rocket shadows not changing, when changing rockets in assembly shop;
- various light leaks in spaceport;
- broken shadows in spaceport during the summer;
- vcam popping on when changing view from spaceport to map;
- you can attach three "Raduga-52" engines to one fuel tank;
- different issues with action groups moving and updating;
- wrong spacecraft velocity after you reached speed of 5km/sec in the atmosphere;
- spacecraft flying sideways relative the ground under some conditions (again);
- Assembly Shop completely broken, when deleting rocket part using Delete key and not detaching it from the rocket before that;
- sometimes parts do not detach from the rocket in the Assembly Shop;
- part slots / connectors incorrectly highlighting in Assembly Shop or flight;
- orbit node text sometimes clipped by the planet.

### Known issues:

- incorrect rocket palcement on the launchpad during launch;
- part of the rocket explode below the surface, if the command module was destroyed.

## 26.08.2020

### Fixes:

- Fixed crash during roclet construction
- Fixed buildings not highlighting when hovering over them
