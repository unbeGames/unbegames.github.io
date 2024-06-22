---
title: February Developer Update
date: 2019-02-28 17:09:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science] 
description: Planet generation
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/0243674f6c7ad289ebd6693251e8c62bac3a0932.png
---

Hello everyone and welcome to another developer update of “How do you like it, Elon Musk?”.  

I've spent most of the last month trying to answer the question: “Can I generate planet in the game as big as Earth actually is?”. Moreover I wanted this planet to not only be big, but also look like Earth, because the lore of the game need this and because not many games try to do this. Usually there are completely procedurally generated planets in these games, but with the similar color scheme and physics parameters to the real ones from our Solar System. But this was not what I wanted from my game.

There were several problems that I had to solve to achieve this goal. First of all the size. You can not use single precision numbers in the calculations, because, for example, with the planet radius five times smaller than Earth, calculation errors start quickly accumulate and you have nice looking cracks in the ground (it worth mention that Kerbin 10 times smaller than Earth).

![Cracks in generated surface](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/5a055b0f3bd086e788fb2030e1cb1f701672c7ea.png)
_Getting rid of these craks is not a trivial task_

The only good solution was to use double precision numbers. But then you could not generate planet geometry on the GPU, because video cards don’t like these numbers and calculations would be very slow. But CPU generation took almost 20 milliseconds which meant less than 60 FPS already and besides generation there were a lot of calculations left, like orbital mechanics, game logic, user input, sounds and music.

So I searched for the solution and found it. It called Job System and Burst Compiler. This is completely new stack from Unity Technologies that utilizes all your CPU cores and heavily optimizes the game code. I had to rewrite the whole generation system from scratch to support this. But the results were amazing. The whole generation process took less than 2 milliseconds on my Intel Core i5-4590 with 4 cores. This processor is pretty average according to Steam Hardware Survey. And I think I can improve these results more up to 1 millisecond. But there is a downside of using this new tech stack — it is currently under active development and may be unstable on some hardware and software configurations (one more reason to release the game in the Early Access).

The second task was generating Earth-like planet geometry such as continents, oceans and mountains. I could use NASA heightmaps for that, but the problem is, that the maximum height map resolution that Unity supports is 8192 x 4096. One pixel of height map in this case gives you height information about 9 square kilometers on the surface of planet which is not enough. So I decided to use combined approach for this. I used NASA heightmap to determine base height of created 3 x 3 kilometers area and the smaller details will be generated procedurally. The only one thing that I didn’t solved yet is the rivers. Even the biggest rivers are too small to be presented on heightmap so I need somehow generate them. Maybe I will postpone this problem to the Early Access period.

![Earth's heightmap](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/9c629acd1c8f66924a508626055b5f940c128602.png)
_Earth's heightmap_

The last one is the texturing. I could not use traditional height based approach, because on such large scale it looked very unnatural. Procedural approach even worse because it can create snow in Africa and subtropical forests in the Greenland. The combined approach saved me here too. I created the simple climate simulation system, that generated temperature and moisture maps, that I could use to determine which biome is present in this place and than apply the appropriate texture set to it. Due to simplicity of climate algorithm it produces not totally physically correct results, but it somehow looks right. And there is room to improve too.

![Generated Earth's Moisture map](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/e7a1326f910b6d926269eae9b08d6e3ffe1d3dea.png)
_First results of climate algorithm: moisture map of the Earth. Dark areas are dry, white areas are wet_

This three components are essentials for planet generation and they will be presented in the Early Access release. But this only the beginning of the path. I will definitely try to evolve planet generation system during the EA. I dream to implement grass, forest and cloud systems and it will be possible with your help and with the new technologies available today.

See you in the next update.
