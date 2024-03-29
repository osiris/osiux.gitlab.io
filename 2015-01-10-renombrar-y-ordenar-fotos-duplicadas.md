---
title: Renombrar y Ordenar Fotos Duplicadas
date: 2015-01-10
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2015-01-10-renombrar-y-ordenar-fotos-duplicadas.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2015-01-10-renombrar-y-ordenar-fotos-duplicadas.md) |
[`.gmi`](gemini://gmi.osiux.com/2015-01-10-renombrar-y-ordenar-fotos-duplicadas.gmi) |
[`.html`](https://osiux.gitlab.io/2015-01-10-renombrar-y-ordenar-fotos-duplicadas.html)

![](img/nahuel-osiris-leonel.jpg){width="640" height="320"
title="En casa usamos Debian"}

## Caos por naturaleza

Amo el orden, pero soy un caos ;-) asi que desde hace años que vengo
acumulando archivos en distintas computadoras, en varios discos rígidos,
copiando *por las dudas* una y otras vez casi los mismos archivos con
nombres muy similares y por sobre todas las cosas de manera muy
desordenada.

Cada tanto hago el intento de ordenarlos, pero me pierdo en la revisión
manual y suelo cambiar de criterio, por lo cual abandono el orden.
Muchas veces también sucede que no logro tener 1 disco donde consolidar
todos los *backups* parciales y provisorios para dejar un compilado
completo y ordenado, suelo llenar discos en muy poco tiempo, en parte
porque duplico archivos y *backups* de desconfiado nomás...

## Ordenando un poco

Hace poco que vengo teniendo éxito en ordenar mi colección de fotos
digitales (y algunas digitalizadas), la solución vino de manera
automatizada, como no podía ser de otra forma, pero en lugar de elegir
una aplicación, opté como es costumbre, hacerlo a mano, mediante un
*script* en `bash` (de cabezadura que soy!).

### `renombrar-fotos`

Este *script* se encarga de generar un nombre de archivo único, a partir
del *md5* y de la fecha que esta dentro de la imagen `.jpg` mediante
*exif*.

Partiendo de varios directorios desordenados, como por ejemplo el
siguiente listado:

``` {.example}
/mnt/data/fotos
/mnt/data/fotos/fotos
/mnt/data/fotos/fotos/monte2010/fotos
/mnt/data/inspiron/Dropbox/gcoop/fotos
/mnt/data/inspiron/charlas/campusparty-2012/fotos
/mnt/data/inspiron/revisar/fotos
/mnt/data/inspiron/revisar/pld/charlas/campusparty-2012/fotos
/mnt/data/musica/fotos
/mnt/sdb5/vodka/home/osiris/fotos
/mnt/sdb9/bal/fotos
/mnt/sdb9/bal/fotos/JRSL07/fotos
```

Se invoca al comando `fotos-renombrar` de la siguiente manera:

``` {.example}
cd /mnt
fotos-ordenar
```

De esta manera el *script* buscará archivos `*.jpg` en el directorio
actual (`/mnt`), en caso de encontrar archivos *JPEG*, verificará que
efectivamente se tratan de archivos válidos usando `file` para
identificar que contienen una imagen *JPEG*, luego se comprobará el
*HASH* mediante `md5sum` y se verificará si existe un archivo con el
mismo *HASH* y/o el mismo nombre de archivo compuesto del *HASH* y la
extensión `.jpg`, si es asi indicará que esta duplicado.

Luego con `identify` verificamos que sea correcto el *JPEG* y en caso se
ser inválido, se renombra el archivo a `HASH.jpg`.

Ahora viene lo interesante, extraer la metadata, básicamente la fecha y
hora de creación de la imagen, esto facilitará ordenarlas. Se realizan
varias comprobaciones y se renombra el archivo al formato
`YYYY-MM-DD-HH-MM-HASH.jpg` usando `jhead`. En el caso de no contar con
metadata se crea lo mínimo partiendo del *timestamp* del archivo.

El resultado sería algo similar a esto:

``` {.example}
2014-07-03-0935-2bb594.jpg
2014-07-03-0935-436e18.jpg
2014-07-03-0935-437eaa.jpg
2014-07-03-0935-6c5846.jpg
2014-07-03-0935-8d84be.jpg
2014-07-03-0935-da7f18.jpg
2014-07-03-0936-1ad076.jpg
2014-07-03-0936-9f6327.jpg
2014-07-03-0936-e01e7e.jpg
```

También se puede especificar el directorio con el parámetro `-d` y el
nivel de subdirectorios a buscar usanod `-l`:

``` {.example}
fotos-renombrar -l 3 -d ~/ordenar
```

Hasta este paso conseguimos renombrar a todas las fotos por igual, bajo
un mismo criterio y detectar las duplicadas! :-)

### `ordenar-fotos`

Teniendo los archivos correctamente renombrados, se mueven a un único
directorio, por defecto `/mnt/data/fotos` y se organizan en la siguiente
estructura:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cd /mnt/data/fotos && tree -d | grep 2014 | head
```

``` {.example}
├── 2014
│   ├── 2014-01
│   │   ├── 2014-01-25
│   │   ├── 2014-01-26
│   │   ├── 2014-01-27
│   │   └── 2014-01-29
│   ├── 2014-03
│   │   ├── 2014-03-14
│   │   └── 2014-03-31
│   ├── 2014-04
```

Entonces los archivos quedarían asi:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cd /mnt/data/fotos && ls 2014/2014-01/2014-01-29/* | head
```

``` {.example}
2014/2014-01/2014-01-29/2014-01-29-0844-24fc12.jpg
2014/2014-01/2014-01-29/2014-01-29-0844-b70a1e.jpg
2014/2014-01/2014-01-29/2014-01-29-0846-69dc1a.jpg
```

De manera similar al *script* anterior, se detectan los duplicados, con
la diferencia que el primer duplicado que se encuentre se moverá al
directorio de destino y guardarán en `/duplicate`, esto es a los fines
de realizar una revisión manual, antes de tomar alguna decisión. Un
resultado posible sería:

``` {.example}
fotos-ordenar

duplicate file:  /mnt/data/fotos/2014/2014-07/2014-07-15/2014-07-15-1044-ffb340.jpg
move duplicate file: /mnt/data/fotos/duplicate/2014-07-15-1044-ffb340.jpg
duplicate file:  /mnt/data/fotos/2014/2014-07/2014-07-26/2014-07-26-1306-c9869d.jpg
move duplicate file: /mnt/data/fotos/duplicate/2014-07-26-1306-c9869d.jpg
duplicate file:  /mnt/data/fotos/2014/2014-08/2014-08-06/2014-08-06-1855-b42d9c.jpg
move duplicate file: /mnt/data/fotos/duplicate/2014-08-06-1855-b42d9c.jpg
```

Pero en el caso de encontrar un segundo duplicado, en base al *HASH* y
no solamente al nombre del archivo, directamente se eliminará por ser
idéntico.

``` {.example}
fotos-ordenar

duplicate file:  /mnt/data/fotos/2014/2014-07/2014-07-15/2014-07-15-1044-ffb340.jpg
delete re-duplicate file: 2014-07-15-1044-ffb340.jpg
```

## Todo en orden?

Actualmente ambos *scripts* están en el repo `media-bash-utils` y se
pueden obtener usando `git`:

``` {.example}
git clone https://github.com/osiris/media-bash-utils
```

Invito a probar los *scripts* y acepto cualquier sugerencia y/o mejora,
desde ya que hay mucho más que se puede hacer, por ejemplo se me ocurren
las siguientes ideas:

-   ante duplicados, comparar tamaños en pixels y conservar las fotos
más grandes.
-   detectar imágenes muy similares.
-   aplicar operaciones varias como compresión, marcas de agua, etc.
-   generar tamaños alternativos y/o unificar tamaños de *previews*.

Una de las mayores ventajas es el ahorro de espacio en disco, pero por
sobre todo el poder consolidarlas, eliminar los duplicados y dejar de
hacerlo manualmente, todo es automático y a medida que vayan apareciendo
casos se puede ir mejorando y reorganizando una y otra vez a todas las
fotos con exactamente el mismo criterio.
