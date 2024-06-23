---
author: Arugin
title: August Developer Update
description: HDRP and procedural texturing
date: 2019-08-31 23:49:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/1462e326f3d9275af95acd133f6b1d4e7b1f36fc.jpg
game: Rocket Science
---
Greetings!

Today will be a short update, because I am at small vacation right now, visiting my grandparents. They happen to live in such place of Russia where stable Internet connection is rare than a good indie game on Steam these days. But I found a base station deep in the fields and managed to write and publish this update.

![Fields](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/1462e326f3d9275af95acd133f6b1d4e7b1f36fc.jpg)
_This is also the place to draw inspiration from and get good references for the development_

The first thing I am excited of is recent announcement, that High Definition Render Pipeline (HDRP) will be out of preview this autumn. HDRP is a high-fidelity next-gen render pipeline built by Unity to target modern (Compute Shader compatible) platforms. It provides great new tools to author content, like a Shader and Visual Effect Graph, solid API for high performance custom rendering systems, and a lot of features from volumetric lightning to subsurface scattering. I started to use it a year ago, when it was in alpha stage. Even in that early stage it gave good results. And now Unity Technologies promises, that HDRP will become stable just before the HDYLIEM release! So I started updating the game to the latest version of Unity to get the stable HDRP as soon as it will be ready.

![HDRP Lightning](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/6d2eed9510169e49f3046ec241506a1ca49d27e0.jpg)
_Example of volumetric lightning in HDRP_

Secondly, I’ve added the Moon heightmap into the game. It was easier than I thought, so the next in line is Mars. I have also rewritten the planetary configuration system, so every planet will be present in the Solar System even there is no heightmap or textures for it yet. Such celestial body will look like a white sphere, but you will be able to land on it anyway.

![Moon heightmap testing](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/21a3d33cfd6d08fa865bbd3c8f6c33d188e91806.png)
_Test scene with the Moon heightmap applied_

The last thing is the planet texturing system. The old system supported only 16 materials (which is nothing for real scale planet), produced poor results and have no room for configuration and future improvement. So I had to develop a system that would procedurally select materials based on set of easily configurable parameters. I researched how it was done in other space games and in the popular libraries on the market and came up with my own solution.

I’ve developed procedural texturing module for planets that includes a configuration file which supports 32 layers of materials (and I can increase this number up to 64 in the future). These layers work like in Photoshop, but they have a bunch of parameters, which controls if the material will be placed on top of the previous one or not.

![Procedural texturing inspector](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/139261c2031b71c881b85dc393a82bf72044512c.png)
_Inspector that I use to configure procedural texturing_

As you can see, there are four main parameters for each layer now: height, slope, temperature and humidity. Each of them is a curve which specifies the probability of material selection depending on the parameter value. There are more parameters in the config for granular tweaking of each material such as weight, tint and blending contrast. This config then encoded into texture and passed to the shader. And finally, the shader decides which material to use at this particular point on the planet's surface. Combination of all parameters with the addition of some noise function give the results I like. Moreover all these configs were built with the mods support in mind, which I will add into the game as soon as API and feature set are stabilized.

![Surface procedural texturing tests](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/6eeb3c94c0bdaf73fa2c7506c7bf67a49f764872.jpg)
_Another test scene with the procedural texturing. Here only three materials are blended together, and there is already no tiling and repetition_

That’s all for now, I'll try to get out of the field, and I wish you a productive autumn!
