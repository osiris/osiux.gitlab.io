---
title: Diagramas de Topología de Red =csv2nwdiag=
date: 2021-03-03
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-03-diagramas-de-topologia-de-red-csv2nwdiag.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-03-diagramas-de-topologia-de-red-csv2nwdiag.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-03-03-diagramas-de-topologia-de-red-csv2nwdiag.gmi) |
[`.html`](https://osiux.gitlab.io/2021-03-03-diagramas-de-topologia-de-red-csv2nwdiag.html)

[![](https://osiux.com/tmb/csv2nwdiag-vms-prd-vms-stg.png)](https://osiux.com/img/csv2nwdiag-vms-prd-vms-stg.png)

## dibujar una red desde un `csv`

Cuando tenés varios `hosts` y necesitás aislarlos en varias `subnets`,
se vuelve necesario graficarlos, cuando más `hosts`, mas `subnets` y por
lo general ****mas lío**** y ni hablar si contás con varias `WANs` y
otras redes de administración, monitoreo, backup, etc...

Gracias a `nwdiag` esto es tarea fácil y hace un par de años hice un
*script* que convierte un `.csv` a un archivo `.diag` para luego generar
un `.png` de manera automatizada.

Voy a documentar diferentes ejemplos y liberar `csv2nwdiag`...

...continuará...

Se puede usar `nwdiag` desde un *`sitio web`* [^1] de manera interactiva
sin necesidad de instalarlo.

## ChangeLog

-   [`2021-03-31 12:56`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/4678ba05e3917b84be661aab288f66b89cbb7f12)
agregar *link* a sitio web interactivo de `nwdiag`
-   [`2021-03-03 23:27`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/8b2b415357bedcd20c7a7e45b5c4343f7c2487f5)
agregar *Diagramas de Topología de Red* `csv2nwdiag`

[^1]: <http://interactive.blockdiag.com/nwdiag/>
