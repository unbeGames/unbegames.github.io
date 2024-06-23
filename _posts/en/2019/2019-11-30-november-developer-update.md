---
author: Arugin
title: November Developer Update
description: Making the trailer
date: 2019-11-30 21:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images//34094219/c9089c3a11a66b058b8c84cafccbd9ce97a5a01a.png
game: Rocket Science
---
I wanted to publish a game trailer today instead of the usual update, but I was blocked by a critical bug in the Unity engine, which crashes the build. And because I use only ingame footage in the trailers, we’re gonna have to wait one or two weeks until it will be fixed. On the other hand, It is not that bad, because I will add more content into the game in that time and trailer will only get better because of that. Let's talk about work that was done and need to be done, so I can finally release the game. **Note**, that there is a link to a small survey at the end of this update. Please take a part in it, it will help me a lot.

![](https://clan.akamai.steamstatic.com/images//34094219/c9089c3a11a66b058b8c84cafccbd9ce97a5a01a.png)
_This is how the Earth miniature looks like in the test scene in the project (3km radius)_

Preparing a game trailer is a kind of preparing to a small release. You need to add enough content, make sure, that everything is looks good and there are no horrible glitches. Also stable 60 FPS during recording is very important, so you need some time, to optimize the game code. On top of that, you need to think about the story in the trailer and what message you want to convey with it. And finally, you can’t waste a time making things, that aren't gonna get into the game.

That’s why it is hard to tell, what exactly was done for the game during past month. I made a lot of small features and fixes, scattered all over the project. Other than that I finally started making content for the game in form of rocket parts, but I'm not gonna spoil them, because they are part of the trailer. And yet I have prepared some things to share with you.

The first thing is a part attachments. I partially covered this topic in the [May Developer Update](https://steamcommunity.com/games/890520/announcements/detail/1621772460694645634?snr=2_groups_partnerevents_), but there were a few questions I had to answer. The most important one is what to do with the side attachments. For example if we have fuel tank, there will be at least 5 different ways to connect something to the sides of it.

![](https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fclan.akamai.steamstatic.com%2Fimages%2F%2F34094219%2F71d3dbe2239c96c01dbd6fd79c59ec12f61fed49.png)
_Here is a top view of the fuel tank and six different types of side connections to it._

Due to the fact, that all attachment points is preconfigured and precalculated, they can not be added to the rocket part dynamically. But representing every type of connection by separate item in the assembly shop UI means adding six same fuel tanks with the only difference in number of attachment points. Which adds a lot of clutter and not very intuitive. After some trial and error I found a good solution: part configuration.

Thus, in the case of fuel tank above a small icon will appear on the part UI, which means that this part is configurable. When you click on it, it will show available options.

![](https://clan.akamai.steamstatic.com/images//34094219/7a4f9a63e48d17be990a07a90c02f7fae7c016e0.gif)
_Radial attachment selection in the part configuration_

The great thing about this, is that you can have different types of configuration per part. For fuel tank it can be not only number of attachments, but type of it contents: only fuel, only oxidizer, or both in right proportions. Obviously, these choices will have an impact on the flight characteristics of the rocket part. For example, even for different number of attachment points each variant will have slightly different mass and air drag. And I'm not even talking about the types of fuel tank content, because it opens up so many possibilities to build your spacecraft.

One interesting thing I learned from modeling rocket parts for the game, is how precise they have to be. Because the shape of parts matters and is involved in the physics calculations, even a small asymmetry can lead to instability and unpredictable behaviour of the whole spacecraft. Usually I am a little bit of perfectionist when it comes to modelling. But in this case it's really justified, especially for the parts that put rocket into orbit.

Another good task, that I did and can show something is improvements to interpolation algorithm of planet geometry generation. Earlier, you'd have noticed pixels on the planet due to the fact, that heightmap has finite resolution. Now everything is smooth.

![](https://clan.akamai.steamstatic.com/images//34094219/27b62f68f1b5c2d5e09ac93d8797d16011ba16bf.png)
_Before the change_

![](https://clan.akamai.steamstatic.com/images//34094219/56ec187d2febcf4dc7f67dd41223445c5be4e32d.png)
_After the change_

As for the future work on the game, it comes to making content and establishing the game loop and preparing to the release in Early Access. The only two systems, that are missing right now, are the direct flight controls and contracts system. The first one brings more fun into the game, if you don’t wanna plan your flight ahead, and want to just fly around and explore. The second system is needed for the Survival mode, where you should actually earn the money to pay salaries and unlock new rocket parts and buildings to keep your space center going. It worth to mention that the second mode will be Sandbox, with everything unlocked from the beginning, for those who like to have fun and experiment on their own. Both systems are not that hard in implementation, so I don’t see any big problems with them, compared to the rocket physics, for example.

For the preparing to the release, I need some data from you - my core audience. What hardware are you using and what are you waiting from the game the most. I can then set priorities correctly and concentrate more effort on the important things. So, to help me to do it, please take part in [a small survey](https://forms.gle/MPKfebFoMCP4EfH57).

Thank you, stay tuned and wait for the trailer with the release date announcement in it! It will be published soon™.
