---
author: Arugin
title: "Дневник разработки: ноябрь"
description: Создавая трейлер
date: 2019-11-30 21:00:00 +0300
categories: [Rocket Science, Дневник разработки]
tags: [rocket science]
image: https://clan.akamai.steamstatic.com/images//34094219/c9089c3a11a66b058b8c84cafccbd9ce97a5a01a.png
game: Rocket Science
---
Сегодня я хотел опубликовать трейлер игры вместо обычного обновления, но эта идея была заблокирована серьезным багом в Unity, из-за которого любой билд крашится. И так как я использую только кадры из игры в своих трейлерах, нам придется подождать одну или две недели, пока этот баг не будет исправлен. С другой стороны, это не так уж плохо, потому что я успею добавить больше контента в игру за это время, отчего трейлер станет только лучше. Поэтому давайте поговорим о работе над игрой, которая была выполнена и которую нужно еще сделать, чтобы наконец-то выпустить игру в Раннем доступе. **Кстати говоря**, в конце обновления есть ссылка на небольшой опрос. Пожалуйста, примите в нем участие - это очень мне поможет.

![](https://clan.akamai.steamstatic.com/images//34094219/c9089c3a11a66b058b8c84cafccbd9ce97a5a01a.png)
_Так выглядит миниатюра Земли на тестовой сцене в проекте (радиус 3км)_

Подготовка трейлера игры - это своего рода мини-релиз. Тебе нужно добавить достаточно контента, убедиться, что все выглядит неплохо и отсутствуют ужасные баги. Также при записи важны стабильные 60 FPS, так что над оптимизацией хотя бы на своем компьютере тоже приходится поработать. Кроме того, необходимо продумать историю для трейлера, а также какое послание ты хочешь им донести. И, наконец, ты не можешь тратить время на вещи, которые в конечном итоге не попадут в игру.

Именно поэтому очень сложно описать, что конкретно было сделано за прошедший месяц. Я выполнил десятки небольших задач и исправил баги разного уровня сложности, рассыпанные по всему проекту. Кроме того, я наконец-то стал создавать контент для игры в виде разных деталей ракет. Но спойлерить я их не собираюсь, так как они - часть трейлера. Несмотря на все это, я все же подготовил пару вещей, которыми смогу поделиться с вами.

Первая вещь — это соединения деталей ракет. Я частично рассказал о них в [Майском дневнике разработки](https://steamcommunity.com/games/890520/announcements/detail/1621772460694645634?snr=2_groups_partnerevents_), но осталось еще несколько вопросов, на которые мне нужно было найти ответ. И самый важный из них - что делать с боковыми соединениями. К примеру, если взять топливный бак, то можно придумать как минимум пять разных способов присоединить к нему что-нибудь по бокам.

![](https://steamcommunity.com/linkfilter/?u=https%3A%2F%2Fclan.akamai.steamstatic.com%2Fimages%2F%2F34094219%2F71d3dbe2239c96c01dbd6fd79c59ec12f61fed49.png)
_Здесь схематично изображен вид на топливный бак сверху и 5 разных типов боковых соединений_

Так как точки соединений конфигурируются и рассчитываются заранее, их невозможно динамически добавить к детали. Но и представлять каждый тип соединения отдельным элементом в интерфейсе сборочного цеха тоже нельзя. Так как придется по сути добавить шесть одинаковых топливных баков, единственное различие между которыми — это количество возможных боковых слотов. Это создаст ненужную путаницу и перегрузит интерфейс. После проб и ошибок я нашел хорошее решение, которое называется конфигурацией деталей.

В случае топливного бака, о котором мы говорили выше, на интерфейсе появится иконка, которая будет означать, что данную деталь можно конфигурировать. Как только вы кликните по такой детали, вам будут представлены на выбор все доступные варианты конфигурации.

![](https://clan.akamai.steamstatic.com/images//34094219/7a4f9a63e48d17be990a07a90c02f7fae7c016e0.gif)
_Выбор радиальных соединений в конфигурации детали_

Более того можно добавить несколько типов конфигураций к каждой детали. Для топливных баков это может быть не только количество возможных соединений, но и тип их содержимого: только топливо, только окислитель, или оба в правильных пропорциях. Очевидно, что такой выбор будет оказывать влияние на летные характеристики частей ракеты. Даже в случае просто разного количества соединений, детали будут немного отличаться по массе и сопротивлению воздуху. И я не говорю уже о различных способах наполнения баков, так как это значительно расширяет возможности при конструировании космического корабля.

Моделируя детали ракет, я осознал, насколько точно нужно это делать. Так как форма деталей важна и участвует в вычислениях физики, даже малейшая ассиметричность может привести к нестабильности и неожиданному поведению космического корабля во время симуляции. Обычно во мне есть немного перфекциониста, когда дело доходит до моделирования. И наверное, это один из немногих случаев, когда это действительно оправдано, особенно для частей ракеты, которые выводят ее на орбиту.

Другая хорошая задача, которая попалась мне по пути и о которой я могу рассказать — это улучшение алгоритма интерполяции при генерации геометрии планеты. Ранее вы могли заметить пиксели на планете из-за того, что карта высот имеет конечное разрешение. Сейчас же все гладко.

![](https://clan.akamai.steamstatic.com/images//34094219/27b62f68f1b5c2d5e09ac93d8797d16011ba16bf.png)
_До изменения_

![](https://clan.akamai.steamstatic.com/images//34094219/56ec187d2febcf4dc7f67dd41223445c5be4e32d.png)
_После изменения_

Что касается будущей работы над проектом, она сводится к созданию контента, проработке игровой последовательности и подготовке к релизу в Раннем доступе. Есть только две относительно больших системы, которых сейчас не хватает в игре: прямое управление ракетой и система контрактов. Первая добавит больше удовольствия от полетов, если вам не нужно планировать их заранее, и вы хотите просто полетать вокруг, исследуя окрестности. Вторая система нужна для режима «Выживания», в котором вам нужно зарабатывать деньги, чтобы платить зарплаты и разблокировать новые детали ракет и постройки, которые понадобятся для поддержания космопорта в функциональном состоянии. Стоит отметить, что вторым режимом будет «Песочница», где все будет доступно с самого начала, для тех, кто любит самостоятельно развлекаться и экспериментировать. Обе системы не настолько сложны в реализации, поэтому я не вижу никаких серьезных проблем с ними, по сравнению, например, с физикой ракет.

Для подготовки к релизу мне нужно немного данных от вас — моей основной аудитории. Какое железо вы используете и что вы ждете от игры больше всего. С помощью этих данных я смогу корректно расставить приоритеты на наиболее важных задачах. Вам достаточно пройти [небольшой опрос](https://forms.gle/MPKfebFoMCP4EfH57), чтобы помочь мне в этом.

Спасибо вам, оставайтесь на связи и ожидайте выхода трейлера с объявлением окончательной даты релиза. Это произойдет скоро (с).
