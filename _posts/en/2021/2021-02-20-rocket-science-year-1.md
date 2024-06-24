---
author: Arugin
title: "Rocket Science: Year 1"
description: Going into bright future
date: 2021-02-20 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/b14eaa2e19bab7fe40b0477d4dc8ab6c957d34d0_400x225.png
game: Rocket Science
---
Hi there, fellow rocket builders! First and foremost, today marks the 1-year anniversary of Elon’s release on Steam!

It was an incredibly difficult but productive year, and I wanted to thank everyone who supported me during this time. Thanks to you, I was able to improve the game far beyond its release state and get an incredible feedback I never hoped to achieve.

Now, obviously, I couldn't possibly leave you without a present. The next update will be released on March 26. While it's still in development, I'll tell you about what's been done and reveal some of the features that will be there.

First of all, I’ve updated the game to the latest engine version. You will never know what will break during such updates, but it seems that almost everything broke this time. And I spent a good amount of time fixing all these problems. But why was this update needed? Because the game initially was built on a new high definition renderer in Unity, which produces wonderful graphics, but had a huge limitation — you can not have more than one camera in the game (actually can, but it is so expensive, that FPS immediately dropped from 60 to 30 for the one additional camera).

This was almost a game breaking limitation. For example, at least 4 cameras are used in KSP during the flight:

- for close geometry (everything closer than 500 meters);
- for far geometry (from 500 meters to the horizon);
- for rendering scaled space (mostly other celestial bodies);
- for rendering kerbals inside of command modules.  

Moreover, one additional camera was used for rendering of reentry effects. But I could use only one camera and it also had a limited rendering range. Luckly, the Moon was able to fit into this range, that's why it was visible from Earth. But the rest of the Solar System beyond that range (except Sun and stars — they use other rendering techniques) was invisible during the flight. Also making reentry and atmosphere friction effects were completely impossible and there were some bugs with constantly disappearing stars.

The latest engine version introduces a concept of Custom Passes. Basically, you can render a scene from any point of view with any camera properties, but without paying a cost for the entire second camera. This helped me to make a camera rendering range almost infinite, fix a bunch of bugs and prepare for adding reentry effects in the future.

The next thing I’ve switched to was an assembly shop improvement. I’ve added a highly requested feature - subassemblies. You can grab any group of parts and save it as subassembly, which can be used later during other rocket construction.

![](https://media1.giphy.com/media/Iwx79A47Vdd6FqZJG3/giphy.gif)

One cool feature is that you can edit subassembly like a regular rocket, duplicate the existing or create the new one at any time.

![](https://media3.giphy.com/media/HQFNBxVB0vpVHmcKFc/giphy.gif)

I’ve improved default parts orientation during attachment, so its behaviour is more predictable now.

![](https://clan.akamai.steamstatic.com/images//34094219/d4862590fc300fe1bcbb2966ac242d65161f8592.png)
_Orientation before_

![](https://clan.akamai.steamstatic.com/images//34094219/d303e1a238eebc76aa440a411731ee052152e634.png)
_Orientation after_

![](https://clan.akamai.steamstatic.com/images//34094219/90e025311af32d4cd3318aa4319caea22a15ee47.png)
_Side symmetry orientation before_

![](https://clan.akamai.steamstatic.com/images//34094219/ef28c546f96e06331a694640983017fd1301e9fc.png)
_Side symmetry orientation after_

And I reworked an algorithm that places a first part, so it is compatible with the part variants.

![](https://media4.giphy.com/media/pK3C1H0fPbF4jw5GZN/giphy.gif)
_If first rocket part has variants and you select another variant, part will be automatically replaced_

Currently I am working on assembly shop modes. Three modes are planned: Select, Grab and Rotate with several more to come later.

![](https://media0.giphy.com/media/Mj5lNuiKWEfEHQVx29/giphy.gif)

The default one is a Grab mode. It is similar to how assembly shop works now. You can grab parts, move them and attach to each other in this mode. In the Rotate mode you can select any part and rotate it using hotkeys or specific rotational handle. I will also allow you to rotate already connected parts following a set of restrictions.

There are basically two restrictions to this: you can only rotate the part around the connection axis and connectors should still fit into slots after rotation.

For example, a part attached using a single connector could be rotated on any angle. In the case of hexagon connection it can be rotated with 60 degrees step.

In the last Select mode you will be able to select a single part without risk of moving or rotating it. It will be used in the future for opening part properties and for such operations, like rerooting a rocket to the selected part.

A bunch of new parts will also be added in the next update. Five of them are already done, but I will not spoil them for now. In addition to the improvements to the assembly shop, there will be new flight-related features united by one common theme. Can you guess what kind of theme it is?
