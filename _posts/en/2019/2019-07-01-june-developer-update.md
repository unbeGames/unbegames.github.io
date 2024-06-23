---
author: Arugin
title: June Developer Update
description: Spaceport building
date: 2019-07-01 00:47:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/5a42c6d642fd90392c996620017af677836a906e.png
game: Rocket Science
---
Hello everyone!

First of all, I have updated some screenshots on the store page, so you can go and check it out. It is still a work in progress, but I think, they better represent the current state of the game and show more gameplay, than the old ones. Also I am often asked about game trailer and I agree that it will describe the game better, than the thousands words. But good trailer requires well established gameplay, a lot of game polishing, and enough content to not disappoint anyone (and I still changing a lot of things in the game on a daily basis). So, I think I will be able to publish the trailer three weeks before the release in Early Access. And I hope it will happen in the 2019.

![Control Center](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/5a42c6d642fd90392c996620017af677836a906e.png)
_Control Center_

Now it’s time to talk about spaceport building in “Rocket Science”. As I always said, this will be the main focus of the game. While this game mechanic is pretty easy to implement from the coding perspective, it is hard from the game design point of view, because there are too many ways of how you can approach this problem. You can also pretty easily stuck infinitely iterating over it and keep adding new systems to the point, when the game becomes unplayable complex mess of mechanics, numbers and buttons.

![Elevator](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/1911245721c051a255764727637bfb8f48574cd3.png)
_Elevator_

I should have come up with a set of rules and restrictions to avoid falling into this trap. And set them in stone after that, no matter how it will be difficult to follow this restrictions, because it is only way to find your way. So I will outline the set of found restrictions in the following paragraphs and we will deep dive into them in the next developer updates.

The story begins, when you get under control the ruins of the old Soviet spaceport. All you need is to transform it into the space center of the future. Unfortunately, the building permit was not given and you are not allowed to build anything on the surface. The only way to expand is to build deep into the Earth. Each building opens up new opportunities, complements existing ones or makes life easier. For example, laboratories allow researching new rocket parts and buildings more quickly, storages and workshops - to store and process items into resources, and generators - to produce electricity on your own.

Sounds familiar, right? The next step was to make this gameplay unique in its own way. I spent a lot of time thinking about it and came up with the first rule:

## Nothing works without people

Every building requires staff to operate. There are workers, engineers and scientists you can hire and assign to buildings. The more staff requirements fulfilled the more features the building have.

![Storage](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/a4897f45486070d0de969eb42b866ca81f7c4b8c.png)
_Storage_

For example, each worker unlock more space to store items in the storage and when you will assign all four of them to the building, you will receive the ability to automate collecting or delivering resources to other production buildings. But don’t forget, you should pay every employee at the end of the month. And if you don’t, they will quit and will never return.

The second rule almost immediately arose from the staff system:

## Every action takes time

The game will be in real time. And the time will become the second main resource after money. Do you want deconstruct the Soviet ruins? It requires four days. Do you want to build a coal generator? The workers will finish it in a week. Of course you will be able to speed up time up to one day in a second. But you should think twice about this, because the end of the month is coming and you should not only pay salary, but taxes and bills too.

The third rule is the matter of my own taste. I hate routine and monotonous tasks in games if they lasts for entire game and not required by narrative. But in the right proportions they can set the tone of the game or make you feel current situation. It is just another tool that you should use carefully. So, the third rule is:

## Every routine and monotonous task should be automatable

For example, in the beginning of the game you will have few resources and money. And you should do some tasks manually such as moving resources from building to building, or throwing coal into the furnace of the coal generator. But when you’ll make some money you will be able to hire more staff to make it for you. But the option to do something manually will always exist, for example, if the hard times come, you can save some money by performing all this work by yourself. By the way, the flight plans system was born because of this rule.

The last rule is my preference too. I’m not a fan of linear upgrades systems in the games. Sometimes it’s ok, like in Action/RPG, where the upgrade trees exist just to make you feel the growth of your character. Or in Civilisation you feel how is you nation developing, thriving and moving from one era to the another. But I think that in some games it is a waste of content and potential. Why you should build, for example, the tower and then upgrade it ten times to do something useful with it? And very often there is even no situation, where you actually need the tower of level 5, so there are no interesting choices to make. The actual fun is delayed by meaningless actions to increase the playtime and create an illusion of depth.

So the fourth rule:

## Avoid linear upgrades system as much as possible

This the the hard one, because every game needs the progression system and linear progression is the easiest one and you almost instinctively want to add it into the game. But I think I solved it in theory and came up with nonlinear system with interesting choices and room for sinergy. And it called “Mechanisms system”. I hope I will tell you more about it in the next updates after I actually try to implement and play with it.

Now you know the four main pillars of the spaceport building. As always tell me what do you think and see you next time.
