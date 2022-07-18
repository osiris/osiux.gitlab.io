---
title: Clonar 24 pendrives al mismo tiempo
date: 2014-08-12
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2014-08-12-clonar-pendrives.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2014-08-12-clonar-pendrives.md) |
[`.gmi`](gemini://gmi.osiux.com/2014-08-12-clonar-pendrives.gmi) |
[`.html`](https://osiux.gitlab.io/2014-08-12-clonar-pendrives.html)

[![](https://osiux.com/tmb/clonar-pendrives/letras-viajeras-routers.jpg)](https://osiux.com/img/clonar-pendrives/letras-viajeras-routers.jpg)

Luego de reemplazar el *firmware* original de *TPLink* por *OpenWRT*
[^1] a 24 Routers MR-3020 [^2] para el proyecto **Letras Viajeras**
[^3], necesitabamos clonar 24 pendrives con exactamente lo mismo y no
queríamos hacerlo de a uno.

## Cómo clonar un pendrive a muchos pendrives

Buscando un poco por la web, encontramos varias opciones, entre ellas:

1.  iniciar una máquina con *CloneZilla* [^4] que tiene una utilidad
para clonar *USB*.
2.  usar `dd` y `tee` con varios *pendrives* conectados a la misma
máquina.
3.  usar `dd`, `tee` y `netcat` con varios *pendrives* en varias
máquinas.
4.  crear un `.torrent` con el contenido, y descargar el *torrent*
directamente en cada *pendrive* conectado a un *router*.
5.  que cada router descargue el contenido directamente en el *USB*
usando `wget` y `tar` desde un `parallel-ssh` [^5]

### 1. CloneZilla

No lo probamos porque no queríamos reiniciar :-P

### 2. `dd` + `tee`

Un hack [^6] de la vieja escuela, haciendo uso de `dd` y `tee` se puede
de una manera muy simple clonar en varios dispositivos al mismo tiempo,
la desventaja es que por lo general los distintos puertos USB comparten
el mismo BUS y por ello puede ser más lento copiar más de 1 a la vez,
pero bueno, sirve para un proceso desatendido.

Primero, un test, de que efectivamente funcione:

``` {.example}
ls / | pv | tee >(dd of=a) >(dd of=b) | (dd of=c)
```

-   `ls /` listamos el contenido de la raiz

-   `| pv` agregamos un *pipe view* para tener un indicador de progreso

-   `| tee` esto nos permite redireccionar a la salida estandar y al
mismo tiempo enviar la salida a un archivo.

-   `>(dd of=a)` enviamos la salida al archivo `a`

-   `>(dd of=b)` enviamos la salida al archivo `b`

-   `>| (dd of=c)` última salida al archivo `c`

El resultado es el siguiente:

``` {.example}
160B 0:00:00 [3,37kB/s] [  <=>                                                                                                        ]
0+1 registros leídos
0+1 registros escritos
160 bytes (160 B) copiados, 0,0398646 s, 4,0 kB/s
0+1 registros leídos
0+1 registros escritos
160 bytes (160 B) copiados, 0,0434177 s, 3,7 kB/s
0+1 registros leídos
0+1 registros escritos
160 bytes (160 B) copiados, 0,0465925 s, 3,4 kB/s
```

Se visualizan el total de bytes copiados `160` y la tasa de
transferencia en cada caso: `4,0`, `3,7` y `3.4 kB/s`.

Comprobamos que los 3 archivos estén completos y sean idénticos:

``` {.example}
ls -lh a b c

-rw-rw-r-- 1 osiris osiris 160 ago 12 12:46 a
-rw-rw-r-- 1 osiris osiris 160 ago 12 12:46 b
-rw-rw-r-- 1 osiris osiris 160 ago 12 12:46 c

md5sum a b c

0f422c457d50131124ba323a23f76f7e  a
0f422c457d50131124ba323a23f76f7e  b
0f422c457d50131124ba323a23f76f7e  c
```

Luego generamos un pendrive con el contenido a copiar, en nuestro caso,
el mismo ocupa solo 1.4G de los 7.4 disponibles:

``` {.example}
fdisk -l | grep sdc1

/dev/sdc1       7,4G   1,4G  6,0G  20% /mnt/sdc
```

La utilidad `pv` simplemente va contando los *bytes* que pasan, pero si
indicamos el tamaño total a copiar, nos proporciona un *ETA* [^7] que
ayuda bastante a tener una idea real de cuanto tardará el proceso de
copia. Para esto es necesario indicar la cantidad de *bytes*, esto lo
podemos obtener usando `fdisk`:

``` {.example}
B=$(fdisk -l /dev/sdc | grep sdc | head -1 | awk '{print $5}')
```

Entonces leemos el contenido del pendrive y creamos una imagen en disco,
desde la cual copiaremos el resto de los pendrives.

``` {.example}
dd if=/dev/sdc bs=1M | pv -s $B | dd of=pendrive.raw
```

La copia dura unos 9 minutos, en total se copian los 8GB a una tasa de
transferencia de `14,3 MB/s`

``` {.example}
7,46GB 0:09:19 [13,7MB/s] [===============>] 100%

15646720+0 registros leídos
15646720+0 registros escritos
8011120640 bytes (8,0 GB) copiados, 559,49 s, 14,3 MB/s
```

Ahora partimos desde la imagen `pendrive.raw` y clonamos los
dispositivos `/dev/sdc` y `/dev/sdd` usando lo siguiente:

``` {.example}
time dd if=pendrive.raw | tee >(dd of=/dev/sdc) | (dd of=/dev/sdd)
```

El resultado, no fue favorable en termimos de tiempos, 38 minutos para
clonar 2 pendrives! Esto varía de máquina en máquina, es cuestión de
probar con diferentes puertos y usando un *hub USB* (algo que no
hicimos).

``` {.example}
time dd if=pendrive.raw | tee >(dd of=/dev/sdc) | (dd of=/dev/sdd)

15646720+0 registros leídos
15646720+0 registros escritos
8011120640 bytes (8,0 GB) copiados, 2313,62 s, 3,5 MB/s
15646720+0 registros leídos
15646720+0 registros escritos
8011120640 bytes (8,0 GB) copiados, 2321,35 s, 3,5 MB/s
15646720+0 registros leídos
15646720+0 registros escritos
8011120640 bytes (8,0 GB) copiados, 2326,16 s, 3,4 MB/s

real38m46.174s
user0m57.744s
sys6m4.339s
```

### 3. `dd` + `tee` + `netcat`

Esta opción sonaba muy interesante, porque podíamos usar varias máquinas
y podríamos clonar todos los pendrives al mismo tiempo, pero al ser en
cascada, en cada *host* había que especificar la *IP* del siguiente y
eso involucraba realizar un paso manual en cada compu.

La ventaja de este método es que se reduce el cuello de botella de
utilizar un mismo *BUS* *USB*.

### 4. crear un `.torrent` y distribuirlo

Esto motivó realmente conectar todos los pendrives al mismo tiempo, y
ahí el surgieron 2 temas, el primero la alimentación de energía,
intentamos comprar zapatillas (adaptador de múltiples tomacorrientes),
pero los transformadores del MR3020 tienen una disposición que impiden
enchufar un toma al lado de otro, por tener las patas en sentido
horizontal. En una zapatilla de 8 tomas, sólo entraban 4, y en otra de 5
sólo se aprovechaban 2 tomas, ya que el cable *USB* también molestaba.

Optamos por conectar el resto de los routers a 1 *hub USB* de 10 puertos
y otros a varias notebooks, todos conectados a la *LAN*, adicionando 2
*switchs* de 8 puertos cada uno.

Ahora bien, como el contenido podría sufrir varias modificaciones,
habría que regenerar un `.torrent` por cada cambio, y además instalar un
cliente como `rtorrent` pero decidimos, no tocar la imagen de *OpenWRT*
ya que el MR3020 tiene poco espacio.

Asi que queda pendiente realizar esta prueba, seguramente la ventaja
estaría en que cada *router* podría leer los datos de otros *routers* al
mismo tiempo por compartir el mismo *torrent*.

### 5. `wget` + `tar` + `parallel-ssh`

Aprovechando que `wget` y `tar` vienen en *OpenWRT*, realizamos un
*script* para que realize el *deploy* en cada *router*. Para esto
utilizamos *parallel-ssh* que facilita enormemente la administración de
todos los *routers* al mismo tiempo, incluso permite aplicar cambios
parciales, detectando los *routers* que fallan ya sea por estar
desconectados o con algún error en particular (algunos no levantaban el
pendrive correctamente).

Lo primero es crear un archivo con el listado de *hostnames*, en este
caso ya nos habíamos asegurado de que cada *router* tenga un *hostname*
distinto basado en su *macaddress* mediante un script [^8]. Capturamos
los *hostnames* desde el servidor *DHCP* a un archivo `~/.ssh/letras`:

``` {.example}
grep C04A /tmp/dnsmasq.leases | awk '{print $4}' | sort -u | tee ~/.ssh/letras
```

Luego es muy simple ejecutar un comando en todos los equipos, definimos
un *alias* para simplificar aún más:

``` {.bash org-language="sh" session="yes" results="output" exports="code"}
alias multiletras='parallel-ssh -i -h ~/.ssh/letras'
```

Confirmamos que estén conectados todos los *routers*, mediante `wicd` se
pueden ver los `SSIDs`:

[![](https://osiux.com/tmb/clonar-pendrives/letras-viajeras-wicd.jpg)](https://osiux.com/img/clonar-pendrives/letras-viajeras-wicd.jpg)

Ahora si, tirando un `uptime` en todos los equipos, rápidamente vemos
los *routers* en que se pudo ejecutar el comando y su resultado:

[![](https://osiux.com/tmb/clonar-pendrives/letras-viajeras-pssh.jpg)](https://osiux.com/img/clonar-pendrives/letras-viajeras-pssh.jpg)

Para facilitar, la descarga del contenido a copiar en el *pendrive*,
realizamos un *script* llamado `deploy.sh` [^9], el cual ubicamos en un
servidor `nginx` [^10] junto a todos los archivos comprimidos en
`letras-viajeras.tar.gz`

El proceso de copia en todos los *routers* se reduce a ejecutar lo
siguiente:

``` {.example}
multiletras 'wget -q -O - http://192.168.10.180/deploy.sh | /bin/sh'
```

Es decir, primero se conecta a cada *router*, se descargar el archivo
`deploy.sh` y luego se ejecuta, este *script* luego se encarga de hacer
unas mínimas comprobaciones necesarias, como verificar que esté
correctamente montando en modo escritura el pendrive, descargar el
`.tar.gz`, verificar el *MD5* de los archivos testigo, capturar algunos
errores y en caso de estar corriendo `wget` o `tar`, no ejecutarse
nuevamente.

Ni bien ejecutamos el *deploy* vemos el resultado por cada *router*:

[![](https://osiux.com/tmb/clonar-pendrives/letras-viajeras-md5.jpg)](https://osiux.com/img/clonar-pendrives/letras-viajeras-md5.jpg)

Y si monitoreamos el tráfico de red, podemos apreciar que todos los
*routers* descargan al mismo tiempo el contenido a copiar en cada
pendrive, cada conexión descarga entre `6Mb` y `13Mb`, es un cuello de
botella el ancho de banda, pero por muy poco tiempo y teniendo una *LAN*
de `1Gbit` no debería haber problemas:

[![](https://osiux.com/tmb/clonar-pendrives/letras-viajeras-iftop.jpg)](https://osiux.com/img/clonar-pendrives/letras-viajeras-iftop.jpg)

La mayor ventaja, es poder repetir el proceso una y otra vez, siempre
con la última versión disponible de `deploy.sh`, siendo el límite de
*routers* la cantidad de bocas de red, reduciendo el tiempo total de
copia a solo unos minutos por ejecutarlas en paralelo y asegurando que
quedan todas exactamente iguales. :-)

## [Comentarios](mailto:blog@osiux.com?subject=Comentario)

[^1]: <http://openwrt.org>

[^2]: <http://www.tp-link.com/en/products/details/?model=TL-MR3020>

[^3]: <https://github.com/gcoop-libre/letras_viajeras>

[^4]: <http://www.clonezilla.org/>

[^5]: <https://code.google.com/p/parallel-ssh/>

[^6]: <https://superuser.com/questions/145516/cloning-single-disk-drive-to-multiple-drives-simultaneously>

[^7]: <https://es.wikipedia.org/wiki/Tiempo_estimado_de_llegada>

[^8]: <https://github.com/gcoop-libre/letras_viajeras/blob/master/config_ap/root/autoconfig.sh>

[^9]: <https://github.com/gcoop-libre/letras_viajeras/blob/master/config_ap/root/deploy.sh>

[^10]: <http://nginx.org/>
