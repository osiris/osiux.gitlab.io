---
title: redes abiertas versus redes cerradas
date: 2012-03-05
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2012-03-05-redes-abiertas-versus-redes-cerradas.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2012-03-05-redes-abiertas-versus-redes-cerradas.md) |
[`.gmi`](gemini://gmi.osiux.com/2012-03-05-redes-abiertas-versus-redes-cerradas.gmi) |
[`.html`](https://osiux.gitlab.io/2012-03-05-redes-abiertas-versus-redes-cerradas.html)

Estuve jugando un poco con varios **APs** (Access Points) y luego de un
par de minutos de **scannear** las redes que me rodean se me ocurrió
graficarlas!

Como de costumbre la herramienta elegida fue
[graphviz](http://graphviz) y salió bastante bien, comparto la
imagen:

![](img/aps-2012-03-05.gif)

A medida que la señal disminuye los **SSIDs** (nombres) se alejan del
centro (mi nodo) y el tamaño de la fuente se reduce.

Como se puede apreciar, lamentablemente no abundan las redes abiertas,
por el contrario, escasean y lo peor de todo es que muy pocas asignan
`IP` por `DHCP` y cuentan con **cero contenido**, algunos pocos dan el
servicio de salir a **INET**.

Obviamente la excepción son los pocos nodos de **BuenosAiresLibre**
[^1]. Sería interesante poder revertir esta situación y lograr que los
309 equipos listados sean cada uno parte de una **red libre, abierta y
comunitaria**, donde todos podríamos sacar provecho de la misma, dejando
de estar aislados y cerrados con la comunidad que nos rodea.

Invito a todos a capturar su zona y ver en un par de meses o años si el
gráfico se torna más verde que rojo.

Solo hace falta generar un archivo que contenga SSID, MAC, estado
(abierta o cerrada) y el nivel de señal, como por ejemplo

``` {.example}
FT9081668   e0:cb:4e:61:4a:0f   6 (B+G)     AP  yes     50
ACOYTE  98:fc:11:d1:45:d1   9 (B+G)     AP  yes     44
mesh.buenosaireslibre.org   f8:d1:11:7a:61:b2   1 (B+G)     Ad hoc  no  35
```

Y luego ejecutar el script
[aps2dot](https://github.com/osiris/aps2dot/blob/master/aps2dot) de la
siguiente manera:

``` {.bash org-language="sh" results="none" exports="code"}
./aps2dot.sh >aps.dot;neato -Tpng aps.dot >aps.png
```

Esta disponible el código fuente en un repositorio git:

-   <https://github.com/osiris/aps2dot>

Se aceptan sugerencias a osiux\@buenosaireslibre.org

Y acordate, **si en tu barrio no hay un nodo libre, es porque **vos** no
lo hiciste!**

[^1]: <http://buenosaireslibre.org>
