---
author: Arugin
title: Update v0.12.5 "The Fourth Planet"
description: We need to reach Mars so humanity is not a "single-planet species"
date: 2021-07-02 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/a4fd2bcbc7ddb0e232a93f66f861975f4cc4f5f3_400x225.png
game: rocket-science
release_notes: rocket-science/v0.12.5
---
Today’s update finally extends the explorable boundaries beyond Earth and Moon. It also brings a lot of loading time and performance improvements, new Navball and several new rocket parts you've been waiting for. Let’s get started.

## Martian system

Implementing this one was not that easy. I needed to add a new atmospheric physics for Mars, and also develop a new visual model for it. Procedural texturing was challenging too, because you have a lot less visual references compared to Earth. I am not completely satisfied with the result, but it is good for the first iteration. As for Phobos and Deimos it turns out that they have non-spherical shapes so adding support for non-spherical shapes for the Solar system map took a while too. In the end, the red planet and its two tiny moons are waiting for brave explorers!

![](https://clan.akamai.steamstatic.com/images//34094219/dc52bd7e059a8a2f5146ea852ee06d58af208780.png)
_Elon Musk's dream_

![](https://clan.akamai.steamstatic.com/images//34094219/39ea0f175d45d3ef816c0acb308d153229e5e3e8.png)
_Phobos_

![](https://clan.akamai.steamstatic.com/images//34094219/217da62de243f520064005379a8ea2cf2552fc8c.png)
_Deimos_

![](https://clan.akamai.steamstatic.com/images//34094219/e109d09bb77d14aba07efc5f41e44246e3248933.png)
_Night on the surface of Phobos_

## Navball

Navball not only includes visuals rework but also provides more information such as a fuel indicator and heading angle. Every part of navball now has a tooltip where you can also find numerical values of current throttle and fuel amount. You can also switch between stage and rocket fuel using a new button at the top of navball.

![](https://media0.giphy.com/media/6BrxamoCsML37i0dCp/giphy.gif)

As a bonus I’ve added a new Navball mod type where you can customize its appearance. I will update the mod guide later this week, but you can already try a [KSP-like navball](https://steamcommunity.com/sharedfiles/filedetails/?id=2534826336&searchtext=) from the workshop! (Just don’t forget to select it in the game settings after subscribing to the mod).

## Solar System Map

New space context menu will make your life easier! You can left click on a spacecraft or celestial body and get context-dependent options, like “Switch to” or “Focus”.

![](https://media.giphy.com/media/GNCK7vihATxFk0Q6Ki/giphy.gif)

The “Set as target” option from the context menu will show ascending/descending nodes on your orbit and will add “Target” and “Anti-target” autocorrection modes to Navball.

![](https://media1.giphy.com/media/1dhwpXpJiUSo6FA5a3/giphy.gif)

Last but not least, the maneuver raycast handle will automatically snap to orbit nodes, so the maneuver can finally be placed exactly on periapsis or ascending node! You can hold the ALT key to switch to the old behaviour.

![](https://media2.giphy.com/media/w9fxCTq6p5ib13AdqX/giphy.gif)

## New parts

Rocket parts from this update include two new engines! Since every engine in the game is based on real analogue from the USSR or Russia, it requires a lot of research to create and add it to the game. That’s why all previous updates didn’t include them. But this time everything came together and you can try the most powerful single-chamber liquid fuel engine ever created in the USSR for the lunar program (sadly, it wasn't used in real flights because its development was stopped in 1970).

![](https://clan.akamai.steamstatic.com/images//34094219/f9a91f28df095bf0a785d4989d7c9446dd2256c1.png)

The second engine added to the game has the highest specific impulse in vacuum in the game (but lowest thrust). You can try to guess on which real engine it is based.

![](https://clan.akamai.steamstatic.com/images//34094219/8ea54a43cfb089e0a105974f82ad70f0b271b402.png)

\*\*\*

There are a lot of changes and fixes in this update too. Most important are loading times and performance improvements and a bunch of flight fixes. You can find a full changelog below. I am planning to release one more big sandbox update in the future (which will include a rocket instruments feature I talked about in the previous dev update) and then switch to spaceport building.

I hope you will enjoy this update. If you encounter any bugs or problems with it, don’t hesitate and leave it on the forums or in the official [Discord channel](https://discord.gg/unbegames). Thank you and see you in the next update.
