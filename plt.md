---
title: OSiUX gnuplot
date: 2022-07-18
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/plt.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/plt.md) |
[`.gmi`](gemini://gmi.osiux.com/plt.gmi) |
[`.html`](https://osiux.gitlab.io/plt.html)

## lo bueno y lo malo de `gnuplot`

La buena es que `gnuplot` [^1] es super rápido para generar todo tipo de
gráficos de funciones, en 2d y 3d, desde la línea de comandos, la mala
es que **NO tiene nada que ver con el** *`proyecto GNU`* [^2] y **su
licencia no es** *`GPL`* [^3] `:(`

La licencia es `gnuplot` license y permite redistribuir libremente sin
modificaciones! `:|`

## `gnuplot` *oneliners*

En muchas oportunidades, necesito ver un gráfico de algo que esta
sucediendo en tiempo real, para esto suelo recurrir a procesar algun log
de sistema o de aplicación y mediante comandos de `gnuplot` en línea, es
decir, sin generar un archivo `.plt`, rápidamente visualizar el `.png`.

### `plot12i`

Supongamos que quisiera saber, qué días y cuántas veces utilicé el
comando `ssh` en el 2019 ? Yo guardo un en un log diario de todos los
comandos que uso, entonces solo tendría que buscar por `ssh`, quedarme
con la fecha, ordenar el listado, obtener la cantidad de comandos por
día y finalmente enviarle todos estos datos a mi alias `plot12i`, que se
ocupará de graficar la 2da columna con `impulsos`

``` {.bash org-language="sh" exports="code"}
grep -hw ssh 2019*.log | awk '{print $1}' | sort | uniq -c  | awk '{print $2,$1}' | plot12i

```

[![](https://osiux.com/tmb/plot12i-ssh-2019.png)](https://osiux.com/img/plot12i-ssh-2019.png)

``` {.bash org-language="sh" eports="code"}
alias plot12i="gnuplot -p -e \"load '~/bin/osiux.plt';set xdata time;set timefmt '%Y-%m-%d';set format x '%Y/%m';plot '-' u 1:2 w i ls 1 \" > /tmp/plt.png && pqiv -i /tmp/plt.png"

```

## galería de archivos `.plt`

Desde mis comienzos en el mundo `GNU/Linux` adopté `gnuplot` porque me
permite automatizar fácilmente la generación de gráficos, solo es
necesario crear un archivo `.plt` con las definiciones y éste se ocupará
de leer y procesar los datos de uno o mas archivos de datos `.dat` para
obtener un bonito `.png`

### [visualizando `org-mode` con `gnuplot`](visualizando-org-mode-con-gnuplot)

Si bien, hoy día ya no uso `org-mode` [^4] para cronometrar tareas, y en
su lugar utilizo `jrnl` [^5], la generación del gráfico fue todo un
desafío y es reutilizable, asi que tengo pendiente adaptarlo, mientras
se puede aprender a realizar este tipo de gráficos.

[![](https://osiux.com/tmb/org-task-by-day-2011.png)](file:visualizando-org-mode-con-gnuplot.org)

... continuará ...

[^1]: <http://gnuplot.info/>

[^2]: <https://es.wikipedia.org/wiki/Proyecto_GNU>

[^3]: [https://es.wikipedia.org/wiki/Licencia\_Pública\_General\_de\_GNU](https://es.wikipedia.org/wiki/Licencia_Pública_General_de_GNU)

[^4]: <https://orgmode.org/>

[^5]: <https://2018-01-01-reemplazando-orgmode-por-txt-bash-jrnl.html>
