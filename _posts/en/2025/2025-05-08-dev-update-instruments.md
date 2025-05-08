---
author: Arugin
title: "Dev Update: Instruments" 
description: "Two possibilities exist: either we lose the connection or we it will be too weak. Both are equally terrifying"
date: 2025-05-08 18:30:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]  
image: https://clan.cloudflare.steamstatic.com/images/32055644/50c4af0feae829494c697180276dc8168722bf9a.png
game: Rocket Science
---

So, where was I at in the last dev update? I said that I started working on high gain antennas, right. And, oh boy, I have a story for you.

The first such antenna I’ve modeled and added to the game was a famous 3.7-meter dish that was installed on the Voyager spacecraft. It had a fixed mount and well-known parameters, so it was a simple case and a great reference for testing Deep Space Network. I’ve modeled, configured and added it into the game. Then built a simple spacecraft and sent it to the orbit of Pluto.

![The satellite with antenna on orbit of Pluto](https://clan.cloudflare.steamstatic.com/images/32055644/f2f651a5a9ed23927c6da2c6daf28947c9fce37b.png)
_Finally, crafts starting to take a more realistic silhouette_

In anticipation, I loaded a flight scene and… the antenna showed that there was no connection. Wait what? I’ve double checked all parameters of the antenna and ground stations. I’ve looked into DSN calculations. Everything seemed right. But there was still no connection. But why? Both Voyagers are much much further than Pluto right now, but they continue to send telemetry and scientific data to Earth and receive flight commands. How do they do that then?

I’ve started to research this topic deeply and I found that I made a mistake. [Remember](/en/posts/2025/dev-update-communications/), I said that I will assume that we are always receiving only digital signal and will determine some minimum signal-to-noise ratio after which the signal will be considered lost? So I set this value to 10dB, because it seemed reasonable. But what I learned is that for very distant transmitters DSN could handle signals with much less SNR than that. For example, (if I understand correctly), SNR for New Horizons was less than -20 dB while it passed near Pluto. So basically, the noise was **100 times stronger** than the signal itself! It was a bit mindblowing, how could you even extract any useful data with such low SNR? I read about it more and found out that there are some great (but complicated) methods for doing that. But I will not dig into it there, because it is out of scope of this update.

So I decided to set the minimum SNR to -20 dB. It was a simplification, because I didn’t account for or implement all those crazy integration and error correction algorithms for DSN to work on such low signals, but I thought there was enough depth for the communication system already. I’ve loaded my craft and…

![Typical bitrate on Pluto's orbit](https://clan.cloudflare.steamstatic.com/images/32055644/76befe619f3d94d5f1647ea92559ed1287c2d876.png)
_2 kB/s is actually a pretty good speed for such distance_

It is finally working, yay!

Another interesting thing I’ve implemented is an increase of antenna temperature when it points to the Sun while receiving a signal. If you remember from my previous dev update, antenna temperature is used while deriving the power of noise. And the Sun is a very powerful source of noise. So when this happens, you will experience a significant reduction of signal strength and most likely will lose a connection unless you have a retranslator that avoids pointing the antenna to the Sun. So this becomes another factor you need to account for while exploring inner planets.

![Ground station to retranslator reconnect animation](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcWw0eGxndHJ5aWFsMjdyOGxmN2JiamhjeXphbWtvaDduc3pobnNpcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/WA2VnoLmXIZhJ3yptt/giphy.gif)
_Here you can see how spacecraft reconnects from ground station to the retranslator and back while orbiting_

Next, I had to answer the question: what actually happens when the signal is lost or becomes too weak? In the case of complete connection loss everything is simple: you can’t control your satellite and don’t receive any data from it. But what to do when the connection becomes weak and bitrate approaches values of a couple of hundred bytes per second? There were so many ways to handle this so it kinda stumped me for a bit. After a careful consideration I decided to take a systemic approach for this problem rather than some set of arbitrary rules. This aligned well with a feature I've mentioned several times before and wanted to implement it for years.

## Instruments

What bothered me for a while was a fixed set of stats panels during the flight that didn’t depend on the type of spacecraft. For example, orbit and altitude panels are meaningless for a rover. And atmospheric pressure data is not needed for satellites that spend 99% of the time on the orbit in the vacuum. And if I decide to expose more stats – the more panels will clutter the UI. But the introduction of a communications system has created the perfect conditions to deal with this problem.

From now on each panel will be linked to a corresponding instrument that is installed on the craft. Most command modules will receive built-in instruments, like altimeter, orbit or resource info. If a spacecraft doesn’t have an instrument, then there will be no corresponding button or panel there. I am also introducing a new rocket part type, so you will be able to attach new instruments to your spacecraft. For example, if you need to measure pressure, you need to attach a barometer to your craft. And obviously, more instrument parts will be added in the future.

Each instrument will consume electricity while working. If you don’t need it you can turn it off, but then you will not get any data from it. Each instrument now also has a completely new parameter – required bitrate. For probe cores and rovers instruments will not send any data if there is no connection. If there is not enough electricity they will not display any data too regardless of the spacecraft type. Finally, if the connection is very weak and the sum of bitrates of all instruments is higher than antennas could transmit, some instruments will stop transmitting data. But don’t worry, the numbers there are very low. For example, navball (which is an instrument now too) requires only 24 bytes / second of data transmission and altimeter only 8 bytes. Missions with a good parabolic antenna near Pluto will have far more than that. However I am planning to extend the data rate requirement to other panels, like rocket part ones too.

![Connection lost](https://clan.cloudflare.steamstatic.com/images/32055644/d0775596464260f6cdb4d9a3158f14c3581f0d00.png)
_Instrument panels when you are using unmanned spacecraft and connection was lost_

It is also very important for me that each instrument would give you meaningful data. For example, if I add a temperature sensor, it should show the temperature of the atmosphere where you are flying. Even if it is a simplified model of atmosphere, it is far better than no data at all or some random joke-like text descriptions. More importantly, It will be also a part of the future science update, where you will put instruments on the spacecraft not only to make experiments and gather science points, but to discover and expand your knowledge about celestial bodies in our solar system.

While working, implementing and playing around with instruments and antennas I realized that there are more changes required to spacecraft systems, so everything could operate smoothly and predictably.

## Electricity rework

I had several bug reports where the craft had batteries, solar panels or RTG but at the same time probe core was not operating and showing the error that there is no electricity available. What was happening here? After a bit of investigating I found out that parts produced and consumed power in random order. More specifically, parts with similar modules were combined into systems and the order of execution of those systems was not determined. So it could happen that the solar panels system executed first, produced electricity and stored it in the batteries, then the reaction wheel system executed and consumed all the electricity from batteries, and lastly, when it was time for the probe core system to go off, there was no more electricity left in batteries to operate. Which is not great if the same will happen with the antenna system, because spacecraft would become uncontrollable. And the more part types would consume electricity the more likely it will happen.

So I’ve added an electricity "supersystem" that will calculate how much electricity is consumed and produced among all systems and parts each frame. The produced electricity will then be used to fulfill the demand. And the remainder between production and consumption will be sent to the batteries or taken from them. This way the spacecraft will be perfectly functional even if your solar panels barely cover the electricity demand. This is good for performance too, because the game touches batteries only once per simulation step, and draining or depositing resources is a pretty expensive operation.

![Total production vs total consumption](https://clan.cloudflare.steamstatic.com/images/32055644/a46657bb7ad9421c8369a50bf768005d9a3bd545.png)
_Status indicator has been reworked too, but more on that next time_

A few more interesting changes that I made along the way. Firstly, batteries now produce heat when charging. Only 90% of electricity output from solar panels or RTGs will be stored there and 10% will be converted to heat. This is not a big amount but in some scenarios it could produce an interesting story.

Secondly, I’ve added resource priorities. You can set them now for fuel or electricity during the flight or while assembling rockets. Resources will be consumed from containers that have higher priority first. Priorities could be negative too.

![Resource priorities in work](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeWRqZWkzYWQ1YXMwN2hyd3lhM2pmM2RwNzByNGk5Zmljc3VjN3cwdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B56AAjXE8bm7LanUlP/giphy.gif)
_Priority can be set in range from -128 to 127. I think this is enough even for a most complex rocket you can imagine_

Thirdly, I discovered a critical bug in the batteries logic, that proportionally consumed more electricity the more batteries you had. So, basically, for the last few years you actually had the capacity of one largest battery no matter how many of them were installed! And no one has noticed it! This is fixed now and batteries are great again.

There are many other changes, but I will tell you about them on update release. Now I want to talk about the next important meta game feature.

## Game API

I couldn’t say that it is a highly requested feature, but there are some very dedicated players in the community who want to contribute to the game via mods. While the current mod system is simple and neat, it is pretty limited. You can’t add new functionality to the game using it. You need an ability to extend game code in some way to do that.

I’ve thought a lot about this. There are dozens of different approaches to that. Some of them are slow. Others are hacky or very hard to use. The best way to do that in my opinion is to provide a C# API and the way to dynamically load your extensions compiled into dll. This is a pretty low level solution, but it is fast, simple to integrate from my side and someone could build a wrapper using it exposing scripting for example on Lua, Python or even JS.

But what about an API? There are two main approaches here. The first one is called “Facade”. This means that the game code is completely hidden from the extension programmer and he could interact with it only using this API. This would be a great variant, because it provides stability (each update would not break extensions) and safety (I have complete control over what parts of the game could be touched at what point in the update loop). But this also means less flexibility (you can make only what the API allows) and hundreds of hours of the development spent on the feature that I am not sure would be in high demand in the near future.

Because of that I chose another way. I will provide a thin API which will simplify some operations. For example, the way to easily request all current flying spacecrafts, or currently created rockets, or information about the scene, celestial bodies or other stuff. Other than that you will be able to execute any public method from any game module. So you will need to learn the game structure and data formats to use it effectively. To help you with that I will start to convert some of my internal comments to a special C# “docs comments” format. This way you could get hints in Visual Studio while calling the game methods. There are also ways to gather this docs comments and generate the documentation site from it, but I see if I have time for that. The documentation will be very bare bones at first and it would take a lot of time to even document essential methods and data formats (there are literally tens of thousands of them), but we I will try to extend it with each update.

![Game API](https://clan.cloudflare.steamstatic.com/images/32055644/ed7734e4b274b0f6148eee4558808954b047b96f.png)
_How some code documentation will look like, I hope_

You have to also understand another downside of this approach, that I will not guarantee the game API compatibility between game versions. I am constantly changing different parts of the game, improving and refactoring it. So your extensions will likely break each update. But on the other hand, I made a big refactoring pass already, standardizing some naming conventions, code style, etc., so it is less likely to happen.

So, when the update releases I'll provide an extension loader integrated into the current mod system, a thin API and a template project for extensions on GitHub. So those players who want to try it out could do so. After that I will prepare and publish a sample extension which adds some new functionality to rocket parts and displays it during the flight. This would take a couple of weeks and I also will be able to process and implement some feedback received from early adopters. This would be a great starting point for any player who wants to try to extend the game. And we will see how it goes.

## When?

I am almost finished with the core functionally of all described systems and some other featuress that I didn’t talk about. But there is still more work to do. I need to test everything out and see how everything feels. I didn’t have time to work on rocket parts themselves (except for some prototype ones), nor I didn’t started fixing bugs already reported by players and introduced during an update. I certainly need to add a communications tutorial and add default GEO retranslators as an option when starting a game. Usual performance tests and improvements are also required. So I can’t promise the date right now, but I will probably announce it in a few weeks when most of the work will be done. See you there then and have a nice flight!