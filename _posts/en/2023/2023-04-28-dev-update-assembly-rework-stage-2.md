---
author: Arugin
title: "Dev Update: Assembly Rework Stage 2"
description: Slowly but surely we are getting there
date: 2023-04-28 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/ce55b456af5f4b31896352933f5a97025832c009_400x225.png
game: Rocket Science
---
Today I want to tell you about the rocket assembly improvements that are coming in v0.19.0 “**Awakened Assembly**” update. This update is expected to be released in beta towards the end of May, but you can already get the glimpse of some changes in it today.

## The problem

Old system based on connectors and slots was very restrictive. I’ve received many reports that it is difficult to work with over the lifetime of the game. And I agree with them. You spend most of the time not designing the rocket itself, but trying to find appropriate adapters to attach the part that you want. In some cases your choices are limited to a few rocket parts, like in case of attaching side boosters using radial decouplers, which lead to rockets that look very similar to each other.

It is also hard to design new rocket parts. Most of the time you need to add several part connection variants with each combination of slot and connector on the top and the bottom. If the part should support side attachments then you screwed. You need to add similar parts that have just a little different geometry in this case.

Working with the part connection variants could be annoying too, they are fine for radial attachments, but it is unnecessary complication and slowdown in other cases.

The last thing that bothered me was inconsistent rules because of docking ports. You can attach docking ports to each other, but they have no connectors or slots. You can say that this is just an exception, but I think that exceptions do not confirm the rule, they suggest that the rule is flawed.

## Restrictions

I can’t just throw the attachment system away and make it like in other games. Firstly, the game is built around them, physics calculation simplification, symmetry, coupling and decoupling, exploding parts and tons of other systems depend on attachments. Reworking all of that is basically writing a new game. Secondly, the game will lose part of its identity and it will make it too similar to other games. Also, while the free attachments are great, they basically work only in the radial case. You need some kind of fixed attachment points for top and bottom anyway, so making the rocket perfectly balanced would be even possible.

## The solution

So, I experimented a lot and found a solution that solves most of the described problems without rewriting the whole game. So, say goodbye to slots and connectors and meet sockets!

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMDBiYTM1ZTU1YTYzYmNjMGMzOTA3ZmIwYWZlZWZlY2Q1ZmM0OTNhNyZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/N98j4stALcX9NJXRbX/giphy.gif)
_Wait, what?_

So how do they work? This is basically unified connectors and slots. They obey the similar rules: sockets should match each other and sockets on one of the attachments should be completely filled out. But since there is no difference between them, you can attach any part to any part that follows the rule above!

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTk0MzQyZjA2M2ZhZWI5YzRhNmZjMTk5NjYwZmFmYTQ5YTczMzliOSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/gDyVWBcuaIG7xL8PW0/giphy.gif)
_You can finally attach fuel tanks radially without radial decouplers_

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNTQ1Mjc5Y2UyMTY5MWMxZTk2NmJiMGJjY2FmZmQyZTQ5NjU0ZDM2NiZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/ioXrScjUfzPxCrl3Pi/giphy.gif)
_You no longer need an adapter and could attach fuel tank directly to the command module_

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWRiN2E3MDEyNDkwNmUyOTdjMTNkZjBkMWQyOGQxYzExZjgxNWUyNSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/vfyqzKg1UoFWQ9w9kx/giphy.gif)
_A lot more ways to connect parts are available now, that was not possible before_

But how such sockets would work in reality you ask. I thought about that too.

Each socket has a core of a spicific shape. The core of one of the sockets will rotate 60 degrees on attachment. Then both cores will extend out of the socket halfway perfectly securing the connection. It also has a hole in the middle for transferring resources, signals or electricity between parts.

![](https://clan.akamai.steamstatic.com/images//34094219/c2b2e850fad107512edba90b62f9e612d3d713a3.png)
_From left to right: socket, socket's core, two cores before attachment, two cores after attachment_

Also this type of connection would be several times stronger in reality than the previous connector-slot one.

This is also consistent for docking ports: those brass parts are kinda sockets of a different shape that can be attached only to each other.

![](https://clan.akamai.steamstatic.com/images//34094219/84b16d337b4efa960e6efb97c755100317016a3d.png)
_No more exceptions from rules_

So, as you can see, I’ve implemented this new attachment system, and thanks to the previous assembly rework, it was not that hard. Moreover, I’ve spent most of the time applying the new system to every single rocket part (there are more than 100 of them already). A lot of rocket parts lost their attachment variants, because they no longer needed. Some parts were removed, because they were created only to bypass previous attachment restrictions. And some old parts were improved or reworked along the way.

So, will this solve every single problem in the rocket assembly? No, some problems are partially solved. For example, you still have less freedom compared to completely free attachments in other games. But the amount of different part combinations in the new system exponentially increased and it is much, much easier to work with.

Also,, because much more ways to attach parts are available, part could go wild trying to find appropriate attachment in some specific cases. But I am working on improving that too.

Also this is not a final stop – there is a lot of potential in the new system and many ways to improve it in the future. I also took the one step further and already implemented something that gives even more freedom to connect parts and will improve wing attachment to the planes a lot, but I will tell you about it on the release of v0.19.0 update in beta.

Stay tuned!
