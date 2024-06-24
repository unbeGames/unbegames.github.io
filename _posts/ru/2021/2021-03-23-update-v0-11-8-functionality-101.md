---
author: Arugin
title: Update v0.11.8 "Functionality 101"
description: Становясь лучше
date: 2021-03-23 20:00:00 +0300
categories: [Rocket Science, Обновление]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/4113a6c154cfda6a0cdf4b85131019760078e3a8_400x225.png
game: Rocket Science
---
Всем привет! Пришло время для очередного обновления! Это самое большое обновление с момента выхода игры по количеству исправлений и нововведений. Предлагаю не тратить ни секунды впустую и перейти сразу делу.

Обратите внимание на изменение горячих клавиш в списке изменений ниже!

## Сборки

Сохраните группу деталей в виде сборки и переиспользуйте ее позже при постройке нового космического аппарата.

![](https://media3.giphy.com/media/vzfctx93QuwvjRKYQO/giphy.gif)
_Сохраните_

![](https://media1.giphy.com/media/pXEbHWgu02bWFsGRbd/giphy.gif)
_Используйте_

## Вращение деталей

Используйте манипулятор вращения для вращения групп деталей и уже прикрепленных деталей в соответствии с правилами слотов и коннекторов.

![](https://media4.giphy.com/media/EFalTl383q8n97ybRt/giphy.gif)
_Вращение всей ракеты_

![](https://media3.giphy.com/media/YzGGJegGCHOrFIf5cY/giphy.gif)
_Вращение присоединенной детали_

![](https://media1.giphy.com/media/V4gxDBiPyZhOqyIBXp/giphy.gif)
_Симметрия при вращении тоже работает_

## Океан

Я разработал новую систему океана. Она включает в себя настоящие волны, пену и меняет цвет поверхности в зависимости от глубины морского дна. Также были включены простые столкновения с поверхностью океана, благодаря чему на нее можно сажать космические корабли. Это временное решение до тех пор, пока не будет реализована корректная физика воды.

![](https://clan.akamai.steamstatic.com/images//34094219/9096dc04ff178a3fa86199cca6c1f8f985b49be4.png)
_Океан до_

![](https://clan.akamai.steamstatic.com/images//34094219/7460472854bb6271fff345425a91f5d65720681e.png)
_Океан после_

![](https://media1.giphy.com/media/UpfvSbpaL2JbCbxH02/giphy.gif)
_Океан в движении_

## Режимы камеры

Добавлены новые режимы камеры во время полета и на карте Солнечной системы.

![](https://media1.giphy.com/media/uDvD8gIAtLLkzZ08lT/giphy.gif)
_Никакого вращения камеры, просто переключение между различными режимами_

## Улучшение текстурирования планет

Я переписал шейдер планеты, чтобы улучшить его производительность. В ходе этого процесса я обнаружил и исправил несколько критических ошибок, что привело к значительным изменениям в том, как планета выглядит на маленьком масштабе.

![](https://clan.akamai.steamstatic.com/images//34094219/8fce0601554c0dc9d1ba4f032a6dee08c0988ffa.png)
_До. Заметен сильный тайлинг_

![](https://clan.akamai.steamstatic.com/images//34094219/b4d6215cae94d1d75777ef630175e24ff1c68fab.png)
_После. Нет тайлинга, значительно улучшилось смешивание текстур_

В случае с Луной же, детализация стала слишком сильной. Я пересмотрю текстурирование Луны и решу, нужны ли какие-либо изменения в другой раз.

![](https://clan.akamai.steamstatic.com/images//34094219/a5c6c130ec41d1bfc5d445b5486c9aa0183b9e7d.png)

## Полеты

Вы можете мгновенно переключаться между космическими кораблями во время полета.

![](https://media2.giphy.com/media/iu4znELEJCZnlkdR5x/giphy.gif)
_Переключение между видимыми космическими кораблями_

![](https://media2.giphy.com/media/LUXqnXH0Jtjc31afJy/giphy.gif)
_Переключение между кораблями с использованием карты_

Вы также можете переключаться между командными модулями, если у вас установлено более одного.

## Редизайн электричества

Электричество было переработано с нуля. Вместо каких-то случайных безразмерных физических единиц используются настоящие физические (ватты — для мощности и джоули — для энергии). Все характеристики деталей, так или иначе использующих электричество, приведены к физически корректным (в некоторой степени).

## Новый тип детали

Добавлен новый тип детали — свет. Такая деталь потребляет энергию и производит фотоны. Она должна улучшить полеты и посадку в темноте. Пока добавлены две подобные детали, в следующих релизах их будет больше.

![](https://media3.giphy.com/media/e0R88sEa7gfX5TEYhX/giphy.gif)
_Да будет свет!_

## Новые детали

Девять новых деталей ракет ждут вас в сборочном цехе!

![](https://clan.akamai.steamstatic.com/images//34094219/76a15b182161314679228b4a0072f451082828b4.png)
_В основном структурные элементы и электричество_

## Горячие клавиши меняются

Изменена горячая клавиша «повторить последнюю выбранную деталь» с **R** на **Q** и горячая клавиша счетчика симметрии с **X** на **C**. Добавлено много новых горячих клавиш и некоторые подсказки кнопок теперь отображают, к каким горячим клавишам они привязаны. Из-за этого пользовательские настройки управления были сброшены на значения по умолчанию.

Вы можете найти полный список изменений ниже. С каждым обновлением игра становится все больше и все сложнее проверить все возможные тестовые случаи, поэтому небольшие баги ожидаемы. Если вы на них наткнетесь — сообщите о них, пожалуйста, на форуме или в Дискорде. Спасибо за то, что играете, и увидимся в следующем обновлении, в котором должна появиться одна известная красная планета.

## Release notes v0.11.8

### Features:

- new ocean system, that includes real waves and foam, also it changes color depending on depth to the sea floor;
- added subassembly support;
- added Grab and Rotate modes to assembly shop;
- added rotation handle that appears in the Rotate mode, when any rocket part was selected;
- you can rotate already attached part relative to its parent respecting socket restrictions, symmetry works for rotation too;
- instant switch between any spacecrafts by double clicking on it during the flight;
- added ability to switch between command modules on the spacecraft if there are more the one (left click on it -> toggle "control from here");
- added 5 camera orientation modes and ability to switch between them;
- added new part type — light;
- added real physical units for energy (Jouel) and power (Watt);
- implemented deep space camera rendering, any solar system object in theory can be seen from anywhere (but they are usually too small);
- improved planet shader visuals and speed;
- added shortcuts labels to most button tooltips;
- default planet body (with no height/texture data) will be loaded, when reaching celestial body, that was not added to the game yet (previously game just crashed);
- enabled simple collisions for water surface (this is a temporary solution until proper water physics will be implemented);  

### New rocket parts:

- Solar Panel GOST 12-12-00-1996;
- "Tesla" Illuminating Device;
- 2239-79 Signal Light Source;
- Conic Fuel Block;
- Hexagonal Prism T100;
- Hexagonal Prism T200;
- Structural Adapter Cube-1.2;
- Structural Adapter 1.2-Module;
- Modular-to-Cubic Adapter.  

### Part changes:

- сompletely redesigned rocket part stats related to electricity;
- increased energy producing area of solar panel 1;
- improved shape of Small Battery;
- lowered center of mass of command 0;
- deprecated part Cubic Rack Adapter;  

### Changes:

- launchpad zone directly under the spacecraft could destroy parts now (previously this feature was intentionally disabled);
- increased minimum scale on solar system map when spacecraft is current camera target;
- added additional time scale step equals to 7 days (may be increased in the future);
- implemented smooth transitions between different time scales;
- navball size on UI now independent from screen resolution;
- when placing first rocket part that has variants, selecting its variants will change already placed part instead of creating the new one;
- improved default orientation of rocket parts on connection to side sockets;
- improved socket selection during part attachment, so it tends to have a smallest angle possible between parts;
- added missing collision parts for different structure parts;
- camera will focus on the first placed part or group of parts in the Assembly shop;
- Rocket list changes:
  - edit button in rocket list was removed from list items;
  - double click on rocket item or click on edit button from actions panel to go into edit mode;
  - press ALT+click on rocket item to rename it;
- you can now rename spacecrafts in the Control Center, by pressing ALT+click on its name;
- solar system map markers are much smoother now and have slight dark outline;
- improved part tooltip alignment — it is now consistent between parts;
- updated tutorial, to reflect recent changes in hotkeys;

### Settings:

- added ocean quality setting into Performance category;
- added default camera orientation mode settings for space flight and Solar system map;
- added maneuver and assembly handles size settings;
- changed Repeat hotkey from **R** to **Q**;
- changed Cycle Symmetry hotkey from **X** to **C**;
- added Reset Symmetry hokey: **Alt+C**;
- added Cycle Camera Orientation hotkey: **V**;
- added Extend/Retract Solar Panels hotkey: **P**;
- added Turn On/Off Lights hotkey: **U**;
- added assembly modes hotkeys: **G** (Grab Mode), **R** (Rotate Mode);

### Fixes:

- rocket part keeps glowing after destruction sometimes;
- on any resolution other than 1080p, spacecraft list looks wrong in the control center;
- failed to launch spacecraft if its name is too long;
- rocket can stuck in one place, if fuel was depleted and there were a lot of engines and fuel tanks in it;
- only first part are correctly aligned to the attachment, if you try to connect group of parts to the rocket;
- exception, when several connected in a row decouplers were decoupled at the same time;
- decoupled part sometimes gets incorrect position;
- rocket with bad orbit breaks the save file;
- when flying straight up from Earth until transitioning from elliptic to hyperbolic orbit, spacecraft appears in the center of sun and game sometimes crashes;
- spacecraft shadows are flickering on high orbit altitudes;
- when passing the Moon SOI Earth atmosphere sometimes appears in the wrong place;
- if you have two payload fairings attached to decoupler 0 and then move the decoupler, part group will always reset its position;
- exception when trying remove part using Delete when it has red outline;
- exception when group of parts was cloned but not placed and Undo was pressed;git;
- stars sometimes disappear when rocket is flying on low orbit;
- sun disk is missing on solar system map and in the start scene;
- shadows are flickering sometimes in assembly shop;
- orbit markers change their brightness depending of sun angle relative to camera;  

### Known issues:

- maneuver planner not correctly finding encounters, when building trajectory from Earth to the outer Planets;
- rotation symmetry not working for the parts, attached to the same attachment;  

## 28.03.2021 - v0.11.9

### Fixes

- solar Panels not working when spacecraft is orbiting around the Sun;
- two suns appear when spacecraft is orbiting around the Sun;
- spacecraft name is not saved when renaming it and then exiting from game;
- sometimes game stuck on starting flihgt;
- sky breaks if you are in spaceport and selecting spacecraft, orbiting another planet and then exiting from map;
- rocket rotating like crazy after changing SOI;
- maneuver panel sometimes doesn't show up after loading flight if orbit already had a maneuver;  

## 02.04.2021 - v0.11.10

### Changes

- Updated "About" window;  

### Fixes

- rare memory leak, when nothing changes on the solar system map;
- potentiial crash when rocket has a lot of solar panels and lights and they were destroyed.
