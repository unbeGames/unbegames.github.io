---
author: Arugin
title: Update v0.17.0 "Within The Horison" public beta
description: The moment you doubt whether you can make planes, you cease forever to be able to do it
date: 2022-12-01 22:30:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science, beta]
image: https://clan.akamai.steamstatic.com/images/34094219/957206c74cd25566caf44ee55c0d6839477b99bc_400x225.png
game: Rocket Science
---
This is the second update I decided to publish into the public beta branch first. It will stay there for about two weeks and will be released to the default branch once I will fix all critical issues found by players. I am planning to add several more parts that didn’t end up in beta and probably one or two tutorials related to a new content. You can find how to switch the game’s branch on Steam in the release notes section. Let's get started.

## Venus

This is a hard one. There is not much data or photos of the Venus surface except those one returned by soviet Venera probes. Because of Venera’s thick cloud layer we don’t even have proper surface color maps. So there is a lot of procedural texturing involved. I also chose the atmosphere color parameters by eye. So the only “real” data are Venus height and atmospheric physics. There is also no cloud layer at this moment but it will be added as soon as I will start developing a cloud system for the whole game.

![](https://clan.akamai.steamstatic.com/images//34094219/e55cd471e6b61848aead8c7ea1ab4457f5914edb.png)
_The atmosperic pressure is so high on Venus that engines basically stop working. But you will also not crash because of it._

## Planes

I talked about planes in the previous dev update so I will briefly touch on a few details here.

Firstly, there is basically one set of all parts needed for planes currently. The amount of work needed to add them was crazy, because it is always hard to add something completely new to the game. I can easily compare it to the first twenty parts that were in the game at the original EA release. You have no experience, references or idea if the new stuff works properly. But after extensive testing and reading a lot of articles you start building a feeling, what works and what is just a buggy mess. So you can expect more plane parts in the future, especially after I will gather some feedback for these ones.

Secondly, I’ve noticed that it is pretty easy to build something that will fly due to the socket system. But it is pretty hard to build a perfectly balanced plane because of socket’s restrictions. So a lot more assembly tools needed to solve that. One of them will be an ability to do a small offset for the connected part relative to the parent. Like 10cm would be enough for the balance purpose. But this is a task for another dev cycle and will probably require the whole rework of the rocket assembly system, because the code of it is very bad and it is very hard to change it in any way. But I will see how it goes.

![](https://media1.giphy.com/media/gwi0PjnPuj1p406Xha/giphy.gif)

So please try out planes and leave your feedback so I could improve them.

## Forces overlay

During plane assembly testing I found out that it is very hard to predict how a plane will act without additional information. To solve this I’ve added a detailed forces overlay during craft construction. Now you can see the force center, direction and magnitude for gravity, lift, thrust and drag. Or you can toggle a combined force and basically see the craft velocity prediction.

![](https://media4.giphy.com/media/dycvupEqfWlGDdq70z/giphy.gif)
_You can change a set of parameters to see what forces and how will affect the spacecraft at given conditions_

It is funny, that this force overlay helped me to find a bug: some payload fairings didn’t actually protect the parts placed into them from the drag.

![](https://clan.akamai.steamstatic.com/images//34094219/2d932624a39830762d6c1de59f30827cf8837c45.png)
_Notice the drag force affecting spacecraft without payload farirings_

![](https://clan.akamai.steamstatic.com/images//34094219/581f17c02a12dc5af26149e202c7f41872f64e6d.png)
_Drag force has been reduced by a factor of 12 after fairings were added_

Also note that each division on the arrow is equal to 1kN force, so you can easily compare forces and understand what will happen with the craft at a given set of parameters.

## Assembly improvements

The feature I am pretty sure you all waited for. You can finally remove parts using a symmetry.

![](https://media1.giphy.com/media/W1W7YkIlGzNXC9FO9u/giphy.gif)
_Better late, that late_

Not only that, but you can even symmetrically reattach parts. This one have some limitations tho:  

![](https://media4.giphy.com/media/YmNlxNhQM03Wqm0lPQ/giphy.gif)
_This one works_

![](https://media3.giphy.com/media/JFS3TBfnqriEJCS8oN/giphy.gif)
_This one doesn't because both attachment points should be free. This one currently impossible to fix without rewriting the whole assembly system_

Also mirror symmetry was added for plane assembly and some small fixes were made for the whole assembly workflow.

## Decouplers

All decouplers received two configurations. Now they can work as a decoupler (default) or a separator. In the first mode, the decoupler will stay attached to the decoupled part. The second mode works as it was before. This will help to reduce the amount of debris produced during the rocket launch. To further reduce it you can try to use dynamite, but note it is not safe!

![](https://clan.akamai.steamstatic.com/images//34094219/cc4adcc4740ecdeac082721d74d61a35b7151ce9.png)
_There are only one decoupler that can only work in the separator mode. Could you find it?_

## Bigger fuel tanks

This one I’ve mentioned in the August dev update. As it turns out, the new fuel tank radius requires a lot of additional parts like bigger decouplers, adapters, nose cones, fairings etc. I didn’t have time for all that, but still I’ve added something. This is bare bones, but you can easily build the first stage already. Also several days before the release I found a bug in this radius geometry (wrong number of polygons) which led to the coupling artifacts. I will need to basically remake all of these parts and will do it during the beta.

![](https://clan.akamai.steamstatic.com/images//34094219/e2f1b0a0f3e5875816ce9449684441c349891c34.png)
_This thing is really huge_

## Other improvements

As always there are a lot of smaller improvements that you can find in the release notes. For example, new lens flares, sun size and flares now depend on the distance to it, improved drag calculations, hiding part connections during the flight and more!

As always thank you for your support and I am waiting for your feedback!

## Beta

This build was deployed to **beta-builds** branch. To switch to this branch right click on the Rocket Science in your library, and click on Properties. Select the Betas tab, and then select the beta-builds branch. Once you see it, select it and click OK.

Note: if you want to switch back to default branch after this beta, you will need to manually clean %USERPROFILE%/AppData/LocalLow/Unity/unbeGames_HDYLIEM folder or the game will not start.