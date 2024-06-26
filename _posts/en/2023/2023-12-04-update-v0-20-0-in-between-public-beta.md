---
author: Arugin
title: Update v0.20.0 "In Between" Public Beta
description: You often have smaller updates in between the larger ones
date: 2023-12-04 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science, beta]
image: https://clan.akamai.steamstatic.com/images/34094219/3cf37bc8b82aacf8413467c110d88589811d20bc_400x225.png
game: Rocket Science
---
Today I am releasing part of the v0.20.0 "In Between" update into the beta branch. This will not include new rocket parts and several smaller features. They need a bit more work, so they will come in two and a half weeks with a full update release. So, let’s talk about what’s new is awaiting you in this update.

**Note**: this update is in public beta. This means, that you need to swith your game to beta-builds branch, to access it.

## Ceres

The first dwarf planet located between the orbits of Mars and Jupiter has arrived to the game! The surface elevation is based on Dawn space probe data and the surface color was built using the newest procedural texturing technology. It is a small body only 946 km in diameter and a mass of 0.0128 of the Moon’s one with a high inclined orbit. It would be almost impossible to reach with the current set of parts, but I will not underestimate players of Rocket Science, who have already arrived on every single present body in the inner planet group with the technology made mostly for lunar flights. So we’ll see how it goes.

![](https://clan.akamai.steamstatic.com/images//34094219/866cecbe7404342fac658db45bf3b244da1910ea.png)

## Vesta

The first fully made asteroid is now in the game too! It is the second biggest body in the asteroid belt with the mean diameter of 525 km. While it is a pretty big object and its shape is close to a gravitationally relaxed oblate spheroid, the large concavity and protrusion at the southern pole combined with the small mass placed it into the asteroid category instead of dwarf planet one.

![](https://clan.akamai.steamstatic.com/images//34094219/335e227103fd76824e7ebbf3cab73a43dcc2552f.png)

## Mars textures rework

I’ve mentioned this one in the [previous dev update](/en/posts/2023/dev-update-overcoming-unity/). Not only did it get a new procedural selection of colors, but twice as many materials using some new ones. Here is an orbit view of the planet.

![](https://clan.akamai.steamstatic.com/images//34094219/a5e51061cd54971f8695979c3eff106e27cee1a3.png)

## Control center UI changes

I’ve added a new Celestial Bodies list there. It only contains major bodies in the Solar system for now, but I'll add more as time goes on. Spacecrafts list was reworked and can hold more elements and it is harder to accidentally remove your spacecraft now (you should specifically toggle on hotkey removing or use a delete button for that). I’ve also added search functionality to both lists.

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExam5xc2w0bmo2ZXg2MmFvYXA5ejR4MmluZ3dtNnhyNTRxZWt1ZmlhbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/7KjlAHMpw3WdTObFCg/giphy.gif)

## Map filters

You can filter your map in the control center and during the flight now. You can finally turn off all debris and don’t see it anymore (but the game will still simulate it, there is no way around this).

![](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2JuY2RyZjJ3bnVqZnJuZnd2Y2NkbjBwMTh1Z3Yya3U2NjF1YXo3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/dD7pzSxhaTOqn0v4ss/giphy.gif)
_The filter also applies to the spacecraft and bodies lists in the Control Center_

## Flight panels improvements

One of the frequent requests was to display rocket orbit data. I’ve added an orbit instrument, where you can see the orbit's periapsis, apoapsis, inclination and eccentricity. Note, that orbit data is available for all spacecrafts, but when the instrument parts system will be implemented, it will be tied to a specific instrument you will need to attach to the rocket.

![](https://clan.akamai.steamstatic.com/images//34094219/fa1c6760f4d6782fbda8376f33c675b37133af14.png)
_Please let me know if you need more orbit data and I will add a toggle for that_

You can also display all the resources that the rocket has by simple toggle now.  
![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNXhraXRzZmVncno2MXN5eW5ydm83emJ4cHRlN2tieTZycjZnb3JmaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/NZQZGNP4Fs4Z4rru64/giphy.gif)

## Other features

Two most requested features are in the game: Fast Load button and orbit planner improvements. You no longer need to ALT+F4 the game, if you made a mistake. You can load the last game autosave at any moment during the flight or in the space center.

![](https://clan.akamai.steamstatic.com/images//34094219/333513e3418c888b4049a787483ab524c97d4b17.png)
_Due to legacy code limitations, the game will load spaceport by default, but I am planning to make it load directly the flight if you pressed the button during the flight_

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExb3J6ZWpmcmZjbzNtMHRpamdtY2VpMWQ0NjQwOW54NXJoMzFpY2drYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/DqSbJ5qkgBQkXtdn13/giphy.gif)
_If you will get an encounter and then will switch to a body in which SOI spacecraft will get to, you will be able to see an orbit relative to this body frame of reference_

## Engine update

I’ve described this in the [previous dev update](/en/posts/2023/dev-update-overcoming-unity/) too. It was a very long and painful process and there are so many changes in the code, most of those are invisible. I’m expecting plenty of bugs and crashes in this update. On the other hand, some systems should start working smoother and faster. There are a bunch of bugs fixed as well, and more to come. Anyway, please let me know if you find anything not working as expected and I will be glad to fix it.

That’s all for today and I am waiting for your feedback.
