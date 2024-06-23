---
author: Arugin
title: 20 days before release
description: When everything is on fire, but it's fine
date: 2020-01-31 20:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/0b96134dda9f9dfd374a5d6d35974b094eac48e2_400x225.png
game: Rocket Science
---
Greetings.

It’s been a while since the last update and I have a lot of things to discuss today.

I spent more than a half of December preparing the trailer and establishing art and content pipelines for it, which could then be used in the actual game development. During that time I created the first 15 rocket parts and battle-tested them by assembling different spacecrafts. The first thing I discovered, that direct controls over the spacecraft is a must-have feature for the game. When you are assembling rockets, you usually want to have a quick iterations over your design. This means that the time between attaching the last part and launch must be kept to a minimum. With the flight planning workflow this was not easy to achieve.

But before diving into flight systems I had to solve one important problem. As you you may have noticed from the trailer, I greatly increased the planet surface details.

![](https://clan.akamai.steamstatic.com/images//34094219/cd4871e06c7fd4862ad6a7d0831d48bab07d3b3b.png)
_Earth's surface before the trailer_

![](https://clan.akamai.steamstatic.com/images//34094219/0e9b6048bc2c268774c6c8db29a47792f762d707.png)
_Earth's surface in the trailer_

This was necessary not only for aesthetic, but because you simply can't feel the planet scale and size of spacecrafts without them. But performance immediately dropped from stable 60 to 40 FPS with such level of detail. This was unacceptable and I needed to rewrite planet generation system, using different, data-oriented approach. It took me five days and it was not easy, but, amazingly, the system has become simpler, more extendable and more performant. I hit target 60 FPS on my hardware (which is 5.5 years old) and created a good foundation for future grass, rocks and rivers systems. Also I will expose the planet level of detail setting to the players.

Then January has come and I finally started internal playtesting. The first system that got hit, was rocket assembly. While the main concepts were clear to players, available tools were terrible. Parts usually were not placed where users wanted them to be, connections not working half of the time, sometimes saved rocket even not load after all that. So I wrote down a long list of issues and spent next 10 days fixing them all. The system still lacks a lot of features, like symmetry tools or batch operations, some parts attachments are less stable, then others, but the core is now rock solid. Even I started to feel more satisfaction while designing spacecrafts.

[![](https://media.giphy.com/media/H4DJYCLIdgncl5B05B/giphy.gif)](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fgiphy.com%2Fgifs%2Fspacecraft-space-simulator-hdyliem-H4DJYCLIdgncl5B05B)
_A bit rough but it is correctly positioning itself on slots_

It was January 11, **40 days before release**. It became obvious that I will unable to deliver all three main parts of the game (spaceport building, rocket construction and space flights) with the same level of quality and comparable amount of content. And I couldn’t delay release even further, because then I need to find a job to pay my bills. And this means only part-time development on weekends and evenings. Which is extremely hard and would greatly increase development time. So I basically had two options:

1.  Deliver everything with tons of bugs, little content and basically unplaytested (because I will have no time to fix all found problems).  
2.  Cut one of these systems on release, and concentrate more effort and development time on others.  

The first option is bad across all levels. You want to launch an Early Access title, when you could gather a valuable feedback from it. There will be no such feedback when the game is just broken. Also it will spoil all game systems and it will be much harder to surprise players with the next updates.

Basically, I had only second option. But the problem was that you can’t cut rocket construction without cutting space flights, so there was a choice only between the space flights and spaceport building. And looking to the results of survey from the previous update, the choice was pretty obvious:

![](https://clan.akamai.steamstatic.com/images//34094219/a5d13323024dbeb706f86d15f2f524dd221b172c.png)
_I hear you loud and clear._

There is only one thing that bothers me: now Elon will be in the same field with the giants such as KSP and other space sims. But they had so much more time to come to what they have now. Also it is very difficult to cut parts of the game you've put so much effort into. But I had no time for worries and regrets, I needed to get done the remaining systems. Here is a list of things I’ve worked on the next 20 days before this update.

**Direct controls.** Yes! It is finally in the game. There were two problems that I faced: how to make a rocket staging and how to befriend a rocket auto stabilization system with the direct controls. There was nothing new I could add to staging, so it will look like in other games:

![](https://media.giphy.com/media/IgQnMIDeCQ1UbOgVUW/giphy.gif)
_Stage sorting is one of the main components of any flight preparations_

The auto stabilization system is now understanding player input and didn’t try to alter the input axis.

**Rocket design flexibility.** Before the total assembly shop rework, part connections were very strict. For example, rocket engines could only face down. Now you could connect parts however you want, until the rule “every connector should find it’s slot” is being fulfilled.

![](https://media.giphy.com/media/WouffvvLRG5ikJX2bW/giphy.gif)
_Game: you can build any spacecraft you could imagine. Me:_

**Engine fuel.** I've redesigned the architecture of engines so that in the future, there may be several types of fuel pairs in the game. Right now they consumes UDMH with nitrogen tetroxide. This is small change, but I love when the systems have a good foundation under them.

**Explosions.** That’s right. At the beginning of January all rockets were undestroyable. And now every part has an impact tolerance. If the collision force became too high the part will explode adding explosion force for all nearby parts. I think, you can even launch something into space using only explosions.

![](https://media.giphy.com/media/Lr3bpxihokjcfswbmF/giphy.gif)

**Sounds.** I record all sounds that can be recorded at home using the equipment I have left since my film-making hobby. Other can be found on [freesound.org](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=http%3A%2F%2Ffreesound.org%20) or in my personal sound library.

![](https://clan.akamai.steamstatic.com/images//34094219/b0d0fcd78851b422f04bc70ef0c7d26cbd532e11.jpg)
_My sound recording equipment_

There were hundreds of fixed bugs and much more small, but valuable improvements, but you will have a chance to discover them by yourself.

Now I have only 20 days left and long list of features I want to implement before release. Every day I look at this list and sort all the features, so only the most important will stay on the top. Besides that I need to create and add new rocket parts into the game, continue internal playtesting, prepare and send build to Valve, order game localization, write next developer update and much, much more. Every developer says that the game is shaping into the final product in a few days before the release. Now I've made sure of that, too.

To summarize, what does it all mean for the game? There will be only sandbox game mode available on release, where you could assembly spacecrafts and launch them into space. You will be able to directly control your rockets as well as launch them using flight plans. More info, such as how many rocket parts will be in the game or what celestial bodies will be available for exploration, I will publish in the update a day before release. And spaceport building and a lot of other cool stuff will come in one of the following big updates for the game.

I hope you enjoyed this update and see you the day before the release in Early Access.
