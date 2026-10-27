---
author: Arugin
title: "Two weeks after release"
date: 2018-01-04 16:27:12 +0300
categories: [Spreadstorm, Development Blog]
tags: [spreadstorm]
image: https://shared.steamstatic.com/store_item_assets/steam/apps/742380/capsule_616x353.jpg
game: spreadstorm
---
Hey everyone!

We’ve been hard at work on Spreadstorm since the Early Access release in December. A small intro of some of the things we’ve been working on are:

- Game core rewriting. Overlooking how the different game systems works and applying necessary changes to it.
- Bugfixing. Our small community have reported dozens of bugs and we are investigating them.
- Level changes. Looking at how players walk through the game, we found some issues in level design, and we think about how they can be fixed.

Before closing this update up we want to talk about core rewrite a bit more. So, one of the important systems in Spreadstorm is the Reset system. In its current implementation it resets state of the unfinished level thereby helping players to get out of progress blocking situations, such as running out of power or locks in different parts of level. But finished levels is not resetable. It produces many issues and some of them are:

- You could reset 24th level halfway through and will be forced to spend a lot of time restoring lost progress, not to mention the potential bugs this action will bring.
- You could finish one level, go to another and recharge there, return back and spend all your power and you will not be able to return it back, because finished levels are not resettable.
- After you lost all power in non resettable level, you can return back to the unfinished level, reset it and get the negative power. gg.

After figuring it out a while we found the solution: all levels are resettable all the time, but we will have a checkpoint system. So if you finished the level, made some bad stuff in it and after reset - it would revert level state to the last checkpoint (level finishing). So the 24th level would have 4 checkpoints and all problems will gone. Another change which helps to avoid the last issue is if you leave unfinished level it will autoreset, so you can not spend the power of this level somewhere else.

Furthermore the changes in reset system shows us, that our current save system, where we save where we save the whole level, will not work with checkpoint system. So we will have to convert our save system to the incremental saves and this leads too...

That's all for now, I hope you enjoy this quick inside look on our development process and you have the idea what's going on.

See you in the next update.
