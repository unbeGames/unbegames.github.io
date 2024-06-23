---
author: Arugin
title: July Developer Update
description: One year later
date: 2019-07-31 22:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/41a312866d5f323c55e7be0b773474b76ab8d389.png
game: Rocket Science
---
Hello friends!

On August 1st, 2018 I decided to leave the prototype of the isometric shooter I was working on and make something small in one or two months. I started with a 2.5D arcade about launching rockets into space, where you were able to collect resources, bonuses and boosters during the flight and then spend it to upgrade your spaceship or buy new parts for it. And I don’t know how it has happened, but here I am, a year later, working on one of the biggest and ambitious games in my live. The great news is that the game vision has not changed since January, when the first Dev Update was also published. And I am slowly but steady getting closer to the goal.

![Robot Hunter prototype](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/e74decda5c42c5300a1465095cd2ac45fe977de3.png)
_Prototype of the game that I abandoned for Rocket Science_

As for development, I need to work on three main areas. First of all is the game sequence, which is important not only for the release, but for early playtests too. It is the hardest task I have ever had, because the first three hours of the game in Early Access will determine the future of the game in store. This includes compilation of all game systems into solid gameplay and making content for it as well as creating tutorial and hints for all of that. And I can’t even send the game to my friends to try it out before the tutorial will be developed. And it is hard to make the tutorial, when you not sure if some particular parts of the game is working as intended. But sooner or later, I will figure it out.

The second one is to brining all game systems to the “ready for Early Access” state. For example, I am happy with the planet generation system, but I am not satisfied with the planet’s rendering. There is an annoying tiling on the surface and lack of different materials. I need to develop a texture layering system to remove tiling and give the biomes more natural look. Another example is the water, that looks like this in the game right now:

![Current water rendering](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/72042ac74fd22953b4a6df3dc01c9ad99bdff096.png)
_Not great, not terrible_

I found a several good water shaders, but they work only on planes and need to be rewritten to work with planets. This is very interesting task and it will be really exciting if the water in Rocket Science will look like this:

![Planned water rendering](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/41a312866d5f323c55e7be0b773474b76ab8d389.png)
_Good water is usually 1/3 of the success_

Another thing about planet generation is that I found the way to increase the heightmap resolution from 8192 x 4096 (the max allowed by Unity) to pretty much unlimited. The only limitation is the memory and disk space. For example, I found and will use 43200 x 21600 heightmap for Earth, which means that instead of 4x4 km area, one pixel of heightmap will cover 0.7x0.7 km! If you know, where I can find heightmap with the higher resolution, please let me know in the comments.

![Sliced heightmap sample](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/1696ef597e4cbee9fdb04729938f2afd08f56252.png)
_This is the part of heightmap with the Himalayas. You can even see rivers here._

Every other game system has some things that need to be finished too. For example, I need to implement patched conics for orbits, to show the spaceship trajectory, when it is leaves or enters the sphere of influence of the celestial body. Direct controls for flights without flight plans need to be done too. And there are a whole bunch of spaceport building, flight planning and rocket assembling tasks waiting for my attention. But the great thing about this is that I can switch between them every time I tired of the previous one. They all are completely different and each of them brings an unique set of problems and challenges.

The last one is the polishing pass that includes sounds, effects, optimization and quality of life features, like game settings. Unfortunately I haven't even touched this yet, but I finally started to think about this it, which is a good sign.

Every day the game is one step closer to what I imagine in my head. Not only this, but my passion for space, as well as your constant support, helped me to overcome this year-long journey and keeps me going. Thank you and see you next time.
