---
author: Arugin
title: "Quick Update: v0.24 is Around The Corner"
description: "An update is good when there is a meeting of time and space, when time and space become irrelevant"
date: 2025-08-01 21:34:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.cloudflare.steamstatic.com/images/34094219/9f44bb3bf55e8c8c4171666da2a5ed80f48904ef.png
game: rocket-science
---

Hello, fellow rocket scientists!

It’s been a while since my last post and I wanted to give you a quick update about current development status. It will be the biggest update since the release not only in the new game systems, but also in terms of the size of the changelog: it is already approaching 100 lines, and I'm not done yet!

![](https://clan.cloudflare.steamstatic.com/images/34094219/336095d74aafac690df1fc4389a51cc16e14f225.png)
_The changelog is here just for reference, nobody is supposed to be able to read it_

The biggest time sink was the integration of communications into the game and new rocket parts production. The first one required significant changes all over other game systems. For example, when I’ve added default relays into the orbit, I’ve discovered that on high time warps communications just stop working. Why? Because spacecraft orientation was not stable on high time warps, and orientation matters a lot for high gain antennas. So I need to do something about that.

Another example is that in the game comms model relay antennas should be cooled down for very low temperatures, to reduce the noise and increase the signal strength, like I told in one of the [previous dev updates](https://blog.unbegames.com/en/posts/2025/dev-update-communications/). But the game didn’t have anything that could support that. So I researched how cryocoolers work on some missions like the James Webb telescope and implemented simplified model of them. The good news is now I am one step away from implementing other active cooling systems. They are similar to cryocooling in some ways, but very different in another. I've also fouund at least two big mistakes in the thermodynamics code while working on it, so be prepared to a slightly different thermal behaviour in the next update.

![](https://clan.cloudflare.steamstatic.com/images/34094219/7ea14a2f4bc410a3d4cd94909928d226d16845f8.png)
_It is nice, when game systems finally start to interact with each other_

As for new rocket parts — this update requires a lot of them. I’ve already made 7 different antennas, and it is barely enough to cover the game needs.

![](https://clan.cloudflare.steamstatic.com/images/34094219/d371ca939fe68910b681dea0b4bf626404d6bca2.png)
_This is an absolute minimum of needed antennas, but it is barely enough. I need to add at least 4 or 5 more_

And the total planned part count approaches 30. This will include not only antennas, but new probe cores, structures, thermal parts and engines. And I will not release the update untill I finally add new parachute, that I promised for years now! Considering that every rocket part takes at least 3 work days to research, model, add to the game, test and somehow balance and adjust, this time quickly adds up. And a lot of antennas has unfolding animations, that's more unexpected work too...

Another big chunk of time took the preparation of the game code to the releasing of the game API. I’ve already published [one of the samples](https://github.com/unbeGames/RSExtensionSamples) that shows how to add custom rocket part modules. This is an absolute minimum of an API currently, but I will extend the API and samples on a per players request basis, when they actually start working on extensions and will have specific examples of what they need.

There are a lot more to the update that I’ve not yet mentioned in the dev updates, but you will discover them in the update itself. But I can give you a sneak peek. For example, could you guess what is the purpose of this new game panel?

![](https://clan.cloudflare.steamstatic.com/images/34094219/86a9abfadb18c0fd55f38560440d218a31365db3.png)
_Please post your guesses in the comments bellow_

So what’s next? I am planning to release the update to the closed beta in the following weeks, so I could start receiving the feedback and bugs from a smaller and more dedicated group of players, while I am still working on new parts and finishing stuff up. (If you too want to participate in closed beta, please join our [Discord](https://discord.gg/unbegames)). And then, as soon as it is ready, it will be finally released for everyone. It took much, much longer than I expected, but this is game development, you never actually know how much work any new feature will take until you start working on that.

And the last sneak peek of how some of the new parts look in action.

![](https://clan.cloudflare.steamstatic.com/images/34094219/b13d23af6389aa2ae81cd747d9d0e3f20b2b5859.png)
_Can you guess what spacecraft I tried to replicate here?_

That’s all for today, see you soon and have a nice flight!
