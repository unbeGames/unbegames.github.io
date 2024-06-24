---
author: Arugin
title: Обновление v0.7.8 «Восстановление контроля»
description: Лучше поздно, чем поздно
date: 2020-03-12 22:00:00 +0300
categories: [Rocket Science, Обновление]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images/34094219/dccb450b212dd3502ab5bf66d4e0bddd56773baa_400x225.jpg
game: Rocket Science
---
Привет, друзья.

Это должен был быть небольшой патч, который я планировал выпустить еще на прошлой неделе, но некоторые изменения игры требовали реализации недостающих функций, некоторые новые функции добавляли пачку багов на исправление, некоторые исправленные баги показывали, что в игру нужно внести еще немного изменений, и так далее. Я даже и не заметил, как небольшой патч внезапно превратился в полноценное обновление.

Итак, я начал разбираться с наиболее распространенной жалобой: ракетами управлять сложно, особенно в нижних слоях атмосферы. Гиродины в одиночку не могли справиться с этой задачей. Поэтому мне нужно было реализовать управление вектором тяги (УВТ) для двигателей. В то время как менять наклон сопла двигателя достаточно просто, проблемы стали возникать, когда я попытался добавить УВТ в систему авто стабилизации космического корабля. Все дело в том, что момент силы, генерируемый при использовании УВТ гораздо больше, чем момент силы гиродинов. И он зависит не только от тяги двигателя и наклона сопла, но и от позиции двигателя относительно центра масс корабля. Таким образом я провел несколько дней, пытаясь сделать систему авто стабилизации отзывчивой, но чтобы ее не раскачивало из стороны в сторону и чтобы она не промахивалась мимо цели. Только после того, как я стал рассчитывать все возможные моменты силы, которые двигатели могли сгенерировать, я начал отправлять корректные значения в ПИД-регуляторы, которые использует система авто стабилизации, и космический корабль стал более-менее стабильным в полете. В результате, вы можете начать делать гравитационный маневр практически в любой момент при наличии достаточно количества двигателей с УВТ и если они правильно расположены на космическом корабле.

![](https://media.giphy.com/media/Jn3zfikEEoLqn0gc5t/giphy.gif)
_Такой поворот и стабилизация после него были в принципе невозможны без TVC_

После этого немедленно возникла вторая проблема. Из-за того, каким образом камера привязана к ракете, и так как в полете нет никаких других ориентиров, кроме самого корабля, возникает иллюзия, будто бы центр масс корабля находится в точке фокуса камеры. С учетом того, что ракета сейчас поворачивается достаточно быстро, на это больно смотреть. Таким образом, мне пришлось переписать систему наведения камеры и теперь она по умолчанию фокусируется на центре масс космического корабля. У вас также будет возможность переместить фокус на любую деталь или смещать его вдоль ракеты.

![](https://media.giphy.com/media/W3TM7VyirO371MxQdF/giphy.gif)
_Фокус камеры направлен на верхнюю часть движка и создается иллюзия, что центр масс расположен там же_

Я внес в игру еще множество небольших изменений и исправлений (например, метки вектора скорости и ориентации, о да!), но вы можете почитать об этом в списке изменений ниже. Хочу только отметить, что я старался не вносить в игру таких изменений, которые сломали бы сохраненные игры, поэтому они должны работать. Но все космические корабли, которые вы создали ранее, не получат новых функций, таких как УВТ или новые параметры системы авто стабилизации. Поэтому будет лучше собрать новые. Также некоторые добавленные горячие клавиши могут не работать, поэтому стоит проверить настройки управления или просто сбросить их на значения по умолчанию.

Теперь я хочу немного рассказать вам о будущих планах. Следующие наиболее важные функции, которых сейчас не хватает в игре, это: посадка на Луну, улучшение системы орбит, планировщик маневров и инструменты симметрии для сборки ракеты. Как я говорил ранее, Луна уже практически готова, мне нужно только исправить пачку багов и подобрать текстуры ее поверхности. С другими системами всё чуть сложнее — это достаточно большие изменения. Мне также нужно еще переписать математическую симуляцию (когда космический корабль находится на орбите и его двигатели выключены), потому что я ее реализовал больше года назад и она плохо поддерживает некоторые новые системы, которые я добавил позднее (например, электричество или проверку столкновения корабля с поверхностью планеты). Поэтому, у меня пока нет примерных сроков следующего обновления, но я надеюсь, что оно выйдет в Апреле и будет действительно большим.

На этом пока всё, надеюсь вам понравится это обновление!

## v0.7.8 release notes

### Features:

- added engine trust vector control for all engines except "Zarya-352" Liquid Fuel Engine;
- autocorrection system uses engines to turn spacecraft if TVC is available;
- added thrust limiter to engine window (previously it was just throttle with wrong name);
- added velocity and orientation markers on navball;
- you can remove parts using **Delete** hotkey in Assembly Shop;
- you can toggle auto stabilization using **T** hotkey;
- you can switch camera focus to any rocket part in the flight using **ALT + left mouse button click**;
- you can move camera along spacecraft using **ALT + mouse wheel**;
- you can reset camera focus to default position using **ALT + C**;
- the Moon can be seeing from the flight camera now (but it still not reachable yet :/ );
- added "remove spacecraft" and "enter into flight" buttons to the list of spacecrafts in the Control Center;
- new part category "adapters" in assembly shop;
- new connector type "rectangle".  

### New parts:

- basic fin;
- advanced nose cone;
- adapter 1.2m radius to 0.55m;
- adapter 0.35m radius to 0.55m;

### Changes:

- flight camera will focus at spacecraft's center of mass instead of command pod by default;
- to be consistent with the flight mode, hotkeys in Assembly Shop were changed:
- \- focusing camera on the part is **ALT + click** now instead of SHIFT + click;
- \- moving along the building is **ALT + mouse wheel**;
- some parts was moved from decouplers category to adapters;
- improved connector/slot selection during part attaching in assembly shop.

### Fixes:

- planet generation memory leak when orbiting around Earth a long time with in the time warp;
- one of the fuel tanks has incorrect connection position, which lead to rocket flip over;
- one-socket part can be incorrectly connected to triple connector part;
- rocket part outlines stays when switching to map;
- lightning artefacts on Earth on map view;
- parts sometimes stay connected to the rocket after removing;
- new part is not selected from list, when another part was detached from rocket and stayed selected;
- bottom visual slots on side fuel tank are missing;
- decoupler and adapter attached to command pod have wrong alighment;
- engine turn on after changing throttle, even if it was manually turned off;
- missing alpha gradients from orbits;
- spaceport camera stop rendering if selected spacecraft was removed in control center;
- selected value in dropdown sometimes not localized properly;
- wrong engine name in the tutorial;
- click on detached part opens part's window;
- close button not worked in spacecraft stats window.  

### Known issues:

- sometimes rocket receives huge side force on launch (need more evidence to solve this one). If you encounter this, you can try go to Control Center and remove any bugged spacecrafts;
- it is impossible to reattach part with socket from one connector to another (you can detach part and place it before attaching to another one as a workaround).
