---
title: Install Debian Buster on ThinkPad T14 Gen 1
date: 2021-02-09
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1.gmi) |
[`.html`](https://osiux.gitlab.io/2021-02-09-install-debian-buster-on-thinkpad-t14-gen-1.html)

## Martes de gloria

Hace exactamente 2 Martes atrás (2021-01-26) mi querida `cachaza` (una
*notebook ASUS ZenBook Q324UAK*) luego de 4 años, se apagó para no
encenderse más `:(`

Si bien pasé a contingencia rápidamente gracias a
[DIREPLOS](2021-01-26-disaster-recovery-plan-osiux) en `caipiroska`
(una *notebook ASUS K52JC*, que está en sus últimos días, un poco
destartalada pero funcional en gran parte) no fue sino hasta hoy que
estrené una nueva *notebook ThinkPad T14 Gen 1* :)

## Hola `tequila`, chau `cachaza` `;)`

Si bien tengo esperanzas de reparar de alguna manera a `cachaza` en
algún momento futuro, la noche de anoche fue momento de olvidar el
pasado y vivir el presente y intentando instalar *Debian Buster* en mi
primera *ThinkPad*.

## particionando el *NVME*

Como siempre el esquema es 1 partición `/boot`, 2 particiones idénticas
para *Sistema Operativo*, una para la `/` de ahora y una disponibles
para cuando falle, el resto de la unidad para datos, pero como estamos
en un sistema **moderno** además es necesaria 1 partición para *EFI*, en
fin, quedó asi:

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
4      52,0GB  102GB   50,0GB               BAK
5      102GB   512GB   410GB                LUKSDATA

```

## instalando paquetes

Esta tarea esta super des-atendida gracias a los *scripts* de
*DIREPLOS*, aunque aproveché a hacer algunas correcciones, que ya
publicaré.

## y la *X* ?

Sin dudas fue extremandamente difícil que funcione *Xorg* y no hubo caso
hasta que se me ocurrió instalar un *kernel* de *Debian Backports*:

``` {.example}
uname -a

Linux tequila 5.9.0-0.bpo.5-amd64 #1 SMP Debian 5.9.15-1~bpo10+1 (2020-12-31) x86_64 GNU/Linux

```

## y la *WiFi* ?

Luego de mucho buscar, encontré el *backport* del
[firmware-iwlwifi](http://ftp.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-iwlwifi_20200918-1~bpo10+1_all.deb)
que me permitió desconectar el cable *UTP*.

``` {.example}
dpkg -l | grep iwlwifi

ii  firmware-iwlwifi  20200918-1~bpo10+1  all  Binary firmware for Intel Wireless cards

```

## y la música ?

Como no podía ser de otra manera, también fue necesario obtener una
versión actualizada de
[firmware-sof-signed](http://ftp.br.debian.org/debian/pool/non-free/f/firmware-sof/firmware-sof-signed_1.6.1-2_all.deb)
para poder escuchar música mientras **codeo**, y si, también para el
maldito *zoom* `:S`

``` {.example}
dpkg -l | grep sof-signed

ii  firmware-sof-signed  1.6.1-2  all  Intel SOF firmware - signed

```

## Continuará...

Tengo mucho por documentar sobre la instalación y configuración, la idea
es ahorrarle un poco de tiempo a quienes quieran instalar *Debian
Buster* en una *ThinkPad T14 Gen 1*.

## Tal vez te interese leer...

-   [DIsaster REcovery PLan
OSiux](2021-01-26-disaster-recovery-plan-osiux)
-   [ansible luks format external usb
disk](2021-01-25-ansible-luks-format-external-usb-disk)

## ChangeLog

-   [`2021-02-09 23:21`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/3abe6e9636187cd30633cd02d834b5fefb7a0c17)
agrego Instalar *Debian Buster* en una *ThinkPad T14 Gen 1*
