---
title: generar sección =git= mediante =git-repos2org=
date: 2021-02-05
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-05-git-repos2org.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-05-git-repos2org.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-02-05-git-repos2org.gmi) |
[`.html`](https://osiux.gitlab.io/2021-02-05-git-repos2org.html)

## Compartir es Bueno!

Así como [comparto mis favoritos](2021-01-29-bookmarks-vs-links) en
[`links`](links), hace tiempo que tenía ganas de compartir un
listado consolidado de mis repositorios `git`.

Inicialmente cuento con un extenso listado de todos los *repos* `git`
que en algún momento me resultaron interesantes, pero creo que es tan
extenso y desordenado que de momento me voy a ocupar únicamente de
aquellos proyectos donde metí varios *commits*, muchos *repos* son de
mis proyectos personales y otros tantos de los proyectos que desarrollé
mayormente en [gcoop Cooperativa de Software
Libre](https://www.gcoop.coop/) (donde trabajo desde el 2007).

## `git-repos`

Llevo un par de años almacenando el listado de repositorios `git` en un
archivo `.git-repos`, originalmente contaba con uno solo en mi `home`
pero hace un par de semanas decidí adaptar el *script*
[`git-repos`](https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-repos)
con el que administro el uso de todos los repositorios ya que de esta
manera me brinda mayor flexibilidad, sobre todo para segmentar y
priorizar los repositorios mas importantes a la hora de [recuperarme de
un desastre](2021-01-26-disaster-recovery-plan-osiux).

## `git-repos2org`

Generar una [página `git`](git) fué muy fácil, usando el *script*
[`git-repos2org`](https://gitlab.com/osiux/git-bash-utils/-/raw/master/git-repos2org)
y me compré varias tareas para hacer en cada *repo*:

-   \[ \] agregar un archivo `description`
-   \[ \] implementar `git-flow` y generar al menos un *release*
-   \[ \] publicar repositorios que solo existen en mi `localhost`
-   \[ \] verificar que existan *mirrors* en *gitlab* y en *github*
-   \[ \] asegurar que existe un `README` básico

Obviamente me va a llevar un tiempo, pero al menos ahora puedo
visualizar el problema gracias a consolidar el listado!

## tal vez te interese leer

-   [disaster recovery plan
OSiUX](2021-01-26-disaster-recovery-plan-osiux)
-   [sincronizar repositorios
git](2015-01-14-sincronizar-repositorios-git-repos)
-   [las cooperativas construyen un mundo
mejor](2012-02-17-las-cooperativas-construyen-un-mundo-mejor)

## ChangeLog

-   [`2021-02-05 02:55`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/59d3cad9c12311a578328423d99f83f68b7aad51)
agrego generar sección `git` mediante `git-repos2org`
