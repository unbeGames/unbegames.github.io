---
author: Arugin
title: Update v0.17.3 "Within The Horizon" is out of Beta!
description: Progress can be seen at night with closed eyes
date: 2022-12-22 20:00:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/256ddad9f913b4df50776a102743a00fbefd3cdb_400x225.png
game: Rocket Science
---

Three weeks ago I released the "[Within The Horizon](/en/posts/2022/update-v0-17-0-within-the-horison-public-beta/)" update into public beta. This time I've got less bug reports, because the game is a bit more stable overall. But winter holidays could be a reason too. Anyway, I've found another bunch of bugs, while working on the next advanced game tutorial. And I haven't heard about any critical blockers from the users who tried it out, so the beta testing was totally worth it.

Here is a quick summary of major changes in v0.17 version: Venus, planes, mirror symmetry, symmetry delete, new advanced tutorial, more than 25 new parts, including large fuel tanks, and yet another pile of fixes as the game has ever seen.

Don't also forget, that there will be a limited time winter holiday event in the game. It will last from **December 24** to **January 14** and will bring a holiday spirit into it.

Below are patch release notes and full release notes. Thank you for playing the game and helping to improve it!

P.S. If you prefer playing Rocket Science localized in German, take a look at [this mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2902755770&searchtext=), released recently.

![](https://clan.akamai.steamstatic.com/images//34094219/a23e7fed9824b72c87a981a5791c1e9906c78a41.png)

## Release notes v0.17.3

### Features:

- new planet: Venus;
- added aero (wings) and control surfaces (aileron, rudder ecs);
- added fixed and steering wheels;
- added new engine type: turboprop engine;
- added new fuel type: kerosene;
- implemented mirror symmetry;
- new vechicle forces overlays in the assembly shop;
- added symmetry delete / reattach;
- new fuel tank radius: 2.5m;
- added two decoupler modes for all decouplers;
- rocket part connections can now handle up to 64 sockets (previously was only 16);
- one new connector and one new socket for new fuel tank radius;
- added new line socket type for planes;
- slots and connectors on rocket parts will only be shown during rocket assembly;
- added runway for spaceport, that will store spacecraft separately;
- added AMD Fidelity FX and NVIDIA DLSS support;
- sun's lens flares effect rework and improvements;
- added new "Adnanced Rocket Assembly" tutorial.  

### New rocket parts:

- added around 25 new rocket parts, most of them are bigger fuel tanks and parts for planes;  

### Part changes:

- Basic adjusted size and mass;
- increased radius of big payload farings so sizde staged rockets are now possible;
- adjusted size of some eingines so they will fit well on new connector;
- changed connector on engine 0 from triple to rectangle;
- reduced all socket and connector sizes by a factor of one and a half;
- fixed a bunch of geometry issues, seams and other visual bugs on different rocket parts;
- reduced mass of nose cones a bit;
- added kerosine fuel configuration for all small fuel tanks;
- added no fuel configuration for all fuel tanks;
- reduced throttle limit for engine 4 from 90% to 80%.  

### Changes:

- only some parts (like fuel tanks, engines, batteries) generate explosion force on destroying;
- improved autostatbilization speed on large heading differences;
- sun flares and sun size will depend on distance to it;
- CPU consumption improvement in the spaceport and assembly shop;
- attachments with two or more sockets can have a small offset along surfaces and induce additional rotation on a part;
- \[Assembly\] rewroked craft overlays buttons (borderless buttons);
- \[Assembly\] chaning category will automatically close part configuration;
- greatly improved search of approach nodes and increased search distance around target body, especially for small celestial bodies;
- reworked geometry of all 2.5m parts, so no more artefacts on rotation;
- fixed visible seams on 2.5m fuel tank caps;
- improved materials on all 2.5m fuel tanks;
- tanks no longer auto rotate on connecting;
- slightly improved automatic stage builder.  

### Settings:

- new hotkey for brakes (B);
- new hotkeys for wheels steering (A/D);
- new hotkey for mirror symmetry (M);
- added separate marker size setting for celestial markers;
- added scale rendering settings to the video settings;
- sometimes the rocket part tooltip does not show connections.  

### Fixes:

- unnececary drag calculations performed when spacecraft is over planet with no atmosphere;
- parts inside the payload fairings produce drag;
- some payload fairing sections produce additional drag;
- spacecrafts a bit less responsive when rotating them clockwise;
- controls setting have no setting for spacecraft systems (ligts, landing gear, etc);
- drag data calculated incorrectly for a part if it has more than one material;
- sun flares are visible through the planet;
- exception, when using symmetry on rcs_mounting_point_1;
- sometimes rocket could start behave incorrectly when some parts were destroyed or removed;
- custom Surface mod is not saving if already modified surface was modified;
- reduced window flickering in the assembly shop;
- center of mass and root part markers have wrong position after the whole rocket was moved in the assembly;
- when reattaching part from socket to socket within the same part, game sometimes doesn't register place click;
- engines got negative thrust on Venus;
- some ambient and engine sounds not respect audio volume;
- error when creating subassembly from whole rocket, then placing it back and then removing any part from it;
- newly created subassembly could be unexpectidly edited when used during another rocket assembly;
- if subassembly was placed into new rocket and then any part was removed, the whole subassembly disappears;
- game sometimes stuck if you interrupt tutorial;
- rectangle socket now prevents selecting middle slot on a heptahedron socket;
- some part names are not localized.
