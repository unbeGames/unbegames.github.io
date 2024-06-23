---
author: Arugin
title: October Developer Update
description: The battle for good physics, part 2
date: 2019-10-30 21:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images//34094219/221c092ca0d1ad48f568ff33a296bd360e4a6839.jpg
game: Rocket Science
---

Hello, friends!

This month I made a great progress developing the game. I spent it almost exclusively on physics, implementing things I mentioned it the previous update. And everything worked out almost exactly as I planned and I did even more than I could have imagined. So, without further ado, let’s talk about it.

![](https://clan.akamai.steamstatic.com/images//34094219/221c092ca0d1ad48f568ff33a296bd360e4a6839.jpg)
_Some rockets were hurt while preparing this update_

## Rocket physics

The only good way to support timeline and time rewind is by representing the spacecraft with one physics body. But since the spacecraft is made by player and consist from different parts with different shapes and masses, I needed a good way to account for it in the simulation. Otherwise, you will immediately feel, that the physics is not correct. I solved it by calculating the forces that affect every part individually and then applying them at the right positions of rocket's body. So, if you will not balance your rocket right, and there is not enough auto stabilization force, it will eventually start flipping to the side with greater mass.

## Aerodynamics

I used USSA equations for the atmosphere model. Since Earth and Solar system are in real scale in the game, the equations was not modified in any way. The only difference is that Earth atmosphere in the game ends at 110 km, where the pressure is so low that it can be neglected. The surface area and dimensionless drag coefficient are pre calculated for each part, which means that the shape of spacecraft will affect it flight characteristics. The approximations I used for calculating drag forces give decent results and have a good performance. But I am open for the better drag models in the future.

## Collisions

This was the hard one. All collisions are handled by PhysX. And there is always a tradeoff between accuracy and performance. If the collisions were solved even a bit incorrectly, spacecraft will be immediately launched with 10x speed of light into abyss, because bodies has huge masses and moving with the high speed in the simulation. One small error and the whole experience will be ruined. But if you increase accuracy too high you will receive a poor performance and angry players. While I found a decent settings for collision solver, I will expose some of them in the game settings, so everyone will have chance to tune the game to their computer capabilities. Here are some funny gifs before I tuned the PhysX and fixed tons of bugs.

![](https://media.giphy.com/media/XzYGySKcvZjYUGU19C/giphy.gif)
_A simple collision with the ground threw a ten-ton rocket, as it was made of plastic_

![](https://media.giphy.com/media/j3VvAyHADhGu9YHPZB/giphy.gif)
_Here collision between two parts of rocket send both to the orbit of Pluto_

## What else?

For now the water physics is missing. I wasn't be able to quickly find the good algorithm for that. I could use the same drag model as for atmosphere, but with higher density, but I don’t think this is the only and right solution. So I will continue investigate this topic after release. For now there are two options: every spacecraft will immediately explode on the contact with water. Or it will just ignore the water and fall though it. I like the first option more, because it destroys immersion to a lesser extent.

Also I didn't implemented wings yet, but I will do if I will have time for it.

## Not only physics

When I got tired of fixing physics, I switched off to another area of the game. The first one was stars. Initially I used simple texture for it. It was huge (almost 8 Mb with the resolution of 8192 x 4096), but even with that stars looked blurry. Also all of them had the same color which is far from reality.

![](https://clan.akamai.steamstatic.com/images//34094219/1b2d1fffe4cf89830f7a74b8913fd640ca29637c.png)
_Old stars_

So I implemented own starfield system using the real world star database, which includes more than 110k stars. Every star now uses a color, brightness and position from that database. Even with 65k stars all the data occupied only 2Mb of memory, but you usually don’t need this many. You can see about 6000 stars with your naked eyes. And again I will expose starfield settings, so you can change the stars count. maximum brightness and exposure how you would like. The only thing I am missing now is the Milky Way, But I will make it sooner or later too.

![](https://clan.akamai.steamstatic.com/images//34094219/1a2c41b5c3fceb5c3ead0d37d7cfb59a7a511540.png)
_New stars. It is better to compare both images in full-size in the browser_

The second one is the orbit rendering. Initially I used builtin Line Renderer, but it was not good, when the orbit was far enough from the camera.
![](https://clan.akamai.steamstatic.com/images//34094219/a9350f17eff2aba1108322b035ca50a953850369.png)

Well, time to implement custom orbit renderer!

![](https://clan.akamai.steamstatic.com/images//34094219/d274562f1c81248142cad93bb077d0efb24be57e.png)
_It is better to compare full-size images here too_

At the end of this month I felt like I created my own game engine for the flight simulation. Almost everything is custom: planet generation, orbital mechanics, drag and gravity, starfield and even my own version of the line renderer. Funny enough, I got around 80 FPS in the flight on my computer (i5-4590 and GeForce 970), where so many different calculations happens. And only 55 FPS in the spaceport, where nothing complicated is going on, just a bunch of objects and light sources.

It’s time to finish this update. I will leave you a gif where you can see the result of all work done in this month. It looks so simple, right? But it was not easy no get there.

![](https://media.giphy.com/media/cIsvEt5gsgSFaZjZjw/giphy.gif)
_Note: the gif was recorded on 5x time warp_
