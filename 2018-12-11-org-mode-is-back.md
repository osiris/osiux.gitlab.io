---
title: Org-mode is back!
date: 2018-12-11
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-12-11-org-mode-is-back.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-12-11-org-mode-is-back.md) |
[`.gmi`](gemini://gmi.osiux.com/2018-12-11-org-mode-is-back.gmi) |
[`.html`](https://osiux.gitlab.io/2018-12-11-org-mode-is-back.html)

## Un reencuentro desvelado

Otra noche difícil de dormir y luego de webear un rato termino
recordando que hace mucho que no posteo nada en mi olvidado blog y como
era de esperar me encuentro con archivos sin commitear, algún que otro
duplicado, algo a medio comenzar y una variedad de tipo de archivos y
como **Déjà vu** recuerdo cómo comenzó este blog **Migrando de frontweb
a Org-mode** [^1], pasando por **reStructuredText** [^2], luego
**Org-mode** [^3], mas recientemente **Markdown** [^4] y esta noche otra
vez volviendo a un `.org`, luego un par de años de abandonar **EMACS**
[^5] por el primer amor que ****Vi**** [^6] :P

## La herramienta no tiene la culpa

Era el título de un artículo que recuerdo vagamante comenzar a tipear en
algún momento de este año (o el anterior?), es que hace mucho que tengo
abandonado el blog, pero más concretamente, he abandonado ese
sensacional momento de sentarse un rato a escribir algo para uno mismo,
con la excusa de querer compartir algo con el mundo.

Por un momento, culpé a la herramienta, si es que de developer pasé a
sysadmin a tiempo completo, saltando de un server a otro (como un ninja
de la consola) y dejando de vivir en un editor de texto, esto me obligó
a encontrar la manera de documentar velozmente y para ello creé `jrnl`
[^7], el cual utilizo casi todo el día, pero al intentar adaptarlo para
usarlo para este blog, por más que haya logrado resolverlo técnicamente
(aún con la implementación de **Markdown** y unos **bash** scripts), el
problema de no postear seguido no se trataba de la herramienta, yo no
sirvo para el micro-bloging, claramente no tengo poder para resumir,
mayormente mis publicaciones son extensas y detalladas y es porque
disfruto hacerlo y me tomo mi tiempo para ello (bueno hace un par de
años que no lo hago).

## Org-mode

Volver fue extremandamente fácil, solo basta con clonar el repo y
compilar:

``` {.commonlisp org-language="emacs-lisp" exports="code"}
git clone https://code.orgmode.org/bzg/org-mode.git
cd org-mode
make
make autoloads
```

Y luego agregar en `~/.emacs`:

``` {.commonlisp org-language="emacs-lisp" exports="code"}
(add-to-list 'load-path "~/git/org/org-mode/lisp")
(add-to-list 'load-path "~/git/org/org-mode/contrib/lisp" t)
```

Listo! A tipear y exportar a `.html` presionando `C-c C-e h h` ... y
claro, reconvertir los malditos `.md` a `.org` :S

## Disclaimer

-   volver fue muy fácil porque recuerdo casi todas las combinaciones de
teclas (en EMACS es extremandamente importante!)

-   puede que todo esto sea otra típica promesa de fin de año! :)

[^1]: <file:2013-02-01-migrando-de-frontweb-a-org-mode.org>

[^2]: <http://docutils.sourceforge.net/docs/user/rst/quickstart.html>

[^3]: <http://orgmode.org>

[^4]: <https://commonmark.org/help/>

[^5]: <https://www.gnu.org/software/emacs/>

[^6]: <https://www.vim.org/>

[^7]: <file:2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.org>
