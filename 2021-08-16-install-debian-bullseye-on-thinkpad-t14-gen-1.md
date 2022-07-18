---
title: /Install Debian Bullseye on ThinkPad T14 Gen 1/
date: 2021-08-18
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-08-16-install-debian-bullseye-on-thinkpad-t14-gen-1.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-08-16-install-debian-bullseye-on-thinkpad-t14-gen-1.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-08-16-install-debian-bullseye-on-thinkpad-t14-gen-1.gmi) |
[`.html`](https://osiux.gitlab.io/2021-08-16-install-debian-bullseye-on-thinkpad-t14-gen-1.html)

## Lunes de gloria

Hace exactamente 188 días atrás (2021-02-09) instalé *Debian Buster* por
primera vez en mi nueva *notebook ThinkPad T14 Gen 1* [^1] y hoy estrené
*Debian Bullseye* :)

## ...antes de empezar, hay backup?

Antes que nada hice un *backup* completo de `tequila` (mi *notebook*) y
luego procedí a descargar la `netinstall` [^2] porque permite instalar
****únicamente lo que necesito y nada más****.

## Partición siempre disponible!

Como siempre, cuento con 2 particiones del mismo tamaño destinadas al
*Sistema Operativo*, una para la versión *stable* y otra para probar una
nueva versión o incluso usarla de contingencia si por algún motivo rompí
la *stable* y tengo que salir rápidamente a volver a instalar.

``` {.example}
Model: SAMSUNG MZVLB512HBJQ-000L7 (nvme)
Disk /dev/nvme0n1: 512GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name          Flags
1      1049kB  1000MB  999MB   fat32        EFI           boot, esp
2      1000MB  2001MB  1000MB  ext4         BOOT
3      2001MB  52,0GB  50,0GB               LUKSDEBIAN10
4      52,0GB  102GB   50,0GB               LUKSDEBIAN11
5      102GB   512GB   410GB                LUKSDATA

```

## todos los paquetes en un solo *script*

Durante la instalación en *Selección de Programas*, selecciono
únicamente `SSH server` y `Utilidades estándar del Sistema`, asi al
iniciar no hay entorno gráfico ni aplicaciones innecesarias.

Luego descargo el *script* `deb.sh` [^3] y basta dejarlo corriendo para
tener casi todo lo mismo que tenía antes!

``` {.bash org-language="sh" exports="code"}
./deb.sh -tux

```

En breve estaré liberando una nueva versión de `deb.sh` que tenía dando
vueltas y que aproveché esta ocasión para mejorarlo.

Si bien son muy pocos los paquetes que ya no estan en *Debian Bullseye*,
encontré varios que antes no estaban y los tenía que compilar u obtener
desde otros repos, entre ellos esta `cava` que le da vida a la música
desde la consola [^4]

## *intel* sin *nvidia*

Esta *notebook* cuenta con 2 placas de video y como tuve inconvenientes
anteriormente con la placa *nvidia*, esta vez decidí solo usar el
paquete `xserver-xorg-video-intel` y no instalar nada de *nvidia*, lo
cual fue una excelente decisión, funciona mucho mejor.

## hola `iwpass`, chau `wicd-curses`

Por algún motivo `wicd-curses` no esta disponible en *Debian Bullseye*
(`python2` *cof..cof..*) pero a no desesperar, debido a un *bug* que
sucedía al tener muchas redes cerca [^5] ya venía conectándome a la
*****Old School Way***** [^6] y recientemente liberé el *script*
`iwpass` [^7] que \"automatiza\" la conexión a una red *wifi* usando
`pass` [^8].

## mejoras de *firmware*

La *WiFi* anda mucho mejor y el sonido tiene mejor soporte. El *Kernel*
que venía usando era un *Backport* y con el nuevo funciona todo muy
bien.

package               buster                bullseye
--------------------- --------------------- ------------
linux-image           5.10.0-0.bpo.5        5.10.0-8
firmware-iwlwifi      20200918-1\~bpo10+1   20210315-3
firmware-sof-signed   1.6.1-2               1.7-1

## Tal vez te interese leer...

-   [DIsaster REcovery PLan
OSiux](2021-01-26-disaster-recovery-plan-osiux)
-   [Install Debian Buster on ThinkPad T14 Gen
1](2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1)

## ChangeLog

-   [`2021-08-20 13:00`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/624bc8d39e7f4e8b7dcca7e866558da23b8fd36e)
agregar *link* a *Install Debian Buster on ThinkPad T14 Gen 1* y
corregir sintaxis
-   [`2021-08-19 11:57`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/99ff89cd6260ebabc729205693c08d78fe073e9d)
agrego Instalar *Debian Bullseye* en una *ThinkPad T14 Gen 1*

[^1]: <file:2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1.org>

[^2]: <https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.0.0-amd64-netinst.iso>

[^3]: <https://gitlab.com/osiux/direplos/-/raw/master/deb.sh>

[^4]: <file:2021-02-14-tty-music-on-console.org>

[^5]: <file:2021-03-08-quien-necesita-mas-de-64-redes-cerca.org>

[^6]: <file:2021-03-23-wpa-passphrase-wpa-supplicant.org>

[^7]: <https://gitlab.com/osiux/pass-utils/-/raw/master/iwpass>

[^8]: <file:2021-02-19-no-me-acuerdo-de-nada-dejame-en-pass.org>
