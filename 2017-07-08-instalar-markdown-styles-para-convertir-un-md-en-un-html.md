---
title: Instalar =markdown-styles= para convertir un =.md= en un =.html=
date: 2017-07-08
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-07-08-instalar-markdown-styles-para-convertir-un-md-en-un-html.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-07-08-instalar-markdown-styles-para-convertir-un-md-en-un-html.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-07-08-instalar-markdown-styles-para-convertir-un-md-en-un-html.gmi) |
[`.html`](https://osiux.gitlab.io/2017-07-08-instalar-markdown-styles-para-convertir-un-md-en-un-html.html)

Luego de una búsqueda por la web, encontré **markdown-styles** [^1] que
permite fácilmente convertir un archivo de **Markdown** al formato
**HTML**.

## Instalar `nodejs` y `markdown-styles` usando `npm`

``` {.example}
# curl -sL https://deb.nodesource.com/setup_8.x | sudo -E  -
# sudo apt-get install -y nodejs
# sudo npm install -g markdown-styles
```

## Ejecución

Es muy simple, lo más básico es indicar un **layout** (que puede ser
personalizado), el directorio de entrada y el directorio de salida

``` {.example}
# generate-md --layout ./layouts/osiux --input ./input --output ./output
```

La generación se ocupa de copiar los **assets**, en mi caso estoy
armando mi layout en base a uno existente

``` {.example}
# generate-md --layout ./layouts/osiux --input ./input --output ./output
Layout: /home/osiris/blog/layouts/osiux
Input: /home/osiris/blog/input
Output: /home/osiris/blog/output
Copy asset file /home/osiris/blog/layouts/osiux/assets/hljs-solarized-dark.min.css => /home/osiris/blog/output/assets/hljs-solarized-dark.min.css
Copy asset file /home/osiris/blog/layouts/osiux/assets/osiux.css => /home/osiris/blog/output/assets/osiux.css
Copy asset file /home/osiris/blog/layouts/osiux/assets/pilcrow.css => /home/osiris/blog/output/assets/pilcrow.css
Copy asset file /home/osiris/blog/layouts/osiux/assets/style.css => /home/osiris/blog/output/assets/style.css
```

Realmente es muy rápido y con muy buen resultado, definitivamente lo voy
a utilizar en mi sistema de micro blog basándome en `txt-bash-jrnl`

[^1]: <https://github.com/mixu/markdown-styles>
