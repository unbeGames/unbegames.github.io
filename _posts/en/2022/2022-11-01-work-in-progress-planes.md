---
author: Arugin
title: "Work In Progress: Planes"
description: Reinventing the wheel
date: 2022-11-01 22:26:00 +0300
categories: [Rocket Science, Development Blog]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/f2fa14238c5b59c80d3ce664fe628bdf4d69af81_400x225.png
game: Rocket Science
---
A quick update here about a new feature that is coming in the next v0.17 version of Rocket Science. So, this is actually happening. At the beginning of the development I thought planes are too complicated to make, and even placed researching this topic post v1.0 release into my roadmap. But the more I worked on the game and the more my skills improved, the more I began to realize that it was not only possible, but doable in the time frame of one update cycle.

![](https://clan.akamai.steamstatic.com/images//34094219/1f856843217b46323876097ae4ce280504ff80a8.png)
_Planes have been at the back of my mind since the first rocket take-off in the game_

One issue that I had to address before even starting research was the compatibility of the socket system with wings. The point is that planes, unlike rockets, need to be properly balanced so that the center of lift is behind the center of mass. I had no suitable sockets for that and the distance between each slot was 0.7m which is too far for proper balancing. So I've added a new type of socket. It is a line of slots with any number of them and 2x reduced distance between each one. And as I mentioned in the previous update, such sockets would look like swiss cheese. This was another reason to implement sockets hiding everywhere except assembly shop. Also I had to make them smaller, because with reduced distance the become like a mess.

After that, one week of heavy research and five weeks of development I finally put everything together.

![](https://media0.giphy.com/media/KDTLWLFcdLdtBhUE0O/giphy.gif)
_Note, that all the gifs are work in progress, anything can be changed_

The amount of new things that need to be added into the game to support planes is the biggest so far. Just take a look at this list of features.

- wings and lift and drag force calculations for them;  
- control surfaces such ailerons and flaps;  
- autocorrection system for lift forces;  
- wheels, including steering and braking;  
- new engine type: turbopropeller;  
- new fuel type: kerosene;  
- mirror symmetry for spacecraft assembly;  
- center of lift and thrust calculations;  
- new launch facility - runway.

And many more. The most complicated feature from this list was reinventing the wheel by the way, because Unity's builtin wheels do not work in the spherical gravity. But this is a story for another time. As are many otherstories about this development cycle, but I hope to be able to tell one or two in the actual update (now I simply have no time for that).

![](https://media1.giphy.com/media/iVlFbLi5xO5MoF6bf6/giphy.gif)
_The basic functioning wheel took me one week to made..._

Almost all of these things are 75-80% complete and I want to release the update someday in November. I didn't fully solve plane balancing yet and I need to finish tons of smaller features too. And, if I have some time left, I will try to add more than one plane set of rocket parts and add tutorials for all that.

![](https://media2.giphy.com/media/5NWBTa4XaHeVVCzvjA/giphy.gif)
_You can see there a new type of symmetry — mirror_

Thank you for your attention and see you in the v0.17.0 update!

![](https://media1.giphy.com/media/yUs9XSqokRlyBWE0CS/giphy.gif)
_Plane flight feels so different from rockets, it is like a new dimension for the game_
