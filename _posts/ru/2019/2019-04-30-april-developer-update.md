---
author: Arugin
title: "Дневник разработки: апрель"
date: 2019-04-30 18:00:00 +0300
categories: [Rocket Science, Дневник разработки]
tags: [rocket science]
description: Планирование полетов
image: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/99a46c1214939a7a65368e431ecb68363d446b6b.png
game: Rocket Science
---
Всем привет!

Очередной месяц подошел к концу и пришло время рассказать вам о достигнутых успехах и текущем ходе работ над игрой. Прежде чем мы приступим, я хочу обратить ваше внимание на то, что все скриншоты в этом посте сделаны, пока игра находится на ранней стадии разработки.

Я могу разделить проделанную работу в этом месяце на три основные категории. В первую категорию попадут работы по сборке различных систем в работающую игру. Я писал об этих системах в предыдущих обновлениях — это строительство космического центра, орбитальные механики, генерация планет и всеми любимые ракеты и полеты. Раньше они существовали раздельно друг от друга и представляли собой практически четыре отдельные мини-игры без геймплея.

![Летая на низкой околоземной орбите](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/99a46c1214939a7a65368e431ecb68363d446b6b.png)
_Это невероятное чувство — впервые достичь низкой околоземной орбиты в Rocket Science_

Теперь же космический центр располагается в правильном месте на Земле, что приводит к корректной смене дня и ночи, верному углу наклона Солнца над горизонтом и правдивому ночному небу со звездами. Позиция космодрома основывается на широте и долготе, которые конфигурируются с помощью файла. Более того, игра корректно рассчитывает высоту над уровнем моря в этой позиции и располагает космический центр на поверхности планеты. На релизе в качестве этой позиции выступят координаты космодрома Восточный, но в целом, это открывает широкие возможности для новых геймплейных систем. Например, выбору координат космического центра на старте игры или просто для пользовательских модификаций (поставить космический центр на Эверест было интересно даже мне).

Теперь можно открыть карту всей Солнечной системы и увидеть все запущенные на данный момент космические корабли из Центра управления полетами, расположенном на космодроме В нем есть возможность выбрать любую ракету и загрузить ее в режиме полета. Оттуда также можно запустить новую ракету, выбрав чертеж ракеты и план полета. И, наконец, можно собрать свою ракету из имеющихся деталей в Сборочном цехе.

![Control Center view](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/e297b165dc6116b568b41b506164ec2d44395946.png)
_Вид на солнечную систему из центра управления полетов_

В описанном нет ничего нового по сравнению с другими играми, но теперь основная игровая последовательность готова и я наконец-то могу начать развивать другие системы, такие как строительство космического центра или планирование полетов.

Кстати говоря, я закончил работать над системой планирования полетов и это попадет во вторую категорию работ этого месяца. Что я могу об этом сказать? Это была самая сложная часть игры, из всех, что мне пришлось разрабатывать. Я провел практически полмесяца над этой задачей (гораздо больше, чем я планировал). Пришлось учесть столько нюансов и граничных случаев, что если бы я знал о них до этого, то я бы скорее всего просто свихнулся. В итоге, сейчас этот интерфейс большей частью завершен (естественно с жирной порцией багов).

Он работает следующим образом: вы останавливаете время, выбираете деталь ракеты и открывается ее интерфейс. Вы вносите изменения и команда добавляется на таймлайн. Далее вы возобновляете время и можете наблюдать за тем, как команда повлияет на состояние ракеты. Вы можете перемещаться вперед и назад во времени, добавлять, перемещать или удалять команды как вам хочется. И система планирования полетов пересчитает состояние всего мира для вас!

![Another timline UI](https://steamcdn-a.akamaihd.net/steamcommunity/public/images/clans/34094219/74d4e0213f622f9e043e7be5759e5983ed8db656.png)
_Интерфейс управление полетом с помощью таймлайна_

Как я и ожидал, это система оказалась отличной для планирования сложных полетов, где требуется высокая точность, таких как стыковка с космической станцией. И она также хороша для автоматизации полетов. Но, как и следовало ожидать, эта система ощущается переусложненной для простых задач. Например, если вы просто хотите запустить ракету и полетать по округе. Так что я буду дополнительно размышлять над этой частью игры и с высокой долей вероятности верну прямое управление ракетой игроку. Естественно, вне интерфейса планирования полетов у вас не будет возможности повернуть время вспять или даже просто поставить его на паузу. Также ракета будет сразу выполнять все полученные команды. Таким образом, у вас появится возможность управлять ракетой, как и в других играх. Я думаю, что больше разных способов выполнения полетов не повредят игре. С другой стороны это увеличит время, требуемое на разработку, но об этом я поговорю позже.

Последнее, чем я занимался — это дизайн интерфейса. Я чувствую, что многие другие инди-разработчики ненавидят работать над интерфейсом своих игр, откладывая эту задачу на самый последний момент, после чего просто накидывают пару стандартных серых панелей с белыми кнопками и нажимают кнопку “Зарелизить”. Я тоже не в восторге от работ над интерфейсом (потому что там обычно много рутинных задач, которые ты делал уже миллион раз в прошлом), но больше всего я ненавижу такой “сделанный на отвали” интерфейс. Так что я провел оставшуюся часть месяца, закладывая основу лучшего интерфейса, который я вообще способен сделать. Ничего фантастичного, просто работа с ним не должна вызывать отвращение.

Для тех из вас, кто дочитал этот дневник разработки до этого момента, я подготовил и опубликовал [план работ](https://trello.com/b/7H6nY5L6/hdyliem-development-roadmap) по игре. С его помощью вы сможете получить общее представление о планируемых функциях и текущем прогрессе. Как всегда, все может измениться в последний момент, но чем дольше идет разработка, тем меньше вероятность, что это произойдет.

Последняя вещь, которую я хотел обсудить — это дата релиза. Изначально она была назначена на 31 Мая. Но я много думал об этом и пришел к выводу, что я не хочу выпускать несколько кое-как собранных вместе игровых систем и надеяться, что это прокатит. Даже в Раннем доступе мне хочется дать вам законченный игровой опыт и минимум три часа геймплея. И одного оставшегося месяца недостаточно, чтобы реализовать эту цель. Поэтому я решил перенести релиз игры на Июль. Конкретную дату я анонсирую позже. Но я надеюсь, что мне удастся к концу Мая подготовить трейлер и обновить скриншоты игры на странице в магазине.

Спасибо за внимание, не забудьте присоединиться к нашему сообществу в [Дискорде](https://discord.gg/unbegames), или подписаться на меня в [Твиттере](https://twitter.com/unbeGames) или на [канал на Ютубе](https://www.youtube.com/unbeGames). До скорой встречи.