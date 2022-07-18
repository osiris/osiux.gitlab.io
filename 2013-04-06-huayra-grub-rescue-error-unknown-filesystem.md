---
title: huayra grub rescue error unknown filesystem
date: 2013-04-06
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2013-04-06-huayra-grub-rescue-error-unknown-filesystem.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2013-04-06-huayra-grub-rescue-error-unknown-filesystem.md) |
[`.gmi`](gemini://gmi.osiux.com/2013-04-06-huayra-grub-rescue-error-unknown-filesystem.gmi) |
[`.html`](https://osiux.gitlab.io/2013-04-06-huayra-grub-rescue-error-unknown-filesystem.html)

## mmmm que rarooo...

Luego de una exitosa jornada de dos días instalando *Huayra* [^1] en el
*Primer Encuentro de Software Libre en Monte Caseros* [^2], como no
podía ser de otra manera, justo a última hora, el último día la netbook
de \"la directora\" dejó de arrancar tras instalar *Huayra 1.0* y en su
lugar apareció un bonito mensaje de error
`grub rescue> error unknown filesystem`

<file:https://osiux.com/tmb/1eslmc/2013-04-06-17-45-a4bdc1-grub-rescue-error-unknown-filesystem.jpg>

## linux.mod

Apelando a nuestros conocimientos de recuperación empezamos a tirar
comandos, básicamente se puede listar el contenido de cada partición
haciendo `ls (hd0,1)/` y rápidamente vimos que el comando
`insmod linux.mod` fallaba porque no existía el archivo en
`(hd0,1)/boot/grub/linux.mod` entonces vimos la ubicación original del
archivo al copiarse el paquete es `/usr/lib/grub/i386-pc/linux.mod` pero
tampoco estaba, evidentemente justo ese archivo no se copió al
instalarse, por algún motivo que ignoramos por ahora.

![](https://osiux.com/tmb/1eslmc/2013-04-06-17-55-926d69-grub-error-file-not-found.jpg){width="\"640\""
height="\"480\"" title="huayra grub error file not found"}

## super grub2 disk al rescate de grub

No quedaba otra que corregir `grub` pero aún booteando desde un pendrive
no se lograba iniciar el sistema, asi que buscamos alguna distro de
rescate, encontramos *Rescatux* [^3] y *SuperGrub2Disk* [^4], ésta
última ocupaba apenas 7mb la *ISO*, asi que era la indicada a probar
dada la simplicidad y que nuestra conexión al mundo era muy angosta de
banda.

Descargamos la *ISO* y verificamos el *MD5*:

``` {.example}
# wget http://download.berlios.de/supergrub/super_grub2_disk_hybrid_2.00s1-beta1.iso
# wget http://download.berlios.de/supergrub/super_grub2_disk_hybrid_2.00s1-beta1.iso.md5

# md5sum super_grub2_disk_hybrid_2.00s1-beta1.iso
952a48942df720f579ebca0d09f197c4  super_grub2_disk_hybrid_2.00s1-beta1.iso

# cat super_grub2_disk_hybrid_2.00s1-beta1.iso.md5
952a48942df720f579ebca0d09f197c4  super_grub2_disk_hybrid_2.00s1~beta1.iso
```

Intentamos instalarla en un pendrive de diversas maneras, primero usando
`unetbootin` [^5] la cual no funcionó.

Luego usando `dd` a la unidad, pero tampoco funcionó:

``` {.example}
dd if=supergrub.iso of=/dev/sdb
```

Finalmente la fórmula ganadora fue:

``` {.example}
dd if=supergrub.iso of=/dev/sdb1
```

Booteamos con *SuperGrub2Disk* y elegimos una opción que no encontró
nada de nada:

![](https://osiux.com/tmb/1eslmc/2013-04-06-18-15-caef04-not-found-any-grub2-installation.jpg){width="\"640\""
height="\"480\"" title="huayra not found any grub2 installation"}

En el segundo intento tuvimos éxito!:

![](https://osiux.com/tmb/1eslmc/2013-04-06-18-15-d81f34-super-grub2-disk.jpg){width="\"640\""
height="\"480\"" title="huayra super grub2 disk"}

## instalando grub

Una vez iniciado el *Huayra* de la netbook con la ayuda de
*SuperGrub2Disk* procedimos a reinstalar `grub`:

``` {.example}
grub-install /dev/sdb
```

![](https://osiux.com/tmb/1eslmc/2013-04-06-18-18-f4b7dd-grub-install.jpg){width="\"640\""
height="\"480\"" title="huayra grub install"}

## booteando Huayra

A festejar *Huayra* salió andando de una, \"la dire\" contenta:

![](https://osiux.com/tmb/1eslmc/2013-04-06-18-19-9d2385-huayra.jpg){width="\"640\""
height="\"480\"" title="huayra"}

## compartir es bueno

Aprovechamos a copiar algunas de las presentaciones que se dieron en el
evento, como asi también el Libro *Redes Inalámbricas en los Países en
Desarrollo* [^6] ya que se quedaron muy entusiasmados por las charlas
sobre Redes Libres [^7], también las *ISO* de *Huayra 1.0* [^8] y
*Huayra Live* [^9] y de paso el video *Códigos Cooperativos* [^10],
porque si de algo estamos seguros es que **Compartir es Bueno** y por
ello este artículo, si a alguno le llega a pasar este error o algo
similar con `grub`, ahora saben como solucionarlo en pocos pasos.

![](https://osiux.com/tmb/1eslmc/2013-04-06-18-41-662982-compartir.jpg){width="\"640\""
height="\"480\"" title="huayra compartir es bueno"}

[^1]: <http://huayra.conectarigualdad.gob.ar/>

[^2]: [file:2013-04-06-primer-encuentro-software-libre-monte-caseros.org](2013-04-06-primer-encuentro-software-libre-monte-caseros)

[^3]: <http://www.supergrubdisk.org/rescatux/>

[^4]: <http://www.supergrubdisk.org/super-grub2-disk/>

[^5]: <http://unetbootin.sourceforge.net/>

[^6]: <http://wndw.net>

[^7]: <http://wiki.redeslibres.org>

[^8]: <http://huayra.educ.gob.ar/huayra-VR-1.0.iso>

[^9]: <http://huayra.educ.gob.ar/huayra-live-mate-1.0.iso>

[^10]: <http://www.gcoop.coop/codigos-cooperativos>
