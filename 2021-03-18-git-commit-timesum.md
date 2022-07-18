---
title: git commit timesum
date: 2021-03-18
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-18-git-commit-timesum.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-18-git-commit-timesum.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-03-18-git-commit-timesum.gmi) |
[`.html`](https://osiux.gitlab.io/2021-03-18-git-commit-timesum.html)

## registras cuánto tardás?

Creo que fue en el 2008 cuando en *`gcoop`* [^1] decidimos registrar
cuánto tiempo tardábamos en hacer cada *commit* e inicialmente la idea
era simple, solo bastaba comenzar el *subject* del *commit* con el
prefijo `@ HH:MM hs -`, fácil de implementar y permitía luego obtener un
total del tiempo utilizado en un proyecto.

## `git-log-time`

Obtener el listado de tiempo de cada *commit* es simple de obtener, para
esto basta con ejecutar `git-log-time` [^2]

``` {.bash org-language="sh" exports="code"}
git-log-time

00:01
00:05
00:02
00:01
00:25
00:25
00:11
00:30
00:02
00:02
00:05
00:02
06:17
01:57
02:21
00:32
00:01
00:25
00:25
00:05
00:06
00:37
01:24
00:12
00:27
00:50
00:34

```

## `git-log-timesum`

Si lo único que queremos es obtener el total de tiempo de un proyecto
basta con ejecutar `git-log-timesum` [^3]

``` {.bash org-language="sh" exports="code"}
git-log-timesum

18:04

```

## `git-repos2org`

Hoy se me ocurrió agregar este total de tiempo al listado de
repositorios `git` [^4] de este blog, el cual genero usando
`git-repos2org` [^5] y me sorprendió ver que el proyecto `txt-bash-jrnl`
[^6] solo me llevó `18:04 hs`

## `git-log-time-stats`

En algún momento voy a consolidar todas las posibles estadísticas que se
podrían obtener con los tiempos registrados en los *commits* de un repo
`git`

## ChangeLog

-   [`2021-03-19 00:43`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/efb8315115f34fd7d285c674a867f9877f69c432)
corregir *link* a `git-repos2org` y agregar links a *gcoop*
-   [`2021-03-18 23:03`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/4d52b7d119c3495ed0fc171ffe620c36a3339992)
agregar *`git commit timesum`*

[^1]: <https://www.gcoop.coop/>

[^2]: <https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-log-time>

[^3]: <https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-log-timesum>

[^4]: <https://osiux.com/git.html>

[^5]: <https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-repos2org>

[^6]: <https://gitlab.com/osiux/txt-bash-jrnl/>
