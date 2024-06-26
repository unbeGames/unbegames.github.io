---
author: Arugin
title: "Dev Update: Overcoming Unity"
description: Always post bugs to your engine developers; nothing annoys them so much
date: 2023-10-04 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/d26a2d8c82c6e66180b3820e0479b03b92e2534b_400x225.png
game: Rocket Science
---
After v0.19.6 release I took two weeks off to prepare for another big task – the transition to the new 2022.3 version of Unity. This particular one has to be one of the most challenging in the entirety of the game's existence. As I mentioned in previous dev updates, I’ve started building Rocket Science using a lot of newest experimental Unity packages such as HDRP, DOTS, Addressables, Burst, etc. They were under active development, which led to constant API and breaking changes, bugs and other early access stuff that you are familiar with. On the other hand they provided a set of tools that basically allowed me to make this game on Unity as performant as it is.

As time went by some of these packages reached version 1.0 and finally became “stable”. But DOTS ones, using which I built planet generation, orbits and maneuver planner, remained “experimental” until Unity 2022.3. So I definitely wanted to transition to that version of editor and finally get rid of this warning panel and start working on fully stable and supported version of the engine:

![](https://clan.akamai.steamstatic.com/images//34094219/145517a946bd38bd109f85920b47e68d43798071.png)

The only catch was that DOTS API changed a lot between last version and 1.0 so I wasn’t even able to open Unity Editor until I will apply hundreds of changes into the game's code to implement the new API. It took me more than a month to do all this stuff, but at that moment I thought that it was worth it. Because the code became much cleaner, a lot of dirty hacks and workarounds were removed and some functions and structures became unnecessary because they were already implemented in the newest Unity. Moreover I revisited the architecture of planet generation and made it consume almost 400Mb less memory, which will become very useful when I start to add props and details on the planet’s surface. Also thanks to some changes I made, loading times between spaceport or assembly to flight transition reduced a lot.

But when I fixed the last compiler errors and finally launched the game I was shocked by the amount of bugs this version introduced. Here are only some of the most notable ones.

![](https://clan.akamai.steamstatic.com/images//34094219/6a4293b0dd0f5ea1f870a2892ab9a587e53e1291.png)
_Navball for some reason lost almost all the color_

![](https://clan.akamai.steamstatic.com/images//34094219/fc67fb6a23616c98b6330fa7950ba9bc33d0bd31.png)
_Ambient lightning disappears during transition between scenes, and sometimes completely_

![](https://clan.akamai.steamstatic.com/images//34094219/e031dbed24023b6865b23ede71b0b0b20dbe8491.png)
_All UI icons render with artifacts_

![](https://clan.akamai.steamstatic.com/images//34094219/fda836df8970270d2062fa2fe49fe88d685b5e85.png)
_All directional light shadows are broken_

And the cherry on top: the game build immediately crashed on start.

This was very unexpected. I haven't seen so many bugs since Unity 2019.3 using which Rocket Science was initially released (and because of that I lost almost 20% of sales in refunds). But I simply couldn’t go back, because I’ve spent so much time on this transition already, so I started searching for workarounds and posting all these bugs to Unity at the same time.

I found acceptable solutions to almost all of these bugs except the broken directional light shadows one. And Unity is always very slow on processing posted issues: it can easily take them a half of a year to fix and backport them to the stable version from the current tech stream. So I began a deeper investigation and debugging and found out that shadows break when any object in the scene is located further than 1e8 meters from the origin, even if it is not in a current camera view. For comparison, the Moon is around 3e8 meters away. And the only workaround was to disable any object that exceeds this distance. Which means no distant rendering (or even planet rendering from high altitudes) which was not acceptable for the game at all.

So I started poking Unity Technologies at forums trying to drive their attention to this bug. And the silence was an answer. Two more months have passed and I finally got the response: they just closed this bug with a resolution “By Design”. They said that Unity has never supported far away objects and don’t have any plans to support it in the future. Which was simply not true. How Rocket Science is working then?

I was very demotivated by this and combined with the news about the new engine pricing model (basically 2.5% revenue share from sales in addition to current monthly payments for the editor). So further development on Unity didn't look very attractive. But I pulled myself together and spent the weekend debugging and deconstructing that shadow bug piece by piece. Surprisingly I found a source of this problem in the engine's code and an acceptable solution for it. At the same time this bug was reopened by some responsible employee from UT and then fixed later (but it will still take at least three months to propagate this fix into the current version of Unity).

This is all great, but I lost so much time that I could have used for gameplay development while doing work that Unity Technologies should do. I'm tired of the fact that most new engine’s features don’t support and don’t even consider space simulators as a type of product that could be built with it. For example they released great cloud and ocean systems, but both of them can only be used on a flat surface. It is also very inconvenient to wait a half of a year until some critical bugs will be fixed and get to the users, because your game release could be completely blocked by this. Moreover this sudden change in pricing model undermines the company's credibility.

But migrating Rocket Science to another existing engine is not an option either. For example, Unreal Engine don’t support C#, Godot doesn’t support Data-Oriented design, Unigine is not that popular and it can be hard to find guides, tutorials and answers to questions about it. So I decided to continue development of Rocket Science on Unity for now, but spend some small portion of time making my own game engine specifically for space simulators. Since I know what I need and 80% of existing game code is engine independent already, it will be possible to migrate it when the time comes. But I don't think it's going to happen anytime soon, because it's a huge task, with a lot of unknowns and research I would need to do. But in the long run it will allow me to do a lot of stuff that is not possible on Unity right now.

Back from Unity mess to the game itself. Here is a quick overview of some features that are currently in development for **v0.20.0**

## Martian system materials rework

I wanted to do it, since the new procedural material system was introduced in March 2022 but don’t have time to. This is basically the last celestial bodies that work on the old one.

![](https://clan.akamai.steamstatic.com/images//34094219/a50c48352e7c6aba9956c401bf6e91b19f4534c5.png)
_Old Mars_

![](https://clan.akamai.steamstatic.com/images//34094219/75ac5b7e6ec5c4cfb27acfcba17c5a1e7a5fe54c.png)
_New Mars. You can see that surface color become much more realistic_

![](https://clan.akamai.steamstatic.com/images//34094219/df2889b6c9801843e520b0614abbc75fd79738ec.png)
_Old Mars_

![](https://clan.akamai.steamstatic.com/images//34094219/008c89bea170ca2b924643286736d9b215b69563.png)
_New Mars. A lot more surface detail has appeared that is more consistent with the planet’s topography_

## Orbit planning improvements

If you will get an encounter and then will switch to a body in which SOI spacecraft will get to, you will be able to see an orbit relative to this body frame of reference.

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExb3J6ZWpmcmZjbzNtMHRpamdtY2VpMWQ0NjQwOW54NXJoMzFpY2drYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/DqSbJ5qkgBQkXtdn13/giphy.gif)
_You can even change a maneuver while staying in the target body reference frame and see, how orbit will change_

## Solar system map filters

Sometimes it can be hard to plan a flight trajectory because a lot of objects could clutter your view. So I am working on a set of filters that would help you to deal with this problem and clean up your map,

![](https://clan.akamai.steamstatic.com/images//34094219/7a62fd04113a78460cb3b1e1c5bf3dea3d45e072.png)
_Work in progress, could change before the update_

## Processing feedback

Last three months I received a lot of feedback from the players, who spend around 1000 hours in Rocket Science. There are different requests there: from simple UI improvements to bugs that crash the game when encountered. I need to process most of it before the release of the update.

As always, more stuff is coming including traditional bugfixing, QoL improvements and more rocket parts. But I will cover all of that next time. That’s all for today, thanks for your support and feedback! See you soon.
