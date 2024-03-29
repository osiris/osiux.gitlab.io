---
title: cómo usar /GitLab/ desde la línea de comandos
date: 2022-08-21
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-08-21-howto-use-gitlab-from-command-line.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2022-08-21-howto-use-gitlab-from-command-line.md) |
[`.gmi`](gemini://gmi.osiux.com/2022-08-21-howto-use-gitlab-from-command-line.gmi) |
[`.html`](https://osiux.gitlab.io/2022-08-21-howto-use-gitlab-from-command-line.html)

[![](https://osiux.com/tmb/gitlab-bash-utils.jpg)](https://osiux.com/img/gitlab-bash-utils.jpg)

Hace varios años que utilizo *GitLab*, pero recién hace 4 meses que
comencé a utilizar los *issues* y como no podía ser de otra manera, opté
por buscar la manera de integrarlo a la consola, porque hasta ahora no
era mas que un repositorio `git` con permisos administrables.

## `glab` vs `gl`

Encontré `glab` [^1] que es una *CLI* de *GitLab* para usar desde la
terminal, y si bien es muy completa [^2], me topé con una dificultad y
es que necesitaba utilizar una instancia de *GitLab* detrás de una *VPN*
dentro de una red aislada de *INET* y por ello, en principio no había
manera de llegar directamente, o al menos no encontré como configurar a
`glab`.

Se me ocurrió hacer un *wrapper* llamado `gl` que esencialmente solo
habilitaba el uso de la variable `https_proxy` y mediante `LocalForward`
de `ssh` pude redireccionar un puerto local `127.0.0.1:3128` a un *Proxy
HTTP* que puede llegar a la instancia de *GitLab*

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
localhost -> vpn -> proxy-http -> gitlab

```

Con el pasar de los días, fui generando una serie de *scripts* que
simplificaban y/o permitían automatizar a `glab` extendiendo de cierta
manera su funcionalidad con el comando `gl`, el cual es invocado desde
muchos comandos específicos, algunos muy simples, pero que ayudan a usar
la misma metodología e integrar *GitLab* con otras *tools* propias.

## Registrando tiempos

La primer necesidad a cubrir fue el registro de tiempos de cada *issue*,
algo que anteriormente al usar *Redmine* [^3] había resuelto con
`redmine-bash-utils` [^4] y ahora daría origen a `glab-bash-utils` [^5]

Si bien *GitLab* utiliza el formato `/spend 00h25m`, mi *script*
`gl-issue-spend` espera recibir el formato `00:25` y obviamente lo
convierte, el porqué?, es simple, desde el 2008 que a todos mis
*commits* en la última línea del mensaje agrego el tiempo que tardé, de
la siguiente manera `@ 00:25 hs`, entonces puedo usar *pipe* `|` para
recuperar el tiempo registrado en el *commit* e enviárselo a *GitLab*.

Ejemplo:

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
# git log -1

commit 6b3f0285abe9847124b17c2f9c4523f6caa01df4
Author: OSiRiS <osiris@gcoop.coop>
Date:   Sat Aug 20 11:21:33 2022 -0300

gl-config: add GL_DEFAULT_REVIEWER: admin as config example

@ 00:01 hs

# git log -1 | gl-issue-spend 14

send /spend 01m to 14

```

Trabajar con formato `hh:mm` permite fácilmente hacer operaciones de
suma y resta de tiempos.

## Integrando con `jrnl`

Desde 2017 que utilizo `jrnl` [^6] para registrar el desarrollo de cada
tarea, a veces es un simple *paste* luego del *copy*, pero muchas veces,
hay un paso a paso muy detallado y ordenado que vale la pena compartirlo
en forma de comentario de un *issue* y como ahí tengo registrado el
tiempo invertido, es muy fácil enviarlo a *GitLab* y en este caso ni
siquiera debo indicar el *ID* del *issue* porque ya es parte del
*header* del *journal*, entonces basta con ejecutar

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
jv | glin

```

-   `jv` es un *alias* de `jrnl view`
-   `glin` es un *alias* de `gl-issue-note`

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
jv

2022-08-20 15:40 @gcoop-libre gitlab-bash-utils#14 gl-mr-new: set reviewer with default reviewer or assignee when default is empty

@ 00:01 hs
```

Un flujo común de trabajo usando `jrnl` y `gl` es el siguiente:

*command*     *task*
------------- ------------------------------------------------------------------
`jngi 14`     se crea *journal* desde *issue* 14 de *GitLab*
`jt`          se termina de trabajar en el *journal* y se registra duración
`jv ¦ glin`   se envía comentario y tiempo a *GitLab* desde el útimo *journal*
`gl ic 14`    se cierra el *issue* 14

## *Issues*

Ahora para crear *issues* no necesito utilizar *Firefox*, lo puedo hacer
desde *BASH* invocando a `gl-issue-new` (o usando el *alias* `gliw`) de
la siguiente manera:

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
gl-issue-new 'publish first public version' 'commit actual state of scripts art'

- Creating issue in gcoop-libre/gitlab-bash-utils
#1 publish first public version (less than a minute ago)
https://gitlab.com/gcoop-libre/gitlab-bash-utils/-/issues/1

```

## Un *MR* por cada *Branch*

Una gran utilidad de *GitLab* es crear un *MR* por cada *Branch* para
poder realizar una revisión de código antes de terminar un *feature*,
*hotfix* o un nuevo *release* y utilizando `gl-mr-new` basta con indicar
el *ID* del *issue* y el *MR* se crea con una serie de valores por
defecto que aceleran la operatoria:

*item*            *value*
----------------- -----------------------------------------------------------
`target_branch`   *develop*
`source_branch`   *current branch*
`assignee`        value defined `GL_DEFAULT_ASSIGNEE` in `~/.gl-config`
`lables`          *wip*
`title`           value defined in related `ISSUE_ID`
`description`     checkbox with link of value defined in related `ISSUE_ID`

## *alias* de `glab` vs *alias* de `gl`

El comando `glab` permite definir alias en el archivo
`~/.config/glab-cli/aliases.yml`, y los que definí son los siguientes:

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
ci: pipeline ci
co: mr checkout
ic: issue close
il: issue list
in: issue note
iu: issue update
iv: issue view
iw: issue new
ma: mr approve
mc: mr close
ml: mr list
mv: mr view
my: mr ready

```

Entonces si tipeo `gl ic 14` voy a cerrar el *issue 14*.

En cambio para el comando `gl`, los alias se definen en `gl-src-alias` y
entonces si tipeo `glic 14` el resultado es el siguiente:

``` {.bash org-language="sh" session="yes" results="none" exports="code"}
- [ ] gl-mr-new: set reviewer with default reviewer or assignee when default is empty [gitlab-bash-utils#14](https://gitlab.com/gcoop-libre/gitlab-bash-utils/-/issues/14)

```

Obtengo un *checkbox* del *issue* 14 con su descripción un *link* en
formato *Markdown*, ésto me resulta muy útil para organizarme al
registrar estado de las tareas en una minuta.

## Hay un alias para casi todo!

script                   alias    description
------------------------ -------- ------------------------------------------------------------------------
`gl-ci-lint`             `glcl`   Validate `.gitlab-ci.yml`
`gl-issue-check`         `glic`   Get issue URL link in Markdown format with checkbox
`gl-issue-jrnl`          `glij`   Get Issue group and project *ID* with title for `jrnl`
`gl-issue-link`          `glik`   Get the issue title with the *URL* link in *Markdown* format
`gl-issue-list`          `glil`   Get the issue title with *URL* link in *Markdown* as a list item
`gl-issue-new`           `gliw`   Create issue with defaults defined in `~/.gl-config`
`gl-issue-note`          `glin`   Insert note in *Issue* converting hh:mm time format into `/spend` time
`gl-issue-spend`         `glis`   Insert `/spend` time in *Issue* converting from `hh:mm` time format
`gl-issue-title`         `glit`   Get title of Issue
`gl-issue-url`           `gliu`   Get *URL* of Issue
`gl-mr-check`            `glmc`   Get *MR* *URL* link in *Markdown* format with checkbox
`gl-mr-jrnl`             `glmj`   Get *MR* group and project *ID* with title for `jrnl`
`gl-mr-link`             `glmk`   Get the *MR* title with the *URL* link in *Markdown* format
`gl-mr-new`              `glmw`   Create *MR* with default values defined in `~/.gl-config`
`gl-mr-note`             `glmn`   Insert note in *MR* converting `hh:mm` time format into `/spend` time
`gl-mr-spend`            `glms`   Insert `/spend` time in *MR* converting from `hh:mm` time format
`gl-mr-title`            `glmt`   Get title of *MR*
`gl-mr-url`              `glmu`   Get *URL* of *MR*
`gl-notifications-get`   `glnu`   Get *User* notification level defined in *GitLab*
`gl-prj-list`            `glpl`   List all *projects* in *GitLab* for current user
`gl-src-check`           `glsk`   Check syntax using shellcheck and group errors by code
`gl-src-help`            `glsh`   Generate Markdown Help
`gl-src-table`           `glst`   Generate Markdown Table Overview

## *Releases*

El 2022-08-04 liberé la primer versión pública con el *tag* `v0.1.0` y
desde entonces, acepto sugerencias y parches, aunque ya registré varios
*issues* [^7] por resolver sigo trabajando en mejoras a medida que las
voy necesitando.

## Seguro te interesará leer

-   [tarea en progreso](2021-03-28-tarea-en-progreso)
-   [git commit timesum](2021-03-18-git-commit-timesum)

## ChangeLog

-   [`2022-10-11 10:05`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/0b200766813009e7d95a63f31e8e48930d7baae4)
agregar cómo usar *GitLab* desde la línea de comandos

[^1]: <https://gitlab.com/gitlab-org/cli>

[^2]: <https://glab.readthedocs.io/en/latest/>

[^3]: <https://redmine.org/>

[^4]: <https://gitlab.com/osiux/redmine-bash-utils>

[^5]: <https://gitlab.com/osiux/gitlab-bash-utils>

[^6]: <https://gitlab.com/osiux/txt-bash-jrnl>

[^7]: <https://gitlab.com/gcoop-libre/gitlab-bash-utils/-/issues>
