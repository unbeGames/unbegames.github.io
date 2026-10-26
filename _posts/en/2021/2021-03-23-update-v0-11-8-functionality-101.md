---
author: Arugin
title: Update v0.11.8 "Functionality 101"
description: Getting better
date: 2021-03-23 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/4113a6c154cfda6a0cdf4b85131019760078e3a8_400x225.png
game: rocket-science
release_notes: rocket-science/v0.11.8
---
Hello everyone! it’s time for another update! This one is the biggest one in terms of fixes and changes since the game release. Let’s not waste any more time and jump right in.

Note the hotkeys changes in the changelog below!

## Subassemblies

Save the group of parts into subassembly and use it later during construction of another spacecraft.

![](https://media3.giphy.com/media/vzfctx93QuwvjRKYQO/giphy.gif)
_Save subassembly_

![](https://media1.giphy.com/media/pXEbHWgu02bWFsGRbd/giphy.gif)
_Use subassembly_

## Part rotation

Use a rotation handle to rotate part groups and already attached parts following the attachment rules.

![](https://media4.giphy.com/media/EFalTl383q8n97ybRt/giphy.gif)
_Rotation of whole rocket_

![](https://media3.giphy.com/media/YzGGJegGCHOrFIf5cY/giphy.gif)
_Rotation of attached part_

![](https://media1.giphy.com/media/V4gxDBiPyZhOqyIBXp/giphy.gif)
_Symmetry works during rotation too_

## Ocean

I’ve implemented a new ocean system. It includes real waves, foam and it changes color depending on depth to the sea floor. Also simple collisions were enabled for the ocean surface, so you can land spacecraft on it. It is a temporary solution until proper water physics will be implemented

![](https://clan.akamai.steamstatic.com/images//34094219/9096dc04ff178a3fa86199cca6c1f8f985b49be4.png)
_Ocean before_

![](https://clan.akamai.steamstatic.com/images//34094219/7460472854bb6271fff345425a91f5d65720681e.png)
_Ocean after_

![](https://media1.giphy.com/media/UpfvSbpaL2JbCbxH02/giphy.gif)
_Ocean in motion_

## Camera modes

Added new camera modes during the flight and on the solar system map.

![](https://media1.giphy.com/media/uDvD8gIAtLLkzZ08lT/giphy.gif)
_No rotation involved, just switching between different camera modes_

## Planet visual improvements

I rewrote the planet shader to improve its performance. During this process, I discovered and fixed several critical bugs. That led to significant changes in the planet's visuals on a small scale.

![](https://clan.akamai.steamstatic.com/images//34094219/8fce0601554c0dc9d1ba4f032a6dee08c0988ffa.png)
_Before. You can see noticable tiling here_

![](https://clan.akamai.steamstatic.com/images//34094219/b4d6215cae94d1d75777ef630175e24ff1c68fab.png)
_After. No noticable tiling, improved texture blending_

In case of Moon too much detail appeared I would say. I will review Moon texturing another time and will decide if some changes required.

![](https://clan.akamai.steamstatic.com/images//34094219/a5c6c130ec41d1bfc5d445b5486c9aa0183b9e7d.png)

## Flights

You can instantly switch between spacecrafts during the flight.

![](https://media2.giphy.com/media/iu4znELEJCZnlkdR5x/giphy.gif)
_Switching between visible spacecrafts_

![](https://media2.giphy.com/media/LUXqnXH0Jtjc31afJy/giphy.gif)
_Switching between spacecrafts using map_

You can also switch between command modules if you have more than one installed.

## Electricity redesign

Electricity was redesigned from ground up. Real physical units are used (Watt for power and Joules for energy) instead of some unnamed ones. All parts that use electricity now have physically correct parameters (to some extent).

## New part type

Added a new type of rocket part — light. It consumes energy and produces light photons. It should improve the experience of flights and landing in the dark. Two light parts were added, with more to come in the next releases.

![](https://media3.giphy.com/media/e0R88sEa7gfX5TEYhX/giphy.gif)
_Let there be light!_

## New parts

Nine new rocket parts await you in the assembly shop!

![](https://clan.akamai.steamstatic.com/images//34094219/76a15b182161314679228b4a0072f451082828b4.png)
_Mainly structural elements and electricity_

## Hotkeys changes

Changed Repeat hotkey from **R** to **Q** and cycle symmetry hotkey from **X** to **C**. Added many new hotkeys and some button tooltips are showing hotkey labels now. Saved user controls were reset to the default ones because of that.

You can find more changes in the changelog below. Since the game become bigger and bigger it is hard to check every possible test case. So some minor bugs are expected and if you encounter them, please report them on the forum or on Discord. Thanks for playing and see you in the next update which should include one famous red planet.
