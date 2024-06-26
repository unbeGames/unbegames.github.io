---
author: Arugin
title: Как я планету вертел
description: Не только вокруг своей оси, но и вокруг Солнца
date: 2019-03-26 20:00:00 +0300
categories: [Rocket Science, Статья]
tags: [rocket science]  
image: https://clan.akamai.steamstatic.com/images/32055644/52634c369b34ded8ceb8b0d2fa2c044fb04c17f7.png
game: Rocket Science
---
Это четвертая статья из цикла историй о разработке игры «[Rocket Science](https://store.steampowered.com/app/890520/Rocket_Science/)», в которой я расскажу о том, как и каким образом я вращал планеты не только вокруг своей оси, но и вокруг Солнца.

![Как я планету вертел](https://clan.akamai.steamstatic.com/images/32055644/52634c369b34ded8ceb8b0d2fa2c044fb04c17f7.png)
_Фобос и Деймос на пути вокруг Марса_

Для тех, кто все пропустил и не в курсе, о чем идет речь, я оставил ссылки на все предыдущие статьи, хотя для попадания в контекст достаточно наискось пробежать глазами хотя бы первую.

- Часть 1: [Как я на Марс ракету отправлял](/ru/posts/2018/kak-ya-na-mars-raketu-otpravlyal/)
- Часть 2: [Как я планету в Unity генерировал](/ru/posts/2019/kak-ya-planetu-v-unity-generiroval/)
- Часть 3: [Как я планету в Unity генерировал, часть вторая](/ru/posts/2019/kak-ya-planetu-v-unity-generiroval-chast-vtoraya/)

В последний раз я слишком сильно ударился в технические детали о процессе генерации планет, из-за чего потерял 90% аудитории и получил очень мало отклика. Чтобы не потерять оставшихся десять человек, я поднимусь на несколько уровней абстракции выше, и буду рассказывать о процессе разработки в общих чертах, выжимая из него наиболее интересное. Обратной стороной такого хода будет превращение последней статьи, в классическое руководство вида:

![Как я планету вертел](https://clan.akamai.steamstatic.com/images/32055644/73983e2244f199c42ebb186a8f861e8ef776a53d.png)
_Два простых шага_

Но у меня есть специальное предложение для тех читателей, которые жаждут расширенного руководства. Пишите в [Дискорд](https://discord.gg/unbeGames), задавайте вопросы, и, как только у меня появится толика свободного времени, я напишу подробную заметку или даже сниму ролик для [канала на Ютубе](https://www.youtube.com/unbeGames) (кстати на нем есть пара полезных видео для начинающих разработчиков Unity).

## Битва за планету Земля

Итак, с горем пополам, спустя месяц страданий, я закончил с генерацией. Получилось относительно неплохо, планета выдерживала 18 уровень разбиения — это в среднем 5 квадратных метров на один полигон для тела с радиусом Земли. Для создания крупных деталей ландшафта, таких как горы, континенты и океаны, я использовал карту высот с [сайта NASA](https://visibleearth.nasa.gov/view.php?id=73934). Однако максимально возможное разрешение текстур такого типа в Unity равно 8192x4096. А это примерно 9 квадратных километров на один пиксель, чего явно было недостаточно. Поэтому дальше вступала в бой генерация высоты, основанная на шумах. К примеру, если взять несколько симплекс шумов с увеличивающейся частотой и с уменьшающейся амплитудой и объединить их, то получится карта высот, пригодная для генерации недостающих деталей ландшафта.

![Симплекс шум дает сравнимые результаты с шумом Перлина, однако вычисляется быстрее](https://clan.akamai.steamstatic.com/images/32055644/29d7a9cc654984acbf6f9aae31fad753175f75bf.png)
_Симплекс шум дает сравнимые результаты с шумом Перлина, однако вычисляется быстрее_

![Искушенный глаз может заметить здесь повторяемость. От нее можно избавиться, используя разные виды шумов и поэкспериментировав с параметрами](https://clan.akamai.steamstatic.com/images/32055644/e2c53f8f3d45c08ba58840b3d371f0e4ef59d2df.png)
_Искушенный глаз может заметить здесь повторяемость. От нее можно избавиться, используя разные виды шумов и поэкспериментировав с параметрами_

Для текстурирования я использовал простую симуляцию влажности, которая рассчитывалась заранее, а ее результаты записывались в текстуру. Далее, ориентируясь на влажность и температуру текущего участка, я подбирал для него материалы. Получилось, конечно, далеко до красот какого-нибудь Хорайзона, но результат вышел лучше, чем стандартное текстурирование в зависимости от высоты. К тому же систему, чисто теоретически, можно усложнять и расширять до тех пор, пока процессор не будет плавиться от расчетов, но эти эксперименты я оставил на будущее: надо было двигаться дальше.

![Полученная карта влажности Земли. Чем светлее участок, тем больше в нем влаги. Африка и центральная Азия вышла чересчур сухой, но это потому, что в симуляции я не учитывал ветер. Когда-нибудь я доберусь и до этого](https://clan.akamai.steamstatic.com/images/32055644/c3da8202d94dcf0cfe12e270e64109b79adf1e00.png)
_Полученная карта влажности Земли. Чем светлее участок, тем больше в нем влаги. Африка и центральная Азия вышла чересчур сухой, но это потому, что в симуляции я не учитывал ветер. Когда-нибудь я доберусь и до этого_

![Пример текстурированного участка, который я использовал как обложку ко второй статье. Помимо всего прочего, здесь использовались еще три техники, которые могут быть для вас полезными: Slope-Based Texturing, Distance Resampling и Normal Details](https://clan.akamai.steamstatic.com/images/32055644/eebd064c94cfc70288cf1205d6612232856f0709.png)
_Пример текстурированного участка, который я использовал как обложку ко второй статье. Помимо всего прочего, здесь использовались еще три техники, которые могут быть для вас полезными: Slope-Based Texturing, Distance Resampling и Normal Details_

Как бы ни было интересно заниматься процедурной генерацией, к геймплею это приближало меня только на полшага из трехсот тысяч. Работа над системами игры, которые не включают геймплей, на самом деле изматывает. Голову постоянно сверлит назойливая мысль: «А вдруг все, что я делаю сейчас — пустая трата времени?». Это справедливый вопрос, так как на него можно ответить, только дав поиграть в свое детище незнакомым людям. И самое печальное, что играть пока было не во что. Но и забить на генерацию я не мог. Потому что геймплей очень сильно зависел от того, смог бы я создавать планеты размером с Землю или нет. Это как две стратегии, одна из которых поддерживает 100 юнитов, тогда как другая — 10 000, будут совершенно по-разному играться и делать упор на разные вещи. Ответ я получил: да, планеты размером с Землю и даже больше в игре будут. На одну неопределенность стало меньше.

Я сделал перерыв на три дня: сварил себе суп из гнилой капусты и очистков картошки, вышел пару раз на улицу, чтобы насладиться затянутым серой пеленой небом и помесить грязь, а остальное время пролежал на диване, глядя в одну точку. Пора было переключаться на разработку геймплея и моей следующей жертвой стали системы строительства космодрома.

На самом деле с тех пор многое поменялось (в очередной раз), поэтому, чтобы сохранить хронологический порядок истории разработки, но не тратить свое и ваше время на описание того, что уже не актуально, я соберу всю информацию про космодром в следующей статье. Здесь же отмечу, что я вдохновлялся серией XCOM и элементами своей первой, замороженной игры — Freemium Way. Из первой я взял вид на космодром сбоку и строительство частично под землей (и даже смог обосновать лором, почему так). Из второй — системы ресурсов и предметов. Объединил их в прототипе и получил то, что можно было потыкать и оценить свои ощущения.

## Новые горизонты

Наступил декабрь 2018 года. У меня был готов своего рода геймплей, состоящий примерно из такой последовательности:

- управляем космодромом, тратим ресурсы на его развитие, детали ракеты, оплату труда персонала;
- запускаем ракету, летим вверх, собираем разбросанные в воздухе ресурсы;
- у ракеты заканчивается топливо, она падает, все что собрали, оказывается на космодроме, после чего последовательность повторяется.

Напомню, что система полета на тот момент была унаследована из прототипа, во многом похожего на игры, вроде Into Space 2. И на момент написания прототипа играть в него было весело, но с появлением строительства космодрома и целой планеты, полеты стали выбиваться из канвы и выглядеть чужеродными. И если взлет с Земли и посадку на Марс как-то можно было оправдать, то как сделать интересным полет между ними, который в реальности занимает девять месяцев, было непонятно С другой стороны, отказываться от 2.5D измерения и делать что-то похоже на Kerbal Space Program не хотелось — объем работ казался неподъемным. К тому же, зачем кому-то нужен второй KSP? Ещё я попробовал перейти от аркадной физики ракеты к той, что используется в KSP, где каждая деталь является твердым телом и они соединены между собой джоинтами, и ощутил, какая это боль. Столько багов у меня не было даже в первых лабораторных работах по программированию в университете.

Я был преисполнен сомнений, но не мог дать постороннему человеку поиграть в свой проект. Слишком сыро. А первое впечатление можно получить только один раз. Но и продолжать разработку вслепую я тоже не мог. Поэтому я подготовил и опубликовал страницу в Стиме со всем, что у меня было на тот момент. А также написал свою первую статью на DTF. И знаете, результат стоил того. Статистика вишлистов и посещений показала чуть большую заинтересованность аудитории, чем у моей [предыдущей игры](https://store.steampowered.com/app/742380/Spreadstorm/). А благодаря комментариям к первой статье я понял, в каком направлении надо двигаться дальше.

Идея заключалась в том, что у игрока не будет прямого управления над космическим кораблем. Чтобы сдвинуть его с места, необходимо будет разработать план полета до запуска. План полета состоит из набора команд, которые должны будут посылаться деталям ракеты. Когда наступит день запуска, команды из плана начнут выполняться, что должно привести (чисто теоретически) к отрыву корабля от поверхности Земли и достижению поставленных целей. План составляется в центре управления, где можно симулировать полёт и состояние всей Солнечной системы на месяцы вперед. Упрощенная текстовая версия плана полета могла выглядеть следующим образом:

```
T -00:00:02 установить дроссель двигателя на 0,5
T -00:00:00 запустить двигатель
T +00:00:30 начать гравитационный маневр на восток на 15 градусов
T +00:01:54 отстыковать спасательную вышку
...
```

Если что-то пойдет не так (а это рано или поздно случится), у игрока будет возможность послать набор корректировочных команд ракете и надеяться, что это решит проблему. Но самое главное преимущество этой идеи заключалось в том, что появлялась возможность переиспользовать планы полета для ракет одного типа, чтобы каждый раз не выполнять одинаковые задачи, например по выводу ракеты на низкую околоземную орбиту, что очень раздражало меня в KSP.

Возникал вопрос, как это будет выглядеть и как это реализовать. Ни один разумный игрок не захочет вручную и в текстовом виде вбивать команды для ракеты, даже если достижение ею Марса в таком виде приведет к релизу Half Life 3. Ключевым моментом был интерфейс, но я быстро пришел к разным вариантам его реализации и остановился на таймлайне. Таймлайн состоит из линии времени и панели команд. Игрок может переместиться на любую позицию на линии времени, получить текущее состояние ракеты и задать ей команду. Набор заданных таким образом команд и становится планом полета.

![Прототип таймлайна. Вертикальные белые линии — команды. Белая стрелка обозначает текущую позицию симуляции во времени. Как только она дойдет до команды, команда выполнится](https://clan.akamai.steamstatic.com/images/32055644/800325aac93814425065552f32e941ee9792253a.png)
_Прототип таймлайна. Вертикальные белые линии — команды. Белая стрелка обозначает текущую позицию симуляции во времени. Как только она дойдет до команды, команда выполнится_

Оставался последний и самый главный вопрос: физика. Идея таймлайна сразу отметала встроенную физику Unity, так как состояние объекта в ней зависит от предыдущего состояния. То есть, чтобы получить положение ракеты через десять минут от текущего момента, нужно либо просимулировать все десять минут с шагом в 0.02 секунды для всех физических объектов на сцене (включая Землю и Солнце), что приведет к долгим фризам игры. Либо нужно увеличить шаг, что сделает фризы менее заметными, но ценой будет очень сильная потеря точности. Либо геймплею придется снова подождать и придется писать свою физику. В этот момент еще стало очевидно, что полеты при таком раскладе перейдут в полное 3D.

## Нулевой рассвет

Исследование, на которое я потратил в свое время неделю, выручило меня снова. В ролике о KSP авторы как раз рассказывали о проблемах физики Unity для космического симулятора. И как смогли разобраться с ней, через решение [задачи двух тел](https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B0_%D0%B4%D0%B2%D1%83%D1%85_%D1%82%D0%B5%D0%BB). Что это значит? Это значит, что мне нужно было реализовать систему орбитальных механик и по сути всю Солнечную систему, и при этом я получал следующие преимущества:

- состояние всех объектов Солнечной системы будет функцией от времени;
- ускорение времени становится тривиальной задачей благодаря предыдущему пункту;
- чтобы восстановить состояние всей системы достаточно лишь одного значения текущего времени, то есть не нужно будет сохранять позиции, скорости и вращения всех тел системы;
- нет проблем с точностью;
- предсказанная траектория тела всегда будет совпадать с текущей.  

Естественно за этот набор преимуществ нужно было заплатить. И цена такова: на текущее тело может воздействовать только один источник гравитации. Но это можно частично обойти, используя сферы влияния. Как только, например, корабль вылетает за сферу влияния Земли, его «подхватывает» Солнце, и в этот момент нужно пересчитать лишь все его орбитальные параметры. Это решение неплохо зарекомендовало себя в KSP, поэтому я принял его как данность.

Теперь о реализации. В интернете можно было найти достаточно много решений, если погуглить «Two body solver». Только не было ни одного решения для Unity. Формально, была только одна проблема переноса решения с любого другого языка или движка. Весь мир, в том числе и Википедия, учебники по физике, программы 3D-моделирования используют координатную систему, основываясь на правиле правой руки. А Unity? Правильно, левой!

![Как я планету вертел](https://clan.akamai.steamstatic.com/images/32055644/600c875a6dad103fc51147758c7e7b58e4708ce7.png)

Казалось бы, какая-то мелочь, но (простите) сколько я поел говна с этим, словами не передать. В результате планеты у меня вращались с востока на запад, солнечная система выглядела зеркально отраженной, конвертирование географических координат космодрома Восточный в декартовы в Unity отправляло космодром в Тихий океан, и так далее. Это был тот момент, когда я был ближе всего к решению бросить к чертям игровую разработку и программирование, уехать на юг и заниматься огородом, пить вино и есть шашлык до конца жизни.

Долго ли, коротко ли, я разобрался со всеми проблемами. Орбитальные параметры всех восьми планет и их основных спутников я опять же взял с сайта NASA. Результат, конечно, порадовал, я по сути получил планетарий, который уже обладал какой-никакой ценностью: я мог увидеть реальные положения планет Солнечной системы в любой момент времени.

![Модель Солнечной системы с положениями планет в январе 2000 года>](https://clan.akamai.steamstatic.com/images/32055644/f74ca9c447d10555dfb332a1db1f6eda978abd66.png)
_Модель Солнечной системы с положениями планет в январе 2000 года_

Космический корабль тоже подчинялся формулам и вставал на верные орбиты в зависимости от своей скорости и положения. Однако, когда у него включались двигатели, физики, основанной на интегрировании, было не избежать. Именно поэтому, в аналогичной ситуации в KSP максимально возможное ускорение симуляции ограничивается четырехкратным. Я же решил больше не идти по пути KSP и отказался от физической симуляции всех деталей космического корабля. Детали оставались (я все же хотел реализовать возможность упрощенной сборки ракеты), но они влияли только на общие параметры ракеты. Это позволило мне ускорять симуляцию во время работы двигателей до x10 с приемлемой потерей точности, что для таймлайна было критично.

Оставалась проблема чисел с одинарной точностью, типичная для всех современных движков. Существуют различные способы представления десятичных чисел на компьютерах:

- числа с плавающей запятой одинарной точности: 23 бита (float в большинстве языков);
- числа с плавающей запятой двойной точности: 52 бита (в большинстве языков double);
- числа с фиксированной запятой: 31 бит;
- числа с фиксированной запятой: 63 бита.

В таблице ниже приведена точность, которую обеспечивает каждый тип.

![Как я планету вертел](https://clan.akamai.steamstatic.com/images/32055644/60162bca77a76741f0e8b965dbc114dbcc51f97f.png)

У меня был выбор был между float и double, и он был очевиден. Конечно, double уже не хватало для масштабов Млечного пути, но за пределы Солнечной системы я точно не собирался выходить. Нет ну правда. Ну, по крайней мере пока. Итого все расчеты я проводил в double. Но от флоатов в мире Unity никак не убежать. Поэтому при переходе в мир Unity значения конвертировались во флоат. Так как при конвертировании точность терялась, то отдаленные от центра системы координат объекты все равно начинали дрожать. Где-то на орбите Плутона дрожание становилось настолько сильным, что объект просто не попадал на камеру. Решение у этой проблемы достаточно простое и называется Floating Origin. Нужно просто держать текущий объект, за которым следит камера в центре координат, а весь мир перемещать относительно него. С этим, на удивление, никаких проблем не возникло.

Второй забавный момент на похожую тему заключался в том, что расстояние, которое может рендерить камера, ограничивается примерно 100 км. И когда игрок крутит колесико мыши, чтобы увидеть всю солнечную систему, камера также остается на месте, а вся Солнечная система уменьшается и сдвигается таким образом, чтобы попасть в поле видимости камеры.

Еще достаточно жирный кусок времени у меня отнял рендеринг орбит. Я брал от 256 до 512 точек в зависимости от орбиты и рассчитывал, где они будут пролегать, после чего использовал стандартный Line Renderer для отрисовки, скармливая ему эти точки. В тот момент я сделал для себя открытие, что Unity не может рисовать простые линии по-другому. А интерфейс у Line Renderer скудный и корнями уходит во времена Unity 4, когда движок представлял из себя станок для инди-треша. Когда я решил делать орбиты тоньше перед движущейся планетой, и толще после нее, чтобы беглым взглядом можно было оценить направление движения небесных тел, я сильно огреб от Unity во второй раз. Но большинство проблем можно преодолеть, если в их решение вложить достаточное количество времени.

Я закончил работать над орбитальными механиками где-то в середине января, получив очередной кусочек пазла. У меня все еще толком не было геймплея, но вроде бы наконец настал тот момент, когда все нужные системы были готовы и из них можно было начать собирать в игру. Чем я и занялся тогда и занимаюсь до сих пор. Об этом и многом другом я расскажу в следующий раз. И вероятность, что он наступит, увеличивается прямо пропорционально вашей поддержке. Если вам интересно, [добавляйте игру](https://store.steampowered.com/app/890520/Rocket_Science/) в вишлист (это очень помогает, правда), заглядывайте в [Дискорд](https://discord.gg/unbeGames) или подписывайтесь на канал в [Телеграме](https://t.me/unbeGames). До скорой встречи.
