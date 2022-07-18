---
title: pomodoro notify-send
date: 2011-02-03
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/pomodoro-notify-send.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/pomodoro-notify-send.md) |
[`.gmi`](gemini://gmi.osiux.com/pomodoro-notify-send.gmi) |
[`.html`](https://osiux.gitlab.io/pomodoro-notify-send.html)

Hace tiempo vengo utilizando a diario la técnica pomodoro [^1] que me
ayuda a focalizarme en lo que tengo que hacer y no distraerme o
procastinar

`pomodoro-notify`

``` {.bash org-language="sh" results="none" exports="code"}
#!/bin/bash

MM=25

if [ ! -z "$1" ]
then
MM=$1
fi

IMG=~/img/pomodoro/1.png

for i in $(seq $MM -1 0)
do
if [ $i -eq 0 ]
then
notify-send -u critical -i $IMG "Listo!"
exit
fi

if [ $i -le 5 ]
then
notify-send -u critical -i $IMG "Faltan $i:00 minutos!"
else
notify-send -i $IMG "Faltan $i:00 minutos"
fi

sleep 60
done
```

[^1]: <http://osiux.com/la-tecnica-pomodoro.txt>
