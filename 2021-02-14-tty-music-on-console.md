---
title: =tty= /Music On Console/
date: 2021-02-14
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-14-tty-music-on-console.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-14-tty-music-on-console.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-02-14-tty-music-on-console.gmi) |
[`.html`](https://osiux.gitlab.io/2021-02-14-tty-music-on-console.html)

[![](https://osiux.com/tmb/tty-music-on-console.png)](https://osiux.com/img/tty-music-on-console.png)

## *Music On Console*

Amo la consola, tty, terminal o emulador de terminal en todas sus
formas, la interfaz de texto es la interfaz universal, simple, rápida y
muy portable y por esto nada mejor que reproducir música en modo texto.

Luego de probar varios reproductores, hace años que me quedé con el
mejor, estoy hablando `mocp` [^1] *`Music On Console`*, principalmente
porque se basa en el uso de directorios y archivos, cuenta con toda las
funcionalidades que esperas de un reproductor y se queda en segundo
plano si no querés verlo :P

## *DJ*

Jugando a ser *DJ* desde la `tty`, para complementar la visualización,
usando `tmux` [^2], dividí en varios paneles la ventana y agregué
`pulsemixer` [^3] para manejar volumen y `cava` [^4] para tener una
hermosa barra de espectro de audio.

### `pulsemixer`

Es muy simple de instalar, desde los repositorios de *Debian*.

``` {.bash org-language="sh" exports="code"}
apt install pulsemixer

```

### `cava`

Si bien `cava` originalmente era para *ALSA*, funciona muy bien con
*PulseAudio* y la instalación desde el código fuente es muy simple:

``` {.bash org-language="sh" exports="code"}
git clone https://github.com/karlstav/cava
cd cava
apt install libfftw3-dev libasound2-dev libncursesw5-dev \
libpulse-dev libtool automake libiniparser-dev
export CPPFLAGS=-I/usr/include/iniparser
./autogen.sh
./configure
make
make install

```

### `tmux`

Para integrar `mocp`, `pulsemixer` y `cava` uso un *script bash* para
dividir una sesion de `tmux` en varios paneles:

``` {.bash org-language="sh" exports="code"}
#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2016 Osiris Alejandro Gomez <osiux@osiux.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

cd "$HOME/music"

tmux ls | grep moc >/dev/null 2>/dev/null
OK=$(echo $?)

if [[ "$OK" -ne 0 ]]
then
tmux new-session -d -s moc '/usr/bin/mocp'
tmux select-window  -t moc:0
tmux split-window   -v '/usr/bin/pulsemixer'
tmux split-window   -v '/usr/local/bin/cava'
fi

tmux a -t moc

```

### `osiux.tty-music`

Tengo a medio terminar un rol de *Ansible* que además de instalar y
configurar `mocp`, `pulsemixer` y `cava`, incluye otras utilidades para
música y audio desde la consola, en breve estaré publicando el rol...

## ChangeLog

-   [`2021-02-14 12:05`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/f2bf6f7c39e77cff5c3dc0029a07abd457eee7be)
agregar `tty` *Music On Console*

[^1]: <https://github.com/jonsafari/mocp>

[^2]: <https://osiux.com/tmux-terminator-awesome.html>

[^3]: <https://github.com/GeorgeFilipkin/pulsemixer>

[^4]: <https://github.com/karlstav/cava>
