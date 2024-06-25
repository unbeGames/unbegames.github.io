---
author: Arugin
title: August Developer Update
description: In this single game of ours there are thousands features we want to exist
date: 2022-08-31 21:00:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/37d1c23272ced3b8f8404ae0d86bde6771e15a72_400x225.jpg
game: Rocket Science
---

Hello, everyone!

Last update I received a lot of feedback on the game and a bunch of feature and content requests. I had to choose the most valuable but not the insanely time consuming ones, as I continue to work on the game alone and have to deliver updates within a reasonable time frame.

But before I get down for that and start the next dev cycle I have to migrate to the next major Unity version. I’ve been locked on the same engine version for 2 years, because I was using new (for that time) experimental engine features that made it possible to make the game fast and support real scale planet generation. The price was this engine lock, until Unity Technologies would transfer these experimental features into the latest stable Unity version and start to officially support them. This happened in June so I could finally move on.

But why spend valuable time on this engine migration when it won't add anything new to the game? Because engine's tools are getting better, some of the newest graphics and scripting tech are becoming available and sometimes everything even starts to perform faster. Hoverer, this migration is certainly not a walk in the park. Usually the game starts to fall apart after that, a ton of bugs and errors appear, some libraries stop working and some critical code completely breaks. You need to fix everything and then test everything, and fix every single issue you find during quality control. And even after that players will find introduced bugs by this update for months. But if you want to support your game for years and continuously work on it, you need to stay on the edge of the progress or you will be left behind and will lose the competition with other projects.

![](https://clan.akamai.steamstatic.com/images//34094219/3ed663fc96438d58aba019123e62d703fafbf8c6.png)
_Typical game view just after engine migration_

Again, this engine update has allowed me to completely rework lens flares and the Sun size and make them dependent on the distance to it. So if you look at the Sun from Pluto, it will look like an ordinary star. The next big thing that I’ve added is the support of scaled rendering and NVIDIA DLSS and AMD Fidelity FX. This means that you can finally play Rocket Science in 1440p and 4k resolution or improve FPS if the game is GPU bound for you.

The engine migration was done, but I suddenly injured my back and couldn't sit or lay down without pain. I spent the whole July healing it and, unfortunately, couldn’t work at all. But, thankfully, the pain was almost gone in the middle of August and I went back to the game development.

I started to look into feedback again. The first most requested feature was bigger fuel tanks. You need a lot of ΔV if you want to fly anywhere beyond the Moon. You can build such a rocket, and you can even find a bunch of videos on Youtube, where players land on Mars or crash into Venus’s surface. But those spacecrafts consisted of hundreds of parts, were hard to assemble and the game processed them very poorly, especially during the first stages of the flight. So the perfect candidate for the job has been found. Besides, the game still needs a lot of different fuel tanks to make the rockets easier to assemble and look better.

But bigger fuel tanks need attachments with more slots and the game supported a maximum of 16 slots at that moment. To increase this number I needed to rewrite an internal data format that stores connected to the part slots, which would immediately break all save games. But after some research I’ve invented a compatible format that supports up to 64 slots by the one attachment.

The shape of attachment containing these slots was a challenge too. It should be consistent with what is already in the game, be compatible with all current attachment shapes, also support symmetry and rotation. It’s like a geometric progression, adding each new attachment shape requires progressively more and more work. But I solved it and the attachment for bigger fuel tanks radius would look like this:

![](https://media0.giphy.com/media/ihW1iUZIkvqajgGDDM/giphy.gif?cid=790b76111c98a550c911d0e17f5692114dc8c9959fadc064&rid=giphy.gif)
_I am thinking about even bigger attachment for the largest fuel tanks radius in the game, but those will come later_

When this shape was done, I started to experiment attaching different combinations of engines. I discovered that some combinations, like three attached “Zarya” engines, are not working, because of incompatible engine radiuses. So I had to tweak those and you can expect a lot of small changes in shape and forms of some rocket parts.

One small problem remains. If you leave most of the attachment space empty, this part of the rocket is starting to look like Swiss cheese. And such rockets don’t look like real ones during the flight. Because no one would leave such attachments exposed to outer space if they would exist in reality. Additionally, the large number of not filled slots adds a visual noise to the rocket. Surprisingly, they also considerably decrease the rendering performance.

So I made the decision to hide all connectors and slots for all spacecrafts except the case when the rocket is in the edit mode in the assembly shop. Implementing this change would require an enormous amount of work, but I found a way to partially automate it. So it is almost done now and it will open more space to rocket visual design in the future.

![](https://clan.akamai.steamstatic.com/images//34094219/6287f8edb8020f5cea4d54c9943b6abecaf1e55b.png)
_The view you are used to and it will remain in the rocket editing mode_

![](https://clan.akamai.steamstatic.com/images//34094219/26aa33f4632a5a2ff36e2895a9d6c7906800e7ae.png)
_How it would look elsewhere_

The next problem I have received several complaints on is space debris. When a rocket's stage debris enters the atmosphere, the simulation speed can not be set over 10x even if your main spacecraft is already in orbit. Players have two options in this case: wait until debris will crash into the planet's surface, which can take several minutes. Or return back and manually delete all junk. Both options are bad, but I don’t want to just exclude all debris from the physics simulation. There are a lot of edge cases for this solution, and I also planned to make several gameplay mechanics related to this problem. In reality, most leftover parts burn up on re-entry. But the game has no thermodynamics right now and it is not easy to just add it.

So I introduced two working modes for all decouplers: “separator” and “decoupler”. The first one works as it was before. In the second mode the decoupler will stay attached to one of the connected parts, marked by an arrow on it. This should already reduce the amount of space junk. As a further “temporary” solution I’ve added a “self-destructor” part which will destroy itself and all connected parts after a specified amount of time after detachment from the main rocket. It is pretty light and requires only one slot, so if you are very annoyed by debris, you have a solution.

![](https://media3.giphy.com/media/eZFzmoXB5ZS3e8DD05/giphy.gif?cid=790b7611eee3dd56d09de6893e5cae5e43bdd86443d513a8&rid=giphy.gif)
_Here I immediately found a bug, that the effect of explosion in space stays fixed in one point instead of moving on the same orbit._

The third thing I have been asked more than several times was extending the tutorial. But this was already on my working list and I just increased its priority. Moreover, I’ve planned a lot more for the next update. New tools for the assembly shop, some improvements handling engine’s throttle, a lot of new rocket parts, the new planet and a bunch of tutorials and missions. I will tell you about all that in the next “work in progress” article.. Obviously, the next update will not be ready in September as I planned before, because I lost one and a half months while I couldn't work. But I hope it will be released somewhere in November and I will keep you updated on that.

Thank you very much for your support and see you soon.
