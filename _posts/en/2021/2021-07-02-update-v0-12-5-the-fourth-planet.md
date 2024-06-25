---
author: Arugin
title: Update v0.12.5 "The Fourth Planet"
description: We need to reach Mars so humanity is not a "single-planet species"
date: 2021-07-02 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/a4fd2bcbc7ddb0e232a93f66f861975f4cc4f5f3_400x225.png
game: Rocket Science
---
Today’s update finally extends the explorable boundaries beyond Earth and Moon. It also brings a lot of loading time and performance improvements, new Navball and several new rocket parts you've been waiting for. Let’s get started.

## Martian system

Implementing this one was not that easy. I needed to add a new atmospheric physics for Mars, and also develop a new visual model for it. Procedural texturing was challenging too, because you have a lot less visual references compared to Earth. I am not completely satisfied with the result, but it is good for the first iteration. As for Phobos and Deimos it turns out that they have non-spherical shapes so adding support for non-spherical shapes for the Solar system map took a while too. In the end, the red planet and its two tiny moons are waiting for brave explorers!

![](https://clan.akamai.steamstatic.com/images//34094219/dc52bd7e059a8a2f5146ea852ee06d58af208780.png)
_Elon Musk's dream_

![](https://clan.akamai.steamstatic.com/images//34094219/39ea0f175d45d3ef816c0acb308d153229e5e3e8.png)
_Phobos_

![](https://clan.akamai.steamstatic.com/images//34094219/217da62de243f520064005379a8ea2cf2552fc8c.png)
_Deimos_

![](https://clan.akamai.steamstatic.com/images//34094219/e109d09bb77d14aba07efc5f41e44246e3248933.png)
_Night on the surface of Phobos_

## Navball

Navball not only includes visuals rework but also provides more information such as a fuel indicator and heading angle. Every part of navball now has a tooltip where you can also find numerical values of current throttle and fuel amount. You can also switch between stage and rocket fuel using a new button at the top of navball.

![](https://media0.giphy.com/media/6BrxamoCsML37i0dCp/giphy.gif)

As a bonus I’ve added a new Navball mod type where you can customize its appearance. I will update the mod guide later this week, but you can already try a [KSP-like navball](https://steamcommunity.com/sharedfiles/filedetails/?id=2534826336&searchtext=) from the workshop! (Just don’t forget to select it in the game settings after subscribing to the mod).

## Solar System Map

New space context menu will make your life easier! You can left click on a spacecraft or celestial body and get context-dependent options, like “Switch to” or “Focus”.

![](https://media.giphy.com/media/GNCK7vihATxFk0Q6Ki/giphy.gif)

The “Set as target” option from the context menu will show ascending/descending nodes on your orbit and will add “Target” and “Anti-target” autocorrection modes to Navball.

![](https://media1.giphy.com/media/1dhwpXpJiUSo6FA5a3/giphy.gif)

Last but not least, the maneuver raycast handle will automatically snap to orbit nodes, so the maneuver can finally be placed exactly on periapsis or ascending node! You can hold the ALT key to switch to the old behaviour.

![](https://media2.giphy.com/media/w9fxCTq6p5ib13AdqX/giphy.gif)

## New parts

Rocket parts from this update include two new engines! Since every engine in the game is based on real analogue from the USSR or Russia, it requires a lot of research to create and add it to the game. That’s why all previous updates didn’t include them. But this time everything came together and you can try the most powerful single-chamber liquid fuel engine ever created in the USSR for the lunar program (sadly, it wasn't used in real flights because its development was stopped in 1970).

![](https://clan.akamai.steamstatic.com/images//34094219/f9a91f28df095bf0a785d4989d7c9446dd2256c1.png)

The second engine added to the game has the highest specific impulse in vacuum in the game (but lowest thrust). You can try to guess on which real engine it is based.

![](https://clan.akamai.steamstatic.com/images//34094219/8ea54a43cfb089e0a105974f82ad70f0b271b402.png)

\*\*\*

There are a lot of changes and fixes in this update too. Most important are loading times and performance improvements and a bunch of flight fixes. You can find a full changelog below. I am planning to release one more big sandbox update in the future (which will include a rocket instruments feature I talked about in the previous dev update) and then switch to spaceport building.

I hope you will enjoy this update. If you encounter any bugs or problems with it, don’t hesitate and leave it on the forums or in the official [Discord channel](https://discord.gg/unbegames). Thank you and see you in the next update.

---

## Release notes v0.12.5

### Features:

- added Mars, Phobos and Deimos to the game;
- added atmospheric pressure models for Mars and Venus;
- added space context menu with contextual Switch To, Focus and Set Target options;
- you can set target for spacecraft, two new autocorrection modes will appear (Target and Anti-target);
- ascending/descending nodes for spacecraft orbits with target set;
- redisigned navball UI + added tons of tooltips to it;
- new mod type: navball, new celestial bodies were also added to the surface mod;
- orbit raycast is now snapping to the closest orbit node (you can hold Alt key to disable this behaviour);
- significanly reduced game launch time, especially on old GPUs;
- imroved perfomance of spacecraft gravity, engines and drag calculations (again);
- flight loading time reduced by 3-5 seconds; when spacecraft is in a deep space it is almost instant now;
- max possible planet quadtree level now equals 30 (previously was 17), this means that the same LOD could be achieved on the planets with pretty much any radius;
- new engine parameter "Throttle limits" (for now it was only added to engine 4)  


### New rocket parts:

- "Vega-072" Liquid Fuel Engine;
- "Yuzhniy-348" Liquid Fuel Engine";
- "Dvutavr" Stroage Bay;
- Storage Fairing 1.4m;
- Adapter 4c-7s.  

### Changes:

- focused body no longer reset when closing and opening solar system map;
- real planet surface now loaded instead of the fake surface in the spaceport and assembly shop;
- perfomance settings now affect planet surface in the spaceport and assembly shop;
- unified sun look on map and during the flight;
- Sun disk has proper size now and depends on distance to the Sun;
- earth atmosphere on solar system map and startup system uses proper exposure and color correction;
- fixed exposure is used on the solar system map until different exposure modes will be implemented (back planet side will be a bit dark becuase of that);
- water quads under the planet surface will no longer render (perfomance improvement);
- changed planet's surface triangulation, it is less stretched along one axes right now;
- greatly decreased amount of geometry rendered during the flight (moderate perfomance improvement);
- changed how rocket part impact is calculated: now it is using force, applied to part to resolve collision and not just a relative velocity;
- added mod type icon to mods in the mods list;
- for some very small sattelites with no its mass data available set a minimum mass;
- for some very small sattelites with SOI less than radius set minimum SOI size equals 1.75 x radius.  


### Settings:

- added navball selector to the game settings;
- added hotkey: \` - reset focus on map;
- added hotkey: Alt + Shift - step increase throttle;
- added hotkey: Alt + Ctrl - step decrease throttle;
- changed hotkey: from \` to Alt + \` - pause/resume time;
- hold ALT key to disable maneuver snapping.  


### Fixes:

- encounter prediction doesn't work outside of Earth's SOI;
- distant celestial bodies dissappear when turning on any light during the flight;
- rectangle connector not attaching to heptahedron socket if it already have hexdual connector attached;
- planet's atmosphere disappeared when switching from spacecraft orbiting the Moon to spacecraft orbiting Earth;
- rocket parts exploded when decoupling them in the atmosphere at the speed over 5000 m/s;
- reattaching rocket part with symmetry turned on not creating symmetry parts;
- spacecraft fly into abyss if engine is working and spacecraft changes SOI;
- grounded spacecraft explode when starting engines;
- collisions between grounded spacecraft and active not work or work incorrectly;
- impact node sometimes displayed when shouldn't;
- impact node not showing after closing and opening map;
- orbit nodes sometimes placed incorrectly during encounter prediction;
- stars are too bright at night in the spaceport;
- predicted orbits are incorrectly scaled, if map scale was changed, when orbit was not active;
- camera keep high rotational damping, when changing camera mode and then switching to map and back;
- save panel is not showing in the surface mod constructor;
- Eris have no gravitational parameter;
