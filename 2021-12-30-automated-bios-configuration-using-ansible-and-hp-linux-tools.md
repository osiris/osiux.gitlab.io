---
title: Automatizar la configuración de la /BIOS/ usando =ansible= y /HP Linux Tools/
date: 2021-12-30
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-12-30-automated-bios-configuration-using-ansible-and-hp-linux-tools.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-12-30-automated-bios-configuration-using-ansible-and-hp-linux-tools.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-12-30-automated-bios-configuration-using-ansible-and-hp-linux-tools.gmi) |
[`.html`](https://osiux.gitlab.io/2021-12-30-automated-bios-configuration-using-ansible-and-hp-linux-tools.html)

## el famoso que raro...

Este año en *gcoop* [^1] nos topamos con un error extraño en equipos *HP
ProDesk 400 G5 Desktop Mini*, básicamente el módulo del *Kernel* `r8169`
para las placas de red *Realtek RTL8111/8168/8411* tienen soporte para
*ASPM* (*Active State Power Management*), pero el mismo presenta
inconvenientes que terminan por congelar e incluso hasta reiniciar el
equipo, por ello es necesario deshabilitar desde la *BIOS* la
***Administración de energía de estado activo***.

## *Automate All The Things*

Obviamente, como casi todo, la mejor solución al problema luego de
investigar un poco, fue automatizar la configuración de opciones de la
*BIOS* utilizando `ansible` [^2].

El rol `gcoop-libre.hp_linux_tools` [^3] se ocupa de descargar las *HP
Linux Tools* [^4] y lo necesario para compilar el módulo de *Kernel*
`hpuefi-mod`, instalarlo, crear el dispositivo `/dev/hpuefi`, obtener la
configuración de la *BIOS* desde un archivo remoto o desde el mismo
equipo, mostrar la config, establecer los nuevos valores, reiniciar el
equipo y verificar el cambio aplicado, en este caso `ASPM Disabled` en
los atributos de la placa de red.

Seguramente en un par de meses sumaremos mas funcionalidad, pero sin
dudas ****este rol es la manera de escalar y cambiar la configuración de
la *BIOS* de miles de equipos de manera automatizada****.

## Recomiendo leer

-   [Deshabilitar *ASPM* en *BIOS* *ProDesk 400 G5 Desktop Mini* desde
*GNU/Linux* utilizando
`hp-repsetup`](2021-09-27-hp-prodesk-400-g5-desktop-mini-bios-disable-aspm-from-linux-command-line)

## ChangeLog

-   [`2021-12-30 10:07`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/648dffc88481ec23ef0208ce14613859428f8b86)
agregar Automatizar la configuración de la *BIOS* usando `ansible` y
*HP Linux Tools*

[^1]: <https://www.gcoop.coop/>

[^2]: <https://www.ansible.com/>

[^3]: <https://gitlab.com/gcoop-libre/ansible_role_hp_linux_tools>

[^4]: <https://ftp.hp.com/pub/softpaq/sp111001-111500/sp111455.tgz>
