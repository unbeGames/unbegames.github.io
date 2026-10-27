---
author: Arugin
title: "Dev blog: making the level editor"
date: 2018-02-15 22:41:00 +0300
categories: [Spreadstorm, Development Blog]
tags: [spreadstorm]
image: https://shared.steamstatic.com/store_item_assets/steam/apps/742380/capsule_616x353.jpg
game: spreadstorm
---
It's been awhile since our last update, but we’ve been busy figuring out how to build convenient and simple level editor for our game. It was in our plans at the beggining of the development, but we underestimated the upcoming challenges a bit.

So, the first question is why do we need this? Why we can't just make the game?

The answer would be "Because of game nature". Every level consist of the small elements which we called "nodes". Players can move through them and interact with the large one. The smallest level in the game (which is the first one) consist from 22 nodes. And it would be ridiculous to manually place every single node and establish every connection between them.

![](https://clan.cloudflare.steamstatic.com/images/31326412/7312302fc6ecf3519e052804b1c85e5b7b4e3c25.png)
_Level in the game engine_

So, at the start of the project we invented our own text format, that described our level, each node, their connections and possible interactions that player can have. When the game starts it grabs the file with the description of level and just generate it. It was a kind of win, because it worked great, but for example the file with the first level consisted of 112 lines of text! It was faster to create levels using text, because you can copy and paste the same lines and quickly adjust them, but another problem arises: the errors. Every time you change something there could potentially be an error. You forget to change parameter, or copy-pasted redundant one and level generates incorrectly or game doesn't start. It takes enormous amount of time to figure out where the error are. Plus than the levels become larger than 50 nodes copy-pasting becomes very slow and unconvenient.

![](https://clan.cloudflare.steamstatic.com/images/31326412/fa1fcabed1781bbe01162177780489b98fd06f1b.png)
_JSON description of first level_

We created five levels using this approach and decided to move towards the simplest version of ingame level editor. It looked like this:

![](https://clan.cloudflare.steamstatic.com/images/31326412/93e15ab1b1647449a4773f3541b88243d4441589.png)

Here you can place nodes, connect and move them, select their type and level editor generates text file, which than used by game to generate level itself... Nonetheless there were tons of problems with this first version of level editor. It could only generate the level structure, but other things like interactions, enemies, node modules had to be manually added to text file (hello, errors!). After the file was finished we had to import it into the game engine, generate level, place the lighting, decorations, bake it, test it and iterate all over again. Despite this we created another 25 levels using this "piece of tool".

So, the game has successfully released to Early Access, feedback was collected and major bugs and problems was solved. So it's time to take a break and focus our attention on our main tool - the level editor. It's time to rewrite it from scratch with the resolutions of all described problems, improved workflow and future public release to our users in mind. It should be convenient, intuitive and useful. And after month of thinking and experimentation we finally found the way to do this.

Stay with us and see you in the next update.
