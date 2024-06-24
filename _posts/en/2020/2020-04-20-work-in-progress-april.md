---
author: Arugin
title: "Work in Progress: April"
description: Eccentric anomaly at mean anomaly
date: 2020-04-20 22:23:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/60d25a47e9934b6a9c668bf9e2b96e2ac255ec8c_400x225.png
game: Rocket Science
---

Since flight UI improvements I did for v0.7.6 and rocket controls rework in v0.7.8, I was able to finally start working towards interplanetary flights. And the first thing I needed to do is to rewrite Math simulation.

I implemented it in the early days, when I thought that there will be very simplified rocket physics in the game. In short, during spacecraft acceleration only the full thrust of all engines was taken into account and aerodynamics was absent at all. When the engines were off, rocket position was calculated using orbit. So, when I’ve added complete Physics simulation to the game, I decided to use Math simulation, when engines are off and rocket is not in atmosphere. It allowed time to do more than 10x time warp and had a great performance as well.

But these systems began to diverge in supported features more and more over time. For example, math simulation had no access to rocket parts, their properties and physics shape. Because of that, it could not properly calculate inertia tensor and rotate the rocket to the correct angle. As a consequence, energy consumption was incorrect too. So, I had to switch to Physics simulation every time any torque was applied to rocket. As a result, rocket could not continue to infinitely rotate in the space, when auto stabilization was off.

The last important thing, that was missing in Math simulation was the access to the whole game world in addition to the access to gravity and the radius of all the planets it had. This means that I can’t check if the rocket fell through the surface of the planet using heightmaps or noise. It is not a problem for the planets with the atmosphere, because rocket will be always simulated using Physics in it (however, there was a funny bug when the rocket switched to the Math simulation at the last moment before the collision with the surface and begin the flight to the planet’s core). But there is no atmosphere on the Moon, Mercury and on many other moons in the Solar System, so I needed to solve this too.

So I rewrote Math simulation to fix all these problems and then I launched the game to enjoy the perfect, stable result. But the first thing I saw, when the rocket reached the space, was:

![](https://media.giphy.com/media/JSpiysnyAaggi8mM2Q/giphy.gif)
_\-.-)_

Actually, It was expected. Every time you make such huge changes, a lot of bugs and regressions immediately occur in any project. But if you make an extra effort and deal with encountered problems, everything becomes more solid and extendable in the future.

![](https://media.giphy.com/media/UW22Hj5SXe0EDK5qGS/giphy.gif)
_^\_^_

I finished development of Math simulation and decided to visit my parents, who live in another part of the country. As soon as I got to them, the COVID-19 outbreak happened in Russia and I stuck there in quarantine far from my development PC. But at least I had a laptop. It has no graphics card and able to run Elon at 15 FPS, and barely run Unity Editor. But I had an idea how to deal with it.

The next task was a Maneuver Planner. It is quite separate from the entire game, because the only information it needed are the orbits, celestial bodies and changes in the velocity of the spacecraft.

So I moved all related code to the separate new Unity project and start to build the Maneuver Planner foundation. I could quickly make changes, run the project, test it and repeat this process. The first thing I’ve added, is the proper support for parabolic and hyperbolic orbits:

![](https://media.giphy.com/media/PjyNk9T6u14NusAnd8/giphy.gif)
_Parabolic Orbit_

![](https://media.giphy.com/media/L32g4rOMlGr7zmVpIz/giphy.gif)
_Hyperbolic Orbit_

After that I’ve changed they way the orbits calculated, generated and updated. Previously, the game could support rendering and updating around 50 orbits at the same time without significant impact on FPS. After that I tested 100 orbits:

![](https://media.giphy.com/media/IfgAXCNEZKVtZRLJp7/giphy.gif)

250 orbits:

![](https://clan.akamai.steamstatic.com/images//34094219/835d54fd70805116aaf04d95f8655dd728514c42.png)

1000 orbits:

{% include embed/youtube.html id='MxT9BYQ3Kvs' %}

These all are synthetic tests, but now I am pretty sure, that the game will support a lot of orbiting objects and I will be able to tackle such problem like space debris. This also means, that the Maneuver Planner will support bigger conic patch limit.

The next problem I needed to solve was an orbit raycast. You need it to select the point on orbit, where you want your maneuver to begin. I can’t use Unity Physics for that, because on such scales it would be too inaccurate. It would be also too expensive to rebuild the colliders for spacecrafts, because during acceleration orbit is changing every frame. This actually was a hard problem: you basically need to go through all visible orbits and calculate possible raycast position on each of them, project back to screen and then look how far projected position was from the original mouse position. But the new orbits architecture handled it great:

![](https://media.giphy.com/media/TGKPhmq6SwLUcc4dD9/giphy.gif)

The foundation for Maneuver Planner was ready. Three days ago I built a new PC to continue to work on the game at the same pace as it was at home (because I don’t know, when the quarantine is going to end and when I could return back to home). I swapped the old orbit system with the new one in the game and checked, that everything is working as expected:

![](https://media.giphy.com/media/YnBpIkY7tsqwt8QuJV/giphy.gif)

The next steps are to develop patched conic approximation, encounters, system for adding maneuver nodes not only to the current spacecraft orbit, but to the predicted ones too. And all of this is multiplied by Solar system scale and accuracy requirements. It sounds hard, but every problem seems to be hard until you start to solving it.

The last thing I want to tell you, is that I started to work with Artur (the composer of Elon’s original soundtrack) on additional tracks for Assembly Shop, orbit, interplanetary flights and planets with and without atmosphere. They will be included into the game and OST on Steam with the next update.

That’s all for now, see you in the next update.
