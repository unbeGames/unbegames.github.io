---
author: Arugin
title: Update v0.15.0 "A New Beginning"
description: The darkest hour is that before the dawn
date: 2022-03-10 23:35:00 +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/c061f93998bf97052aaec06a5e3a5e6a14e2b4de_400x225.png
game: Rocket Science
---

First of all I want to say some words about recent events. The war that Russian government started in February is a catastrophe, a disgrace and a crime against humanity. Hundreds of innocent people have already died in this war and I see no end of this horror. I had friends from Ukraine and my grandmother was also from there. I know what is happening there and share the pain and grief of Ukrainian people. I'm practically depressed because there's no way It can be stopped by ordinary people right now. But it should be stopped at any cost.

On the other side the people of Russia have no future anymore. The Iron Curtain is almost here. Most foreign companies are leaving the country. All financial transactions with the west have virtually stopped. It is worth noting that the whole IT sector and game development cannot exist without a global market. So my profession is destroyed. The government ignores the voices of the opposition and people, who are against this war. It constantly arrests protesters and passes dozens of repressive laws. Today you can get up to three years in prison for the slogan "Stop the war" or Or if you call the events taking place a "war". And up to 15 years in prison if you will repost any video containing any information about it. Unfortunately, more that 50% of Russians are under heavy propaganda. They don’t know and don’t want to know what is happening, thus supporting this terrible “special operation”. Lastly there is a pretty high chance that Internet access here will be completely banned here in the coming months. It's all so crazy that I feel like it's just a nightmare and I need to wake up. But I should point out that none of these compare to the horrors of war.

So, how will this affect the development of the game? I am pretty sure that the February payment from Steam was the last one, seeing how events are unfolding. Because of this I will need to start looking for a job with the possibility of moving to another country. However I will continue to work on the game part-time to the best of my ability.

This is all I want to say, now let’s talk about changes.

## New features and changes

I’ve renamed the game. Initially it was named after a Russian meme and it was a part of the game's marketing strategy and story. But it isn't funny anymore, especially after recent events, and it will only work against the game in the coming years. Also, the Russian space program will certainly come to an end in the near future. There will be no story about it anymore. So I decided to return the original name of the game — “**Rocket Science**''. The theme of the game will remain the same, but I will revise the concept of the story I had originally planned to make. I hope this will not upset players who have already purchased the game.

As for the update itself, I’ve added several things.

## Contracts

Remember you had a non-interactive list of goals in the control center? Now it was replaced with a list of interactive contracts. You can accept up to three contracts and perform them in any order. The goals in this list are almost the same as before, but I will start reworking them and adding a new one in the following updates.

![](https://clan.akamai.steamstatic.com/images//34094219/5ede82cf6286538bf16b50c86381fa60e86e57e1.png)
_This is a really good starting point and a bit more content, than before_

![](https://clan.akamai.steamstatic.com/images//34094219/c0fd80fde9f7ca8666631d4fb11f82d52f418de5.png)
_The contracts you've accepted will be displayed at the top of the screen_

**Note:** accepted contracts and statistics collection will be paused if you start a tutorial at the same time.

## Extended tutorial

I’ve added a section with extended training. You can perform interactive tutorials from it at any time. There is only one new tutorial right now. It requires a huge amount of work to add them, but it is very important for new players, who have never played KSP or similar games. So I will try to add at least one new tutorial each new update.

![](https://clan.akamai.steamstatic.com/images//34094219/f3bb241855d7d82eada980d2dd619ac35ca86fbe.png)

## Statistics

Per-save stats are available in the control center now. I am tracking the most basic things like the number of launched spacecrafts, planets that were visited by the player and speed and distance records. This will be the basis for the future achievements. If you have any proposals about stats you want to see, please leave them below.

![](https://clan.akamai.steamstatic.com/images//34094219/49e9c936ad3b641fa9387ec6586d17154dd280f2.png)

Note, that contracts, extended training and statistics were added into the control center UI.

## Instrument panels

I’ve replaced the stats panel under Navball with separate instruments that can be hidden on a per spacecraft basis. All rockets still have all instruments for now, but they will be moved to separate rocket parts in the future update.

![](https://clan.akamai.steamstatic.com/images//34094219/8954f59319f03b3fe8598a8d4854bddf91a6ba0b.png)
_I am planning to add more functions to each instrument panel soon_

Update includes a bunch of smaller changes and fixes as always. You can find them below. I planned to add more contracts and at least two more new tutorials in this update, but lost two weeks because of recent events. And I don't even know if I will have access to the internet next week. So, here is the update and I hope you will like it. Please report any bugs or issues if you'll find them.

Thank you and see you in the next one.

---

## Release notes v0.15.0

### Features:

- added two new tabs into control center UI: "contracts" and "extended training";
- added save stats;
- reworked rocket stats UI during the flight;
- reworked maneuver panel UI;
- added target panel when rocket has target;
- added 13 interactive contracts;
- added one new extended training tutorial.

### Changes:

- game was renamed, now it called "Rocket Science";
- vessels and probe cores will be always on top in the spacecraft list in the control center;
- improved sprite resolution for some UI elements;
- camera will get spacecraft and its parent body in focus when selecting spacecraft in the control center;
- you can set spacecraft as target by clicking on it and holding ALT (previously it worked only when clicking on marker);
- you can interrupt any tutorial at any moment;
- added several more steps to the base tutorial, updated some steps to match the gane state.  

### Fixes:

- when you open the map when inspecting any building in the spaceport, camera transition is bugged, also building UI stays on the screen;
- sometimes exception appeared when opening and closing ruins UI several times;
- sometimes navball markers are misaligned;
- sometimes huge drop in perfomance appears on rocket launch.
