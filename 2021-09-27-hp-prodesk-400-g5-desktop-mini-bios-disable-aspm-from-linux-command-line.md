---
title: Deshabilitar /ASPM/ en /BIOS/ /ProDesk 400 G5 Desktop Mini/ desde /GNU/Linux/ utilizando =hp-repsetup=
date: 2021-09-27
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-09-27-hp-prodesk-400-g5-desktop-mini-bios-disable-aspm-from-linux-command-line.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-09-27-hp-prodesk-400-g5-desktop-mini-bios-disable-aspm-from-linux-command-line.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-09-27-hp-prodesk-400-g5-desktop-mini-bios-disable-aspm-from-linux-command-line.gmi) |
[`.html`](https://osiux.gitlab.io/2021-09-27-hp-prodesk-400-g5-desktop-mini-bios-disable-aspm-from-linux-command-line.html)

El módulo del *Kernel* `r8169` para las placas de red *Realtek
RTL8111/8168/8411* tienen soporte para *ASPM* (*Active State Power
Management*), pero el mismo presenta inconvenientes que terminan por
congelar e incluso hasta reiniciar el equipo, por ello es necesario
deshabilitar desde la *BIOS* la ***Administración de energía de estado
activo***.

Existen 3 maneras posibles de realizar esta tarea:

A. Deshabilitar manualmente desde la *BIOS*.

B. Deshabilitar desde *USB* utilizando la ***Instalación replicada***.

C. Deshabilitar desde *GNU/Linux* utilizando `hp-repsetup`.

En breve voy a crear un rol de `ansible` para automatizar el
deshabilitar *ASPM* y también establecer otros ajustes de *BIOS* desde
*AWX* garantizando que todos los equipos queden con la misma
configuración.

## \[A\] Deshabilitar *ASPM* manualmente

-   Ir a menú ***Avanzado*** y seleccionar /\*Opciones de administración
de

encendido\*/

-   Deshabilitar ***Administración de energía PCI Express***

-   Volver al menú ***Principal*** y seleccionar ***Guardar cambios y
salir***

-   Confirmar ***Guardar los cambios***

## \[B\] Deshabilitar *ASPM* mediante *Instalación replicada*

Es posible generar una copia en *USB* de los ajustes de *BIOS* de un
equipo y luego restaurarlos en otros equipos.

Antes de continuar, deshabilitar *ASPM* como se indica en el paso
*\[A\]*

-   Ir a ***Instalación replicada*** en menú ***Principal***

-   /\*Crear una copia de seguridad de los ajustes actuales en un

dispositivo USB\*/

-   Insertar el dispositivo *USB* con formato *FAT32* antes de
continuar.

-   Confirmar guardar en *USB*

La copia de seguridad de los ajustes actuales de *BIOS* se almacenan en
un archivo `HpSetup.txt` (en formato *UTF-16*) en el dispositivo *USB*.

-   *Restaurar los ajustes actuales desde un dispositivo USB*

Para restaurar los ajustes desde un dispositivo (previamente guardados),
es necesario seleccionar en el menú ***Principal*** la opción
***Instalación Replicada***, insertar el dispositivo *USB* y luego ir a
la opción ***Restaurar los ajustes actuales desde un dispositivo USB***.

-   Confirmar restaurar desde dispositivo *USB*

-   Volver al menú ***Principal*** y seleccionar /\*Guardar cambios y

salir\*/

-   Confirmar ***Guardar los cambios***

## \[C\] Deshabilitar *ASPM* desde *GNU/Linux* utilizando `hp-repsetup`

*HP* provee una serie de herramientas de consola para interactuar con la
*BIOS* de los equipos *ProDesk 400 G5 Desktop Mini*.

Tener en cuenta que estas utilidades son experimentales y sin garantía:

``` {.example}
DISCLAIMER OF WARRANTY

The following software: 'hp-flash' and 'hp-repsetup' are experimental
and is provided as a courtesy, free of charge, "AS-IS" by HP Development Company, L.P.
HP shall have no obligation to maintain or support this software.
HP MAKES NO EXPRESS OR IMPLIED WARRANTY OF ANY KIND REGARDING THIS
SOFTWARE INCLUDING ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT. HP SHALL NOT BE LIABLE
FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES,
WHETHER BASED ON CONTRACT, TORT OR ANY OTHER LEGAL THEORY, IN CONNECTION
WITH OR ARISING OUT OF THE FURNISHING, PERFORMANCE OR USE OF THIS SOFTWARE.
```

### Descargar `sp111455.tgz`

En el *FTP* público de *HP* estan disponibles las *tools* necesarias en
`sp111455.tgz`

``` {.bash org-language="sh"}
wget https://ftp.hp.com/pub/softpaq/sp111001-111500/sp111455.tgz

```

### Descomprimir `sp111455.tgz`

``` {.bash org-language="sh"}
tar xvf sp111455.tgz

-rwxrwxrwx 0/0          172890 2020-08-07 16:00 docs/HP Linux Tools Readme.pdf
-rwxrwxrwx 0/0          117825 2020-08-07 16:00 docs/HP Linux Tools Readme.rtf
-rwxrwxrwx 0/0           12913 2020-08-07 16:00 docs/HP Linux Tools Readme.txt
-rwxrwxrwx 0/0          130077 2020-08-07 16:00 non-rpms/hp-flash-3.21_x86_64.tgz
-rwxrwxrwx 0/0           12828 2020-08-07 16:00 non-rpms/hpuefi-mod-3.03.tgz
-rwxrwxrwx 0/0            2404 2020-08-07 16:00 README.txt
-rwxrwxrwx 0/0           19964 2020-08-07 16:00 rpms/hp-flash-3.21-1.rh610.x86_64.rpm
-rwxrwxrwx 0/0           19956 2020-08-07 16:00 rpms/hp-flash-3.21-1.rh70.x86_64.rpm
-rwxrwxrwx 0/0           21181 2020-08-07 16:00 rpms/hp-flash-3.21-1.rh80.x86_64.rpm
-rwxrwxrwx 0/0           20605 2020-08-07 16:00 rpms/hp-flash-3.21-1.sled12.x86_64.rpm
-rwxrwxrwx 0/0           20793 2020-08-07 16:00 rpms/hp-flash-3.21-1.sled15.x86_64.rpm
-rwxrwxrwx 0/0           17336 2020-08-07 16:00 rpms/hpuefi-mod-3.03-1.src.rpm

```

### Descomprimir `hpuefi-mod-3.03.tgz`

``` {.bash org-language="sh"}
tar xvzf hpuefi-mod-3.03.tgz

drwxr-xr-x user/user         0 2020-08-07 20:04 hpuefi-mod-3.03/
-rw-r--r-- user/user      1756 2020-08-07 15:00 hpuefi-mod-3.03/README
-rw-r--r-- user/user        75 2020-08-07 15:00 hpuefi-mod-3.03/mkdevhpuefi
-rw-r--r-- user/user     18092 2020-08-07 15:00 hpuefi-mod-3.03/COPYING
-rw-r--r-- user/user     22466 2020-08-07 15:00 hpuefi-mod-3.03/hpuefi.c
-rw-r--r-- user/user       445 2020-08-07 20:04 hpuefi-mod-3.03/Makefile
-rw-r--r-- user/user      1800 2020-08-07 15:00 hpuefi-mod-3.03/hpuefi.h

```

### Descomprimir `hp-flash-3.21_x86_64.tgz`

``` {.bash org-language="sh"}
cd non-rpms

tar xvf hp-flash-3.21_x86_64.tgz

drwxr-xr-x user/user         0 2020-08-17 15:00 hp-flash-3.21_x86_64/
drwxrwxr-x user/user         0 2020-08-17 15:00 hp-flash-3.21_x86_64/docs/
-rw-r--r-- user/user      5973 2020-08-17 15:00 hp-flash-3.21_x86_64/docs/hp-flash-README
-rw-r--r-- user/user      7139 2020-08-17 15:00 hp-flash-3.21_x86_64/docs/hp-repsetup-README
drwxrwxr-x user/user         0 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/
-rwxrwxr-x user/user     32336 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.u2004
-rwxrwxr-x user/user     32520 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.u2004
-rwxr-xr-x user/user     28327 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.sled12
-rwxrwxr-x user/user     26800 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.rh80
-rwxrwxr-x user/user     28040 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.u1804
-rwxrwxr-x user/user     23717 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.rh610
-rwxrwxr-x user/user     24335 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.rh70
-rwxrwxr-x user/user     24384 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.u1604
-rwxrwxr-x user/user     24712 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.u1604
-rwxr-xr-x user/user     32752 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.sled12
-rwxrwxr-x user/user     31224 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.rh80
-rwxr-xr-x user/user     28112 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.sled15
-rwxr-xr-x user/user      3189 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/test-distro.sh
-rwxrwxr-x user/user     24680 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.rh70
-rwxr-xr-x user/user     32512 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.sled15
-rwxrwxr-x user/user     23388 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-repsetup.rh610
-rwxrwxr-x user/user     28224 2020-08-17 15:00 hp-flash-3.21_x86_64/builds/hp-flash.u1804
-rwxr-xr-x user/user       807 2020-08-17 15:00 hp-flash-3.21_x86_64/install.sh
-rwxr-xr-x user/user      1674 2020-08-17 15:00 hp-flash-3.21_x86_64/hp-flash
drwxrwxr-x user/user         0 2020-08-17 15:00 hp-flash-3.21_x86_64/bin/
-rwxr-xr-x user/user      1677 2020-08-17 15:00 hp-flash-3.21_x86_64/hp-repsetup

```

### Compilar e instalar módulo de *kernel* `hpuefi`

Es necesario contar con los `headers` del *kernel* actual y las
herramientas básicas de compilación

``` {.bash org-language="sh"}
apt install build-essential

apt install linux-headers-$(uname -r)

cd non-rpms/hpuefi-mod-3.03

make

make -C /lib/modules/4.15.0-106-generic/build M=/home/ansible/non-rpms/hpuefi-mod-3.03 modules
make[1]: se entra en el directorio '/usr/src/linux-headers-4.15.0-106-generic'
CC [M]  /home/ansible/non-rpms/hpuefi-mod-3.03/hpuefi.o
Building modules, stage 2.
MODPOST 1 modules
CC      /home/ansible/non-rpms/hpuefi-mod-3.03/hpuefi.mod.o
LD [M]  /home/ansible/non-rpms/hpuefi-mod-3.03/hpuefi.ko
make[1]: se sale del directorio '/usr/src/linux-headers-4.15.0-106-generic'

make install

install -D -m 0644 hpuefi.ko /lib/modules/4.15.0-106-generic/kernel/drivers/hpuefi/hpuefi.ko
depmod
install -D -m 0744 mkdevhpuefi /lib/modules/4.15.0-106-generic/kernel/drivers/hpuefi

modprobe hpuefi

lsmod | grep hpuefi

hpuefi                 16384  0

chmod +x mkdevhpuefi

./mkdevhpuefi

ls -l /dev/hpuefi

crw-r--r-- 1 root root 240, 0 sep  7 10:55 /dev/hpuefi

```

### Obtener ajustes *BIOS* y verificar estado *ASPM*

``` {.bash org-language="sh"}
cd non-rpms/hp-flash-3.21_x86_64/builds

./hp-repsetup.u1804 -a -g | grep -A2 'PCI Express Power Management'

PCI Express Power Management
*Disable
Enable

```

### Obtener ajustes *BIOS* en archivo `HPSETUP.TXT`

``` {.bash org-language="sh"}
./hp-repsetup.u1804 -g

ls -lht HPSETUP.TXT

-rw-r--r-- 1 root root 20K sep  7 11:03 HPSETUP.TXT

```

### Establecer ajustes *BIOS* desde archivo `HPSETUP.TXT`

Para utilizar `hp-repsetup` para establecer valores desde un archivo, es
conveniente ajustar los valores de la *BIOS* manualmente y luego
obtenerlos usando `hp-repsetup`.

Al establecer los valores de *BIOS* desde un archivo `HPSETUP.TXT` se
informarán con *Access Denied* los ajustes que no estan permitidos
cambiar y que son propios de cada equipo:

``` {.bash org-language="sh"}
./hp-repsetup.u1804 -s HPSETUP.TXT

HP Replicated Setup Utility for Linux v3.21, 08/07/2020
(c) Copyright 2020 HP Development Company, L.P.

Errors were encountered when programming the following settings:
Secure Erase Hard Disk Serial Number(Access Denied)
Secure Erase Hard Disk Model Number(Access Denied)
Secure Erase Completion Date(Access Denied)
Secure Erase Completion Status(Access Denied)
Feature Byte(Access Denied)
Build ID(Access Denied)
Remote HP PC Hardware Diagnostics Last Execution Time Stamp(Access Denied)
Product Name(Access Denied)
Serial Number(Access Denied)
SKU Number(Access Denied)
Universally Unique Identifier (UUID)(Access Denied)
UUID (standard format)(Access Denied)
System Board CT Number(Access Denied)
Product Family(Access Denied)
HP_Disk0MapForUefiBootOrder(Access Denied)
Memory Size(Access Denied)
System BIOS Version(Access Denied)
BIOS Build Version(Access Denied)
ME Firmware Version(Access Denied)
ME Firmware Mode(Access Denied)
Audio Controller(Access Denied)
Video BIOS Version(Access Denied)
Reference Code Revision(Access Denied)
Super I/O Firmware Version(Access Denied)
Born On Date(Access Denied)
System Board ID(Access Denied)

```

Para que se apliquen los cambios es necesario reiniciar:

``` {.bash org-language="sh"}
reboot

```

### Identificar placa de red utilizando `lspci`

``` {.example}
lspci | grep Realtek

02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)

```

### Verificar estado de *ASPM* utilizando `lspci`

En caso de estar deshabilitado se muestra `ASPM L1 Enabled`:

``` {.bash org-language="sh"}
lspci -vv -s 02:00.0 | grep 'LnkCtl: ASPM'

LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

```

En caso de estar deshabilitado se muestra `ASPM Disabled`:

``` {.bash org-language="sh"}
lspci -vv -s 02:00.0 | grep 'LnkCtl: ASPM'
LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
```

## ChangeLog

-   [`2021-10-14 05:54`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/0a4a503f3dfebce5254f6405a902449d75f549f0)
agregar Deshabilitar *ASPM* en *BIOS* *ProDesk 400 G5 Desktop Mini*
desde *GNU/Linux* utilizando `hp-repsetup`
