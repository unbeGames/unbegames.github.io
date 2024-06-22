---
title: January Developer Update
date: 2019-01-31 21:28:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]     # TAG names should always be lowercase
description: The adventure begins
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/6c91d88a480d31c543b1ffe108d8278e09048fbb.png
---
Hello everyone!

Here is the first Developer Update. Today I want to talk about features and decisions of "How do you like it, Elon Musk?", that make this game different from the main competitors, and what I need to do to successfully reach the release in the Early Access. One small note, before I start. The following is a current vision of the game, and it may and probably will change in the future, as it has happened before several times. You are now aware of possible changes, so let's begin.

The game loop consists of three huge parts: managing the spaceport, constructing the rockets and launching them into the outer space. The main focus will be on the spaceport building and management, while other parts will extend and add meaning to it. Like in Kerbal Space Program the main focus is on the designing your rocket, and other game mechanics (science, upgrading buildings, even flights) only exist to support it. So I had a difficult task, how to "reinvent" rocket construction and flights to make them fresh, interesting to play and at the same time not much distracting from the main theme of the game. And, I think, I solved the flight part of the problem at this moment.

You will have no direct control over the spacecraft. You will need to develop a flight plan before launch, assign it to rocket and rocket will execute commands from the plan to perform the flight. The flight plan is developed at the mission control center, where you can simulate flight and the state of the entire solar system for months in advance. The typical text version of the flight plan may look like:

- T -00:00:02 set the engine throttle to 0.5
- T -00:00:00 liftoff
- T +00:00:30 start gravity turn to the east
- T +00:01:54 decouple launch escape tower

And in the current implementation:
![Implementation sample](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/5f96a7f84c4a67eea375c37300719b0d70ce85d5.png)
_Just and example how an implementation could look like_

If something will go wrong, you'll be able to send the set of correction commands to the rocket and hope it will solve you problems. You will also be able to reuse existing flight plans for the rockets of the same type and do not repeat the same tasks all over again (such as getting rocket on low Earth orbit). But this way of handling flight has a trade-off. Physics simulation should be much simpler and performed for the whole rocket at once, not for its parts. Without this simplification planning UI becomes slow, unresponsive and very frustrating to use. Maybe I will be able to solve this in one of the updates in the Early Access, but this part is not as critical as the other ones. 

The rocket building part is trickier and I didn't fully figure it out at this moment. I don't want this system to be as complex as it is in other games. But I like the idea of combining rocket parts with different parameters and different prices. It adds depth and good progression system to the game. There is nothing complicated about rocket parts, in fact, I have this system already in the game, but if we start talking about the attachments between the parts, I will quickly become mad. For example, you are able to attach any rocket part to almost any other one in KSP. This possibility produces an infinite amount of rocket configurations with more than 98% of invalid ones. And the failure to launch the rocket is fun. It is the solid part of the game. But I’m not sure if the launch failure will be fun when you have no direct control over the rocket and you can’t revert the flight after submitting and starting plan execution. Sure some unexpected accident will add the variety and add weight to your decisions, but rates of the failure should be much lower, to progress successfully in the game. Also due to simplified physics simulation it is very hard to validate the correctness of the assembled spacecraft and check if it is able to fly.

I have several ideas how to deal with this, but I need to prototype all of them to understand which is better. The first idea is to strictly define connection points and limit the part types you can connect to them. The second one is to define basic hull configurations for rockets and give to player the ability only to fill the insides. The third one will give the player a choice from which parts the rocket should consist and then automatically assembles it.

![Initial model of launchpad](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/b4c68eeaf4e45c303890392c5a5abc41450fd7f7.png)
_The first ever created model of launchpad_

The other systems such as planet generation, basic spaceport building, orbital mechanics are in some form ready. So when the rocket construction will be implemented I can finally put them together and start to develop the basic game sequence. After that the content can finally start to arrive. It would be great to deliver the game with all described systems to the Early Access. If I will have not enough time for that, I will probably delay the spaceport building to the first update after EA, because the flight systems are fun even now, but spaceport building requires a lot of work and fine tuning to become interesting.

In the next developer update I will talk in-depth about planet generation and the world of HDYLIEM. See you soon.
