---
title: sslh ssl ssh shellinabox
date: 2012-07-05
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2012-07-05-sslh-ssl-ssh-shellinabox.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2012-07-05-sslh-ssl-ssh-shellinabox.md) |
[`.gmi`](gemini://gmi.osiux.com/2012-07-05-sslh-ssl-ssh-shellinabox.gmi) |
[`.html`](https://osiux.gitlab.io/2012-07-05-sslh-ssl-ssh-shellinabox.html)

Como todo amante de `*UNIX` siempre quiero tener un
`shell/terminal/consola/ssh` disponible y desde hace mucho que vengo
usando `ajaxterm` [^1], pero ayer descubrí `shellinabox` [^2] que
funciona mucho mejor. Lo combiné con `sslh` [^3] que multiplexa un
puerto en varios analizando el header del protocolo utilizado, de esta
manera puedo loguearme usando `SSL` desde un browser mediante `HTTPS` e
ingresar a un shell y también tengo la posibilidad de ingresar
directamente por el puerto 443 mediante de ssh en los casos que esté
filtrado y no haya un IDS, de cualquier manera siempre tengo `ssh`
disponible :-D

Diagrama de conexión::

``` {.example}
+--------+   +---+   +----------------+
----->|443/sslh|-->|ssl|-->|4200/shellinabox|
+---+----+   +---+   +----+-----------+
|                     |
|        +---+        |
+------->|ssh|<-------+
+---+
^
|
|
```

[^1]: <http://antony.lesuisse.org/software/ajaxterm/>

[^2]: <https://code.google.com/p/shellinabox/>

[^3]: <http://www.rutschle.net/tech/sslh.shtml>
