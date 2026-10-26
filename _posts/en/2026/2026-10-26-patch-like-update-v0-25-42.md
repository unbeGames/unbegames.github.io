---
author: Arugin
title: "Patch-like update v0.25.42"
date: 2026-10-26 18:07:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.fastly.steamstatic.com/images/34094219/9acf8a192e68ade9a95539ff8a309f41811c2756.png
game: rocket-science
release_notes: rocket-science/v0.25.42
---

While v0.26 is still cooking and has several big features under development that I will discuss in the next dev update, I decided not to wait yet another several months for them to be finished. Instead, I split a huge chunk of v0.26 into this patch-like update so that you can already try it out and give your feedback.

It contains tons of fixes, especially to orbit calculations and thermodynamics, and the release notes do not even list all of them. Apart from that, there are some important changes that I will briefly discuss.

## Simulation refactoring

The flight simulation was becoming increasingly fragile. Actions like separating stages, docking, spawning parachutes, or destroying parts changed the spacecraft structure immediately, sometimes while the same spacecraft was still being simulated. Some operations were delayed until a specific stage called PostSimulate, while others used callbacks or a static bridge between model and controller code. It worked, but only as long as everything happened in exactly the expected order. As you can imagine, adding more complex spacecraft systems did not make this order easier to maintain.

I replaced this logic with a flight command buffer. Modules no longer perform structural changes directly. Instead, they create commands to spawn, decouple, couple, or destroy something, and these commands are executed after the current simulation step. Temporary spacecraft and part handles allow one command to reference the result of another, even if a spacecraft was split or merged in between. This also removed unsafe callbacks, the static controller bridge, and the entire PostSimulate stage. There is now one clearly defined place where structural changes happen.

![](https://clan.cloudflare.steamstatic.com/images/34094219/432ae17e57070a6a07a391a4f54c7e6620d1c52e.png)
_There's nothing to show in this section, so I'll just post a screenshot from random flight_

Another problem involved connected spacecraft. Previously, each spacecraft independently decided whether it should use full physics simulation or simplified mathematical simulation. This required a collection of workarounds when two spacecraft were connected by a joint. Now, spacecraft and joints form a graph. Adding a joint merges two groups, removing it rebuilds the connected components, and the entire group always moves between simulation modes together. A docked station can therefore no longer have one half calculated by physics while the other half believes it is safely flying on rails.

Most importantly, this gives future simulation systems a predictable foundation. A new system can request physics or schedule a structural operation without knowing how the flight controller processes every special case. More complicated sequences — such as spawning a spacecraft, creating its joints, and separating another part during the same update — can be processed in a controlled order without recursion or invalid references. This refactoring will make future simulation extensions easier to implement and debug, and considerably less likely to break. As a direct consequence, spacecraft with spawned parachutes or skycranes can now be saved and loaded in the correct state.

## Animation changes

Part animations used to be mostly visual effects controlled by Unity Animator. The game changed the logical and physical state immediately, while the model could spend several seconds unfolding, extending, or deploying. This was especially noticeable with parachutes: drag, cable anchors, and other physics parameters switched to the deployed state before the canopy reached it. Animations could also be skipped when a visual model was created late, after loading a save or during time warp. I added several workarounds for those cases, but each one solved only a particular problem and made the whole system even harder to understand.

Now, animation transitions belong to the simulation model. Their duration is measured from the real Animator path during part baking, while the active source state, target state, and start time are stored with the spacecraft. Visual controllers simply display the pose calculated from simulation time, so recreating a view or loading halfway through an animation restores the correct moment instead of restarting it. The center of mass, bounds, and drag are interpolated using the same progress. Commands that would cause an irreversible physical change also check whether the required transition can start before doing anything.

![](https://clan.cloudflare.steamstatic.com/images/34094219/04b80339b1217282ef02d0ccaf786ce26b956e0f.png)
_The result of one of the experiments — you might run into something like this, too_

I also added baked transform profiles for objects that move during an animation. They allow cable attachment points and physics-joint anchors to follow the deploying parachute canopy instead of instantly jumping to its final position. The same system supports position, rotation, and scale, so it is not limited to parachutes: future rotating instruments, extending booms, doors, and other animated mechanisms can use it without requiring another custom implementation. Animation, physics, and visuals now share one clock and one source of truth, which should make future moving parts considerably easier to implement.

## Persistent flight history

The journal of every spacecraft except debris is now saved in the flight history panel. Even if you retire or remove a spacecraft, you will still be able to find and read its journal. Journals are also updated in real time for operational spacecraft, so you do not even have to look into the flight to see what is going on.

Journal events were also extended with many more entries, such as docking and undocking, atmospheric entry and exit, orbital milestones, part and fairing jettison, parachute events, primary-body changes, propellant depletion, and splashdowns.

![](https://clan.cloudflare.steamstatic.com/images/34094219/bd88e9f41821ce0a492affe14997a65556a799b5.png)
_There is no option to delete the history yet; it will be added in the future_

## Work continues

Update v0.26 will introduce the last major required flight systems that will affect game and part design. After that, I am planning to make one more sandbox content update, and then I will completely switch to developing survival mode and spaceport building.

As for the current patch, because of the sheer number of changes, something may be broken. I will therefore be in support mode for the following two weeks, ready to receive and process any bug reports you send me. Thank you, and see you in the proper update.

![](https://clan.cloudflare.steamstatic.com/images/34094219/93edde4f73fd7081f878cb0d3c97aef240cc783c.png)
_I just love colors here_
