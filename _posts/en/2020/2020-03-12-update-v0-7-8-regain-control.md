---
author: Arugin
title: Update v0.7.8 "Regain Control"
description: Better late, than late
date: 2020-03-12 22:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/dccb450b212dd3502ab5bf66d4e0bddd56773baa_400x225.jpg
game: rocket-science
release_notes: rocket-science/v0.7.8
---
Hello, guys.

It was supposed to be another patch and I planned to release it last week, but some changes to the game required implementing missing features, some new features added more things to fix, some fixed bugs showed, that the game needs more changes and so on. I didn’t even notice, how all this work suddenly become an update.

I started dealing with the most common complaint: rockets are hard to control, especially in the lower atmosphere. It was pretty obvious, that reaction wheels alone can't handle it. So I needed to implement thrust vector control (TVC) for engines. While changing the angle of engine’s nozzle was simple, a lot of problems appeared when I tried to add TVC to spacecraft auto stabilization system. The problem is that the torque, generated using TVC is much stronger, than if you are using reaction wheels. And it depends not only from engine thrust and nozzle tilt, but from the engine position relative to the center of mass of the spacecraft. Thus I spent days trying to make stabilization system responsive, but so that it does not overshoot or wobble all the time. Only after I started to calculate all possible torque, that engines can generate, I could send correct values to PID controllers, that auto stabilization system uses, and spacecraft became more or less stable in the flight. As a result you can finally start to make gravity turn pretty much at any moment if you have enough engines with TVC and positioned them correctly on the spacecraft.

![](https://media.giphy.com/media/Jn3zfikEEoLqn0gc5t/giphy.gif)
_Such turns and stabilization after it would be impossible without TVC on that altitude_

After that the second problem immediately arose. Because of how camera is locked on the rocket and since there are no other references in the flight except spacecraft itself, there's the illusion that the center of mass of the spacecraft is located at the camera focus point. And since the rocket is turning pretty fast right now, it was painful to see. So I rewrote camera targeting system and now it focuses at spacecraft CoM by default. And you can switch it to any rocket part or move along the spacecraft during the flight.

![](https://media.giphy.com/media/W3TM7VyirO371MxQdF/giphy.gif)
_The top of the engine is in the camera focus right now. And there is an illusion, that CoM in that point too_

There are a lot more, that I did during the past two weeks (like velocity and orientation markers on navball, oh yes), but you can read about this in the update notes bellow. A small note about this update. I’ve tried to not introduce breaking changes to the game, so your save games should work, but all the spacecrafts you’ve created will not receive new features like TVC or changed stabilization parameters. So it is better to create the new ones. Also some new key bindings could be missing because of how controls settings saving are working. So it is better to check it or just reset controls to defaults.

Now I want to tell you about future plans a bit. The next most important features are: the Moon landing, improvements to orbit system, maneuver planner and symmetry tools for rocket construction. While the Moon are almost there (I need to fix a bunch of bugs and prepare textures for it), other systems are pretty big. Also I need to rewrite a mathematics simulation (when you are on orbit and engines are turned off) a bit, because I created it almost a year ago and it does not properly support a lot of new systems that I added later (like electricity, or checking spacecraft collision with the planet surface). Because of that I have currently no ETA for the next update, but I hope it will be in April and it definitely be huge.

That’s all for now, I hope you will enjoy this update!
