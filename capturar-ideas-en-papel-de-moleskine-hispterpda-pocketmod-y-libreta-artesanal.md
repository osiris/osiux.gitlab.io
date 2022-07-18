---
title: Capturar ideas en papel de moleskine, hispterpda, pocketmod y libreta artesanal
date: 2011-10-06
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/capturar-ideas-en-papel-de-moleskine-hispterpda-pocketmod-y-libreta-artesanal.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/capturar-ideas-en-papel-de-moleskine-hispterpda-pocketmod-y-libreta-artesanal.md) |
[`.gmi`](gemini://gmi.osiux.com/capturar-ideas-en-papel-de-moleskine-hispterpda-pocketmod-y-libreta-artesanal.gmi) |
[`.html`](https://osiux.gitlab.io/capturar-ideas-en-papel-de-moleskine-hispterpda-pocketmod-y-libreta-artesanal.html)

## Capturando Ideas

Muchas metodologías de gestión del tiempo coinciden en un paso
escencial, capturas ideas lo antes posible y uno de los medios más
efectivos, flexibles y más disponibles es el papel, por esto conviene
siempre tener alguna especie de libreta a mano. Si bien hace tiempo es
posible utilizar algún dispositivo electrónico, ninguno es tan versatil
y maleable como el papel.

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_11.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_11.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_12.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_12.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_13.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_13.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_14.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_14.jpg)

Inicialmente cuando leía acerca del método GTD [^1], pase un buen rato
eligiendo la mejor libreta para recopilar y en esa carrera terminé
comprando una **moleskine** [^2], y antes de completarla ya había
comprado otra libreta de similares características pero menor calidad y
precio, luego tuve la suerte de perderlas para provisoriamente usar una
muy barata libreta que en poco tiempo terminó por desarmarse (realmente
era de mala calidad).

## Alternativas a moleskine

En la búsqueda de algo económico y práctico a la vez descubrí la
**hispterPDA** [^3], que consta de varias hojas sostenidas por un clip,
broche o incluso una banda elástica, tiene la ventaja de poder separar
las hojas para tener una visión global, reorganizar e incluso archivar
de maneras muy distintas. No encontré un clip que no lo perdiera y por
lo que suelo registrar se escapaba a mis necesidades.

Entonces dí con la **pocketmod** [^4] una idea fabulosa por su simplesa,
tomar una hoja y dividirla en 8 partes y haciendo sólo dos cortes ya
obtenés una mini-libreta lista para usar. Con esto jugué bastante,
primero con los generadores web que incluyen calendarios, listas de
tareas y varios templates.

[![](https://osiux.com/tmb/libreta_artesanal/libreta_pocketmod_01.jpg)](https://osiux.com/img/libreta_artesanal/libreta_pocketmod_01.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_pocketmod_02.jpg)](https://osiux.com/img/libreta_artesanal/libreta_pocketmod_02.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_pocketmod_03.jpg)](https://osiux.com/img/libreta_artesanal/libreta_pocketmod_03.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_pocketmod_04.jpg)](https://osiux.com/img/libreta_artesanal/libreta_pocketmod_04.jpg)

Como uso **Org-mode** [^5] decidí integrarlo a la **pocketmod**, intenté
adaptar un script para **hispterpda** que extraía citas de **Org-mode**
generando un PDF en formato **pocketmod** pero no me dió resultado,
aunque de esa experiencia obtuve la experiencia de interactuar con el
utilitario `pdfjam` [^6] que facilita la unión de distintos archivos pdf
en uno solo.

Decidido a obtener mi propio template de **pocketmod**, obté por hacer
un par de archivos en ascii-art, incluyendo la salida del programa `cal`
de consola, esto está disponible en un repositorio `git` [^7] y no son
más que unos archivos en formato **reStructuredText** [^8].

Cuando finalmente quedé conforme con el template y lo imprimí y empecé a
usarlo vi rápidamente que estaba desaprovechando papel, la hoja A4
estaba siendo usada de una sola cara. Fui a una papelería y adquirí unas
hojas de 120 gramos pensando en imprimir en doble faz, luego de hacerlo
y plegarla vi que no resultaba cómoda y le di vueltas al asunto.

Buscando maneras de encuadernar sin usar adhesivos vi varios ejemplos de
plegado y observando una foto de un sitio web que no recuerdo obtuve una
libreta que me gustó, aunque con el uso dejé de imprimir el template y
generalmente uso las hojas en blanco.

### Libreta Artesanal

Usando una hoja A4 (210x297mm) el primer paso es doblarla en dos para
luego nuevamente doblarla en dos.

``` {.example}
+---------+---------+    +---------+---------+
|         |         |    |         |         |
|         |         |    |         |         |
|         |         |    +---------+---------+
|         |         |    |         |         |
|         |         |    |         |         |
+---------+---------+    +---------+---------+

+----+----+---------+    +----+----+----+----+
|    |    |         |    |    |    |    |    |
|    |    |         |    |    |    |    |    |
+----+----+---------+    +----+----+----+----+
|    |    |         |    |    |    |    |    |
|    |    |         |    |    |    |    |    |
+----+----+---------+    +----+----+----+----+
```

Luego es necesario hacer 2 cortes, asi obtenemos 4 hojas A6 (148x105mm)

``` {.example}
+----+----+----+----+    +----+----+  +----+----+
|    |    |    |    |    |    |    |  |    |    |
|    |    |    |    |    |    |    |  |    |    |
+----+----+----+----+    +----+----+  +----+----+

+----+----+----+----+    +----+----+  +----+----+
|    |    |    |    |    |    |    |  |    |    |
|    |    |    |    |    |    |    |  |    |    |
+----+----+----+----+    +----+----+  +----+----+
```

Ahora hacer 6 cortes de 5mm cada 15mm para la unión entre hojas

``` {.example}
15mm 15mm 15mm 15mm 15mm 15mm 15mm
+<-->+<-->+<-->+<-->+<-->+<-->+<-->+

1    2    3    4    5    6
+----+----+----+----+----+----+----+   +
|    |    |    |    |    |    |    |   ^
|                                  |   |
|                                  |   |
|                                  |   |
|                                  |  148.5mm
|                                  |   |
|                                  |   |
|                                  |   |
|                                  |   v
+----------------------------------+   +

+<------------ 105mm ------------->+
```

Plegar hacia adentro los 3 segmentos interiores

``` {.example}
+----+    +----+    +----+    +----+
|    +----+    +----+    +----+    |
|    +----+    +----+    +----+    |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
+----------------------------------+
```

Luego los mismos 3 segmentos hacia el otro lado

``` {.example}
+----+    +----+    +----+    +----+
|    +----+    +----+    +----+    |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
|                                  |
+----------------------------------+
```

Finalmente apilar todas las hojas e introducir una varilla de madera de
2mm de diámetro.

## Fotos Paso a Paso

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_01.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_01.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_02.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_02.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_03.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_03.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_04.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_04.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_05.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_05.jpg)

[![](https://osiux.com/tmb/libreta_artesanal/libreta_artesanal_06.jpg)](https://osiux.com/img/libreta_artesanal/libreta_artesanal_06.jpg)

## También te puede interesar leer

-   [*GTD Gething this Done*](gtd-gething-this-done)
-   [`todo.txt` `rst+org-mode`](todo-txt-rst+org-mode)

## ChangeLog

-   [`2021-02-06 19:16`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/399518e629348943bc32b98848a67e93d3d9f3ad)
corrijo *links* y sintaxis, agrego *posts* relacionados
-   [`2019-04-18 00:21`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/e46ec52748a7ecc60f09c3b95e363e92eaa0bebc)
Agregar hora en header date
-   [`2019-04-18 00:01`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/5c8643b83930c6269569c76602608bd33f93008b)
Corregir identación header \#+INCLUDE:
-   [`2015-07-03 04:31`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/bbc3bbc728f2a3eeb4fe2e0a012ee5d8d613e3ef)
@ 00:05 hs - elimino \#+OPTIONS: de todos los archivos excepto
header.org
-   [`2015-07-03 03:59`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/a2abb3b333c91e0d3c15ea9e93a21589bd4d86f7)
@ 01:00 hs - reemplazo :alt por :title y cambios menores
-   [`2015-06-30 05:58`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/c4f35213a5ce601aacae9636dd28aa99c2925943)
@ 01:00 hs - corrijo header.org para exportar individualmente y
agrego posts a medio terminar
-   [`2014-04-22 11:35`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/74165280ffad770d1f8b8acbfa7f22b95459b52a)
@ 00:34 hs - Agrego timestamp:nil
-   [`2013-06-21 02:36`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/71d89f5723e08d91fff52405fec01a9d00acbce5)
@ 00:40 hs - agrego imágenes libreta artesanal
-   [`2013-04-24 08:04`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/5ad3755a3df07cdfbdc75d56cae06db2fee4b5f2)
@ 01:50 hs - migro a org 8.0
-   [`2013-03-14 13:40`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/69b41173759cd575222017d21c4ffc77554dc55a)
@ 01:34 hs - Correcciones y nuevo texto migrado de rst a org

[^1]: <https://es.wikipedia.org/wiki/GTD>

[^2]: <https://es.wikipedia.org/wiki/Moleskine>

[^3]: <https://secure.wikimedia.org/wikipedia/en/wiki/Hipster_PDA>

[^4]: <http://www.pocketmod.com/>

[^5]: <https://es.wikipedia.org/wiki/Org-mode>

[^6]: <http://freshmeat.net/projects/pdfjam/>

[^7]: <https://gitlab.com/osiux/libretA7>

[^8]: <http://osiux.com/restructuredtext-texto-re-estructurado.txt>
