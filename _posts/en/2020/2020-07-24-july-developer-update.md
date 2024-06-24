---
author: Arugin
title: July Developer Update
description: Light at the end of the tunnel
date: 2020-07-24 21:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/410c6f6d1af98c1a43df3879236eb81a25ed6a16_400x225.png
game: Rocket Science
---
Hey, folks.

I’ve finally finished encounters prediction. Here how it looks:

![](https://media3.giphy.com/media/IzciY98lZkQMI6DZzm/giphy.gif)

Technically, encounter prediction is all about root finding of the distance function. But evaluating distance between two celestial bodies at a certain point of time is a bit expensive, so not all existing methods from calculus are suitable for solving this problem. Firstly, I tried approximating distance function with a Chebychev polynomial and then finding the real roots of that polynomial using eigenvalues of the companion matrix of the Chebychev coefficients. This sounds very complicated (and it was), but computationally, it should have been the fastest method. But due to large scales of Solar System, or because of lack of my experience in math, it gave very inaccurate results or didn’t even predict some encounters.

So I abandoned this approach and choosed more simple, but more expensive one. At first, I am searching for a closest approach to the body for half an orbital period using the Golden Section method. If approach is found and it is within a sphere of influence of body, then I am using few steps of Bisection method to get closer to an actual encounter. And to get a precise results I am refining calculations using the Newton–Raphson method. This worked great, and since all orbit calculations for scaled space are parallelized, searching for encounters is almost not affecting game performance in any way. But since I am not mathematician neither physicist, it took almost half a June to research, experiment and come up with this solution.

But this was beginning of a journey. I completely forgot about frame of reference during encounters prediction. For example, if we are looking for transfer from Earth to Moon, and predicted orbit is in the SOI of Moon, it is not enough just to draw this orbit, because Moon is moving around the Earth in this frame of reference. And we should translate every point of orbit, all orbit nodes and maneuvers on it relative this motion in the future.

![](https://clan.akamai.steamstatic.com/images//34094219/0527348e0305d8ff0d340a39eb8237569df9e273.png)
_Without Earth reference frame_

![](https://clan.akamai.steamstatic.com/images//34094219/e085ad330b873feacb63aab872eb73ef022a6fb4.png)
_With Earth reference frame_

I am calling this Dynamic Frame of Reference. And it is working only for parabolic or hyperbolic orbits, because they have start and end points. For elliptic orbits we need to translate only origin of the orbit.

![](https://media1.giphy.com/media/QAg3cCelUeYVAAte7w/giphy.gif)
_Final elliptic orbit is in Static Frame of Reference_

And if maneuver was placed on elliptic orbit we should switch from Static to Dynamic Frame.

![](https://media0.giphy.com/media/RfNDthTrL0fWg6SxDL/giphy.gif)

Encounters search is also repeating each time your spacecraft is passing the maneuver node. So you can place maneuver, get predicted orbit and just wait for encounter.

![](https://media1.giphy.com/media/RMeMOcWsfmHsX8DfIl/giphy.gif)

After some time and fixing tons of bugs and edge cases, I found that still a lot of things are missing. Like I should draw where planet will be during encounter, make target system, closest approach and ascending and descending nodes, provide more tooltips with useful info, make more precise deltaV controls and actually connect this all to the flight system. But I was a bit tired of orbit stuff and decided to switch to other tasks. Since what I have done is enough for Moon flight, I am planning to only connect maneuvers to the flight system and navball for the next release. And other missing features will be moved to the one of the next one.

I could finally work on something else. Firstly, I changed temperature map, that I am using for Earth’s procedural texturing. I got L3 TERRA/MODIS and AQUA/MODDIS datasets from NASA website in higher resolution, combined them, processed to fill up missing data and converted it to 16-bit temperature maps. Going from 8-bit maps to 16-bit greatly improved procedural texturing. Transitions between biomes became more smooth and there was less noise and artifacts. Also texturing became more realistic. No more sand deserts in the middle of Siberia.

![](https://clan.akamai.steamstatic.com/images//34094219/589a043cf35015de9a9a3edd0a262cc87f4314ed.png)
_Before_

![](https://clan.akamai.steamstatic.com/images//34094219/2b2463762c1fd7d05d5e6cef7ff719f55034dadc.png)
_After_

I still need to improve Earth materials by re-selecting them and tweaking a lot of parameters. But this is big task and not that necessary for now, so I will return back to it later.

The next task was the Moon. As I mentioned in the release blog post, the Moon’s heightmap is already in the game. But there were a bunch of bugs, that blocked it from loading.

![](https://clan.akamai.steamstatic.com/images//34094219/3e95297bc5ea6a1ac2b53a69e991cced7be2d487.png)
_There is no textures on the Moon right now, but still it looks gorgeous_

I am using is 32kx16k heightmap but this is still not enough, even the Moon’s surface area is 13 times less than Earth’s. So I needed to work on appropriate noise for it, to add more small details.

![](https://clan.akamai.steamstatic.com/images//34094219/77d2a07e448a6f7eabb1f1d70a9af1b207a4dfbd.png)
_When there is too much noise_

After that I switched to fixing and improving interplanetary flight. This was not as complicated as orbits were, but still, you need to properly load and unload celestial bodies, heightmaps and collisions for them, switch atmospheres and clean all assumptions from the code, that there is only one possible main body.

Right now I am finishing noise for Moon and will start working on the texturing. Since there is no climate on the Moon, I need to adjust my approach to procedural texturing for it. And also choose appropriate set of materials for its surface.

As for release date for this update, I moved it again to the end of August, sorry about that. I made a great progress this month, but still there are more things that need to be done. After finishing the Moon, I will start making new rocket parts. Some of them will be easy to add, other (like parachute) will not. I also need to rework some of existing parts. But I will try to adjust the scope and make only MVP tasks, so I could release an update even not everything I want will be there.

Thanks, and, hopefully, I'll see you at the next update release.
