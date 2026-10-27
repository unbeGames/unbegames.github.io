---
author: Arugin
title: "Update v0.25.7 “Radiant Veil”"
description: An aspirant can afford to be promising. An emperor must keep those promises.
date: 2026-06-19 20:51:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.fastly.steamstatic.com/images/34094219/62f5b3b02d6943e7b6fa21aba06bdde085f4533f.png
game: rocket-science
release_notes: rocket-science/v0.25.7
---

Welcome, fellow rocket scientists and pilots, to the update v0.25.7 “Radiant Veil”!

At the beginning of April, I realized that the best way to continue developing the game was to fork the HDRP rendering pipeline and start making all the necessary changes directly to it. Since then, I’ve implemented several new features that I could only dream of before. This will lead to huge graphics improvements.

## Volumetric Clouds

You’ve been asking for this for a long time. This was an unbelievably hard task, especially considering that Unity does not, and will not, support space simulators properly. To implement it, along with several other changes, I forked HDRP and rewrote large parts of it. And now, you can enjoy clouds from the ground.

![](https://clan.cloudflare.steamstatic.com/images/34094219/43bce50fddd5b1395ed5cbf6f9b675503460c78d.png)
_After playing with the clouds for some time, going back to previous versions of the game felt very empty and strange._

In the air.

![](https://clan.cloudflare.steamstatic.com/images/34094219/c5c1bd5364640400a33e3d3f9728e8d9544881a2.png)
_Flying a plane is twice as satisfying now._

And from space.

![](https://clan.cloudflare.steamstatic.com/images/34094219/d3620e477650681962167f4cee2a5945a4731fa6.png)
_There are a lot of artifacts at those distances. It is very hard to make clouds stable on real-scale planets, but future iterations will gradually improve this._

And most importantly, it is integrated into the lighting pipeline, so cloudy areas will properly dim the light:

![](https://clan.cloudflare.steamstatic.com/images/34094219/dd67fd4cdeb624779b5dec8713ecd0962e411b97.png)
_There are many areas on Earth completely covered by clouds._

This is the first iteration of clouds. There are a lot of artifacts, the clouds are mostly static, and they are very resource-intensive. They are also enabled only for Earth for now (Venus, I’m looking at you). But I am planning to iterate on this system, improving it with each update, just like I did with planet rendering itself.

**Note**: <u>If you have performance problems, try disabling clouds or using lower cloud settings. Volumetric clouds have a very high performance cost!</u>

## Ocean

I completely reworked the ocean system and water rendering. It has physically based scattering and refraction:

![](https://clan.cloudflare.steamstatic.com/images/34094219/f4ae85d7113bc5811a9e39ef9c12c644ec4a7069.png)
_It is funny that I wrote [a post](https://store.steampowered.com/news/app/890520/view/1674703076089067788) more than 7 years ago in which I promised good water rendering. Well, promise fulfilled!_

Underwater rendering:

![](https://clan.cloudflare.steamstatic.com/images/34094219/12f477ab4b4e83081dc551b0a0f2697642790090.png)
_The camera can finally go underwater._

Caustics:

![](https://clan.cloudflare.steamstatic.com/images/34094219/e853684948a13332832a89ddebb672892dfa016d.png)
_Those are light patterns on the ocean floor._

I can also change the water surface geometry in any way I like now, for example by suppressing waves near the shore:

![](https://clan.cloudflare.steamstatic.com/images/34094219/2c31d1018ca526a5622fa3a6925a551d157ec0ec.gif)
_I also tried to make shore waves, but I couldn’t come up with a stable solution at real scale. I will try again next time._

And it can even reflect the clouds:

![](https://clan.cloudflare.steamstatic.com/images/34094219/cdc4436ac24ccfa2a89ae558f0d244473b10eb99.png)
_The most important thing is that every system interacts with every other one._

## Buoyancy

As I told you in the [previous dev update](https://blog.unbegames.com/en/posts/2026/dev-update-iterating-systems/), spacecraft can finally float in the water:

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExM281ejdveWE0czlxNmdqMnFzdzB5ejB5Z3l1bjJ4cW91cTVzbXl4dyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/CvAiQJe0AeXfysccUm/giphy.gif)
_A lot of flights end up in the ocean, so this is an important part of the simulation._

They can also react to waves:

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExaWplc3F3Z2RiMDg4YWR1cHl2b2lkamNkcmNxcjBmOXZ4dXM2cnRhdiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/0X2bsbaBX4epbTbvWM/giphy.gif)
_Here I am drawing a debug view of wave displacement to calculate how it will affect the floating rocket._

A foundation for reacting to water currents has also been prepared, which is very important for possible future rivers.

## Space

Atmosphere rendering has been improved, and many artifacts are gone.

![](https://clan.cloudflare.steamstatic.com/images/34094219/019736ecee31015323e097e635d6cb6b55545355.png)

![](https://clan.cloudflare.steamstatic.com/images/34094219/6526c31b6ea93e202793253e09cf12e310c7bb57.png)
_Those black lines in the image on the right were a pain for many years, but they were finally defeated._

Star rendering has been reworked, improving star brightness, shape, and size. More than 128,000 stars from the HIG database are now displayed:

![](https://clan.cloudflare.steamstatic.com/images/34094219/bc66c39577fdd431d194a94d8fdaabe72d18a8a7.png)
_Previously, the game supported only 65,536._

The Milky Way now uses high-resolution imagery from ESA/Gaia/DPAC.

![](https://clan.cloudflare.steamstatic.com/images/34094219/02babdc957111a700dccd15967eed3c0c49a4305.png)
_It is not that bright in reality, but consider this an artist's vision. It makes the space a bit less boring._

Satellites now reflect sunlight, which interacts with the atmosphere if the planet has one:

![](https://clan.cloudflare.steamstatic.com/images/34094219/6a752c57624462a6f5b16671a4f1309b80309520.png)
_Nights will not be as dark as before during a full moon._

It is also reflected by the water:

![](https://clan.cloudflare.steamstatic.com/images/34094219/f2bb1499768f5ceed6e97f39b5f21b65fa802207.png)
_You can even see some reflections of stars and the Milky Way on the water, but they are currently less stable. This is a Unity-side issue. Maybe adding ray-tracing support would improve it significantly._

This is also visible from orbit:

![](https://clan.cloudflare.steamstatic.com/images/34094219/7c301d45379ca2d5171130d133ae849fd6f62830.png)
_I never would have thought that making the bodies reflect sunlight would create scenes with such stunning views. I also found a photo taken from the space station showing moonlight reflecting off the ocean's surface, and it looked very similar._

It is also worth noting that you will be able to find and see all major celestial bodies among the stars from Earth.

And finally, scaled-space and local-space atmospheric models and rendering have been unified. You can now see the atmospheres of Mars and Venus on the solar system map. Venus looks strange right now because there are no clouds, but I hope to add them in the future, so this will not be as much of a problem.

![](https://clan.cloudflare.steamstatic.com/images/34094219/d649ef391b490c725a374118f8e8f05d0e47036b.png)
_A bluish atmospheric scattering can be seen at the planet's edges. It also gives the entire surface a slight tint._

## Rocket Assembly

I’ve added an offset mode. You can offset any part in this mode. While static attachments can adjust a part’s position slightly, parts with dynamic attachments can be moved anywhere on the rocket surface where they could initially be attached.

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdmVrNmpyNHNwOHV5NGcyM2lvMmJmdzU3b3FrMDM3YW96eG5vdjMxdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/MPuisrEFyQ4MXHSx9Z/giphy.gif)
_This is especially useful for planes, allowing you to balance the center of lift perfectly._

Parts can also be slid inside other parts. This is less realistic, but it opens up much more design space. But be careful: you can’t reduce drag this way, otherwise it would become the only correct way to build rockets.

![](https://clan.cloudflare.steamstatic.com/images/34094219/3fbada71e66bb1dd39dabc96e9ba92f963f1c563.gif)
_More design freedom for players!_

## Flight

This is another feature players have been requesting for a long time. Auto-stabilization systems can now use RCS. They also try to save as much fuel as possible. For example, if reaction wheels are operating below 20% load, RCS will not be used. Auto-stabilization will also not use RCS if time warp is above 10x because it needs to move a spacecraft into the physics simulation to do that.

![](https://clan.cloudflare.steamstatic.com/images/34094219/0d4b65e4ccc11654d925f9417631d4de4f463ca8.gif)
_It is always a good idea to attach even the smallest reaction wheel. This way, a lot of monopropellant can be saved._

Because of the extended bug-fixing period, I was not able to finish many new parts in time. For now, only two of them are ready. But I am planning to spend next month working on incoming bug reports and finishing most of those parts, so they will arrive in one of the next patches.

Full patch notes, as always, below. Thank you for playing the game and for your support. Until the next update!
