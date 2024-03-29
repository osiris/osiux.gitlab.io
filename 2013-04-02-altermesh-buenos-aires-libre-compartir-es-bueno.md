---
title: Altermesh, BuenosAiresLibre y CompartirEsBueno
date: 2013-04-02
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2013-04-02-altermesh-buenos-aires-libre-compartir-es-bueno.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2013-04-02-altermesh-buenos-aires-libre-compartir-es-bueno.md) |
[`.gmi`](gemini://gmi.osiux.com/2013-04-02-altermesh-buenos-aires-libre-compartir-es-bueno.gmi) |
[`.html`](https://osiux.gitlab.io/2013-04-02-altermesh-buenos-aires-libre-compartir-es-bueno.html)

## Migrando de `OLSR` a `Batman-adv`

Hace años que tengo el **NodoOsiux** [^1] dentro de la red
**BuenosAiresLibre** [^2], pero en el último año estoy apostando a un
nuevo modelo de red basado en la experiencia del **QuintanaCamp** [^3]
en el cual dió origen a dos redes que vienen creciendo día a día,
**QuintanaLibre** [^4] y **DeltaLibre** [^5]

**CompartirEsBueno** es la implementación del modelo de red de
**Altermundi** [^6] consolidado en el firmware **Altermesh** [^7].

Podría haber elegido otro nombre, más territorial como por ejemplo:
\"CaballitoLibre\" que es dónde está mi nodo, sin embargo elegí un
nombre sin territorio y que promueva exactamente el motivo por el cual
es bueno interconectar personas mediantes redes, es decir, la necesidad
de \"compartir\".

Algunos sólo estarán interesados en compartir la salida a internet,
otros obtarán por compartir servicios y archivos que están en sus
computadoras y no asi en internet.

Si bien técnicamente hay una gran diferencia entre el protocolo de ruteo
dinámico utlizado por BAL y Altermesh, es decir OLSR [^8] y batman-adv
[^9] respectivamente, ambos permiten escencialmente lo mismo, unir
equipos y es posible tener una red híbrida con éstos y otros protocolos
al mismo tiempo, algo de esto se puede apreciar en el **gŕafico de mi
red actual** al final de este artículo.

Los invito a armar sus propias redes e interconectarlas mediante
*Altermesh*.

## Hay equipo!

Un requisito indispensable es tener un *Router Inalámbrico* también
conocido como *Access Point* que sea compatible con el firmware
*AlterMesh*, actualemente están soportados algunos modelos de TP-Link
con chipset `ar71xx` y además algunos modelos de Ubiquiti, en mi caso
comencé por los siguientes modelos:

modelo               flash   ram     radio0   radio1
-------------------- ------- ------- -------- --------
TL-WDR3500ND [^10]   8mb     128mb   2.4Ghz   5Ghz
TL-MR3220 [^11]      4mb     32mb    2.4Ghz   \-
TL-WR842ND [^12]     8mb     32mb    2.4Ghz   \-

Todos los equipos cuentan con un conector USB que permite utilizar un
pendrive para almacenar datos como asi también es posible conectar un
dongle como el TL-WN722N para tener una segunda radio para enlazar a
otros nodos.

## Flasheando AccessPoints

### cocinar el firmware

El primer paso es utilizar el **chef** [^13] de *Altermundi* para
\"cocinar\" una versión de *Altermesh*, se puede usar la imagen genérica
**AlterMesh-nodo** [^14] o crear una propia partiendo de ésta o de
alguna otra de las **RedesLibres** [^15] que están haciendo uso del
firmware. En mi caso creé el perfil **CompartirEsBueno** [^16], el mismo
se puede utilizar tal y como está o incluso tomarlo como base para crear
un nuevo perfil de red.

Siempre conviene registrarse en el *chef* y agregar una **llave `ssh`**
para que podamos acceder al *Router* de manera segura. Lo más
interesante es que al cocinar un firmware se agrega nuestra llave para
que luego podamos acceder a él para administrarlo remotamente y como el
mismo firmware se puede utilizar en muchos *Routers*, entonces podremos
tener acceso a todos ellos!

### creando la llave `ssh`

Se puede definir en una sóla línea el tipo `rsa`, el archivo dónde se
almacenará `~/.ssh/llave_rsa` y una contraseña `cambiame`:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh-keygen -t rsa -f ~/.ssh/llave_rsa -Pcambiame
```

``` {.example}
Generating public/private rsa key pair.
Your identification has been saved in /home/osiris/.ssh/llave_rsa.
Your public key has been saved in /home/osiris/.ssh/llave_rsa.pub.
The key fingerprint is:
c6:cf:a5:4e:5d:9a:d8:cb:12:4b:9c:66:90:a5:90:67 osiris@inspiron
The key's randomart image is:
+--[ RSA 2048]----+
|       .         |
|      o E .      |
|       + +       |
|       .+        |
|        So .. .  |
|       . oB* +   |
|         +*o=    |
|         oo. .   |
|          ..o    |
+-----------------+
```

-   OjO: Es posible crear una llave sin contraseña lo cual resulta más
cómodo para ingresar al *Router* pero más incómodo y seguro es usar
una contraseña, sino cualquier que se copie nuestra llave (pública y
privada) podrá acceder al *Router* como si fuera `root`.

Luego es necesario subir el contenido del archivo `~/.ssh/llave_rsa.pub`
que es nuestra llave pública.

La llave privada se encuentra en `~/.ssh/llave_rsa` NO se la debe copiar
a nadie! Es conveniente hacer una copiar de seguridad.

### descargar el firmware

Una vez cocinado el firmware, hay que descargarlo:

``` {.example}
cd ~/altermesh
wget http://chef.mesh.altermundi.net/ls/CompartirEsBueno/r33815/altermesh-ar71xx-generic-tl-mr3220-v1-squashfs-r33815-CompartirEsBueno-nodo-compartir-factory.bin
```

Si se trata de la primera vez que se realiza la operación se debe elegir
una imagen *factory*, en futuras actualizaciones se debe utilizar una
imagen *sysupgrade*. Obviamente hay que elegir la imagen de acuerdo al
modelo de *Router* que vayamos a *flashear*.

Es **altamente recomendado** verificar la integridad del mismo, el
*hash* debe coincidir con el que se encuentra en el archivo `md5sums`

``` {.bash org-language="sh" exports="both"}
cd ~/altermesh
md5sum *.bin
```

``` {.example}
24f6dfddbe4c1fbf29e74d3c32f24afc  altermesh-ar71xx-generic-tl-mr3220-v1-squashfs-r33815-CompartirEsBueno-nodo-compartir-factory.bin
```

### actualizar el firmware

Solo basta conectarse al *Router* mediante un cable UTP e ingresar
mediante un navegador a la dirección <http://192.168.1.1>, generalmente
el usuario y password de fábrica es el mismo, la palabra **admin**.
Buscar en el menú *system tools* la opción *upgrade* y seleccionar la
imagen a subir.

Es necesario renombrar la imagen a un nombre más corto:

``` {.example}
cd ~/altermesh
mv altermesh-ar71xx-generic-tl-mr3220-v1-squashfs-r33815-CompartirEsBueno-nodo-compartir-factory.bin compartir-factory.bin
```

Finalmente subir la imagen y presionar actualizar (**este es el momento
de cruzar los dedos** `:-P` )

Durante la actualización **NO** se debe cortar la alimentación del
*Router* como tampoco se debe perder la conexión, por esto recomiendo
desactivar el `network-manager`, para establecer una conexión manual
realizar lo siguiente:

``` {.example}
sudo ifconfig eth0 192.168.1.22 up
```

Si todo salió bien, el *Router* reiniciará en un par de minutos y se
podrá visualizar el *ESSID* de la red (CompartirEsBueno en mi caso).
Entonces se puede asociar al equipo mediante el `network-manager`
mediante el mouse o de manera manual:

``` {.example}
sudo ifconfig wlan0 up
sudo iwconfig wlan0 essid CompartirEsBueno
```

### conectándose por primera vez

Si mantenemos el cable UTP conectado, ya deberíamos tener acceso al
*Router*, ahora bien, como la idea no es que cualquiera lo administre,
es necesario contar con una llave ssh, la misma fue agregada al cocinar
el firmware, asi que bastaría acceder mediante ssh al equipo, sólo
faltaría saber la dirección IP.

*Altermesh* cuenta con soporte IPv6 y nuestra notebook/compu también
(aunque no lo sepamos) y magicamente cada interfaz de red cuenta con una
dirección IPv6 autoasignada que consta de un prefijo + la macaddress de
la placa de red.

Es fácil comprobar nuestra dirección IPv6 mediante `ifconfig`:

``` {.bash org-language="sh" session="yes" results="output"}
ifconfig wlan0 | grep inet6
```

``` {.example}
Dirección inet6: 2a00:1508:1:f00f:6aa3:c4ff:fecf:b5b4/64 Alcance:Global
Dirección inet6: fe80::6aa3:c4ff:fecf:b5b4/64 Alcance:Enlace
Dirección inet6: 2a00:1508:1:f00f:d0ee:ad27:3551:2b6c/64 Alcance:Global
```

Seguro contamos con al menos una IPv6 de alcance \"Enlace\" o Scope
link-local en inglés. Esto quiere decir que podemos llegar a cualquier
otro equipo con IPv6 por medio de esta interfaz y nuestra IPv6 es
aquella que comienza con `fe80`, en mi caso: `fe80::6aa3:c4ff:fecf:b5b4`

### descubrir routers

Se puede realizar un `ping` a una dirección especial para obtener
respuesta de todos los equipos en la red local que son *Routers*,
normalmente hay un alias `ip6-allrouters` para `ff02:2`.

Para las direcciones link-local es necesario indicar cuál es la interfaz
de salida (no asi en las IPv6 de alcance global), esto se hace agregando
el símbolo `%` y el nombre de la interfaz, por ejemplo `ff02::2%wlan0`:

``` {.bash org-language="sh" exports="both" results="output"}
ping6 -c3 ff02::2%wlan0
```

``` {.example}
PING ff02::2%wlan0(ff02::2) 56 data bytes
64 bytes from fe80::a2f3:c1ff:fe9d:2577: icmp_seq=1 ttl=255 time=1.22 ms
64 bytes from fe80::68d3:ecff:fefb:d060: icmp_seq=1 ttl=255 time=10.4 ms (DUP!)
64 bytes from fe80::a2f3:c1ff:fe9d:2577: icmp_seq=2 ttl=255 time=1.48 ms
64 bytes from fe80::68d3:ecff:fefb:d060: icmp_seq=2 ttl=255 time=8.02 ms (DUP!)

--- ff02::2%wlan0 ping statistics ---
3 packets transmitted, 2 received, +2 duplicates, 33% packet loss, time 2002ms
rtt min/avg/max/mdev = 1.229/5.305/10.485/4.043 ms
```

### descubrir nodos

Aquellos equipos que no sean *Routers* pero si forman parte de la red
IPv6 son considerados nodos y responden al alias `ip6-allnodes` o la
dirección `ff02::1`.

``` {.bash org-language="sh" exports="both" results="output"}
ping6 -c3 ff02::1%wlan0
```

``` {.example}
PING ff02::1%wlan0(ff02::1) 56 data bytes
64 bytes from fe80::6aa3:c4ff:fecf:b5b4: icmp_seq=1 ttl=64 time=0.085 ms
64 bytes from fe80::68d3:ecff:fefb:d060: icmp_seq=1 ttl=64 time=156 ms (DUP!)
64 bytes from fe80::1e4b:d6ff:fed2:f99: icmp_seq=1 ttl=64 time=316 ms (DUP!)
64 bytes from fe80::6aa3:c4ff:fecf:b5b4: icmp_seq=2 ttl=64 time=0.086 ms
64 bytes from fe80::68d3:ecff:fefb:d060: icmp_seq=2 ttl=64 time=9.74 ms (DUP!)
64 bytes from fe80::a2f3:c1ff:fe9d:2577: icmp_seq=1 ttl=64 time=1124 ms (DUP!)
64 bytes from fe80::a2f3:c1ff:fe9d:2577: icmp_seq=2 ttl=64 time=123 ms (DUP!)
64 bytes from fe80::6aa3:c4ff:fecf:b5b4: icmp_seq=3 ttl=64 time=0.088 ms

--- ff02::1%wlan0 ping statistics ---
3 packets transmitted, 3 received, +5 duplicates, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 0.085/216.376/1124.681/358.855 ms, pipe 2
```

### accediendo por ssh

Al acceder al *Router* se solicita la contraseña de la llave ssh (si fue
establecida) y se visualiza la revisión del firmware, en mi caso
`r33815` y es un dato a tener en cuenta, a veces algunas funcionalidades
están presentes sólo en algunas versiones o en ocasiones no funcionan
del todo bien en alguna revisión en particular o incluso en algún modelo
de *Router*.

``` {.example}
▶ ssh root@fe80::a2f3:c1ff:fe9d:2577%wlan0
Enter passphrase for key '/home/osiris/.ssh/id_rsa':

BusyBox v1.19.4 (2013-01-14 16:57:22 ART) built-in shell (ash)
Enter 'help' for a list of built-in commands.

_______                     ________        __
|       |.-----.-----.-----.|  |  |  |.----.|  |_
|   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
|_______||   __|_____|__|__||________||__|  |____|
|__| W I R E L E S S   F R E E D O M
BARRIER BREAKER (Bleeding Edge, r33815)
(AlterMesh, maintained by: gui _@_ altermundi.net)
(Get your own at: http://chef.mesh.altermundi.net)

root@aleosi:~#
```

Una vez logueados como `root` es posible reconfigurar el equipo,
conectarse a otras redes e incluso romper todo, asi que a leer un poco
antes de tipear y darle enter.

También es posible tirar comandos sin loguearse, por ejemplo si
quisieramos saber cuánto espacio hay disponible:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh root@fe80::a2f3:c1ff:fe9d:2577%wlan0 'df -h'
```

``` {.example}
Filesystem                Size      Used Available Use% Mounted on
rootfs                    4.5M    660.0K      3.9M  14% /
/dev/root                 2.5M      2.5M         0 100% /rom
tmpfs                    14.3M      1.7M     12.7M  12% /tmp
tmpfs                   512.0K         0    512.0K   0% /dev
/dev/mtdblock3            4.5M    660.0K      3.9M  14% /overlay
overlayfs:/overlay        4.5M    660.0K      3.9M  14% /
```

## Bienvenido a IPv6

Uno de los aspectos más interesantes de *Altermesh* es su manejo de
*IPv6*, no sólo se obtiene una *IPv6* pública para el nodo sino que
además siendo parte de **LibreNet6** [^17] se puede obtener un rango, en
mi caso `2a00:1508:1:f00f::1/64`, y entregar *IPv6* a cada cliente del
nodo y nodos asociados!

Actualmente el dominio `aleosi.osiux.com` apunta al *gateway* de la red
*CompartirEsBueno*:

``` {.bash org-language="sh" exports="both"}
dig +short aleosi.osiux.com aaaa
```

``` {.example}
2a00:1508:1:f00f::1
```

Y se puede acceder a él desde cualquier equipo del mundo que cuente con
*IPv6* ya sea nativo o por medio de un tunel.

### Instalar `tinc` y `babel`

Leer <http://docs.altermundi.net/LibreNet6/Setup>

## Comprobando un enlace

A pesar de la lluvia, Gacq subió a la terraza del NodoPlazaFlores con un
**WR842ND** (flasheado con **Altermesh**) y una antena grillada y
apuntando hacia mi nodo, se puso a escanear y logró ver mi nodo.

Ni bien me avisó, me dispuse a realizar la misma prueba vía `ssh`:

``` {.example}
iw wlan0 scan | grep -C7 CompartirEsBueno

BSS a0:f3:c1:9d:36:66 (on wlan0)
TSF: 893337984 usec (0d, 00:14:53)
freq: 2412
beacon interval: 100
capability: ESS ShortSlotTime (0x0401)
signal: -78.00 dBm  <---- a mejorar alineando la antena
last seen: 860 ms ago
SSID: CompartirEsBueno  <---- mi nodo
Supported rates: 1.0* 2.0* 5.5* 11.0* 6.0 9.0 12.0 18.0
DS Parameter set: channel 1
TIM: DTIM Count 0 DTIM Period 2 Bitmap Control 0x0 Bitmap[0]0x0
ERP: Barker_Preamble_Mode
Extended supported rates: 24.0 36.0 48.0 54.0
HT capabilities:
Capabilities: 0x11ec
```

Es sólo una prueba y será necesario alinear correctamente las antenas
para mejorar el nivel de señal (`-78.00 dBm`), pero es una buena noticia
que los nodos se hayan visto en el primer intento.

## Graficando la red {#graficando-la-red id="c3de996b-7628-41a5-841c-4cdeb77f5081"}

Ahora hay más de una manera de conectarse a cada equipo y debido a ello
se me ocurrió graficar los enlaces *IPv4* e *IPv6* (globales y de enlace
local). Para esto utilicé `nwdiag` [^18] que permite de manera simple y
cómoda editar un archivo de texto plano con cada equipo para luego
generar el gráfico final.

[![](https://osiux.com/tmb/osiux-network.png)](https://osiux.com/img/osiux-network.png)

## Cual es el próximo paso? \[6/10\]

-   \[X\] compartir lo aprendido.
-   \[X\] actualizar este documento.
-   \[X\] flashear MR3020.
-   \[X\] agregar agente altermap a los APs.
-   \[ \] flashear Ubiquity Bullet.
-   \[X\] actualizar WR842ND con soporte USB storage.
-   \[ \] agregarle un WN722N al MR3220 con antena direccional o panel.
-   \[X\] actualizar versión del WDR3500, actualmente no funciona *eth0*
ni *eth1*.
-   \[ \] conseguir buenas antenas para el WDR3500.
-   \[ \] enlazar a NodoPlazaFlores y todo aquel que quiera conectarse.

## Soporte `usb-storare`

Es posible agregar un pendrive o un disco externo en formato `ext4`
directamente el router y usarlo como medio de almacenamiento, sólo es
necesario incluir los siguientes paquetes:

``` {.example}
kmod-usb-storage
uhttpd
block-mount
kmod-fs-ext4
```

## ChangeLog

-   \[2013-08-09 vie\] Agrego sección comentarios :-)
-   \[2013-06-04 mar\] Agrego paquetes para almacenamiento USB
-   \[2013-04-03 mié\] primer borrador, faltan agregar pasos y corregir.
-   \[2013-04-24 mié\] actualizo pendientes y agrego algunas
correcciones.

## Comentarios

Muchas gracias por tu manual sobre Altermesh

``` {.example}
Date: Sat, 10 Aug 2013 00:30:51 +0000 (UTC)
From: al <al@blogmail.cc>
```

Te quería comentar debajo del propio manual, pero como no tiene soporte
para comentarios, te quería agradecer por mail.

He añadido el enlace en nuestro wiki:
[http://es.wiki.guifi.net/wiki/Categoría:Altermesh](http://es.wiki.guifi.net/wiki/Categoría:Altermesh)

[^1]: <http://wiki.buenosaireslibre.org/NodoOsiux>

[^2]: <http://www.buenosaireslibre.org>

[^3]: <http://wiki.arraigodigital.org.ar/RedLibre/QuintanaCamp>

[^4]: <http://quintanalibre.org.ar>

[^5]: <http://wiki.redeslibres.org/DeltaLibre>

[^6]: <http://altermundi.net>

[^7]: <http://docs.altermundi.net/AlterMesh>

[^8]: <http://es.wikipedia.org/wiki/OLSR>

[^9]: <http://es.wikipedia.org/wiki/B.A.T.M.A.N%2E>

[^10]: <http://www.tp-link.com/ar/products/details/?categoryid=&model=TL-WDR3500>

[^11]: <http://www.tp-link.com/ar/products/details/?categoryid=&model=TL-MR3220>

[^12]: <http://www.tp-link.com/ar/products/details/?categoryid=&model=TL-WR842ND>

[^13]: <http://chef.mesh.altermundi.net>

[^14]: <http://chef.mesh.altermundi.net/fwprofile/altermesh-nodo>

[^15]: <http://wiki.redeslibres.org>

[^16]: <http://chef.mesh.altermundi.net/network/compartiresbueno>

[^17]: <http://docs.altermundi.net/LibreNet6>

[^18]: <http://blockdiag.com/en/nwdiag/introduction.html?highlight=nwdiag>
