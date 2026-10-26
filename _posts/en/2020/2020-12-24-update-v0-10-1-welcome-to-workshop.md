---
author: Arugin
title: Update v0.10.1 "Welcome to Workshop"
description: The only limit to what you can do is what you can imagine
date: 2020-12-24 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/eaa4e8cdd3571466cbb7889d2761cdcea877a079_400x225.png
game: rocket-science
release_notes: rocket-science/v0.10.1
---
This update brings you one of the main pillars of a good space simulator: mod support. At this stage the game will support two kinds of mods: Surface Objects and Localization. Rocket parts, rocket sharing, configurable celestial bodies and other types will come later.

Mod creation and configuration process is available in-game so there is no need to run any external applications (apart from models and textures authoring software).

![](https://clan.akamai.steamstatic.com/images//34094219/87bd22f960b28313c7e5075edb7652dc1c95684b.png)

I’ve created a rather detailed [guide](https://steamcommunity.com/sharedfiles/filedetails/?id=2326439478) about mods with examples and lots of screenshots, so if you have never created mods but always wanted to, it's your chance to dive right into it.

The most natural thing you can do with mods is to let other players play them. [Steam Workshop](https://steamcommunity.com/app/890520/workshop/?snr=2_groups_partnerevents_) integration provides an ability to share your mods with the community and download new hand-made mods for yourself. Just click '+ Subscribe' and the mod you liked will be available in the game.

![](https://clan.akamai.steamstatic.com/images//34094219/ee6549df3a8ff57d26064e6d806addcffa6a03c6.png)

Only one mod is published right now, but expect more in the near future.

## Solar System Map

Apart from mods there are other changes. A lot of improvements have been made to the Solar system map. First of all, 166 new celestial bodies were added to the solar system map of which 6 are dwarf planets and other are missing moons of planets.

![](https://media3.giphy.com/media/VSOwiydleU8SxF0vhX/giphy.gif)

Map gives you a lot more information now and supports not only orbit nodes, but spacecrafts, celestial bodies and surface objects.

Up to 8 grouped tooltips will be shown If more than 1 object with tooltip is under the cursor.

![](https://clan.akamai.steamstatic.com/images//34094219/90d90fe5fcd2964dc526f3dd5c38a1c21d027602.png)

And last but not least, the Milky Way was finally added to the map!

![](https://clan.akamai.steamstatic.com/images//34094219/aa8cf2dbf5c9d5b47b6e274f54f1c6c18fc1f685.png)



## Other Improvements

Some systems received a substantial redesign of internal code. I’ve described it partially in the previous post. But I want to bring your attention to several key changes.

First of all, rockets can finally physically interact with the previously launched spacecrafts that have landed or reached orbit. You can try to guess which currently missing important rocket part this change was made for to support it in the future. ;)

Secondly, the surface objects mod configuration scene helped me to identify and fix a bunch of bugs that couldn't be fixed without it. For example, exploding rockets in the air in the certain areas of Earth and Moon, or huge surface artefacts in some places.

![](https://clan.akamai.steamstatic.com/images//34094219/07764555e49661ac76d840edcc253811039340ae.png)
_Artefacts like this are no longer exists_

The final technical tool that was added is the save migration system. It will not only help you to avoid broken saves on each game release, but could be also used to migrate old mods to the new game version.

That’s all for you today. If you have any questions or comments, please put them below. Goodbye and happy holidays!
