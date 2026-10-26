---
author: Arugin
title: Update v0.8.1 "To the Moon!"
description: That's one hard update for developer, one giant leap in quality for the game
date: 2020-08-25 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/3371d8e8989ace69840b7e58094650d90ef6463b_400x225.png
game: rocket-science
release_notes: rocket-science/v0.8.1
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

11 new tracks were added into the game along with new ingame music system that would track your spacecraft state position and will change tracks depending on that. These tracks were also added into “Rocket Science Soundtrack”, so all owners of this package will automatically receive them for free.

![](https://clan.akamai.steamstatic.com/images//34094219/a9c665d2a55c2b8d081bb3f2b216c735a3a1dd1c.png)
_A bunch of rockets were destroyed during development of this update_

There are a lot of other changes, fixes and improvements (as well as new bugs =/). You can see the full changelog below. But I want to talk about what's next. The weakest part of the game right now is the rocket construction. As I said earlier, it has a lot of missing tools and quality of life features. It also requires rewriting some parts of the whole assembly system, to make things like symmetry and saving subassemblies possible. This will be my top priority goal and I will focus on it the next month or two. Before that I will probably release small update, that will add analytics into the game, so I could see, which rocket parts are popular, and which have never been used

That’s all for today. **Thank you all for your support, feedback and reviews!** This update wouldn’t be possible without that. See you in the next one.

P.S. If you have any problems with this update, try to verify integrity of game files first. Sometimes Steam doesn’t download a file or two for some reason. Also this update is compatible with old save files, but rocket part changes will not affect already constructed rockets. So if you have problems there, try to start the new game.
