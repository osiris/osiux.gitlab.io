---
title: Ejecutar un Shell dentro de Vim
date: 2011-09-30
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2011-09-30-ejecutar-shell-dentro-de-vim.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2011-09-30-ejecutar-shell-dentro-de-vim.md) |
[`.gmi`](gemini://gmi.osiux.com/2011-09-30-ejecutar-shell-dentro-de-vim.gmi) |
[`.html`](https://osiux.gitlab.io/2011-09-30-ejecutar-shell-dentro-de-vim.html)

Ayer alguien preguntó en la [coop](http://gcoop.coop) cómo ejecutar un
shell como una ventana más de Vim, tras una rápida búsqueda por la web
encontramos un excelente plugin llamado
[ConqueTerm](http://conque.googlecode.com), muy fácil de instalar:

``` {.bash org-language="sh" results="none" exports="code"}
cd ~/.vim
wget https://conque.googlecode.com/files/conque_2.3.vmb
vim conque_2.3.vmb
:so %
:q
```

Para abrir una ventana con una terminal basta con ejecutar:

``` {.example}
:ConqueTermSplit bash
```

También se puede invocar a otras aplicaciones:

``` {.example}
:ConqueTermSplit top
```

Terminé agregando un alias a mi `.vimrc`:

``` {.example}
nmap ,c :ConqueTermSplit bash<CR>
```

De esta manera cada vez que necesito usar `bash` y no quiero salir de
Vim, basta con pulsar `,c`. En breve publico todos mis archivos de
configuración. :-)
