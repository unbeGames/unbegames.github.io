---
author: Arugin
title: May Developer Update
description: Rocket assembly
date: 2019-05-31 19:19:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/7748a9cb506324b60633f00fac0e532e86896d5b_400x225.png
game: Rocket Science
---
Greetings!

Today I will talk about the rocket construction in “How do you like it, Elon Musk?”.

As I described in the [January Developer Update](/en/posts/january-developer-update/) I had three ideas how to develop this system. And I had one important requirement, that this system needs to be simple enough but at the same time giving the possibility to combine rocket parts in different ways. So after some experimenting and theorycrafting I decided to stay with the slot-based system. But the problem was that there were at least five different approaches to creation of this system with its own advantages and disadvantages!

Let's imagine that we have four classic rocket parts: command module, decoupler, fuel tank and liquid fuel engine.

![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/58318005c8e2bad1998b403ed7bf41032a385fed.png)

**Note:** _this and folowing images are from the prototyping process_

I wanted the slot system to validate this set of rules:
- you can attach as many fuel tanks to each other as you want;
- you can not attach engine to command module or to decoupler;
- you can not attach any of this parts on top of command module.  

So the first thought was to restrict attachments by part type. For example, command module has two connection points: top and bottom.

![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/d4ff394bf0c3c61735b18cb2eb1f09c3cfe950e5.png)  

Imagine that you can attach only utility parts on top and fuel tanks or coupling parts to bottom. Two problems immediately arise. The first one is how to visually tell the player what you may or may not to connect to each other. List of part types in the tooltip is not a good idea. And secondly, this system is too restrictive. What if I want to attach six small engines to fuel tank instead of one big engine? Or if only some of utility parts can be connected on top of command module?

After weeks of suffering in search of the best solution I finally came up with one. And as always, it seems very obvious when you found it. So, meet the two pillars of the attachment system:

**Connector**:  
![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/4ec777536069b33519906fdf652bbad9b2c4472d.png)

**Connection slot**:  
![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/495c0f51bbcf3a7e755412035831f08730edf307.png)

Each part will have from one to seven connectors or slots arranged in a specific way. Attachments from the above rocket parts now look like:

![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/73766104b517c16fcaaf731e19450e62e0ccafa5.png)

You will ask: “How does it work?”. The answer is, that there is only one rule now. All connectors from rocket part should be placed into connection slots from another part. That’s basically all.

![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/6c779f016690d3d48d025316ba0ac499e29b397e.png)

This system will provide me the ability to restrict some invalid part configurations. Also I can try to implement a bit more complex rocket physics now. At the same time it gives you a lot more freedom to construct different rockets from the same set of parts. For example, you can connect two or three medium engines (with two connectors) to the fuel tank above. Or from one to seven small engines with one connector!

Also part attachments can be easily represented on the part selection UI:

![](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/057eabf7265fa3733d49f7851aa503fa88395846.png)
_I also experimenting with the UI color scheme and you can see it here._

While this system is pretty simple from the player point of view, it is a nightmare from the implementation side and it will shift the game release further away. But I think it is totally worth it. Also I have several ideas how to further extend this system, without losing its basic simple rules.

So, what do you think about this system? I appreciate all feedback, always read it and take to consideration, so do not hesitate to comment.
