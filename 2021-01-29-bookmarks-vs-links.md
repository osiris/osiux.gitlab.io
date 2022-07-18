---
title: bookmarks vs links.txt
date: 2021-01-29
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-01-29-bookmarks-vs-links.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-01-29-bookmarks-vs-links.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-01-29-bookmarks-vs-links.gmi) |
[`.html`](https://osiux.gitlab.io/2021-01-29-bookmarks-vs-links.html)

## los *bookmarks* no son mis favoritos

Nunca me convenció ningún sistema de *bookmarks*, intenté algunos
*plugins* de *Firefox*, muchas veces me envié por *email* a mi mismo
algún que otro *link* y en mi momento de mayor uso de `org-mode` intenté
registrar los *links* desde *Firefox* usando `org-protocol` y ya no
recuerdo bien porqué falló o si simplemente dejé de usarlo por simple
inconstancia.

## donde guardar mis *URLs* favoritas?

Fiel al principio *KISS* ([Keep It Simple
Stupid!](https://es.m.wikipedia.org/wiki/Principio_KISS)) , hace un par
de años comencé a almacenar las *URLs* en un simple archivo de texto
plano llamado `links.txt`, inicialmente era eso, una lista de *links*
sin orden alguno, fáciles de encontrar con la gran ventaja de poder
utilizar `grep` y *expresiones regulares* para realizar búsquedas, luego
lo convertí en `links.org` intentando mantener un orden por categorías,
lo cual me fue muy difícil de Mantener porque soy malísimo categorizando
(bah, no tolero mas de una categoría, como las pelis de *netflix*, cómo
pueden ser al mismo tiempo \"suspenso insostenible\" y \"dramático\",
perdón, me fui de tema, pero a alguien se lo tenia que decir).

## *links* en movimiento...

Desde que tengo un dispositivo espía en mi bolsillo, aprovecho cuando
estoy viajando o haciendo la cola del super o de otra cosa aburrida a
matar el tiempo haciendo una rápida revisión de webs que podrían
interesarme, algunas lego a leerlas por completo y otras solo las
registro para leerlas luego con mas tiempo y aquí tuve que decidir que
aplicación utilizar para anotarlas, teniendo en cuenta que luego debería
sincronizarlas con el listado de la compu...

## `todo.txt` vs `links.txt`

Como resultado de leer el libro [*Getting This
Done*](gtd-gething-this-done) (gracias a [Hugo
Ruscitti](https://examplelab.com.ar)) termine implementando un montón de
utilidades para básicamente organizarme mediante listas de tareas y lo
mas simple desde una consola es utilizar
[`todo.txt`](http://todotxt.org/), un simple archivo de texto plano con
una línea por tarea, que puede opcionalmente tener una fecha y uno o mas
*tags*.

Y que tienen que ver las tareas con las *URLs*? Simple, hay una
excelente aplicación para editar `todo.txt` en
[*f-droid*](https://f-droid.org/en/packages/nl.mpcjanssen.simpletask/) y
es [simpletask](https://github.com/mpcjanssen/simpletask-android)

Ya la estaba utilizando y su formato contaba con todo lo que necesitaba,
asi que convertí `links.org` a `links.txt` en 3 simples columnas
`YYYY-MM-DD URL +tag` y resulto muy versátil, porque *simpletask*
simplifica la elección de *tags* existentes, crear nuevos y permite
buscar y filtrar con extrema facilidad.

## sincronizando `links.txt`

Había varias maneras de hacerlo y adivinen que? Opté por utilizar un
repositorio *git* para almacenar `links.txt` y mantenerlo sincronizado
con la compu, y esto fue muy simple utilizando
[`termux`](https://github.com/termux/termux-app) (también disponible en
[*f-droid*](https://f-droid.org/en/packages/com.termux/)) , porque no
solo me permite utilizando comandos `git`, es una terminal completa y
podes hacer lo que necesites, en este momento estoy editando este
articulo desde `vim`, dentro de un `tmux` en un servidor remoto, pero
desde mi celular usando un teclado *bluetooth*.

## mis favoritos, son tus favoritos?

Cada tanto tengo ganas de compartir algún link y me pareció lo mas
sensato directamente compartir mi `links.txt` con el mundo! Solo
necesitaba convertirlos a *HTML* asi que escribí otro *script bash* para
pasarlo a [`links.org`](links), en formato `org-mode` y asi `emacs`
mediante [se ocupa de
exportarlo](2019-04-21-gitlab-ci-org-mode-publish) correctamente,
solo que las *URLs* no siempre son muy bonitas e interesantes y terminé
obteniendo el titulo de cada *link* (lo cual no es tan simple) mejorando
la presentación, ordenando las categorías, eliminando duplicados,
lidiando con *UTF-8*, emojis, etc

Todo esto esta disponible y libre! en el repositorio
[links-bash-utils](https://gitlab.com/osiux/links-bash-utils) por si a
alguien le interesa utilizar
[`url2title`](https://gitlab.com/osiux/links-bash-utils/-/raw/master/url2title)
o
[`links2org`](https://gitlab.com/osiux/links-bash-utils/-/raw/master/links2org).

## y que pasa cuando los *links* den `404` ?

Esto es todo un tema y hace mucho me tomaba el trabajo de convertir a
`.txt` cada post que me parecía interesante para no perderlo, pero esa
solución no escala porque registro muchos links, asi que ya estoy
probando diferentes herramientas para generar mi propio *archive* y
mantener un *mirror* de cada *link*, y \"en breve\" voy a escribir al
respecto.

## ChangeLog

-   [`2021-02-02 18:30`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/78b7254030feaa83b9279622914b2f708bfbd016)
corrijo link roto a *gitlab-ci org-mode publish*
-   [`2021-02-02 18:07`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/1b40b6045d031a7e1f19675f330db6b39f8ba4b4)
agregar URLs de referencia a aplicaciones mencionadas
-   [`2021-02-01 18:00`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/59d53d185d5b919e6797fbede574372b7edb278b)
corrijo fecha de bookmarks vs links
-   [`2021-01-31 04:49`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/33298ea5035d39209862c9d38a5dd609cb69a1ca)
agrego bookmarks vs links
