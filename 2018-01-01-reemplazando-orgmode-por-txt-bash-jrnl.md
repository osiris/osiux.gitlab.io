---
title: Reemplazando *Org-mode* por =txt-bash-jrnl=
date: 2018-01-01
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.md) |
[`.gmi`](gemini://gmi.osiux.com/2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.gmi) |
[`.html`](https://osiux.gitlab.io/2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.html)

En estos últimos 2 años dejé un poco de ser developer para convertirme
en un sysadmin y yo siempre dije **\"como sysadmin soy buen developer y
como developer buen sysadmin\"**, hoy lo más cercano sería un
\"devops\".

Y este cambio de rol me obligó a cambiar mucho las herramientas con las
cuales trabajo a diario, ya no podía sostener el estar con un *EMACS*
abierto todo el día en un único archivo de proyecto *Org-mode* [^1],
aunque al principio lo intenté, se tornó extremadamente difícil mantener
la misma dinámica ya que como sysadmin ahora estoy constantemente en
varias terminales al mismo tiempo y cambiando de contexto todo el
tiempo.

Antes la secuencia era comenzar el día con una tarea grande e ir
desarrollándola durante el transcurso del día y tal vez continuarla
durante varios días hasta terminarla.

Hoy comienzo con una tarea a los poco minutos tengo que abandonarla por
otra más urgente y tal vez hasta interrumpir esta segunda tarea por otra
de mayor prioridad y me resulta vital llevar un registro de cada tarea,
en parte porque algunas van directamente al gestor de tareas redmine
para referencia o seguimiento y otras las quiero documentar para uso
futuro, si necesito volver en el tiempo y reutilizar lo aprendido.

Esta situación conllevó a volverme minimalista y lo primero que encontré
fue una aplicación realizada en *python* llamada `jrnl` [^2], la cual me
resulto genial, lo único que hacía era invocar mi editor de texto
favorito *ViM* [^3] agregándole un timestamp, entonces podía registrar
libremente lo que hacía, por lo general la salida de consola a algún
comando y algún texto de referencia, pero con el tiempo la noté un poco
lenta ya que guardaba cada entrada en un único archivo de texto, asi que
decidí realizar una alternativa en bash que almacenara en diferentes
archivos en una clásica estructura de árbol de directorios y esto me
permitió además agregarle diferentes funcionalidades que me iba
necesitando y que se tornaban cómodas para el uso cotidiano.

Asi llegué a publicar `txt-bash-jrnl` [^4], el cual hoy decidí publicar
grandes cambios que tenía dando vueltas sin commitear y en parte se debe
a que este año quiero mantener actualizado este blog, tengo muchísimo
por publicar, ya que tengo unos 2 años de journals para seleccionar,
corregir y liberarlos.

Antes mi blog estaba desarrollado en *Org-mode* y gran parte de él aún
sigue sin convertir de `.org` a `.txt` y por ello se me ocurrió que la
mejor manera sería utilizar un journal para mi blog y escribiendo en
formato markdown solo bastaría convertir a html cada journal para que se
conviertan en posts.

Trataré de publicar rápido y seguido, posiblemente en una modalidad de
micro-blog o mini posts mientras voy puliendo el *jrnl2blog*.

Es una excelente manera de comenzar este **Happy GNU Year** :)

[^1]: <http://orgmode.org/>

[^2]: <http://jrnl.sh/>

[^3]: <http://www.vim.org/>

[^4]: <https://github.com/osiris/txt-bash-jrnl/>
