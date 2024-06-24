---
author: Arugin
title: May Developer Update
description: Deeper and deeper into rabbit hole
date: 2020-05-31 22:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/47e08322616e12197e35017471fd4e6de44a89ab_400x225.png
game: Rocket Science
---
Developing a game is always a journey. You can never tell exactly how long the next task will take and how much research you should do before you actually start working on it. This is because of unique nature of games. No matter how many games you made before each time you will face some problems you couldn't even think of.

![](https://clan.akamai.steamstatic.com/images//34094219/540126f14184255b20f0bc2519d80f2422e76536.png)
_One inaccurate change and the whole Solar System is broken_

This was exactly what happened with me, when I started developing a maneuver planner. Initially I thought that it would take at most three or four weeks to develop it. But the more I researched how to actually make it, the longer the task list became and the more missing features I found in the orbit system.

The first one was an orbit section. For example, rocket on the suborbital trajectory can not fly through the surface of planet, so the section of orbit under the surface should not to be calculated and drawn. This feature is also the main building block of the maneuver planner, because sections of orbits are extensively used in patched conic approximation.

![](https://media.giphy.com/media/SUbzKWKWw3A6BMhMj9/giphy.gif)

After I've implemented calculating and rendering of orbit sections, I started applying them to every spacecraft’s suborbital trajectory. And I immediately discovered, that orbit section has to be recalculated every frame, when the rocket is in atmosphere or accelerates, because orbit constantly changes. Also section calculations are differs between elliptic and non-elliptic orbits. Thanks to total orbit system rewrite I did last month, it will have almost no effect on the game FPS, even with a dozen parts decoupled at once.

![](https://media.giphy.com/media/YPWIAb7E3nSw6b7llY/giphy.gif)

The next thing required an improvement, was orbit nodes. Apoapsis and periapsis have to respect orbit sections and should not be placed on the hidden ones. There is also no apoapsis on hyperbolic and parabolic orbits. And it have to be easy to add the new node types in the feature. So I’ve added impact node, and will add sphere of influence nodes soon.

After that I reworked orbit nodes tooltip. Finally, time of arrival and the celestial body name was displayed when hovering mouse over the node.

![](https://media.giphy.com/media/VhiJYtPJsUBkJgRYu6/giphy.gif)

Afterwards I fixed a bunch of bugs, that prevented smooth transitions between elliptic and parabolic orbit.

![](https://media.giphy.com/media/WOZIsAlD6inzTpMUqs/giphy.gif)

Finally, all the preparations have been completed and I started working on actual planner. In theory, it based on three concepts: maneuver nodes, predicted orbit and encounter. In practice, it was a little more complicated than that.

Adding just a maneuver node was easy enough. It is just like a regular orbit node, but it specified by true anomaly and holds velocity change in it.

![](https://media.giphy.com/media/fS5F3y77cdq8UVT8Ca/giphy.gif)

Then we need some handle to control velocity change. Every colored element on it corresponds to six vectors on which to burn (prograde, retrograde, normal etc).

When we are able to get velocity change, we could calculate predicted orbit using total velocity (actual velocity plus velocity change) and node position at orbit point.

![](https://media.giphy.com/media/XHpPyFVk8dcJ0gWv4V/giphy.gif)
_Making a dotted line in Unity is a task that deserves a separate article_

So everything is done? Not quite. Player have to be able to plan trajectory ahead. It means that maneuver could be placed on the predicted orbit. And then on the next one. And the next. Each time predicted orbit should be converted to orbit section. And each new section and node have to have different color, otherwise the planned trajectory will be not readable at all.

![](https://media.giphy.com/media/ZFLXQGUnWyMIArAbYc/giphy.gif)

Don’t forget about inserting maneuver in between of two existing.

![](https://media.giphy.com/media/TfivWXAeFRkGXXFuxc/giphy.gif)

And they could be removed at any moment.

![](https://media.giphy.com/media/H1FjVHeiVnHdKyjyRe/giphy.gif)

And the most important: you could move the whole chain!

![](https://media.giphy.com/media/iIvW4Nn97O6L2wLTAV/giphy.gif)

This was a small glimpse of all tasks related to maneuver planner I had. Here is a list of tasks I done last two weeks:

![](https://clan.akamai.steamstatic.com/images//34094219/a549d3adbbc9845175b8018d9c6c00f7f41c4d16.png)

The good news is: that only encounters was left out of the big tasks after it the planner will be almost ready. But I don’t even know, how long the task list will be this time. But I am pretty sure that this is very important part of interplanetary flights and it's not likely to change much in the near future.

When the planner will be done, I will switch to finishing the interplanetary flights themselves. After that I will deploy the game to private branch on Steam, so some players can try it out and give me feedback and tell me about found bugs. I hope it will happen at the end of June.

As for releasing an update: additionally, I need to make a bunch of new rocket parts, especially for landing on Earth and Moon. And I want to improve rocket assembly a bit, because this process is painful right now. But I really hope it will be easier, than the maneuver planner.

P.S. Congratulations to SpaceX on the perfect launch of Crew Dragon! This is really inspiring and makes me believe in humanity. And also make the game faster.
