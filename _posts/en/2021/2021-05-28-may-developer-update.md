---
author: Arugin
title: May Developer Update
description: The perfect cycle
date: 2021-05-28 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/228213a6d47e2adfbe6822d44bd63de74eae84eb_400x225.png
game: Rocket Science
---
As time went on, I realised that three-months cycle for HDYLIEM development is the best. Three months is a good chunk of time to make meaningful changes to the game. And it is not long enough so players start thinking that the game was abandoned.

The first month I always spend refactoring and improving the game's code base and implementing features that may not be that important right now, but will be very useful in the future. Why am I doing this? Because in the long run high-quality and resilient to changes code will undoubtedly win. It produces less bugs on each change and implementing new game mechanics or adding a content becomes a simple and pleasant process. Also some things are much easier to add on the earlier stages of the development because game architecture is still flexible.

Let me show you some examples.

In the current live version of the game, the planet surface in the spaceport or assembly shop is fake. I mean, there are a bunch of surface quads that I got from the flight on spaceport coordinates and saved as static meshes and then I am loading them with other buildings. I did that because 1.5 years ago planet generation and rendering was not that performant comparing to how it is working right now. There is one problem with that. Every time you launch the rocket game needs to create the whole planet. And every time you return back to the spaceport it needs to destroy the planet. It is a long process and that’s why these transitions were so long.

So I’ve changed that. Right now Earth is created when you load a spaceport for the first time. And if you go to the flight on the spacecraft that is located on the surface of the Earth or orbiting around it, nothing will be destroyed or created, because the planet is already there and ready for action. So what? There are a bunch of advantages to that:

- spaceport is located in a real place on the planet;
- transitions between spaceport/assembly shop and flight are much faster now;
- quality and performance settings affect planet surface in the spaceport/assembly too;
- spaceport could be located in any point on Earth;
- spaceport could be located on any planet in the Solar System.

The last two items from the list are not usable right now. But when I need to make a selector of the starting spaceport position or position and render a player's colony on Mars, it will be as simple as setting two coordinates for that.

While I worked on that, I decided to experiment a bit with the surface mesh triangulation. Here are some before and after screenshots:

![](https://clan.akamai.steamstatic.com/images//34094219/668a55573ac284e82816ff403acbef365f2de86f.png)

![](https://clan.akamai.steamstatic.com/images//34094219/8e262c3400c8c071536c0a941e93b6dbfb168167.png)
_Interestingly, that the triangles count is the same in both cases. Every even triangle just rotated 90 degrees relative to the previous one in the new triangulation algorithm_

And in game result (you may click on them to compare in full resolution):

![](https://clan.akamai.steamstatic.com/images//34094219/e60e16d840c689a6154c41d0f443b91a0d90ca73.png)

![](https://clan.akamai.steamstatic.com/images//34094219/249b0f88443c68b2ad667a689ab3b1f987ac06bd.png)
_The change is subtle, but the surface no longer looks like it was stretched along one of the axes_

It seems to me like such small details is an important part of what actually makes the game good.

Second month of the development cycle I usually spend on some big changes in the game that actually affect gameplay in some form. And the third month is the time for adding new rocket parts, small changes and improvements, local verification, testing and bugfixing.

The changes I made at the start of the second month were not so big but very important for the game. I decided to rework the navball UI. The current one is performing its function but is painful to look at. Here is some results of work:

![](https://clan.akamai.steamstatic.com/images//34094219/5c39b4d63095fc0a297fac5497c7296d8bfb6923.png)
_How it is right now_

![](https://clan.akamai.steamstatic.com/images//34094219/39eec5d6bce4e50be7ca50e9028be80bf21d157a.png)
_How it will be_

Navball UI moved to 3D and also has a heading angle value and a fuel amount indicator now. Also I’ve added two more rocket status indicators that are reserved for the future. Also if you hover the mouse over part of the navball it will show a tooltip describing its functionality.

The next thing I need to rework is the window that contains flight and environment stats. Like pressure, altitude etc. But I don’t want to just change this window. I want to make it so that if you want to get pressure, altitude, temperature or other values, you need to install an appropriate instrument on your rocket. Some command modules could contain some instruments already installed. For example “Vys” command module will most likely have an altimeter installed (you definitely don’t want to send a crewed spacecraft without this info). But for others command modules or probe cores it should be your decision what instruments to take on a flight. This will make rocket building a bit deeper and also will bring a bunch of new rocket parts into play. Cargo modules will become useful as well.

I have more features implemented at this moment, but I will hold on to them until the release which is planned at the end of June.

The last thing I want to talk about is the game modes. Right now I am working exclusively on Sandbox, because you can incrementally improve the game and release an update every three months or so. This is all good but the game was about spaceport building at the start of this project, so I am planning to release two more Sandbox updates (this and the next one) and switch to the Survival mode development. The problem with this one, is that it could only be released when it will be mostly ready with the finished and solid game loop and good progression system. It means that most of my work will be hidden until this mode will be finished. But I will still try to make a release once in three months including content and changes related to the Sandbox.

Hope you enjoyed this dev blog, see you in the next update!

P.S. Here is one more work-in-progress screenshot, just for you.

![](https://clan.akamai.steamstatic.com/images//34094219/6d02cf29a595ffd7845a2668a4f8e792037a7b42.png)
_What it could be?_