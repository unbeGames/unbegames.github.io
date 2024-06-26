---
author: Arugin
title: "Дневник разработки: март"
date: 2019-03-31 18:00:00 +0300
categories: [Rocket Science, Дневник разработки]
tags: [rocket science]
description: Орбитальные механики
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/14ed4aa2a72c0aa043463164a92070616a2f46d9.png
game: Rocket Science
---
Привет, друзья.

Сегодня я хочу поговорить об орбитальных механиках и физике ракет в “Rocket Science”. Где-то в середине декабря я пришел к решению, что у игрока не будет прямого управления над ракетой и все миссии будут выполняться через планы полетов (об этом можно прочитать в [январском обновлении](/ru/posts/2019/january-developer-update/)). До этого момента у меня был прототип аркадных полетов в 2.5D, как в тысячах других игр из мобильных сторов, где ты летишь вверх до тех пор, пока не закончится топливо, собирая по пути ресурсы, ремонтные комплекты и уворачиваясь от препятствий. Другими словами, это выглядело примерно так:

![Первый прототип игры Rocket Science](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/df1a14651be0f54b733afb7322adc58d63501e31.png)
_Скриншот прототипа, с которого все началось_

По началу в прототип было относительно весело играть, но со временем, особенно после того, как я реализовал планетарные и атмосферные системы, стало понятно, что эта часть игры не вяжется со всем остальным. К счастью, ко мне пришла та идея о планах полета во время обсуждения данной проблемы в комментариях к [одной из статей](https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fdtf.ru%2Findie%2F34184-kak-ya-na-mars-raketu-otpravlyal) об игре. Идея звучала здорово, но возникало несколько проблем, которые требовали неотложного решения.

- Систему полета нужно будет перенести в полное 3D.
- Из-за этого система сборки ракеты из деталей станет сложнее.
- Физика Unity не будет работать для интерфейса планирования полетов, да и в целом для всей игры.

Формально, первые два пункта были решаемыми, но у меня не было ни малейшей идеи, что делать с физикой. Позвольте мне объяснить, почему вообще было важно. Вот прототип интерфейса планирования полетов:

![Таймлайн](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/4496c88c8083629ca15496d805ef7eac9a13dd47.gif)
_Другой прототип - планирование полетов в виде временной шкалы, как в программах для редактирования видео._

Его можно сравнить с таймлайном, содержащим команды. У вас будет возможность масштабировать время, ускорять его или перемещаться в любую точку таймлайна, чтобы затем добавлять команды (жирные белые вертикальные линии). Когда команда достигает белой стрелки, ракета ее выполняет. Командой может быть любое действие, которое должна выполнить деталь ракеты: включение двигателя, поворот космического корабля или отстыковка пустых баков. Проблема со стандартной физикой в этом случае заключается в том, что она зависит от предыдущего состояния. Это означает, что если, к примеру, вам необходимо прыгнуть на десятую минуту полета, игра должна будет просимулировать все состояние мира в течение 10 минут с шагом в 0.02 секунды. В результате, игра тупо повиснет на несколько секунд даже на самых мощных компьютерах, что абсолютно недопустимо.

![Земля](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/14ed4aa2a72c0aa043463164a92070616a2f46d9.png)
_Вот она наша бледно-голубая точка_

Я провел много времени в поисках решения, а затем реализовывая его. Оно называется “Решение задачи двух тел” и это, по сути, орбитальные механики для небесных тел из учебников по физике, где состояние тел становится функцией времени. Что как раз было тем, что нужно для таймлайна. Более того, у меня появилась возможность использовать реальные орбитальные параметры всех планет Солнечной системы и их спутников. Я взял их на сайте NASA, добавил в игру и вы можете посмотреть на результат ниже.

![Солнечная система](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/dae5b661e19cbc510e6012ea99dfbca7947a77e0.gif)
_Карта солнечной системы_

Получилось здорово: игра внезапно обрела дополнительную ценность. Я мог выставить любую дату и увидеть реальные положения (и вращение) всех планет Солнечной системы. Что это значит для геймплея?. Это значит, что контент игры становится практически бесконечно расширяемым. В далеком, далеком будущем у игроков будет возможность летать вокруг и исследовать не только Землю и Марс, но и всю Солнечную систему! Это звучит очень смело, но у игры действительно появился такой потенциал. Если остановиться мечтать на минутку, и вернуться к релизу в Раннем доступе, то вся система будет в нем, однако в начале вы сможете приземляться только на поверхность Земли. В одном из последующих обновлений будет добавлена Луна, а затем одна за одной и другие планеты.

Один недостаток полученных мною орбитальных механик заключался в том, что их нельзя было использовать для ускоряющихся тел. Вместо этого приходилось возвращаться к интегрированию, зависящему от предыдущего состояния и достаточно медленно работающему. Именно по этой причине, вы не можете ускорить симуляцию в KSP более чем в четыре раза, когда ракета ускоряется. Как было упомянуто в первом обновлении, я частично решил эту проблему через упрощение симуляции, в которой физика рассчитывается для всего космического корабля, а не для отдельных его частей. В результате я получил максимально возможное ускорение времени равное x30 без значительной потери точности, когда двигатель ракеты работает. Я думаю, этот результат можно улучшить в одном из последующих обновлений игры.

На этом на сегодня все. Вышло слегка коротко, но релиз все ближе и ближе, а еще столько всего необходимо сделать. Теперь я работаю семь часов в день без выходных, чтобы успеть завершить самые важные системы игры. Но я очень вдохновляюсь, видя ваш интерес и поддержку. И если вы заинтересованы присоединиться к нашему любящему космос сообществу, вы можете сделать это, заглянув в наш канал на [Дискорде](steam://openurl_external/https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fdiscord.gg%2FCx3yAH6). Спасибо и до встречи в следующем обновлении.
