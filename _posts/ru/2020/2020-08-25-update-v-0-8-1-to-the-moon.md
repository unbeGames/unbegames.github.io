---
author: Arugin
title: Обновление v0.8.1 "На Луну!"
description: Один тяжелый апдейт для разработчика, но гигантский прыжок для качества игры
date: 2020-08-25 20:00:00 +0300
categories: [Rocket Science, Обновление]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/3371d8e8989ace69840b7e58094650d90ef6463b_400x225.png
game: Rocket Science
---
Наконец-то обновление прибыло. Я даже не мог себе представить, что его разработка займет столько времени, но я гораздо больше доволен теперь состоянием игры, чем во время первого релиза. Давайте поговорим о новых функциях и изменениях, которые внесет это обновление.

## Луна и межпланетные полеты

Новое небесное тело для исследование и новые вызовы, которые нужно будет преодолеть. В то время как первая стабильная орбита вокруг Луны и первое столкновение с ее (тогда несуществующей) поверхностью были уже достигнуты [Адмиралом Андре](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DyQRyFnkvOJY) в феврале, посадка, а тем более возврат на Землю после этого, выглядит сейчас как игра в хардмоде с включенным режимом Железного Человека. В основном потому, что в игре все еще недостаточно деталей ракет и необходимых инструментов, чтобы можно было точно сконфигурировать космический корабль для такой миссии. Также у вас нет возможности сохраниться во время полета и, при необходимости, загрузить это сохранение. Несмотря на то, что такое положение вещей дарит новые эмоции, становится очень грустно, когда ваш корабль взрывается во время посадки из-за какого-то неожиданного бага. Поэтому я добавлю возможность сохранять игру во время полета и откатывать состояние игры на тот момент в одном из будущих обновлений. Больше деталей и хорошие инструменты строительства ракеты тоже в ближайших планах.

![](https://media3.giphy.com/media/jql9taPrNPxJUgFisM/giphy.gif)
_На высокой орбите Луны_

![](https://clan.akamai.steamstatic.com/images//34094219/e6a628917cab7ac142084622cd4bf98bd7d9e1d3.png)
_Один из многочисленных кратеров Луны_

## Переработка системы орбит и планировщик маневров

У системы орбит сейчас очень хороший фундамент. Я очень доволен текущей производительностью и качеством этой системы. Планировщик маневров построен на ее основе и несмотря на текущие шероховатости, это отличное и очень важное дополнение игры. В нем сейчас отсутствуют некоторые функции, такие как маркеры восходящего и нисходящего узлов, позиции тел во время энкаунтеров, система целей и прочее. Но всё это будет достаточно легко добавить в будущем. Кстати говоря, вы можете использовать планировщик маневров прямо в центре управления полетами, не переходя в режим полета. Вы можете всегда поставить игру на паузу (по умолчанию клавиша ~), что поможет во время планирования полетов в ЦУПе.

![](https://media2.giphy.com/media/jTwOZeCgWdyI2Bzitg/giphy.gif)

## Улучшенное взаимодействие между космическим кораблем и миром

Ракеты больше не взрываются в десяти метрах над землей. Анимация деталей, как раскрытие солнечной панели, например, будет изменять физическую форму корабля и параметры детали. Детали ракет могут теперь взрываться при столкновении друг с другом во время полета, если сила столкновения превысит ударную устойчивость детали.

![](https://media3.giphy.com/media/MdM9qiPMhYVoZKAsk5/giphy.gif)

## Улучшенная аэродинамика

Игра рассчитывает до трех векторов силы трения для каждой детали и применяет их к физической форме, вместо одного комбинированного вектора, который применялся к центру масс детали. В результате, ракеты, состоящие из небольшого количества деталей будут гораздо более подвержены аэродинамическим силам, чем ранее.

![](https://media0.giphy.com/media/KCMH1QTjDshPXuqj9g/giphy.gif)
_В предыдущей версии игры, командный модуль продолжил бы падать без изменения ориентации_


## Улучшения конструирования ракет

Я не успел сильно погрузиться в эту составляющую игры. Тем не менее, я исправил два критических бага во время сборки, которые приводили к подвисанию сборочного цеха. Также я изменил способ рейкастинга сокетов и коннекторов, что должно чуть улучшить присоединение деталей друг к другу.

## Новые детали и изменения в них

Парашют и посадочные опоры были своего рода вызовом, потому что у них есть внутреннее состояние и анимация, они должны реагировать на мир вокруг и быть в курсе состояния космического корабля, к которому присоединены. Но не смотря на все проблемы, они теперь добавлены в игру. Другая важная деталь — новый беспилотный модуль, который гораздо легче командного модуля “Высь”, но у которого отсутствует гиродин и очень маленький аккумулятор. Вместе с этим модулем в игру был добавлен новый прямоугольный тип сокета, который очень неплохо комбинируется с уже существующими коннекторами. И наконец, масса всех пустых топливных баков была уменьшена примерно на 15%, что позволит вам выводить больше полезной массы на орбиту.

![](https://media2.giphy.com/media/XEI3Xk8bCdQkGer9DP/giphy.gif)

## Расширенный саундтрек

В игру были добавлены 11 новых композиций и новая музыкальная система, которая будет отслеживать состояние и позицию космического корабля и менять треки в зависимости от этого. Новые треки были также добавлены в “Как тебе такое, Илон Маск? Саундтрек”, таким образом, все владельцы этого пакета, бесплатно и автоматически их получат.

Это обновление добавляет большое количество других исправлений, изменений и улучшений (и новых багов тоже =/). Полный список изменений опубликован ниже. Но сейчас я хотел бы поговорить о том, что дальше. Самая слабая часть игры на данный момент — это сборка ракеты. Как я уже ранее упомянул, в ней отсутствует множество важных инструментов и функций. Также необходимо переписать некоторые части всей системы сборки ракеты, чтобы сделать возможным добавление таких функций, как симметрия или сохранение частей сборок. У этих задач будет наивысший приоритет и я сосредоточусь на них следующий месяц или два. До этого я скорее всего выпущу небольшое обновление, которое добавит в игру аналитику, чтобы я мог видеть, какие детали ракет используются чаще других, а какие совсем не популярны и никогда не устанавливались на корабль.

![](https://clan.akamai.steamstatic.com/images//34094219/a9c665d2a55c2b8d081bb3f2b216c735a3a1dd1c.png)

_Во время подготовки этого обновления пострадало несколько ракет_

На сегодня всё. **Спасибо вам всем за вашу поддержку, фидбэк и отзывы!** Выпуск этого обновления без вас бы не состоялся. Увидимся в следующем.

P.S. Если у вас появятся какие-либо проблемы с этим обновлением, попытайтесь вначале проверить целостность игровых файлов. Иногда Стим почему-то не докачивает файл или два. Также несмотря на то, что это обновление совместимо со старыми сохранениями игры, изменившиеся детали ракет никак не отразятся на уже собранных ракетах. Если с сохраненной игрой возникнут проблемы, попробуйте начать новую игру.

P.P.S. Список изменений не успел перевести, но думаю, это не должно стать проблемой.

## Release notes v0.8.1

### Features:

- added support for interplanetary flight;
- added the Moon;
- implemented maneuver planner and encounters prediction;
- added 11 new tracks and improved playlist selection during flight;
- improved aerodynamics for rockets with small number of parts;
- added proper support for parabolic and hyperbolic orbits;
- game is now supporting up to 500 orbits rendering at the same time without dropping fps on the average PC;
- new orbit nodes: impact, encounter, escape;
- approach time to orbit nodes and maneuvers is showing now, when hovering mouse over them;
- added proper environment shadows during flight;
- new 16-bit temperature map for Earth, it will make planet texturing more smooth and reduce noisiness,
- new high quality color and normal maps for Moon on the Solar System map;
- added automatic camera exposure control and adjusted values during flight and on the Solar System map;
- added sun flares;
- updated main menu scene;
- animated rocket parts not only change visual appearance, but affect physics shape and rocket parameters;
- new autostabilization mode: maneuver;
- new socket types: rectangle, dualhex.

### New parts:

- Frontal Parachute is working now! (kinda of)
- "Feather" Landing Strut;
- Standard Reaction Wheel;
- Payload Fairing 3x7;
- Micro Decoupler with 3+2 variants
- two more variants of "Seeker" Decoupler.

### Part changes:

- "Vys" Command Module:
  - reduced max torque from 20 kN to 18 kN;
  - reduced consumed power from 0.53 to 0.48;
  - increased mass from 740 kg to 850 kg;
  - reduced electric charge amoun from 135 to 120;
- Small Reaction Wheel: increased max torque from 4.5kN to 6kN and consumed power from 0.1 to 0.14;
- reduced dry mass of all fuel tanks by ~15%;
- changed visual appearance of Adapter 1.2-0.55 C-4 to make the compartibility with "Clicker" Longitudinal Decoupler more obviuos;
- added single socket on top of the "Sputnik-2" Probe Core;
- "Energia-C8.95" Liquid Fuel Engine increased thrust and fuel consumption a bit (impulse didn't change).

### Settings:

- added orbit markers size configuration;
- added scroll sensitivity for manever planner handle;
- new hotkey G - to toggle landing gear;
- press "Delete" while on map view to remove selected maneuver node.

### Changes:

- changed collision detection method, it will no longer produce phantom colissions, but sometimes may miss collision on fast moving objects;
- rocket parts could explode on collision with each other;
- improved attachment search while assembling the rocket;
- spacecrafts with applied torque will continue infinitely rotate in space (if auto stabilization is turned off);
- rocket consumes correct amount of electric charge when it is in Math simulation;
- spacecrafts position is checking against planet heightmap in Math simulation;
- increased max possible angular speed of all bodies;
- orbit markers and text have the same size no matter how far they are from the camera;
- antialiasing is now applied to orbits;
- improved orbit colors and rendering;
- only section of orbit is generated and rendered in some cases (like when part of the orbit is bellow the surface);
- improved perfomance in spaceport;
- sun is more yellowish now in the map view;
- autocorrection in Math simulation is more precise;
- last activated stage in flight will be saved with spacecraft;
- reordering action groups shift folowing groups instead of swap;
- spaceport authorities have finally continued construction of launchpad!

### Fixes:

- rockets explode in air far from ground;
- stage activation breaks after some rocket stages was destroyed by impact;
- rocket can not be crashed onto launchpad (fixed for most of launchpad, except the exact start point to avoid rocket exploding on engine start);
- seams on planet, visible from certain distance and light angles;
- higher level of detail of planet surface sometimes doesn't load;
- when rocket flying on hyperbolic orbit, it is going into abyss after some time;
- game freezes when entering atmoshpere with huge time warp multipler;
- decoupled rocket part moves strangly to the sides sometimes;
- rocket fall through the surface of planet and continue flying sometimes;
- different artefacts on planet in flight mode on very high orbit;
- incorrect normals in map view on all planets;
- grid-like artefacts on oceans on Earth in the map view;
- ocean flickers a bit when rocket is falling down;
- rocket shadows not changing, when changing rockets in assembly shop;
- various light leaks in spaceport;
- broken shadows in spaceport during the summer;
- vcam popping on when changing view from spaceport to map;
- you can attach three "Raduga-52" engines to one fuel tank;
- different issues with action groups moving and updating;
- wrong spacecraft velocity after you reached speed of 5km/sec in the atmosphere;
- spacecraft flying sideways relative the ground under some conditions (again);
- Assembly Shop completely broken, when deleting rocket part using Delete key and not detaching it from the rocket before that;
- sometimes parts do not detach from the rocket in the Assembly Shop;
- part slots / connectors incorrectly highlighting in Assembly Shop or flight;
- orbit node text sometimes clipped by the planet.

### Known issues:

- incorrect rocket palcement on the launchpad during launch;
- part of the rocket explode below the surface, if the command module was destroyed.

## 26.08.2020

### Fixes:

- Fixed crash during roclet construction
- Fixed buildings not highlighting when hovering over them
