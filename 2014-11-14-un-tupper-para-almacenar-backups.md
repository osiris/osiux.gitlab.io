---
title: Un tupper para almacenar backups
date: 2014-11-14
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2014-11-14-un-tupper-para-almacenar-backups.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2014-11-14-un-tupper-para-almacenar-backups.md) |
[`.gmi`](gemini://gmi.osiux.com/2014-11-14-un-tupper-para-almacenar-backups.gmi) |
[`.html`](https://osiux.gitlab.io/2014-11-14-un-tupper-para-almacenar-backups.html)

![](tupper.png)

## dónde guardar los backups?

En **la cooperativa** [^1] trabajamos con muchas máquinas virtuales
(usando **PROXMOX** [^2]) y si bien contamos con *backup* local no está
demás ser previsor y contar con un *backup* remoto por si fuera
necesario utilizarlo algún día...

Como todo problema, uno tiende a simplificarlo, en principio la solución
parecía simple: *\"comprar un disco externo, y copiar todo ahí\"*

## siempre es bueno tener un tupper a mano

Teníamos una *AllInOne* que usamos en algún momento para un evento y que
estaba en deshuso, como no se trataba de una compu muy potente, estaba
en una caja. *¿Y si la desarmamos y la metemos en un tupper?*

Las ventajas, en principio son:

-   ocupa muchísimo menos espacio (no necesitamos monitor)
-   es fácil de transportar (si fuera necesario)
-   puede estar en cualquier lugar (wifi mediante)
-   no hace nada de ruido (o muy poco)

Asi procedí al desarme, descarté el disco para ahorrar espacio, en su
reemplazo utilice un pendrive de 16GB para el Sistema Operativo, que
inicinalmente fue un **Huayra 2.0** [^3], pero resulto que no necesitaba
todas las aplicaciones que tenía instaladas, es más ni siquiera
necesitaba un entorno de ventanas, luego probé con **OpenElect** [^4]
que era extremandamente rápido, pero la contra es que no podía instalar
nada extra y luego con **OpenMediaVault** [^5] que tenía un panel web
para compartir los discos, pero no siempre booteaba, asi que finalmente
la mejor opción fue realizar la instalación mínima de un **Debian
Jessie** y esto permitió que instalara exactamente lo que necesitaba y
nada más!

Contaba con 1 puerto USB 3.0, donde conecté un disco externo de 2TB. Lo
ciframos usando LUKS [^6] porque somos paranoicos... :)

Tuve que tapar con cinta los LEDS, de no hacerlo tendría Navidad todas
las noches.

La WiFi interna no tenía buena señal, asi que use un *dongle USB*
**TPLink WN722N** [^7] que mejoró notablemente la conexión:

A fin de que no se caliente demasiado hice unos cuantos agujeros en la
tapa y en los bordes, y aproveche uno para pasar la antena.

Aunque luego opté por conectar el tupper mediante UTP a un *AccessPoint*
**TPLink WR842ND** [^8], asi extendía la red de **CompartirEsBueno**
[^9], agregando un nodo más a la mesh.

## plan-b

***Un backup si no es automatizado: ¡NO SIRVE!***

Así que implementé **plan-b** [^10], que son una serie de *scripts* que
facilitan el *backup* de contenedores **OpenVZ** [^11] y que tuve el
gusto de presentarlo en la edición 2015 de la **SASOConf** [^12] y están
disponibles en *github* [^13] para que cualquiera pueda usarlos y
mejorarlos.

## bonus extra: un mediacenter!

Y ya que el tupper tenía que estar prendido todo el día y podía estar en
cualquier lugar de la casa, aproveché a conectarlo por *HDMI* a una *TV*
y se convirtió en un *mediacenter* instalando **XBMC** [^14].

![](tupper-xbmc.png)

También instale **MAME** y pude volver a disfrutar de juegos como
*bubble bobble* y muchísimos otros gracias a la colección de
**archive.org** [^15]

<file:tupper-mame.png>

[^1]: <http://gcoop.coop>

[^2]: <http://proxmox.com>

[^3]: <http://huayra.conectarigualdad.gob.ar>

[^4]: <http://openelec.tv/>

[^5]: <http://www.openmediavault.org>

[^6]: <http://www.hermann-uwe.de/blog/howto-disk-encryption-with-dm-crypt-luks-and-debian>

[^7]: <http://www.tp-link.com/ar/products/details/?categoryid=&model=TL-WN722N>

[^8]: <http://www.tp-link.com/ar/products/details/?categoryid=&model=TL-WR842ND>

[^9]: <file:2013-04-02-altermesh-buenos-aires-libre-compartir-es-bueno.org>

[^10]: <http://pub.osiux.com/plan-b-sasoconf.pdf>

[^11]: <http://openvz.org>

[^12]: <http://sasoconf.com.ar>

[^13]: <https://github.com/gcoop-libre/plan-b>

[^14]: <http://xbmc.org>

[^15]: <https://archive.org/details/messmame>
