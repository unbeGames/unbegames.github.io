---
author: Arugin
title: Rocket Assembly Rework Stage 1
description: Changing the design pillar
date: 2023-03-03 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science, beta]
image: https://clan.akamai.steamstatic.com/images/34094219/ab7be14c0f3c3842dabc506e5e79adafba3fe9e1_400x225.png
game: Rocket Science
---
So, it finally happened. I started reworking the weakest part of the game – the rocket assembly. I mentioned several times earlier that this system was developed several months before the game release in EA, and its core hasn't changed much since that time, despite the addition of symmetry tools, parts rotation, force overlays and rocket subassemblies. It was badly written, had a lot of code duplication, hacks and workarounds. Because of that this system has been very hard to improve. Every change, even a small one, resulted in a bunch of bugs that were difficult to track down and debug. Also it never felt smooth. The slot-connector system has its own problems too but I will talk about them later.

Let’s talk about why it was badly implemented. The answer is simple: it was a pretty complex task and my experience was not enough to design it well. I chose the wrong way to do it. I based it on Unity’s physics system. I assigned each attachment a collider and when connector and slot colliders touch each other, “trigger” event happens. Which means that we need to process this pair of attachments and check if they can be connected to each other. If yes, we need to position the current rocket part relative to the parent one. If not, we needed to check the next “trigger” event if that happened in this frame. The second way to find the attachment pair was to cast the ray from the camera through all its attachments and check if it intersects with any other one. And then repeat the positioning steps.

![](https://clan.akamai.steamstatic.com/images//34094219/70830b6089227acb38eac9af99a3646dfee2dd9b.png)
_There are two types of colliders: cubes for slot attachments and sphere for connector ones_

There are a lot of problems with this approach. So the attachment colliders are placed on the rocket part, but they load asynchronously like most entities in the game. So, your rocket assembly logic starts to depend on loading timings, which heavily depend on a player’s computer. You can see a “perfectly working“ system on your machine and then get dozens of bug reports that are almost impossible to reproduce.

The second issue is that all attachment pairs, that the system finds, are isolated from each other. So it can report a part that was found during the “trigger” event, but there is actually a better one, but you can identify it by using a raycast only.

Lastly, because attachment colliders are bound to visual representation of the rocket part, there was a lot of code duplication for part position logic. One for parts alignment during the flight and the other one during rocket assembly. The amount of bugs that were produced, because I’ve changed logic in one place and forgot to do it in the other one is countless.

So, I rewrote this system almost from scratch. I have left colliders to describe attachment areas, but they are used only in the “edit” time. When the rocket part is backed on the game start, all info about attachment shape, position and connection points is collected and saved in the mathematical model of the part. Then I actually reconstruct all attachment positions and orientations using this info during rocket assembly without using a physics engine at all. Because I am at full control, I can easily make a good debug overview of what is currently happening.

![](https://clan.akamai.steamstatic.com/images//34094219/8352060d59583f8fdc4042396126e150f004e7a8.png)
_The debug overview of all attachments. It looks like at the previous screenshot, but it doesn't use Unity physics engine_

When the player is moving the part I collect all possible attachment pairs that could happen in this frame using a bunch of different methods: signed distance fields, attachment raycasts, cursor raycasts, reversed raycasts. Then I check if each pair is compatible with each other and remove duplicated ones. Then for each pair I find all possible connection positions. Lastly, I assign a bunch of weights for different metrics that could help me to find the best connection from all possible ones. There are a bunch of metrics that I am using, like distance between attachments, distance between attachment and camera, part rotation angle and even information on whether the part will overlap with others if placed in one position or another. Using these weighted metrics I then choose the best attachment pair and connection point.

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZGE2NmU0MzI5MDEwMWVkYTUxYWQ1YmMzMzdmZGRkNDYzY2Y0Y2RmOSZjdD1n/9eTT3ryjQMiA07me5Z/giphy.gif)
_I can also visually debug selected attachments_

This change not only produces a more enjoyable experience while assembling the rocket, but the ability to choose another connection if you don’t like this one without moving the mouse.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmFhOGFkNjU1MzZiZjQxOGU5NzU5OGNhN2E5OGE5YzQ0N2YzZDI0ZSZjdD1n/6tMJNTEenUSvG4jJFf/giphy.gif)
_You can change choosed connection by using , and . hotkeys_

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYzAyYjI5ODc4OTBkYzVhNGQ5N2NmYTg2ZDExMjI1YzAyMDhjNzRhNiZjdD1n/DD5Bb4JZ9zFNheXyfh/giphy.gif)
_You may think, that the rotation is happening here, but the engine is actuially changing set of the slots it is connected to_

I removed all code duplication between flight and assembly during rework. Thanks to this there are actually 2 times less code in this system, than before! I also added some tweening to make the whole process feel smoother.

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExOGU4ZTFlMzZiYTNjNThhZGI0YTBlNzIwM2MxOTI5OWUzOGYyMDhkNCZjdD1n/gDlnsoDhioqjdyERc1/giphy.gif)
_You can see, that attachment motion is smoothed even on a 20 fps gif_

Also some old bugs are easy to fix now.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmY2MTNiY2Q2ZmE4ODhjMjNhZWNlYzYyNzdjYWZhOWQzNmFhOWE2MiZjdD1n/IdvhACfe2zQbPqs05r/giphy.gif)
_Previously, symmetry rotation not worked when all symmetric parts were connected to one attachment_

But this is only the first stage of the rocket assembly rework. I agree with a lot of reports that the current connector-slot system is very restrictive and greatly limits the amount of possible rockets that you can build using it. But I can't just throw it away and make something similar to KSP, for example, because too many things are based on it and I will need to basically rewrite half of the game. Also the game will become less unique because of that.

I made some prototypes and I think I found a way to dramatically improve it without radical decisions. But implementing this is still a huge amount of work and I don't want you to wait another five months until the next update. So I decided to release what is ready to the public beta. I think it is already a big improvement from what was done before, but I need your feedback. As always, you can find all these changes in the **beta-builds** branch.

As for what changes are awaiting the rocket assembly I will tell you in the next dev update. See you there soon.
