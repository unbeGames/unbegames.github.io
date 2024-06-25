---
author: Arugin
title: Update v0.14.0 "Unexpected Outcomes" & Holidays Event
description: An update is not a guest, it's not a bad thing if it's unexpected
date: 2021-12-24 21:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/9b5ba8cc8419b0e3f168383c1edd626ff213d5c6_400x225.png
game: Rocket Science
---
The story of this update begins after I have released v0.13.0 “Space Stations”. I decided that it is time to update the game trailer. It was made in the earliest stages of the development and the game has changed a lot since then. I made a list of tasks that need to be done to keep the trailer relevant until the full release. The first task in the list was a new launch site that was actually requested many times by players.

And I already had a new launchpad model made by one of the players almost a year ago. But I could not just place it on the planet’s surface without clipping into it. And it was almost impossible to find the right spot to fit it perfectly. Moreover, the launch site consists not only of just the launchpad. It has many things: buildings, towers, roads and support structures. So the game should have a way to modify the surface of the planet if I want to build something more complex than several cubes smashed together on it.

I encountered many pitfalls. For example, the game supports three base surface levels of detail that you can choose in the performance settings. Surface modification made for one LOD could look bad on another just because there are different numbers of vertices. Also when you move away from the surface, the game dynamically generates distance LODs using heightmaps and noise, so when the whole planet is in the camera view, it could perform nice and smooth. It is always very scary to touch this system, because it is huge and very complex. It would also be nice to support surface modifications in the mods. And it would be great to use it in the future for gameplay purposes.

I did it. I put a lot of work into this tool and it looks like this:

![](https://media0.giphy.com/media/HCyhWtzTN7VWMK8RfB/giphy.gif?cid=790b7611c99a63c822454c840d8933b101c8657e419eed59&rid=giphy.gif&ct=g)
_You can try to guess what gameplay feature I will use it for_

Surface mods now support surface modification, you need to switch to the tab and you will see the tool's settings.

![](https://clan.akamai.steamstatic.com/images//34094219/577edbef7d4b78f4048f633cbc88cd7a95e81667.png)

One thing I should mention: it is very rough and very experimental. For example, you need a powerful GPU to make this tool work properly. Also while it supports all three base surface LODs you need to set the highest in the performance settings to get the best results. If there will be a demand for this tool, I will put more work into it, but this functionality was sufficient to prepare the surface for the new launch site.

I’ve spent some time researching how the game’s reference — Vostochny cosmodrome actually looks. There is not very much information about it on the Internet, but I found maps, panoramas, photos and even a 360° video on Youtube about it. It was enough to build a better launch site than the game had before.

![](https://clan.akamai.steamstatic.com/images//34094219/88f2d67cc19d96d7e2399087be3416a74aa2018b.png)
_It is still under construction. More to come in the future_

I also placed a control center and assembly shop on the surface.

![](https://clan.akamai.steamstatic.com/images//34094219/129abb699d506af53d6d94e8c2236eb5e65409c9.png)
_No more launchpads in the middle of nowhere I guess_

Then I switched to the spaceport itself. As I mentioned in the previous updates, I will be devoting more and more time to developing the spaceport building part of the game. I’ve uncommented the old spaceport building code from the pre Early Access times and was pleased to know that it is still working! It is rough and needs a lot of improvement, but it is a good basis. While I can’t release the spaceport building until the whole survival mode will be ready, I decided to add more props and buildings into the spaceport to make it look nicer.

![](https://clan.akamai.steamstatic.com/images//34094219/ac3a7aa6708087376176a0dc55d1696c4fd1e769.png)
_Still no functionality exposed, but now you have more workers under your control to illuminate every single building_

The last thing I want to tell you about is that I always wanted the game to react to real world events. But there were much more important tasks in the early stages of development. But this year I finally managed to find some time to make it.

Meet the **Winter Holidays** event in the “Rocket Science”! It will last from December 24 to January 14 and brings a bit of holiday spirit into the game.

![](https://clan.akamai.steamstatic.com/images//34094219/2ccf66a0fb22869727d8e3f2fd3bace375e00c9a.png)

Ah and one more thing: I totally reworked key bindings window and split them into categories and subcategories for better readability:

![](https://clan.akamai.steamstatic.com/images//34094219/39198ef1019f8cab1232c86afcce349ded811d1d.png)

And the video settings was finally extended and improved:

![](https://clan.akamai.steamstatic.com/images//34094219/cadd0b924c8723fd2d619a6382688293ce5eb80d.png)

I hope you will enjoy this small update and see you in the next one. Happy holidays, friends!

---

## Release notes v0.14.0

### Features:

- added Winter Holidays event which will last from December 24 to January 14;
- launch site was completely reworked it is closer to reality and has more buildings and structures;
- reworked space center above the ground, it now exactly match launch site structures;
- added more buildings into space center;
- surface objects mods now support surface height painting;
- added simple wasd controls to move camera when working with surface mods;
- all default fixed bodies will be loaded when creating or editing amy surface object mod;
- tutorial improvements: added fallback steps when player failed to follow instructions (he had one job!);
- improved control settings window and categorised input actions for better readability;
- added support for exclusive fullscreen mode;
- separated display resolution from refresh rate settings;
- added a bunch of new quality settings which will help to solve some of performance problems on older GPUs;  

### Part changes:

- landing strut was moved 10 cm lower relative to the connection;  

### Changes:

- camera is respecting surface object collisions now and tries to avoid it;
- controls settings window now fully supports localization;
- added space (and also hotkey) for the one more time scale on the time panel (will be implemented in the future);
- profile picture moved to the time panel;
- planet will be generated 2 times faster on CPUs with 6+ cores;
- camera speed in the spaceport no longer depends on game's FPS;
- increased camera movement bounds in the space center;
- shore lines will always have slightly higher LOD for better quality now;
- reduced RAM and video memory consumption in the spaceport;
- the game will fallback to English instead of Russian when localization files are invalid or some locale keys are missing;
- significantly improved quality of save game and mod previews;
- added "enter assembly shop" and "back to spaceport" buttons when viewing the rocket list in the spaceport.  

### Fixes:

- game stuck on loading very rarely;
- control center UI is completely missing;
- light leaks from control center into small storage;
- light leaks appear at morning and evening in the space center;
- staff levels are broken on staff panel in the control center or storage;
- stars are jittering in the main menu;
- sometimes shadows are too dark in the surface mods;
- \[assembly\] part variants ordering of categories sometimes changes.
