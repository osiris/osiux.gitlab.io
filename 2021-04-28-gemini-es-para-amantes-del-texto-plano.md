---
title: =gemini://= es para amantes del texto plano
date: 2021-04-28
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-04-28-gemini-es-para-amantes-del-texto-plano.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-04-28-gemini-es-para-amantes-del-texto-plano.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-04-28-gemini-es-para-amantes-del-texto-plano.gmi) |
[`.html`](https://osiux.gitlab.io/2021-04-28-gemini-es-para-amantes-del-texto-plano.html)

## solo quiero texto plano

Hace un par de días que estoy leyendo todo sobre `gemini` [^1], un
protocolo que nos retrotrae a los comienzos de la web por su simpleza y
pureza de permitir única y exclusivamente una web en texto plano con
pocos *tags* y evitando distraernos con imágenes, animaciones, css y
*javascript* :P

## *server*

Hay en diversos lenguajes, yo opté por `agate` [^2] y es muy simple de
iniciarlo:

``` {.bash exports="code"}
./agate --content ~/gemini/ --hostname gmi.osiux.com --lang es-AR

```

Por defecto el puerto es 1965, por esto sería posible *hostear* `http` y
`gemini` en un mismo *server* aunque de momento lo estoy probando en el
subdominio `gemini://gmi.osiux.com` en mi *raspberry-pi*.

## *client*

Hay muchísimos de clientes, obviamente siempre voy a preferir desde
consola usar `amfora` [^3] y si preferís `lagrange` [^4] es muy *monono*
paradel *desktop* pero también esta `ariane` [^5] y `deedum` [^6] para
*Android*.

Encontré a `bollux` [^7] que es un cliente escrito en *BASH* y viendo el
código aprendí que es muy simple ver una *url* en un *oneliner* de
`openssl`:

``` {.bash exports="code"}
openssl s_client -crlf -quiet -connect gmi.osiux.com:1965 \
--servername gmi.osiux.com -no_ssl3 -no_tls1 -no_tls1_1 \
<<< gemini://gmi.osiux.com/gemini-es-para-amantes-del-texto-plano.gmi

```

[![](https://osiux.com/tmb/gemini-amfora-vs-lagrange.png)](https://osiux.com/img/gemini-amfora-vs-lagrange.png)

## `org2gmi`

Esta claro que lo primero que se me ocurrió fue convertir mi *blog* en
un formato para amantes del texto plano \<3, aunque a decir verdad ya
esta bastante cerca, pero siempre se puede simplificar aún mas!

Inicialmente busqué y encontré a `ox-gemini` [^8] un *plugin* para
`org-mode` que permite exportar de a `.gmi`, pero no logré que funcione
:(

Luego di con `md2gemini` [^9] que convierte un *markdown* a `.gmi` asi
que con esa base, escribí un *script* que lee un `.org`, lo masajea un
poco y con `pandoc` [^10] genera un `.md` y finalmente el `.gmi` :)

Todavía falta pulirlo bastante a `org2gmi` [^11] porque hay mucho que no
es necesario en *gemini* en cuanto a formato y además la navegación
cambia porque se simplifica.

## *links* `gmi`

Estoy comenzando a recopilar *links* de sitios `gemini`, mayormente se
trata de *blogs* que dan mucho placer leerlos, tienen mucho para
compartir de esa grata experiencia de leer únicamente texto plano y
pronto compartiré mi selección...

## ChangeLog

-   [`2021-04-29 01:05`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/de270d9c871a98da8a43ed00cc73c786d19da57e)
agregar `gemini://` es para amantes del texto plano

[^1]: <https://gemini.circumlunar.space/>

[^2]: <https://github.com/mbrubeck/agate>

[^3]: <https://github.com/makeworld-the-better-one/amfora>

[^4]: <https://github.com/skyjake/lagrange>

[^5]: <https://codeberg.org/oppenlab/Ariane>

[^6]: <https://github.com/snoe/deedum>

[^7]: <https://tildegit.org/acdw/bollux>

[^8]: <https://github.com/emacsmirror/ox-gemini>

[^9]: <https://github.com/makeworld-the-better-one/md2gemini>

[^10]: <https://pandoc.org/>

[^11]: <https://gitlab.com/osiux/org-bash-utils/-/blob/e1311a395fc41cbcfc16798a6ee083bbee4f0734/org2gmi>
