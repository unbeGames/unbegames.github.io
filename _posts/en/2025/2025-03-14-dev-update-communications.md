---
author: Arugin
title: "Dev Update: Communications" 
description: A picture is worth a thousand words. A satellite signal is worth a million dollars.
date: 2025-03-14 19:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]  
image: https://clan.cloudflare.steamstatic.com/images/32055644/d465ee71ff79b5a33f0feaabdc1bee2b4e2438c3.png
game: Rocket Science
math: true
---
Last February marked 5 years since the game started its journey in Early Access. Over the years I’ve released 16 big updates and dozens of patches. Since release this project was transformed from basically a technical demo to a real game that players can have fun with. While there is a long way to go and I am still working on this project alone, the end goal is finally within reach. I'll dedicate this dev update to my priorities, philosophy and plans in the near future.

But firstly, I want to mention that I changed my approach to bug fixing in this cycle. Previously, I would spend two or three weeks processing feedback and working on bug reports and then completely switching the next update and moving any remaining reports into there. This time I’ve been receiving feedback for almost two months straight thanks to some active players in Discord. And I fixed most of the critical issues during that time while deploying patches as soon as they were ready. I think I fixed more bugs during that time than in the usual update cycle. I’ve also significantly improved the feel of the spacecraft assembly process, added rocket files validation which should load crafts even if they were broken and fixed parts overheating on high time warps. While this tight feedback was great for the quality of the game, my progress on the v0.24 update slowed down, because constantly switching context between two versions of the game is expensive. The code is also starting diverging more and more over time and you sometimes need to fix the same bug twice – in the live version and in the development branch. But I think I could find a balance between new content and bugfixing next time, we’ll see how it goes.

![Important rocket assembly change](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2xvOXE4cWR4Njd0cmJzenU0emd6eGNrNnhwdjRoNHYydzg4NWd4eiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/yiAFqPH0K16hghPEb1/giphy.gif)
_The part is now positioned along a plane parallel to the ship and not the camera like it was previously. This small change improved rocket assembly a lot_

Next, I want to talk about development priorities. After solving thermodynamics and finally fixing most of the problems of rocket assembly I realized that there weren't many big flight systems left to develop for sandbox before I could finally switch to the survival mode. The first one I mentioned several times in the past updates is part and part attachments stress, overload and failure. What it means is If the part or attachment can’t support the load it should fail and detach from the spacecraft. For example, if you enter the atmosphere with extended solar panels at 8 km/sec they should break off. Or if you attach dozens fuel tanks to a single small radial decoupler it should fail. This system will bring the advantages of a multipart physics simulation without introducing wobbliness, because a rocket is still a single rigid body, and all calculations will be done manually. 

I thought about this a bit and realized that while the described system is great and will make simulation much more realistic and probably fun, it adds not that much to the gameplay itself. Sure, you need to account for part load and stress while assembling your craft, but you probably do not notice any changes for most normal rockets. The effect of this system will be most noticeable when flying in the atmosphere, where many forces act on the rocket and not so much in space. And the stuff to do is what the game lacks the most right now. So after considering all this I decided to postpone this system a bit and start working on another missing and important general system that should introduce more goals for the player and improve the gameplay. 

## Communication

I don’t think I need to tell you why space communications are a very important part of any flight. You can find it everywhere: from famous Apollo missions communications blackout on the back side of the Moon or atmospheric reentry, to whole missions like Galileo or SOHO being at risk because of high gain antenna failure. It also completely defines the shape of some space probes. Could you imagine Voyager without its giant parabolic dish?

![The second shape defining feature of Voyager after antenna is magnetometer](https://clan.cloudflare.steamstatic.com/images/32055644/945acb17a344b4e7321df5d1057d6f235d41a22b.png)
_The second shape defining feature of Voyager after antenna is the magnetometer_

So I’ve started researching space communications and was amazed how deep and complicated this topic is. Not the level of thermodynamics for sure, but I needed to learn a lot before I could even start thinking on how to implement this in the game. Because I didn’t want the system where antennas only have max operational range as a parameter and could magically extend this range when stacking a bunch of antennas together. But after some research I understood that I need to come up with a simplified model that would have a good physics basis but will omit some unnecessary details. Because otherwise this system could quickly become very annoying.

In reality any electromagnetic signal could travel infinitely far as long as there are nothing that can stop it like a planet. But it will lose its power by obeying an inverse square law. Imagine we have a spacecraft somewhere in space and an antenna on the ground. Spacecraft transmits a signal with a certain power towards the ground antenna. Now we need to calculate the power that reaches this antenna. To do this we need to use the Friis Equation.

$$
\begin{equation}
  P_{r}=P_{t}G_{t}G_{r}\left(\frac{\lambda}{4\pi d}\right)^{2}
\end{equation}
$$

where:
- $$ P_{r} $$ and $$ P_{t} $$ are received and transmitted power in Watts;
- $$ G_{t} $$ and $$ G_{r} $$ are antenna gains on both ends;
- $$ \lambda $$ is the wavelength;
- d is the distance between antennas.

As you can see from this equation, received power could not reach 0. But what stops the antenna to receive an infinitely small signal? It is actually the noise. Any antenna would receive the noise and you can calculate it using the following formula:

$$
\begin{equation}
  P_{n}=kBT
\end{equation}
$$

where:
- $$ k $$ is a Boltzmann's constant;
- $$ B $$ is the bandwidth of the receiver (in Hz), and
- $$ T $$ is the equivalent noise temperature of the receiving system.

The most important parameter of a receiving system is a signal to noise ratio or SNR: 

$$
\begin{equation}
  n=\frac{P_{r}}{P_{n}}
\end{equation}
$$

The higher this ratio is the cleaner the signal, the higher is data transfer rate and less errors are in the incoming data. There are different requirements for minimum SNR for different types of data encoded in signal, but to simplify I will assume that we are receiving only digital signal and will determine some minimum SNR after which the signal will be considered lost.

So what are the parameters of the antenna you need to consider when you choose it for your spacecraft? Looking at Friis and the noise equations you can see that there are basically three parameters:

- transmitted power;
- wavelength or basically frequency; 
- gain;
- bandwidth.

The first one is easy, it will affect the power consumption of the antenna. I will talk about the second one later. But the gain is the most important in my opinion because it will directly affect how your spacecraft will operate in v0.24.

Antenna gain is a measure of how effectively an antenna directs or concentrates radio frequency energy in a specific direction compared to a reference antenna typically an isotropic radiator (a theoretical antenna that radiates energy equally in all directions). Looking at the formula above you may think that the higher the gain the better the antenna. That’s right but the high gain antenna has a serious limitation. You need to point it in the direction of the receiving antenna. And while small antennas (for example parabolic where gain depends on diameter of the dish) could have mechanisms with an automatic pointing, bigger ones will be certainly fixed, so you need to orient the whole spacecraft to point it in the right direction. At the same time for low gain antennas, for example, omnidirectional, orientation don’t matter, but they have a limited range (typically 300,000 km but it depends on the receiving end, frequency and bandwidth).

## Network

Any probe core needs an established connection to operate. Command modules will not have this restriction. But where should the signal from the spacecraft end up? To support deep space communication I will introduce the Deep Space Network that consists of a number of ground stations with giant 70 meter antennas all over the globe. Also every launch facility will have a smaller dish too. This is the final destination of every radio signal. You can send it there directly or using a network of retranslator spacecrafts built by yourself.

![You can see these ground stations on the map, because they actual surface objects](https://clan.cloudflare.steamstatic.com/images/32055644/be989ff1ecb1b78f49cbe1fe4b723bd65c4567b8.png)
_You can see these ground stations on the map, because they actual surface objects_

To simplify everything a bit you need to consider only a “downlink” signal path. For example, a retranslator needs to point one of its antennas towards Earth, but receiving antenna direction doesn't matter. We will assume that the retranslator will automatically reorient itself to receive the signal from your other spacecraft to transmit it to Earth. The same goes for ground stations. They will receive signals as long as a direct path between spacecraft and station exists, not obstructed by the ground or other planets.

The remaining two antenna parameters I mentioned above — frequency and bandwidth have lesser effect on gameplay  but still important. They mostly will affect data transmission rates. And data rate would affect what data you can receive from your probe. There will be several data rate thresholds upon reaching which you start to lose some operational capabilities. For example not receiving information from instruments, losing telemetry or ability to open part windows, or even the control of the spacecraft in case of complete connection loss. These are my thoughts, but I didn’t implement it yet and can’t provide more concrete examples.

## Prototyping

I’ve implemented a prototype version of DSN and added low gain antennas to all probe cores. For DSN I used coordinates and parameters of real ground stations. I also added East Station for deep space communications and additional antennas for space center and Baikonur.

The first thing I found out, that no matter how many ground stations I add, they do not cover all LEO, because Earth is huge and the surface is the main limiting factor of ground antennas' field of view. So you need at least three retranslators on geostationary orbit to get the continuous coverage. In the simplest form such a retranslator would have one low gain antenna for uplink and one high gain antenna for downlink. On the one hand this is great because it adds new goals for the players to achieve even in the early stages of the game. On the other hand some players who don’t follow the updates could be surprised that some of their satellites don’t work most of the time. So I am considering adding an option on game creation for automatically adding such retranslators on GEO and for old saves it will be enabled by default.

Other than that everything works more or less as I expected. For low gain antennas you don't need to worry about craft orientation and they have a limited communication range but, for example, it is almost enough to even reach the Moon. Antenna system for spacecraft is automatically searching the best antenna to connect to even if connection to DSN is already established. Because of that the signal will always follow the most optimal path.

Right now I am working on high gain antennas. This includes modeling, parameters research and systemic improvement. For example, I need to add a component which will automatically point medium sized antennas to their target. And know what? This component could be reused for new solar panels, the only difference is that they have the Sun as the only target.

![One of the prototypes of a parabolic high gain antenna, 1.3m in diameter](https://clan.cloudflare.steamstatic.com/images/32055644/d17463a45c336fea89c67a5a31909c0bc8fc881e.png)
_One of the prototypes of a parabolic high gain antenna, 1.3m in diameter_

This update will be another big step towards the completion of sandbox flight simulation. It will require a lot more work than I expected, but I am loving the results so far. I need to test and adjust the parameters of all newly added systems well, because it will have bigger implications on how you build and fly your crafts even compared to thermodynamics.

That's all for now. In the next dev update I will tell you about other stuff I am currently working on as well as describe an upcoming API that the game will have in v0.24.
