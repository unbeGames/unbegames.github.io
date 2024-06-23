---
author: Arugin
title: March Developer Update
date: 2019-03-31 18:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
description: Orbital mechanics
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/14ed4aa2a72c0aa043463164a92070616a2f46d9.png
game: Rocket Science
---
Hello, guys.

Today I want to talk about orbital mechanics and spacecraft physics in "Rocket Science". Around the middle of December, I came to idea, that player will have no direct control over the spacecraft and all flights will be performed through the flight plans (you can read more about this in the [January Developer Update](/en/posts/2019/january-developer-update/)). Before that I had an arcade prototype of flights in the 2.5D, like in the thousands of other games on mobile stores, where you can fly up as long as you have fuel. You should collect resources, repair kits, avoid obstacles and so on. In other words, it looked like this:

![Rocket Science prototype](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/df1a14651be0f54b733afb7322adc58d63501e31.png)
_This is a screenshot from prototype that started it all_

This was fun at the beginning, but as time goes by, and especially with the creation of planetary and atmospheric systems, it became more and more obvious, that this part of the game is out of place. Luckily, I got that idea about the flight plans during the discussion of this problem in the comments on the first article about the game. It sounded great, but I had several problems, that need to be solved.

- Flight system should be moved to full 3D
- Rocket assembly will became more complex due to p.1
- Unity physics will not work for the flight planning interface and in general for the game.

While the first to points were solvable, I had no idea what to do with the last one. Let me explain, why it was the case. Here is the prototype of flight planning interface:

![Timeline](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/4496c88c8083629ca15496d805ef7eac9a13dd47.gif)
_Another prototype, this is flight planning in form of timeline like in video editing software_

It is like timeline with commands. You will be able to scale the time, fast-forward it or move to any point on timeline and then add the command (thick vertical white lines). When the command reaches the white arrow, rocket will execute it. Command is an any action, that can be performed by rocket part: engine start/stop, turning the spacecraft or decoupling of empty fuel tank. The problem with standard physics in this case is that it state-dependent. That means if, for example, you need to jump to 10-th minute of the flight, the game have to simulate the whole world state for 10 minutes with the step of 0.02 seconds. As a result, the game will hang for several seconds even on the most powerful computers, which was not acceptable.

![Earth](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/14ed4aa2a72c0aa043463164a92070616a2f46d9.png)
_Here is a our blue pale dot_

So, I spent plenty of time searching and implementing the solution. And it called “Two-body solver” and this is basically the orbital mechanics for celestial bodies from the physics textbooks, where the state of all bodies became a function of time. Which was exactly what I needed for timeline. Moreover, I could use real orbital and body parameters for all planets and their satellites of our Solar System. I got it from NASA website, added to the game and you can see the result below.

![Solar System](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/dae5b661e19cbc510e6012ea99dfbca7947a77e0.gif)
_Solar system map_

This was great feeling, because the game suddenly acquired an additional value: I could set any date and see the real positions and rotations for all planets of Solar System. But what does it mean for gameplay? It means that the content of the game became almost infinitely expandable: in the far far future players will have an opportunity to fly around and explore not only Earth and Mars, but the whole Solar System! It sounds very bold, but it really has that potential. If we stop dreaming for a moment and go back to Early Access release, the whole system will be here, but initially you will be able to land only on Earth’s surface. The Moon will arrive in one of the next updates and then one by one will come other planets.

The only drawback of two-body solver is that it can not be used for accelerating bodies and you need to use the state-dependent integration solver in this case, which is a bit slow. That’s why you can't speed up the simulation more than four times in KSP, when the rocket is throttling. As I mentioned in the first dev update, I managed to partially solve this by simplifying simulation and calculating physics for the whole spacecraft at once, not for its parts. By doing that I got the maximum of x30 time warping without significant loss of accuracy when rocket engine was working. I think, it can be further improved in one of the following game updates.

That’s all for today. It is a bit short, but release is closer and closer and I have so much things to do. Now I have to work for at least seven hours a day, seven days a week, to complete the most critical systems for the game. But I am very inspired by seeing your interest and support. And if you interested to joining to our space loving community, you can do it by joining to our [Discord channel](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fdiscord.gg%2FCx3yAH6). Thank you and see you in the next update.
