---
author: Arugin
title: Next update is coming
description: As is winter
date: 2020-11-28 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/7039413086c6cb46c2ac170bd5cbae8aa5d022d7_400x225.png
game: Rocket Science
---
Quick update here. Last two months I’ve been busy improving the game's internal code and structure. The main purpose of these changes is that I want the game to support thousands of flying spacecrafts and most Celestial bodies in the Solar system. It was not possible before, and that’s why.

So, a typical rocket consists of several parts. Every rocket part may have several modules which determine what exactly the part can do. For example, every engine could have up to 4 modules:

- Engine Module (engine itself);
- Engine Gimbal Module (thrust vector control);
- Engine Generator (energy production if engine is on);
- Engine Effects (engine sounds and visual effects).

Previously, the simulation system executed an "Update" function of each module of each part of each rocket every frame. But a lot of rocket parts have only config-like modules without any behaviour (like engine effects) or no modules at all, so the time spent on updating such parts is wasted. And if you have more than 20-30 rockets (which I have repeatedly observed in some videos on YouTube), that time becomes considerable.

I’ve rewrote a simulation system such that it directly updates only modules with functionality. Combined with the drag calculation performance improvements introduced in the last update, it makes my initial goal reachable.

Likewise with the Solar system. To support not only 8 planets and their main satellites, I needed to unify orbit calculation (which is already crazy fast) and celestial body positioning and rendering, to not perform the same calculations several times.

There are also more underhood changes I made and some new features I implemented, but I will talk about them in the next update release. If everything goes well it is expected on December 18. If not then December 24 is the day.

Here is a small teaser specially for you.

![](https://media0.giphy.com/media/NXVU456hU6eEQ3YWcU/giphy.gif)

And another one. What it can be?

![](https://clan.akamai.steamstatic.com/images//34094219/5653b0b11609ee6fb0fede2d00f5bdeddbdc6f56.png)
