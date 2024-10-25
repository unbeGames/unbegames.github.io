---
author: Arugin
title: "Dev Update: Assembly Rework, Stage 3" 
description: Every problem will be solved eventually
date: 2024-10-25 18:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]  
image: https://clan.fastly.steamstatic.com/images/32055644/8aeaf27f20105b16148486858c7720f5ebb71022.png
game: Rocket Science
---
This is the third and, I hope, the final part of assembly rework. If you’ve interested in reading the beginning of this story, you can check out the [first](/en/posts/2023/rocket-assembly-rework-stage-1/) and [second](/en/posts/2023/dev-update-assembly-rework-stage-2/) stage articles. Otherwise, let’s get started.

## The Problem

I have been collecting feedback about the game for more than four years now. Different players like or don't like different things about the game, but they all can agree on the one thing: the current attachment system is too restrictive and not easy to work with. I’ve acknowledged this problem and tried to improve rocket assembly over the years, that’s why I’ve made the previous two reworks. While the attachment system became much better than on the game's early access release, it is still far from what I (and other players) want from the rocket assembly.

With almost every update I saw yet another way how the current system limits the gameplay. The first time I noticed that was when I added RCS. You want to place RCS engines symmetrically around the rocket's center of mass to balance it properly. But the center of mass is constantly shifting as you attach each new part. But you can’t adjust the position of RCS engines the same way. I’ve implemented RCS autobalancer, which partially solves this issue. But it has limits: in some very unbalanced cases it just stops working. So you really need to place RCS engines anywhere on the rocket.

The same problem appeared when I added wheels and especially wings. I counteracted this by implementing line sockets. But this was barely enough for supporting rovers and planes that are a bit more complicated than a standard configuration. 

Finally, when I started thinking about adding scientific instruments into the game I realized that most of them are relatively small parts and there are many of them. The amount of current side attachments is not enough to support them. And ideally, you want to place them anywhere on the spacecraft too. Here when I ran out of workarounds. I could design another set of specific parts to support that or add a lot more side attachments to more parts, but this was not an option.

See, adding configurations with fixed side attachments is actually quite expensive in terms of development time. For each symmetry step I basically need to duplicate the part model without side attachments, make holes in it, make solid casing for each hole, place physical and visual attachment points, and finally create prefab variants and configuration files for all of that. This is not only a lot of initial work, but it is also hard to support and change. For example, if I want to improve part visuals and need to change model UV for that, I basically need to make five times more work for any part that has side attachment variants. It also drastically increases the number of meshes and polygons on the scene, which hurts the performance.

![](https://clan.fastly.steamstatic.com/images/32055644/c39e043133d972705203f6e04452320c1b61af75.png)
_Number of files required for one part with side attachments on the left and without them on the right_

There are more disadvantages to the current system. Most spacecrafts look very similar to each other, it is hard to build realistic-looking satellites and finally, adding custom part mods to the game would be near impossible.

At the same time longitudinal attachments are working fine in my opinion. Another advantage of fixed points is that it speeds up calculations during the flight. Also I can calculate symmetric parts on the fly without storing this information inside the rocket which helps immensely on root part change or docking. Finally, thanks to fixed attachments, you can build several parts of the rocket simultaneously on the same scene and then assemble them together without needing to constantly create subassemblies. 

So it was the time to change this system somehow to solve all these problems while trying to keep all the advantages that it has. But the biggest restriction was that I couldn’t completely throw this system out the window. Too many other systems depend on it and doing so meant basically rewriting half of the game from scratch. I didn’t have time and players wouldn’t have patience to wait another year while I do this.

I thought about this problem all this year and started prototyping some ideas I had after releasing thermodynamics update. I’ve spent weeks trying out different things but nothing had worked well, was too complicated or very unintuitive. Until one morning it finally hit me.

## The Solution

The solution lied on the surface all that time. Currently when you select part configuration with side attachments the game basically does two things: changes part prefab to another one that has side attachments and adds those attachment configuration into the part configuration. The game was built around the idea that some attachments could be added to it later, when the player decides to select another configuration. 

Imagine that I want to attach the engine to the side of the fuel tank (for some reason). So, what if I dynamically add a side attachment to the fuel tank when the player grabs the engine and hovers it over the side of this tank? For that I need to somehow gather the following information: attachment position, direction, shape and rotation. Position and direction were easy. I just need to make a raycast from the camera though the mouse cursor. If it hits the side of the fuel tank I can get hit point and normal from the physics engine. Shape and rotation were a bit harder. For each part I need to add an additional configuration that contains info what attachment shapes it can support and in what orientation it should be. And then dynamically choose the appropriate configuration in place by checking if this attachment shape will fit on that position or not.

I called this system "**Dynamic Attachments**". I’ve spent several days implementing this and the first results were promising:

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWp2Njd2d2YyMXpiMWJseWE0YXk5bzNudDJjNjBkMGt4M3VieWJxaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/QhHcj9U0dhlaNB0Qaw/giphy.gif)
_It just works_

But I dIdn’t rush to rejoice, because I knew this was only the beginning of the journey.

Everything worked well, because I had a fixed attachment on the top of the engine and dynamically created another one on the fuel tank. But what if I want to attach one fuel tank on the side of another? Both tanks have no attachments on sides. What to do in that case?

It was obvious that I needed to create a second dynamic attachment on the part I am currently dragging. But the algorithm for that was much more complicated. I would not describe it here because it would be several pages long, but it can be implemented by using more raycasts, math and solving a lot of edge cases.

![](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExdnd3YjJ6cmhpcHhvc2ppdGI4ZXpxZ2VvYmFqaW15YjA3a3hlMzloZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/r52YqrbjRqijqyBw1T/giphy.gif)
_I am creating dynamic attachment on the dragged part when the mouse cursor is at the center of the part. If it is closer to other fixed attachments I will use them instead_

The next step was implementing symmetry for that. It mostly went fine:

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzdmYndxMzVlcTJrbGU2aGJhZHowOXF1aWJiYWV3OXN3YW9lZTY2MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B2pBXysSD9dy9WyEMI/giphy.gif)
_For symmetry I just create dynamic attachments radially around the part, by rotating position and direction of the first dynamic attachment around Y axis_

However, I’ve encountered some problems with that. For example, for non radially symmetrical parts some symmetry steps would give a buggy results:

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZzk1eWlnaDdrbXN1ZWRyZmwwZDlsMmdybTg5MWEydm1wbnY2Y2x0MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lK85i3jL2p56hXlRPZ/giphy.gif)
_Surprisingly, KSP has the same problem for radial symmetry around non-symmetrical parts_

And this problem is hard to solve. I could, in theory, adjust the position and rotation of symmetric parts depending on the shape of the parent object. But  the symmetry would stop working for the adjusted parts after attaching, because they stopped being symmetrical due to changed positions and directions. And I don’t want to store any information about symmetry inside the rocket, because it will be a nightmare to support that going forward.

I left this problem for now and moved to the next important step – snapping. I’ve added two modes of snapping, radial:

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExMnQ3emFieXNlM2pwcWl0YnV2emk1ZzNpYW5oY2pia3Q1YTRyYTJjMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ngRyXFGPiOvzYRXwJ0/giphy.gif)

And linear:

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3E1NTlxbDYwa2c3NW0wMzJ3eXB1bGQwanc2anhnZHhraWdtNm8xaSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/sZHf1n4B5ANqjMipsE/giphy.gif)

You are free to turn on and off both snapping modes independently of each other. I’ve also added six steps with different intervals for each one, so you can attach parts very precisely where you want them to be.

The new dynamic attachments prototype was ready. And, as I expected, flights worked as usual without needing to change a single line of code in that system.

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExOG1pOXlhYmx1aTFicDByaWtqNThtZGs5ZjhhemN0ajBtcjMwYnN5dSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/roIQlBhBNhq8q92HHw/giphy.gif)
_From the flight point of view all attachments are still fixed and no changes are needed_

Let's recap, what will change and what not:
- longitudinal and some other fixed attachments will stay as it is;
- all side attachment part variants will be removed;
- you will be able to freely attach parts to the side of other parts in most places where no fixed attachments or other dynamic attachments already exists;
- dynamic attachments will be created under the hood, but from the player point of view you just attach one part to another like in other games.

Now, what does it take to move this prototype to a production-ready state? 
- Add a new separate assembly-only collision shape for every single part, since it should be much more precise than physics shapes I used for flights.
- Configure dynamic attachments for every single part that supports it. Most of the parts will.
- Remove fixed side attachment configurations and line sockets, since they no longer needed.
- Cleanup all the code related to the old system.
- Fix tons of bugs and process a lot of edge cases, because I didn’t expect parts to be placed anywhere the player wants.
- Rework all the tutorials in the game related to rocket assembly once again.

This is a lot of work, because there are a lot of parts already in the game. This why I didn't add a lot of new parts in last updates, because I knew this rework is coming. Also while doing this, I want to adjust sizes and shapes for some parts that were previously designed with fixed attachment points in mind.

I also want to rework the part loading system. Previously, parts loaded asynchronously, which lead to a lot of very hard to catch bugs that appear when you assemble your rocket very quickly. I am planning to separate part visuals and part physical representation and load synchronously the latter one.

I hope this final rework will solve most of the assembly problems. Will it be perfect? Most likely not, because you need to put months of work into polishing such systems and I am planning to release this update this year. But I am pretty sure that reworked assembly is already better, more flexible and less annoying to play with.

![](https://clan.fastly.steamstatic.com/images/32055644/8aeaf27f20105b16148486858c7720f5ebb71022.png)
_I assembled this spacecraft in minutes and it was definitely not possible before_

That’s all for today, I can’t wait for the release of this update, to see what crafts you will be able to build. Have a nice flight!
