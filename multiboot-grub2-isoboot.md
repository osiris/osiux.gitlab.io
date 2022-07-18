---
title: Muchas Distros en un pendrive = Multiboot Grub2 ISOBoot
date: 2014-04-23
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/multiboot-grub2-isoboot.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/multiboot-grub2-isoboot.md) |
[`.gmi`](gemini://gmi.osiux.com/multiboot-grub2-isoboot.gmi) |
[`.html`](https://osiux.gitlab.io/multiboot-grub2-isoboot.html)

## porqué tener un Multiboot?

Por lo general nunca salgo de casa sin llaves y junto a las llaves
viajan 3 pendrives:

-   **live persistente** (actualmente **Huayra** [^1])
-   **sólo datos** (cifrado usando **LUKS** [^2] )
-   **multiboot** con muchas distros! `:-)`

Esto me permite estar siempre preparado y a falta de notebook puedo
trabajar en cualquier lado con sólo arrancar desde algún pendrive, según
la ocasión.

Muchas veces hace falta bootear (arrancar) con una distro porque el
sistema actual se murió y es necesario hacer algún tipo de rescate,
otras veces en cambio se puede usar una distro para intentar navegar
anónimamente por internet usando **TAILS** [^3] por ejemplo, o
simplemente para probar algo nuevo o tal vez mostrar las bondades de
**GNU/Linux** [^4] a algún amigo.

Un método simple de contar con varias distros es utilizar una
característica de *GRUB* (el gestor de arranque), que es la posibilidad
de iniciar desde un archivo *ISO*, es decir una imagen de disco (puede
ser CD/DVD/USB), entonces sólo hacen faltan los siguientes pasos:

1.  Particionar y formatear el pendrive
2.  Instalar *GRUB*
3.  Descargar/Copiar los archivos *ISO*
4.  Editar el `/boot/grub/grub.cfg`
5.  Reiniciar y disfrutar!

El único paso \"complicado\" es pegarle a las opciones de cada distro
para iniciar correctamente, para simplificar un poco esta tarea, creé un
repositorio con las configuraciones para cada distro y con el tiempo iré
actualizando la config, aunque cualquier puede meter mano y mejorarla.

## particionar y formatear el pendrive

1.  Abrir una terminar y loguearse como `root`

``` {.example}
sudo -s
```

2.  Listar los discos:

``` {.example}
fdisk -l
```

3.  Reparticionar, reemplazando `sdx` por lo que corresponda, por lo
general es `sdb`. **OjO si te equivocás, PERDES TUS DATOS!**

``` {.example}
fdisk /dev/sdx
```

4.  Tipear `d` para eliminar una partición existente

5.  Tipear `n` para crear una nueva partición

6.  Tipear `p` para seleecionar una partición primaria

7.  Tipear `1` para crear la primer partición

8.  Presionar `Enter` para usar el primer cilindro

9.  Presionar `Enter` nuevamente para usar el último cilindro por
defecto

10. Tipear `a` para activar

11. Tipear `1` para marcar como *booteable* la primer partición activa

12. Tipear `t` para elegir el tipo de partición

13. Tipear `c` para usar una partición FAT32

14. Tipear `w` para escribir los cambios (si no estás seguro, presioná
`q`)

15. formatear la nueva partición:

``` {.example}
mkfs.vfat -F 32 -n MULTIBOOT /dev/sdx1
```

-   Estos pasos están basados en el *HowTo* de pendrivelinux [^5]

## instalar GRUB

1.  Montar el USB (sólo si no se montó solo)

``` {.example}
sudo mkdir /mnt/multiboot
sudo mount /dev/sdx1 /mnt/multiboot
```

2.  Instalar *GRUB*

``` {.example}
sudo grub-install --force --no-floppy --boot-directory=/mnt/multiboot /dev/sdx
```

## clonar el repositorio

Al insertar el pendrive debería automontarse en la mayoría de las
distros en `/media/multiboot`

``` {.example}
cd /media/multiboot
git clone https://github.com/osiris/multiboot
```

## agregando una opción en el menú

Por ejemplo, para iniciar un *Ubuntu 12.04 amd64* es necesario agregar
lo siguiente:

``` {.example}
menuentry 'Ubuntu 12.04 amd64' {
set isofile="/ubuntu-12.04-desktop-amd64.iso"
loopback loop $isofile
linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=$isofile noprompt noeject
initrd (loop)/casper/initrd.lz
}
```

-   Más ejemplos en ISOBoot [^6]

## test sin reboot

Lo ideal es reiniciar la compu, modificar la configuración de las *BIOS*
para que podamos iniciar desde un pendrive (en cada compu es distinto,
probá las teclas `F2`, `F8`, `F10`, `F12`).

Puedo hacer pruebas (siempre que tengas *RAM* y *CPU* suficiente) usando
*QEMU* sin necesidad de reiniciar:

``` {.example}
qemu-system-x86_64 -hdb /dev/sdb
```

Entonces se muestra el menú de *GRUB* y se puede probar una distro:

<https://osiux.com/img/multiboot-grub2-isoboot.png>

[^1]: <http://huayra.conectarigualdad.gob.ar>

[^2]: <http://code.google.com/p/cryptsetup>

[^3]: <https://tails.boum.org>

[^4]: <http://getgnulinux.org>

[^5]: <http://www.pendrivelinux.com/boot-multiple-iso-from-usb-via-grub2-using-linux/>

[^6]: <https://help.ubuntu.com/community/Grub2/ISOBoot/Examples>
