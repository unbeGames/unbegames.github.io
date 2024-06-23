---
author: Arugin
title: September Developer Update
description: The battle for good physics, part 1
date: 2019-09-30 20:52:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/b8d89f5d68728a2b1cec73f6bb55970d38864bfc_400x225.png
game: Rocket Science
---
Hi there!

September was a very productive month for me. It is much easier to work, when there is overcast and +5 °C outside. During this month I managed to solve the most difficult task in my life: the rocket physics.

Let me explain. As I have said many times, the ability to plan flights ahead and perform them without direct player control and the Solar System in real scale are the main features of the game. But it also imposes several limitations.

For example, due to floating point precision of PhysX all physics calculations for rockets with running engines should be performed no further than 10km from the world's origin. Otherwise, the accumulated errors during calculations will lead to huge jittering and in the worst cases the Kraken will appear and destroy your ship. This is usually solved by constantly moving the world around the ship, so it stays near the origin all the time.

![](https://clan.akamai.steamstatic.com/images//34094219/ba1d4cb4d0019be5a9af1cb44fea2872240fb679.png)
_Imagine this sphere is actually Earth. Then the size of the area, where spacecraft could flight before shifting the whole world will be less than one pixel!_

But here is the problem. Imagine two ships, one orbiting Mars and one near the Earth. The average distance between them will be around 225 000 000 km. And it happens that both turn on engines at the same time. What to do in this case? It is impossible to move the world in such way so both ships were simultaneously in the world origin. Well then we must sacrifice one of the ships, by moving another to the origin, because the error would be so huge, that first ship will instantly crash into the planet. Or the game should not allow that situation. But this ruins the whole point of the flight planning.

Initially I tried to implement simple flight physics in double precision on my own. It worked good for small rockets with one engine and gave extremely precise results. But the were much more cases that I needed to handle:

- Several engines with different positions and angular forces they cause to the rocket.  
- Basic aerodynamics, where shape of the spacecraft will affect its movement in the atmosphere.  
- Collisions with the surface and other ships.  

There were no way that I could ever handle all these cases in reasonable time and develop them without going crazy. And I could not release the game without these basic things.

So I started to search solutions. And after three months the solution came from the unexpected side. Less than a year ago Unity released the Multi-Scene Physics (or Multi-Word Physics) support. It means, that I could run several invisible physics simulations at the same time and they will not interact with each other. So in the case of two ships above I just needed to create two Physics Worlds, place physics representation of rockets into them, move the world in each simulation so that the ships are in the origin, perform calculations and then synchronize the results of the simulations with the visible world. Sounds simple, right? Of course it is hard as hell! But it was much simpler than reinventing the physics engine.

![](https://clan.akamai.steamstatic.com/images//34094219/24bc19fe1690be2e8c46eda2909a86490394ba75.png)
_Here spacecrafts are far from each other and both simulated in separeted Physics Worlds (big green spheres)_

But how ships will interact with each other, if they placed in separate simulations? This an interesting question. If the two or more ships are approaching each other and the distance between them become less than 6 km I will put them all in one Physics World. If the distance exceeds this number, I’ll move them back to separate simulations. And because I perform all calculations for whole rocket and not to its parts it works pretty good even on my 5-year PC. Obviously, there is a big room for performance improvements. Which will be one of the main tasks in the Early Access.

![](https://clan.akamai.steamstatic.com/images//34094219/126cf9312f5a47f872b6d81baafc69758ede485d.png)
_Now they are close and we are moving second spacecraft in the simulation of the first one_

There are still a lot of work with this system. For example. I’ve solved different engine configurations and partially atmospheric drag at this moment. The collisions need to be implemented, but now I see the way and feel confident, that it would work. And, of course, there are tons of physics bugs waiting for the fix. Maybe I will prepare some funny gifs with them next time.

Thanks for attention and don’t forget to join our [Discord community](https://discord.gg/unbegames)!

P.S. Valve have changed Steam algorithms two weeks ago and game’s store page traffic went almost to 0 after that. So, if you have friends, who love space and rockets, please send them link to the “How do you like it, Elon Musk” page. You are my only hope.
