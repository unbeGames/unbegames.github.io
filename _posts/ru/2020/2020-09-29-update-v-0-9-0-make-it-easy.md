---
author: Arugin
title: Обновление v0.9.0 «Легче легкого»
description: Лучше поздно, чем поздно, часть II
date: 2020-09-29 20:00:00 +0300
categories: [Rocket Science, Обновление]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/70de82fad569617ce91b3855703ccc2558fb1675_400x225.png
game: Rocket Science
---
Всем привет.

Сегодняшний апдейт — это первый шаг к превращению сборки ракеты в простой и приятный процесс. Я также отрефакторил некоторые части игры, что позволило реализовать новые функции, которые невозможно было бы сделать ранее. Ниже я остановлюсь на наиболее значимых нововведениях, а полный список изменений будет в конце сообщения.

## Сборочный цех

Да, не прошло и полгода (а нет, прошло), как вы наконец-то можете собирать ракеты, используя симметрию! Так как детали могут соединяться друг с другом только с помощью аттачментов, симметрия в игре работает немного по-другому, по сравнению с другими играми.

В первую очередь стоит обратить внимание на панель управления симметрией, где вы можете изменить счетчика симметрии разными способами.

![](https://media0.giphy.com/media/2dpBUvEiyg0WUeOjSH/giphy.gif)  
_Можно также нажать **X** и **Shift-X**, чтобы сделать то же самое_

Радиальная симметрия поддерживается не только на боковых аттачментах:

![](https://media1.giphy.com/media/XfGDb2eTXNr2aaGqhc/giphy.gif)

но также на одном аттачменте с несколькими слотами.

![](https://media1.giphy.com/media/Rm2SewNIllsPpe4XvR/giphy.gif)

Поддерживаются в том числе и более сложные случаи:

![](https://media1.giphy.com/media/D1hV7v7tI4zglRhUQx/giphy.gif)

И наконец, можно менять счетчик симметрии перед соединением деталей:

![](https://media2.giphy.com/media/JYXN0dEQnCTMxgkdtT/giphy.gif)

Но у этой системы есть несколько ограничений. Если счетчик симметрии не совпадает с доступными аттачментами или один из них уже занят присоединенной деталью, симметрия не сработает. Стоит также отметить, что симметрия вычисляется относительно корневой детали. Корневая деталь - это первая деталь ракеты. Так как в игре сейчас нет ограничений на то, какая деталь может быть первой, симметрия может выдать некорректный результат, если первой деталью будет, например, посадочная опора.

В игре сейчас нет симметричного удаления деталей. Это чуть более сложная задача, так как я не храню никакой информации о том, какие детали были присоединены к ракете с использованием симметрии. Так что перед удалением придется тоже устанавливать счетчик симметрии и система будет удалять все детали, подходящие под него, хотя это может быть не совсем тем, что вы хотели сделать. Мне нужно чуть больше поразмышлять над этим и провести больше тестов. перед тем, как релизить эту функцию.

В этом апдейте появилась возможность копирования деталей ракет. Нажмите **Shift** и кликните или потяните любую деталь и она будет скопирована вместе со всеми присоединенными к ней деталями.

![](https://media0.giphy.com/media/VXkseYyuyxi5EZLXHq/giphy.gif)

Я также добавил переключатель, с помощью которого можно отобразить центр масс ракеты, улучшил панель инструментов и исправил очередную пачку багов сборки (в особенности с командами отменить/повторить).

## Полеты

После очередного переписывания внутренностей игры, в системе симуляции космических кораблей стала доступна информация о позиции и ориентации каждой детали относительно ракеты. Это позволило мне реализовать несколько функций, которые невозможно было бы сделать раньше.

В первую очередь я могу корректно рассчитывать размеры ракеты. Это значит. что космические корабли в подавляющем большинстве случаев будут точно размещаться на стартовой площадке (больше никаких зависаний в воздухе).

Во-вторых, так как в симуляции доступна ориентация солнечных панелей, производство электроэнергии теперь зависит от угла между панелью и Солнцем. Солнечные панели также больше не производят энергию, когда Солнце перекрыто планетой.

Наконец, головной обтекатель и грузовые модули теперь действительно защищают помещенные в них детали от атмосферного сопротивления. Это достаточно большое изменение, потому что благодаря ему, целый класс деталей становится полезным во время сборки ракеты.

И последнее. У командных модулей теперь может быть любая ориентация, относительно ракеты. Горизонт и маркеры скорости будут ориентированы относительно активного командного модуля, а не относительно вертикали, как раньше.

Последнее изменение также имеет большое значение, потому что вы, наконец, можете выводить спутники на орбиту с помощью ракеты-носителя.

![](https://media3.giphy.com/media/LoZM2NGaa8yxN5BIPv/giphy.gif)
_Отстыковка на орбите — одна из самых красивых частей полета_

## Общее

Тут очень много изменений, но я приведу несколько наиболее интересных:

- ракеты в сборочном цехе теперь сортируются по дате изменения, а центре управления полетами — по времени миссии;
- добавлены иконки для кораблей, беспилотных модулей и космического мусора в центре управления полетов и на карте Солнечной системы. Я также собираюсь добавить фильтры по типам космических кораблей в следующем обновлении, чтобы вы могли по желанию скрыть космический мусор;
- добавлены четыре новые детали и изменена форма и параметры некоторых топливных баков и адаптеров.

И последняя вещь, которую я хочу упомянуть касается размера игры на жестком диске. Раньше она занимала практически 8 Гб и мне удалось уменьшить ее размер на 2 Гб, используя сжатие для карт высот Земли и Луны. Если после обновления размер игры не изменится, то я рекомендую ее переустановить (потому что Стим иногда не удаляет ненужные файлы).

Вам может понадобится перезапустить Steam после того, как вы скачаете обновление. Если по какой-то причине игра не запустится или будет странно себя вести после этого, попробуйте проверить целостность игровых файлов.

На этом всё, надеюсь вам понравится это обновление.

P.S. **Примечание**: сохранения из предыдущих версий игры не совместимы с текущей версией. Я подумаю о добавлении инструмента миграции сохранений в следующем обновлении.

## Release notes v0.9.0

### Features:

- reduced build size by 2 GB by applying compression for planet heightmaps;
- \[Assembly shop\] symmetry tools are available during rocket construction;
- \[Assembly shop\] you can duplicate part or part group using hotkey;
- \[Assembly shop\] added toggle to show rocket center of mass;
- \[Assembly shop\] undo and redo now supports rocket part rotations;
- \[Assembly shop\] spacecraft will keep rotation that was set for it (after exiting an edit mode and during the flight);
- angular drag is now calculated and applied to rockets flying in the atmosphere;
- payload fairing and cargo modules start to actually protect the parts placed into them from the atmospheric drag;
- spacecrafts support any command pod rotation relative to the rocket and will appropriately orient navball, markers and direct controls;
- added icons for ships, probes and debris in the Control Center and for the Solar system map;
- total playtime is recorded into save slot (not counting loading time).

### New parts:

- Adapter 1.2-0.35;
- Series S Fuel Tank;
- Spherical Fuel Tank;
- L-shaped Block.

### Part changes:

- increased radius of Payload Fairing;
- reduced energy capcity for probe core "Sputnik-2" from 42 to 36;
- decreased diameter of "FT-800 Fuel Tank" from, 1.2m to 0.7m and adjusted its paramters;
- changed shape of Adapter 1.2-H and renamed to Adapter 0.35-0.6-H;
- added porthole to "Vys" Command Module;
- decreased length of "Adapter 0.35-0.55";
- changed shape of "Basic adapter" and added 3 more connection variants for it.

### Settings:

- \[Assembly shop\] hold Shift and click or drag rocket part to duplicate part and all connected to it parts;
- \[Assembly shop\] Press Ctrl+S to save the rocket;
- \[Assembly shop\] Press X to cycle through symmetry count;
- \[Assembly shop\] Press Shift+X to cycle through symmetry count backwards;

### Changes:

- changed the way rocket bounds is calculated, as a result fixed floating rockets over launchpad before launch;
- solar panels don't produce energy, while Sun is occluded by planet;
- solar panels energy production depends on angle between panel and Sun;
- added status, occlusion and production values into solar panel control window;
- improved parts attachment positioning for all the parts with only one attachment during rocket assembly;
- \[Assembly shop\] rocket parts keep pivot during rotation;
- \[Assembly shop\] added undo and redo buttons on UI;
- \[Assembly shop\] added sorting by update time for rockets in the Assembly Shop (last updated goes first);
- \[Assembly shop\] changed spacecraft orientation, so the command pod porthole is turned up;
- mission time for spacecraft is now calculated since liftoff;
- \[Control Center\] added sorting by mission time for spacecrafts (newest spacecrafts go first);
- improved performance of drag calculations (5-10x speedup);
- decoupler no longer disappears after use;
- decoupler is applying force to original rocket too during activation;
- reduced memory consumption, when there are a lot of rockets in the Math simulation;
- probe cores constantly consume electric charge, they will not recieve any control commands without it;
- rockets without command pod or probe core (for example, debris) could not receive any commands or open part windows.

### Fixes:

- reaction wheels not working if the spacecraft was decoupled from other spacecraft;
- rocket sometimes fall through Earth surface after collision on high speed;
- a lot of issues, when using "Undo" and "Redo" in the Assembly shop;
- exception thrown, if the rocket on the launchpad was removed through Control Center, and the next one was launched;
- some elliptic orbits flicker, when time lapse is enabled;
- rocket constantly move between Physics and Math world, if it landed and one of the rocket parts was destroyed at the same time;
- spacecraft icon sometimes is not shown on the map;
- rockets from previous save appear in the new save, if save slot was not cleared before starting new game;
- sometimes game freezes, when trying to launch spacecraft with a lot of parts.
