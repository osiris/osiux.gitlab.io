---
title: git =post-commit= /ChangeLog/
date: 2021-02-03
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-03-git-post-commit-changelog.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-03-git-post-commit-changelog.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-02-03-git-post-commit-changelog.gmi) |
[`.html`](https://osiux.gitlab.io/2021-02-03-git-post-commit-changelog.html)

## automatizando el *ChangeLog* en `post-commit`

Hace unos días implementé
[`git-log-org-changelog`](2021-02-01-git-log-org-changelog) para
automatizar la generación del *ChangeLog* de cada *post* y hoy comencé a
usar *hook* `post-commit` para obtener los nombres de archivos del
último *commit* y luego de verificar si se trata de un *post* usando una
*expresión regular* se genera el mensaje del *commit* y se realiza el
mismo, de esta manera, podría dejar de hacerlo manualmente para cada
*post*.

## y la recursividad?

Típico de *developer*, minimizar la tarea y pensar que es una giladita,
obvio que el primero commit para estrenar el *hook* entró en el
problemita de la recursividad! y generó casi 100 *commits* de
*ChangeLog* sobre el *commit* del *ChangeLog*.

La solución fue, agregar una validación inicial donde se verifica que si
se esta por realizar un *commit* de *ChangeLog* y el último *commit*
tiene como *subject* `ChangeLog: YYYY-MM-DD-filename.org` entonces el
`post-commit` no hace nada y termina la ejecución.

## otra giladita mas!

Solucionada la recursividad, me encontré que el *post* se eliminaba y
quedaba únicamente el *ChangeLog*, y esto se solucionó corrigiendo la
expresión regular que detecta si un *post* ya tiene una sección
`** ChangeLog`.

## la solución final

Luego de reescribir el historial de `git` para corregir todos los
errores, documento la solución:

1.  descargar los *scripts*
[git-log-files](https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-log-files)
y
[git-log-org-changelog](https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-log-org-changelog)
y dejarlos accesibles para su ejecución (en mi caso, directamente
todo el repositorio
[`git-bash-utils`](https://gitlab.com/osiux/git-bash-utils/))

2.  descargar el *hoook*
[post-commit-org-changelog](https://gitlab.com/osiux/git-bash-utils/-/raw/master/post-commit-org-changelog)
y guardarlo en `.git/hooks/post-commit` y darle permiso de
ejecución.

Ahora luego de cada *commit* se genera un *commit* de *ChangeLog*
automáticamente :)

## ChangeLog

-   [`2021-02-04 11:46`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/0c95f6b70f0cb765decca57ad01116a568bafbf4)
detallo inconvenientes y solución final de `post-commit` *ChangeLog*
-   [`2021-02-03 23:00`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/736b44d0b43f4fb420ae9cab5585b28ac953b41a)
agrego git `post-commit` *ChangeLog*
