---
title: Realizar un /profile/ en =vim= y deshabilitar =Foldexpr_markdown=
date: 2018-08-15
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-08-15-realizar-un-profile-en-vim-y-deshabilitar-foldexpr-markdown.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-08-15-realizar-un-profile-en-vim-y-deshabilitar-foldexpr-markdown.md) |
[`.gmi`](gemini://gmi.osiux.com/2018-08-15-realizar-un-profile-en-vim-y-deshabilitar-foldexpr-markdown.gmi) |
[`.html`](https://osiux.gitlab.io/2018-08-15-realizar-un-profile-en-vim-y-deshabilitar-foldexpr-markdown.html)

Hace unos días que vengo notando que `vim` se cuelga o al menos tarda
demasiado al pegar texto.

Al principio pensaba que tenía que ver con `tmux`, por estar copiando y
pegando texto desde el *buffer* de `tmux`.

Pero luego comprobé que al pegar en `mcedit` esto no pasaba, e
investigando cuál podría ser el problema descubrí dos cosas:

## Cómo realizar un *profile* [^1] en `vim` para detectar dónde esta la lentitud

Para iniciar el profile:

``` {.example}
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
```

Para visualizar rápidamente que fue lo más lento:

``` {.example}
# awk '{print $2,$3}' profile.log  | grep -v total | grep -v SORTED | sort -nr | head
```

:

``` {.example}
27.629469 Foldexpr_markdown()
27.629469 Foldexpr_markdown()
1.671386 if
1.395355 if
1.186143 if
1.162478 if
1.044769 let
0.997596 let
0.834278 let
0.661260 if
```

## el plugin vim-markdown es lento

Encontré que el plugin *vim-markdown* tiene un *bug* [^2] y se puede
deshabilitar la función `Foldexpr_markdown()` fácilmente agregando al
`.vimrc` la siguiente línea:

``` {.example}
let g:vim_markdown_folding_disabled=1
```

Luego volví a repetir el mismo pegado y en el nuevo *profile* ya no
apareció la función `Foldexpr_markdown` y fue muy rápido:

``` {.example}
# awk '{print $2,$3}' markdown.log  | grep -v SORTED | grep -v total | sort -nr | head
```

:

``` {.example}
0.035887 0.000680
0.035887 0.000680
0.035855 0.002342
0.035855 0.002342
0.035534 0.000327
0.035207 <SNR>94_MarkdownHighlightSources()
0.035207 <SNR>94_MarkdownHighlightSources()
0.032944 0.000331
0.031879 0.000077
0.031723 0.000280
```

[^1]: <https://stackoverflow.com/questions/12213597/how-to-see-which-plugins-are-making-vim-slow>

[^2]: <https://github.com/plasticboy/vim-markdown/issues/162>
