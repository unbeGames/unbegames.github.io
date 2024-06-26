---
author: Arugin
title: Update v0.19.0 "Awakened Assembly" public beta
description: Pillars of assembly
date: 2023-06-09 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science, beta]
image: https://clan.akamai.steamstatic.com/images/34094219/c95cf7573e3942b4d5f08f9aab11364e6b43729a_400x225.png
game: Rocket Science
---

Greetings, rocket scientists!

I am considering this update as one of the most important since the maneuver planner release. Basically, the game has three pillars: spaceport management (not currently present), spacecraft assembly and space flights. And one of these pillars was heavily redesigned and improved for this update. You can read about the design decisions and the process of developing the improved spacecraft assembly in the [previous dev post](/en/posts/2023/dev-update-assembly-rework-stage-2/), in case you missed it. I, on the other hand, will briefly touch on this change and focus on other features and improvements, of which there are quite a few.

**Note**: this update is not compatible with your old save files, so you will need to start a new game. All old crafts will not work too, because of the changed rocket schema. I don’t like game save wipes, but this one was unavoidable.

**Note 2**: this update is in public beta. This means, that you need to swith your game to beta-builds branch, to access it.

## Connector-slot unification

There are no more distinctions between connectors and slots. In fact, all connectors were replaced by slots. The unified connection points are called sockets now. So every rocket part can be connected to any other one. But you still have to follow the attachment shape rules, as it was before.

![](https://media4.giphy.com/media/vfyqzKg1UoFWQ9w9kx/giphy.gif)

The only drawback this improvement has is because the number of possible connections increased, it is harder to select the correct attachment user aimed for. But in time, I will improve that too.

## Line sockets

When I added planes to the game, I immediately understood that the current slot system is not very precise: you need very fine control over aero surfaces placement to get well balanced planes. Also it would be great to give players more freedom when placing rocket parts. As a result, meet the completely reworked line socket.

![](https://clan.akamai.steamstatic.com/images//34094219/3364270749ff0b0f3bcbe4cd08503258de4482c3.png)
_All rocket parts that have side connection variants received line sockets, so you have some vertical freedom there_

You can attach another part at any point along this socket.

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYTBjZGY4ZWJlZTI2NDRkYjIyZDEyNDJlMmQ5ZGJhNmY0ZGZmM2ViNSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/vJ6cHl3D399R7R3ZuD/giphy.gif)
_Perfectly balanced planes with no exploits are possble now_

Other than that it functions exactly like other attachment shapes. It also supports two modes: continuous and discrete. The last one is basically how line attachments functioned before.

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmRlNzAwZDJkYmExN2E0Y2JlYjRmOTJkYTAwNzA3ZjdlNmE0YzM1MCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/mVpa67Uo1rNxzcvrm9/giphy.gif)
_Discrete mode will be in demand for perfectionists_

Speaking of attachments, you can filter rocket parts by socket shape.

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMTU5MDljMTM2MzgzYmUzZmNmOTJlYWMwZjMxMDU4NWYzZTI4MzczNyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/3sTfQfqdoRnZve5c2U/giphy.gif)
_Not all possbile shapes are present, because of limited space, but I will think how it can be solved_

## Blueprint assembly mode

I’ve often been asked about this: why is there no vertical rocket assembly? My answer was because the game is based on the Soviet Union space program, and all the rockets were assembled horizontally there. Also the horizontal assembly shop is better fit into the side view of the spaceport. And it is better to assemble rocket engines this way. But I can agree that vertical assembly sometimes is more convenient, especially when every other game is doing it this way. Considering this and the big amount of players wanting vertical assembly, I came to the next solution.  
There is a new “Blueprint mode” when you are in the assembly shop. When you switch to it, all the walls and props will disappear, as well as any limits to space, where you construct your spacecraft.

![](https://clan.akamai.steamstatic.com/images//34094219/713c1b0c7195a2b64c747207a7ff521bf8501456.png)

While in this mode, you can switch between vertical and horizontal rocket orientations and assemble your crafts the way you like. Note, the game is designed primarily for the horizontal mode, so some things could be a bit awkward in a vertical one. But it is better than not having a choice at all.

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExYTU0Mzc4Y2Y3MzIwYTIyNDEwNTgwMmJkYjk4NTk2MmYxYmYyMzJmMiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/kjjNML8yMfE61rppyR/giphy.gif)
_There are some differences in how camera works in different orientations, but you will probably discover it by yourself_

## Reworked time panel

I am also slowly redesigning the game UI. You will get an improved time panel this time. It uses space more intelligently and holds more useful items than before. For example, it contains the current location and rocket or spacecraft name as well as some new buttons.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMDhmOGE5ZmEwYmRlMjA4YTcxNTkzYTAzNmZhNWRiMDk4NmNhMzIzNiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/PR0zsb3AR9MWwMDAHx/giphy.gif)
_You can easily rename the current object in place by**alt+clicking**on it_

## Context menu for orbits

You can click on orbit and get a context menu for it now. This allows, for example, to set the contract's orbit as a target! They can finally be completed now! Change of the year is here!

![](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExYmZiOTU2MTMwNWVhMmVkNWE5ZmI5MTRjOTQ4YWMwNGFlYTEzYmU5MCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/gRf3u1xivzFVZVJgN7/giphy.gif)

Previously, clicking on an active orbit of the current spacecraft would place the maneuver. Now you can place the maneuver using the context menu, or by holding alt and clicking on orbit. Since there is no context menu for planned trajectories, placing maneuvers on them is working like before.

## Sharing your crafts via Steam Workshop

This is my attempt to revive the Steam Workshop. I’ve added a new mod type called “Spacecraft mod”. When you create this mod you will enter the Assembly shop in the blueprint mode. You can create any number of crafts or subassemblies there. Or you can manually copy your crafts from the save folder to the mod one. This is not very convenient, but I will add the ability to export your rockets directly from the save to the created mod later.  
Spacecrafts from this mod will be shared along all save files. You can toggle their visibility by clicking on the button above the rocket list.

![](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZGZlNTNlOTc0MTFhZDIyYjMzNzg1NjE3YjFmN2FlMDFhOGUxMzM3MiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/v9ZCDuLXUwUoo1ZtVs/giphy.gif)
_When you are ready, you can publish your rockets into the workshop and see if other players will like them_

## What about new rocket parts?

I am working on a batch of new rocket parts that can only be released together. They should be the part of this beta, but as it turned out, they need a bit more work. I will release them during the beta or right before full release of this update. Stay tuned, and don’t miss them, this will be something special.

As always, there are more in this update that didn’t get into this highlight. You have a chance to discover it by switching your game into the beta-builds branch. Full changelog will also be published on full release of the update.

Thanks for your attention and I am waiting for your feedback.
