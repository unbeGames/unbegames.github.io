---
author: Arugin
title: Обновление v0.10.1 «Добро пожаловать в Мастерскую»
description: Единственное ограничение на то, что вы можете сделать — это то, что вы можете себе представить
date: 2020-12-24 20:00:00 +0300
categories: [Rocket Science, Обновление]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/eaa4e8cdd3571466cbb7889d2761cdcea877a079_400x225.png
game: Rocket Science
---
Это обновление добавляет одну из главных опор хорошего космического симулятора: поддержку модов. На данном этапе игра будет поддерживать два типа модов: объекты поверхности и локализации. Детали ракет, шаринг ракет, настраиваемые небесные тела и другие типы появятся позже.

Процесс создания и настройки модов доступен в игре, поэтому нет никакой необходимости запускать какие-либо внешние приложения (кроме программного обеспечения для создания моделей и текстур).

![](https://clan.akamai.steamstatic.com/images//34094219/87bd22f960b28313c7e5075edb7652dc1c95684b.png)

Я создал довольно подробное [руководство](https://steamcommunity.com/sharedfiles/filedetails/?id=2326439478) о модах с большим количеством примеров и скриншотов, и, если вы никогда не создавали модов, но всегда хотели, то это ваш шанс погрузиться в этот процесс с головой. Гайд пока на английском, но рано или поздно я его переведу. Но там достаточно только изображений, чтобы во всем сориентироваться.

Вполнее закономерно было дать возможность не только делать моды для себя, но и предложить установить их другим игрокам. [Мастерская Стима](https://steamcommunity.com/app/890520/workshop/?snr=2_groups_partnerevents_) как раз позволяет выкладывать свои моды для сообщества и скачивать чужие. Достаточно просто нажать '+ Подписаться' и понравившийся мод станет доступен в игре.

![](https://clan.akamai.steamstatic.com/images//34094219/ee6549df3a8ff57d26064e6d806addcffa6a03c6.png)

Сейчас опубликован только один мод, но в ближайшем будущем появятся еще (но это неточно).

## Карта солнечной системы

Есть и другие изменения помимо модов. Карта Солнечной системы была изрядно усовершенствована. Прежде всего, в нее добавлено 166 новых небесных тел, из которых 6 - это карликовые планеты, а остальные - отсутствующие спутники планет.

![](https://media3.giphy.com/media/VSOwiydleU8SxF0vhX/giphy.gif)

Карта дает гораздо больше информации и поддерживает не только узлы орбиты, но и космические аппараты, небесные тела и наземные объекты.

Если под курсором находится более 1 объекта со всплывающей подсказкой, то будет показано до 8 сгруппированных подсказок.

![](https://clan.akamai.steamstatic.com/images//34094219/90d90fe5fcd2964dc526f3dd5c38a1c21d027602.png)

И последнее, но не менее важное: Млечный Путь наконец-то нанесен на карту!

![](https://clan.akamai.steamstatic.com/images//34094219/aa8cf2dbf5c9d5b47b6e274f54f1c6c18fc1f685.png)

## Другие улучшения

Некоторые системы получили существенное перепроектирование внутреннего кода. Я частично описал это в предыдущем посте. Но хочу обратить ваше внимание на несколько ключевых изменений.

Во-первых, ракеты наконец-то могут физически взаимодействовать с ранее запущенными космическими аппаратами, которые приземлились или достигли орбиты. Вы можете угадать, для поддержки какой отсутствующей на данный момент важной детали было сделано это изменение. ;)

Во-вторых, сцена конфигурации модов поверхностных объектов помогла мне выявить и исправить кучу ошибок, которые не могли бы быть исправлены без этого. Например, взрывающиеся в воздухе ракеты в определенных районах Земли и Луны, или огромные артефакты поверхности в некоторых местах.

![](https://clan.akamai.steamstatic.com/images//34094219/07764555e49661ac76d840edcc253811039340ae.png)
_Такого рода артефактов вы больше не встретите_

Последним техническим инструментом, который был добавлен, является система миграции сохранений. Она не только поможет вам избежать сломанных сохранений при каждом новом релизе игры, но и может быть использована для миграции старых модов на новую версию.

Это все для вас на сегодня. Если у вас есть вопросы или комментарии, пожалуйста, оставьте их ниже. До свидания и с наступающим!

## Release notes v0.10.1

### Features:

- added mods support for surface objects and localization;
- added Steam Workshop support;
- added 166 new celestial bodies to the solar system map (6 dwarf planets and moons of giant planets);
- Solar system map improvements:
  - added tooltips for all celestial bodies and spacecrafts with name and useful info;
  - added marks and tooltips for surface objects;
  - several tooltip items will be shown if there is more than one object under the mouse pointer;
  - tooltips are colored the same way as the orbit node under it now;
- added Milky Way;
- improved autocorrection PID controller: it works much more precisely and equally well on rockets of any mass and shape;
- implemented save migration system: no more broken saves on small data format changes!
- added support for ultrawide aspect ratios like 21:9;
- added Japanese, Korean, Simplified Chinese and Traditional Chinese fonts to the game.

### Changes:

- added predicted impact coordinates to the tooltip for impact node;
- remaining rocket parts from previous stage will be moved to the new one during the staging;
- rocket no longer moved into Physics simulation, when you rotate it using direct controls in space;
- added two more save slots;
- increased size of assembly shop;
- changed assembly shop architecture a bit;
- improved performance for rockets with a lot of parts;
- improved performance of noise functions, used during planet generation;
- reduced aliasing on UI icons and small UI elements;
- unify font sizes in most game interfaces;
- applied kerning to fonts;
- improved dropdown visuals;
- added smooth transition when exiting to main menu;
- marker size settings affect all markers on the solar system map now.

### Fixes:

- game stuck when selecting any far planet and then the Sun on the Solar system map;
- huge artefacts on planet surface in areas where fields transition to hills and hills transition to mountains;
- game stuck on spacecraft launch, when previous spacecraft stayed on the launchpad and was manually removed from control center;
- sometimes second launchpad appeared in totally wrong orientation when launching the rocket;
- building and rocket parts outlines sometimes stop working, when you are in the spaceport and at least one rocket is landed on Moon;
- solar system map not properly updated, when time is paused and you have selected another celestial body or spacecraft;
- atmosphere sometimes not switch off, when selecting another planet without atmosphere;
- rocket incorrectly decouples, when the parent rocket is in space and was rotated after the engines are off;
- rocket incorrectly positioned after rotation on 180 degrees in space and turning engines on;
- bad performance in assembly shop for old GPUs;
- rotational period for planets with sync rotation is incorrect;
- height sampling is incorrect in certain areas of the planet, that can lead to rocket explosion in the air or fall through the surface;
- orientation of most planets and moons except Earth is incorrect;
- light leaks on certain sun angles in the assembly shop;
- exception in the console, if one of the rocket parts was destroyed during the flight at the distance around 1000 km from the launch pad;
- parachute sometimes breaks when deployed on low altitude, even if the speed was acceptable;
- missing localization of force and duration units in the engine module window.
