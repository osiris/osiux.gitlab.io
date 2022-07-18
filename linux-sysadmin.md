---
title: Administrador de Sistemas GNU/Linux
date: 2014-01-20
author: Osiris Alejandro Gómez osiris@gcoop.coop
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/linux-sysadmin.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/linux-sysadmin.md) |
[`.gmi`](gemini://gmi.osiux.com/linux-sysadmin.gmi) |
[`.html`](https://osiux.gitlab.io/linux-sysadmin.html)

# Filosofía UNIX

*UNIX* incorpora un conjunto de herramientas que guardan cierta analogía
con una navaja multiusos. Son simples, pero hacen muy bien su trabajo.
En lugar de construir programas muy complejos, *UNIX* proporcionaba
muchas pequeñas herramientas, y un esquema para poder combinarlas de
forma efectiva. Este diseño escala muy bien, permitiendo al sistema
crecer, incorporar nuevas herramientas y, a la vez, ser compatible hacia
atrás.

Los objetivos con que se creó determinaron una *filosofía* de *UNIX*
caracterizada por:

-   comandos cortos, simples, específicos y muy eficientes, que \"hacen
una sola cosa pero la hacen muy bien\".

-   entrada y salida estandarizadas que permiten la interconexión de
comandos. Esto se llama entubamiento (*pipelining*): la salida de un
comando es tomada por el siguiente como entrada.

Algunas directivas son:

-   Escribe programas que hagan una sola cosa y la hagan bien: esto
quiere decir que los programas deben de ser lo más atómicos posible
y que se compruebe mucho su rendimiento y funcionamiento para
hacerlo lo mejor posible.

-   Escribe programas que trabajen juntos: de nada sirve escribir
programas que sirvan para una tarea específica y que, después,
cuando esa tarea se modifique de cierta forma, haya que reescribir
todo el programa.

-   Es mejor dividir el problema en varios programas y después desechar
o reescribir solo uno de esos pequeños programas, cuando se
necesite, o incluso hacer nuevos.

-   Escribe programas que manejen flujos de texto, pues esa es la
interfaz universal: todo lo que se hace con entrada y salida en
formato textual es más fácil de enlazar con otros programas, así
como reutilizarla en el pasado, presente y futuro.

En estos conceptos se basa la mayoría del software libre existente, por
lo que servidores como `sendmail` o `postfix`, están diseñados en
pequeños servidores y/o programas que hacen partes de todo un proceso y,
mediante sus ficheros de configuración, se pueden enlazar de una u otra
forma, así como usar otros programas y/o servidores en lugar de los que
vienen por defecto y, así, extender su funcionalidad.

Sobre *filosofía Unix*, de una forma más extensa, *Mike Gancarz*,
escribe las siguientes líneas:

-   Lo pequeño es hermoso.
-   Haz que cada programa haga una sola cosa, pero que la haga bien.
-   Construye un prototipo lo antes posible.
-   Elige portabilidad sobre eficiencia.
-   Guarda los datos en archivos de texto plano.
-   Aprovecha funcionalidades del software.
-   Usa *scripts* de *shell* para aumentar la funcionalidad y
portabilidad.
-   Evita interfaces de usuario captivas.
-   Haz de cada programa un filtro.

La *filosofía UNIX* supone crear programas rápidos, simples, con poca
intervención por parte del usuario, o en caso de necesitarla, esta se
produzca al principio o lo más mínima posible. Esta se acopla
perfectamente a las necesidades de computación de los laboratorios
científicos, puesto que *Unix* fue originalmente desarrollado en uno de
estos.

A continuación algunas premisas:

-   Que cada programa realice únicamente la tarea para la que fue creado
y la haga bien.
-   Para llevar a cabo una nueva tarea escribe un programa nuevo. No
compliques uno viejo añadiendo nueva funcionalidad.
-   Escribe tu programa teniendo en cuenta que su salida probablemente
sea la entrada de otro programa.
-   Guarda los datos en archivos de texto plano. Si necesitas seguridad,
confía en los permisos.
-   Usa nombres cortos y en minúscula.
-   En la manera de lo posible haz que el usuario suministre los datos
por línea de comandos en la llamada.
-   Haz partes simples conectadas mediante interfaces limpias y bien
definidas.
-   Céntrate en los datos.
-   Claridad mejor que complejidad. La solución más simple es
frecuentemente la mejor.
-   Portabilidad mejor que eficiencia.
-   Piensa en paralelo. Hay otros procesos en el mundo, incluso
instancias de tu mismo programa funcionando al mismo tiempo.
-   Hacer programas grandes, solo cuando se demuestre que no se puede
realizar con uno pequeño.
-   Si no hay nada interesante que decir, que el programa mejor no diga
nada.
-   Para cada problema existen múltiples soluciones.
-   Diseña pensando en el futuro (esta cercano). Esto nos ofrece
compatibilidad y mayor tiempo de utilización.
-   Programa de abajo hacia arriba y de conocimiento pragmático.
-   Programa basado en el conocimiento Empírico o Experiencia.
-   No se encuentra en los métodos y las normas oficiales, sino en el
medio-reflexivo implícito, el conocimiento.

En resumidas cuentas la *filosofía Unix* se puede describir como bien lo
dice *Doug Mcllroy*:

\"Escribe programas que hagan una cosa y la hagan bien, que trabajen en
armonía con otros y que manejen flujos de texto, pues esta es una
interfaz universal.\" - *Doug Mcllroy*

\"Aquellos que no pueden entender UNIX, están condenados a reinventarlo,
pobremente.\" - *Henry Spencer*, 1987

# Linux por dentro, jerarquías de directorios

``` {.example}
/
+-- bin         binarios
+-- boot        inicio del sistema, imágenes del kernel
+-- dev         dispositivos, presentes y futuros
+-- etc         configuraciones
+-- home        directorios personales de los usuarios
+-- lib         bibliotecas
+-- lost+found  archivos y/o cadenas perdidas
+-- media       dispositivos extraerles
+-- mnt         dispositivos montados
+-- opt         binarios fuera de la distro
+-- proc        procesos en ejecución
+-- root        directorio personal del /root/
+-- run         archivos de procesos en ejecución
+-- sbin        binarios del sistema
+-- selinux     secure linux
+-- srv         servicios ej: ftp
+-- sys         system
+-- tmp         temporales
+-- usr         archivos compartidos
+-- var         archivos que varían de tamaño, ej: logs
```

# Todo es un archivo, conociendo `/proc` y `/dev`

## `/proc`

Es un pseudo-sistema de ficheros que se usa como interfaz para las
estructuras de datos del núcleo en lugar de leer e interpretar
/dev/kmem. La mayor parte de este sistema de ficheros es de sólo
lectura, pero algunos ficheros permiten cambiar variables del núcleo.

### `/proc/partitions`

Podemos ver las particiones que leyó el *kernel*:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cat /proc/partitions
```

``` {.example}
major minor  #blocks  name
```

:

``` {.example}
8        0  488386584 sda
8        1   52428800 sda1
8        2   52428800 sda2
8        3  383527960 sda3
11        0    1048575 sr0
254        0  383525912 dm-0
```

### `/proc/uptime`

El `uptime` de nuestro equipo puede ser consultado directamente en
`/proc/uptime`,

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cat /proc/uptime
```

``` {.example}
1901728.32 3010323.20
```

Si utilizamos el comando `uptime`, éste lee el valor expresado en
**epoc** (segundos que pasaron desde el 01/01/1970) y nos informa hace
cuántos días y horas nuestro servidor está prendido, además de informar
otros valores, como la cantidad de usuarios y el **average**:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
uptime
```

``` {.example}
10:53:05 up 22 days, 15 min,  6 users,  load average: 1,63, 1,70, 1,58
```

## `/dev`

Aquí se encuentran todos los dispositivos del sistema, presentes y
futuros.

### `/dev/null`

Este dispositivo es muy especial y sumamente útil, es un agujero negro,
todo lo que se envía a `/dev/null` desaparece

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ls -lh /dev/null
```

``` {.example}
crw-rw-rw- 1 root root 1, 3 ene 20 10:37 /dev/null
```

Si enviamos algo y luego miramos con un `ls` no vemos que se incremente
el tamaño del archivo:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
echo "hola" >/dev/null
ls -lh /dev/null
```

``` {.example}
crw-rw-rw- 1 root root 1, 3 ene 20 10:37 /dev/null
```

### `/dev/sdX`

Los discos están identificados con el prefijo `sd`, luego una letra `a`,
`b`, `c`, etc y finalmente un número `1`, `2`, `3`, etc que identifica
la partición:

Listamos el disco `sda`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ls /dev/sda*
```

``` {.example}
/dev/sda
/dev/sda1
/dev/sda2
/dev/sda3
```

Vemos si esta montado `sda`:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
mount | grep sda
```

``` {.example}
/dev/sda1 on /mnt/sda1 type ext4 (rw,relatime,user_xattr,barrier=1,data=ordered)
```

Visualizamos el espacio disponible:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
df -h | grep sda
```

``` {.example}
/dev/sda1                                                 50G    14G   34G  29% /mnt/sda1
```

# Entrada estándar, Salida estándar y Tuberías

## Descriptores de archivos

Existen 3 descriptores básicos de archivos:

----- ---------- -------------------
`0`   `stdin`    entrada estándar
`1`   `stdout`   salida estándar
`2`   `stderr`   salida de errores
----- ---------- -------------------

Es posible redireccionar cada uno de éstos descriptores mediante los
operadores `>`, `<` y `|`

## Enviar la salida estándar a un archivo

![](img/stdout-file.png)

## Enviar la salida de errores a un archivo

![](img/stderr-file.png)

## Enviar la salida estándar y la salida de errores a un mismo archivo

![](img/stderr-stdout-file.png)

## Enviar la salida de errores a la salida estándar

![](img/stderr-stdout.png)

## Enviar la salida de estándar a `/dev/null`

![](img/stdout-dev-null.png)

## Enviar la salida de estándar y la salida de errores a `/dev/null`

![](img/stderr-stdout-dev-null.png)

## Enviar un archivo a la entrada estándar

![](img/stdin-file.png)

## Enviar la salida estándar a un archivo y a la salida estándar

![](img/tee-stdout-file.png)

## Enviar la salida estándar de un comando como la entrada estándar de otro comando

![](img/stdout-pipe-stdin.png)

## `stdout`

Buscar el texto **model** en el archivo `/proc/cpuinfo` y enviar el
resultado a un nuevo archivo llamado `/tmp/cpu` que contendrá únicamente
las líneas que coinciden con el texto **model**:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
grep model /proc/cpuinfo > /tmp/cpu
cat /tmp/cpu
```

``` {.example}
model      : 28
model name : Intel(R) Atom(TM) CPU D425   @ 1.80GHz
model      : 28
model name : Intel(R) Atom(TM) CPU D425   @ 1.80GHz
```

Buscar el texto **cache** en el archivo `/proc/cpuinfo` y agregar el
resultado al archivo `/tmp/cpu`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
grep cache /proc/cpuinfo >> /tmp/cpu
cat /tmp/cpu
```

``` {.example}
model      : 28
model name : Intel(R) Atom(TM) CPU D425   @ 1.80GHz
model      : 28
model name : Intel(R) Atom(TM) CPU D425   @ 1.80GHz
cache size : 512 KB
cache_alignment    : 64
cache size : 512 KB
cache_alignment    : 64
```

## `stderr`

Enviar la salida con errores a `/dev/null`:

``` {.example}
xkcd 2>/dev/null
```

Redireccionar la salida con errores a la salida estandar:

``` {.example}
echo "xkcd" | grep 2>&1
```

## pipes

El símbolo `|` es usado para redireccionar la salida de un comando a la
entrada de otro comando.

Ejemplo:

Lista el directorio `/var/log` ordenando los archivos más nuevos al
principio y muestra sólo las primeras 10 líneas mediante el comando
`head`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ls -lht /var/log | head
```

``` {.example}
total 14M
-rw-rw-r-- 1 root              utmp       107K feb 10 20:46 wtmp
-rw-r----- 1 root              adm        769K feb 10 20:45 mail.info
-rw-r----- 1 root              adm        769K feb 10 20:45 mail.log
-rw-r----- 1 root              adm        356K feb 10 20:45 syslog
-rw-r----- 1 root              adm        337K feb 10 20:45 auth.log
-rw-r----- 1 root              adm        3,1K feb 10 19:49 messages
-rw-r----- 1 root              adm        2,9K feb 10 19:49 kern.log
-rw-r--r-- 1 root              root        29K feb 10 16:42 Xorg.0.log
-rw-r----- 1 root              adm        1,9K feb 10 16:42 daemon.log
```

lista el directorio `/var/log` mostrando el tamaño de cada archivo, se
filtra el resultando por Megabytes (`M`), luego ordena de mayor a menor
y finalmente limita la lista a los primeros 10 archivos que más espacio
ocupan, incluyendo el total del directorio:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cd /var/log;du -ch *  | grep M | sort -nr | head
```

``` {.example}
496M total
468M atop
15M  installer
14M  installer/cdebconf
3,3M mail.log.1
3,3M mail.info.1
1,5M auth.log.1
```

# Comandos básicos de terminal

## Directorios:

El separador de archivos y directorios es la barra `/`

ejemplos:

``` {.example}
/              directorio raíz (*root*)
/etc           directorio usr (sub-directorio de la raíz =/=)
/etc/apache2   apache2 subdirectorio de /etc
```

### Moviéndose en el sistema de archivos:

1.  `pwd`

Muestra el directorio actual.

2.  `cd`

Cambia al directorio definido en `HOME`

3.  `cd /etc/php5`

Cambia el directorio actual a `/etc/php5`

4.  `cd apache2`

Cambia al subdirectorio `apache2` del directorio actual

5.  `cd ..`

Cambia al directorio inmediato superior

6.  `cd $HOME`

Cambia al directorio definido en la variable `HOME`

7.  `cd ~osiris`

Cambia al directorio del usuario osiris

### Listar directorios:

1.  `ls -l`

Listar en formato ancho, de esta manera se visualizan gran parte de
los atributos de cada archivo y/o directorio

``` {.example}
$ ls -l

-rw-rw-r-- 1 osiris www-data      612 nov  1 19:29 redes.html
-rw-rw-r-- 1 osiris www-data    11457 nov  1 19:31 scrum.html
-rw-rw-r-- 1 osiris www-data     6556 abr 24  2013 ssh.org
-rw-rw-r-- 1 osiris www-data      609 abr 24  2013 graphviz.org
-rw-rw-r-- 1 osiris www-data    17326 abr 24  2013 gnuplot.org
-rw-rw-r-- 1 osiris www-data    11457 nov  1 19:31 tmp
^ ^  ^  ^  ^ ^           ^          ^ ^      ^     ^
| |  |  |  | |           |          | |      |     |
| |  |  |  | propietario grupo tamaño fecha  hora  nombre
| |  |  |  número de links al archivo o contenido del directorio
| |  |  permisos para todos
| |  permisos para miembros del grupo
| permisos para el propietario del archivo:
|   r     lectura
|   w     escritura
|   x     ejecutar
|   -     ninguno
tipo de archivo:
-   archivo normal
d   directorio
l   enlace simbolico
```

2.  `ls`

Listar directorio actual

3.  `ls -a`

Listar directorio actual incluyendo archivos ocultos (comienzan con
`.`)

## Cambiando permisos y atributos

``` {.example}
r = read        4
w = write       2
x = execute     1

propietario   7 = rwx lectura, escritura y ejecución
grupo         5 = rx- lectura y ejecución
todos         0 = --- ningún permiso
```

Es necesario ser el propietario del archivo/directorio (o *root*) para
realizar el cambio de `usuario` o `grupo`.

### `chmod 750 archivo`

Listamos los permisos del archivo `~/.bash_history`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ls -l ~/.bash_history
```

``` {.example}
-rwxr-x--- 1 osiris osiris 326316 feb 10 21:55 /home/osiris/.bash_history
```

Cambiamos el permiso a `750` y volvemos a listar:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
chmod 750 ~/.bash_history
ls -l ~/.bash_history
```

``` {.example}
-rwxr-x--- 1 osiris osiris 326316 feb 10 21:55 /home/osiris/.bash_history
```

Finalmente cambiamos el permiso a `600` y volvemos a listar:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
chmod 600 ~/.bash_history
ls -l ~/.bash_history
```

``` {.example}
-rw------- 1 osiris osiris 326316 feb 10 21:55 /home/osiris/.bash_history
```

### `chgrp grupo archivo`

Establece el grupo al archivo

### `chown usuario archivo`

Establece el usuario como propietario del archivo

### `chown usuario archivo`

Establece el usuario como propietario del directorio y todo su contenido
recursivamente.

## Moviendo, renombrando y copiando archivos:o

Copiamos el archivo `~/.bash_history` a `~/.bash_history.bak` y
verificamos que sea igual:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ls -lh ~/.bash_history
cp ~/.bash_history ~/.bash_history.bak
ls -lh ~/.bash_history.bak
md5sum ~/.bash_history ~/.bash_history.bak
```

``` {.example}
-rw------- 1 osiris osiris 310K feb 11 11:07 /home/osiris/.bash_history
-rw------- 1 osiris osiris 310K feb 11 11:07 /home/osiris/.bash_history
7b862a967fc7096882583f9a6f662230  /home/osiris/.bash_history
7b862a967fc7096882583f9a6f662230  /home/osiris/.bash_history.bak
```

\#+END~SRC~

Movemos el archivo `~/.bash_history.bak` a `~/historial.bak`:

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
mv -vi ~/.bash_history.bak ~/historial.bak
ls -l ~/.bash_history ~/historial.bak
```

``` {.example}
«/home/osiris/.bash_history.bak» -> «/home/osiris/historial.bak»
-rw------- 1 osiris osiris   316801 feb 11 11:07 /home/osiris/.bash_history
-rw------- 1 osiris www-data 316801 feb 11 11:13 /home/osiris/historial.bak
```

Renombramos el archivo `~/historial.bak` a `~/historial.log`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
mv -vi ~/historial.bak ~/historial.log
ls -l ~/historial.log
```

``` {.example}
«/home/osiris/historial.bak» -> «/home/osiris/historial.log»
-rw------- 1 osiris www-data 316801 feb 11 11:13 /home/osiris/historial.log
```

## Ver y editar arhivos:

### `cat`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cat /etc/issue
```

``` {.example}
Debian GNU/Linux 7.0 \n \l
```

:

### `head`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
head /proc/meminfo | head
```

``` {.example}
MemTotal:        2062464 kB
MemFree:          872100 kB
Buffers:           56052 kB
Cached:           642468 kB
SwapCached:        10928 kB
Active:           520204 kB
Inactive:         570096 kB
Active(anon):     366124 kB
Inactive(anon):   211844 kB
Active(file):     154080 kB
```

### `head -2`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
head /proc/meminfo | head -2
```

``` {.example}
MemTotal:        2062464 kB
MemFree:          871860 kB
```

### `tail`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
tail /etc/passwd
```

``` {.example}
hplip:x:106:7:HPLIP system user,,,:/var/run/hplip:/bin/false
pulse:x:107:114:PulseAudio daemon,,,:/var/run/pulse:/bin/false
saned:x:108:118::/home/saned:/bin/false
Debian-gdm:x:109:119:Gnome Display Manager:/var/lib/gdm3:/bin/false
alumno:x:1001:1000:alumno,,,:/home/alumno:/bin/bash
osiris:x:2222:33:OSiRiS,,,:/home/osiris:/bin/bash
sshd:x:110:65534::/var/run/sshd:/usr/sbin/nologin
postfix:x:111:120::/var/spool/postfix:/bin/false
rodrigo:x:1002:1001:Rodrigo Fernandez,,,:/mnt/data/musica:/bin/bash
davfs2:x:112:122::/var/cache/davfs2:/bin/false
```

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
tail -2 /etc/passwd
```

``` {.example}
rodrigo:x:1002:1001:Rodrigo Fernandez,,,:/mnt/data/musica:/bin/bash
davfs2:x:112:122::/var/cache/davfs2:/bin/false
```

### `sed`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
cat /etc/issue
sed s/"7.0"/"8.0"/g /etc/issue
cat /etc/issue
```

``` {.example}
Debian GNU/Linux 7.0 \n \l
```

:

``` {.example}
Debian GNU/Linux 8.0 \n \l
```

:

``` {.example}
Debian GNU/Linux 7.0 \n \l
```

:

## Expresiones regulares

Se utilizan para definir patrones para la búsqueda y filtrado:

### `[a-z]` Minúsculas

Rango de la **a** a la **z**

### `[A-Z]` Mayúsculas

Rango de la **A** a la **Z**

### `[0-9]` Números

Rango de 0 a 9

### `[^..]` Patrón distinto

Negación

### `^` comienzo de línea

### `$` fin de línea

### `.` cualquier carácter

### `?` cero o una aparición

### `*` ninguna o muchas repeticiones

### `+` una o más repeticiones

# Acceso remoto usando ssh

## ¿qué es `ssh` y para qué sirve?

`ssh` permite la ejecución remota de un intérprete de comandos como
`bash`

-   Más información en: <https://es.wikipedia.org/wiki/Ssh>

## ¿qué ventajas tiene?

-   **Es seguro** porque cifra la conexión y nadie puede ver qué estamos
haciendo
-   **Es rápido** porque sólo envía texto, por ello envía menos datos
que si fuera una imagen de pantalla como programas como `vnc`
-   **Es versátil** porque permite interactuar con otros comandos
obteniendo control total de un sistema de manera remota.

## ¿qué necesito para usar SSH?

-   *computadora remota*
-   **servidor SSH**
-   se instala haciendo:

``` {.example}
sudo apt-get install openssh-server
```

-   **conexión a la red** (si es internet mejor!)
-   **puerto 22 abierto** (OjO con el firewall)
-   que la computadora esté encendida! (aunque más adelante veremos
cómo encender remotamente una computadora)
-   *computadora local*
-   **cliente ssh**
-   en todos los linux **ya está instalado**!
-   en otros sistemas pod usar
[PuTTY](https://es.wikipedia.org/wiki/PuTTY)
-   <https://es.wikipedia.org/wiki/PuTTY>
-   **dirección IP** de computadora remota
-   **usuario válido** de computadora remota
-   **contraseña** del usuario de la computadora remota
-   que el **puerto 22 de salida esté habilitado** en el firewall
(aunque hay trucos para saltearlo)

## ¿cómo me conecto por SSH?

En una terminal hay que escribir el comando `ssh` luego el usuario
remoto, por ejemplo: **pepe** y separado por un \*@* arroba la dirección
**IP** o el dominio (ej: `192.168.0.9` ó `osiux.com`)

``` {.bash org-language="sh"}
ssh pepe@192.168.0.9
```

## ¿qué sucede la primera vez?

Siempre que nos conectamos por primera vez a un servidor SSH, nos
aparece un mensaje para que confirmemos la autenticidad de la
computadora a la que estamos conectándonos, por ahora somos confiados y
le decimos que sí, tipeando **yes**

``` {.example}
osiris@osiux.com:/home/osiris# ssh 192.168.0.9
The authenticity of host 'lab2 (192.168.0.9)' can't be established.
RSA key fingerprint is e1:92:a3:54:95:e6:67:b8:89:80:11:02:93:f4:05:36.
Are you sure you want to continue connecting (yes/no)?
```

-   Las próximas veces este paso no es necesario.
-   Luego ingresamos la contraseña (password en inglés) y si es
correcta, ingresamos al sistema remoto!

## Listo, entré a la matrix! ¿y ahora?

Ahora podemos hacer todo lo que el usuario que usamos para conectarnos
(en este caso **pepe**) pueda hacer!

Ahora bien, resulta que este sistema remoto cuenta con un administrador,
que ve que alguien que no es él, ingresó al sistema con su usuario!
Entonces va a matar todos los procesos del usuario **pepe**, a fin de
dejarnos afuera del sistema.

Para esto, utiliza la herramienta `htop` que muestra todos los procesos
y presionando la tecla `F4` nos permite filtrar por la palabra **pepe**
y luego presionando `F9` y eligiendo `SIGKILL` termina cada uno de los
procesos del usuario **pepe**.

También se puede hacer desde la consola sin usar `htop`

``` {.example}
root@lab2:/# pkill -u pepe
```

## El intruso va por la revancha!

Como lo dejamos afuera a **pepe** matando sus procesos, ahora está
enojado! Entonces nos empieza a crear **carpetas** en el **Escritorio**
de la siguiente manera:

``` {.example}
pepe@lab2:~/$ cd Escritorio
pepe@lab2:~/$ mkdir aguante
pepe@lab2:~/$ mkdir la
pepe@lab2:~/$ mkdir academia
```

Si sigue así en algún momento nos va a llenar el **Escritorio**

## Eliminando al intruso!

Matar los procesos activos no es suficiente, debemos eliminar al
usuario, para esto hacemos:

``` {.example}
root@lab2:/# deluser pepe
```

-   Listo! ahora **pepe** no puede ingresar a nuestro sistema

## El intruso es duro de domar!

Resulta que **pepe** cuando ingresó la primera vez, fue astuto y cambió
la contraseña de **root**. ¿Y cómo pudo hacerlo? es simple, el usuario
**pepe** tenía permisos para usar **sudo** que permite convertirse en
**root** (y ser el **DIOS** del sistema). Para cambiar la password hizo
lo siguiente:

``` {.example}
pepe@lab2:~/$ sudo -s
[sudo] password for pepe:
root@lab2:/#

root@lab2:/# passwd
Cambiando la contraseña de root.
Introduzca la nueva contraseña de UNIX:
Vuelva a escribir la nueva contraseña de UNIX:
```

## ¿Y ahora quién podrá defendernos?

Si un intruso logró obtener cuenta **root**, estamos fritos! tiene
completo control del sistema y sin que nos demos cuenta, salvo que haga
algo muy evidente como borrar todo el disco, va a pasar desapercibido.
Qué podemos hacer, para evitar esto?

-   Utilizar contraseñas fuertes, usando `md5` por ejemplo:

``` {.example}
echo -n maradona | md5sum
8b123b7a7cf86f5aa9424d1f379384d8
```

-   Mucho más fácil de recordar, frases de paso:

``` {.example}
Se te escapo la tortuga!
```

-   NO usar la misma contraseña en todos lados!

-   NO usar **sudo**, loguearse como **root** sólo para tareas
administrativas

-   NO permitir el login del usuario **root**

-   Sólo permitir login por *SSH* desde algunas IPs

-   OjO: aunque quitando el cable de red, basta para desconectar a los
intrusos, hoy día casi que vuelve inservible una compu desconectada
del mundo!

## Controlando la matrix!

Si bien usamos el ejemplo de un intruso, lo más probable es que nosotros
seamos root en muchos otros sistemas, como la compu del trabajo, la de
casa, la de un amigo/a, etc. Y poder administrar varios sistemas remotos
usando *SSH* u una sola terminal es posible.

Para esto instalamos **Terminator**

``` {.example}
sudo apt-get install terminator
```

Iniciamos **Terminator** y presionando **CTRL-SHIFT-E** y
**CTRL-SHIFT-O** podemos dividir la pantalla vertical y horizontalmente
tantas veces como sea necesario, obteniendo muchas terminales dentro de
una sola y eligiendo la opción **retransmitir a todas** podemos tipear
una sola vez y que ese comando vaya a todas las terminales conectadas!
:-D

# Entornos gráficos, ejecución remota de aplicaciones gráficas

## `ssh -X`

Es posible ejecutar una aplicación gráfica de un servidor remoto
visualizando en el equipo local por medio de `ssh`, solo es necesario
incluir el parámetro `-X` y el servidor *X* se redireciona a nuestro
*host*

``` {.example}
ssh -X caipiroska 'gnome-calculator'
```

## `DISPLAY\`:0=

Utilizando la aplicación `notify-send` se puede enviar un mensaje de
notificación, normalmente es utilizado para visualizar eventos del
sistema, y estoy lo podemos hacer en un equipo remoto mediante `ssh`:

``` {.bash org-language="sh" session="yes" results="output" exports="code"}
ssh -X osiris@localhost "DISPLAY=:0 notify-send 'hola!'"
```

## `vnc4server`

Habitualmente se utiliza **VNC** para compartir la sesión actual, pero
también se pueden levantar instancias nuevas, pudiendo tener entornos
gráficos diferentes en cada sesión de usuario en el mismo servidor.

Es necesario ejecutar en el servidor:

``` {.example}
vnc4server
```

# Procesos

## ¿Qué es proceso?

-   Un proceso es la instancia de un programa en ejecución.
-   También se lo conoce como tarea.

## ¿Por qué?

-   GNU/Linux es un sistema multitarea, permite la ejecución de
múltiples procesos al mismo tiempo.

-   Comprender el concepto de procesos nos permite administrar el
rendimiento de nuestro equipo.

## Lo que el usuario ve:

![](img/cfp-procesos-01.png)

## Lo que el sistema ve:

![](img/cfp-procesos-03.png)

![](img/cfp-procesos-04.png)

## `PID`

-   Todo proceso que se inicia tiene un número asignado llamado **PID**.

-   Este **PID** permite identificar el proceso y administrarlo
(detenerlo, reanudarlo etc...)

-   Ejemplo: Para obtener el **PID** de un proceso podemos usar el
comando `pidof`:

``` {.bash org-language="sh" exports="both" results="output"}
pidof init emacs
```

``` {.example}
1 15787
```

## Listar procesos

El comando `ps` puede listar el estado de los procesos:

![](img/cfp-procesos-07.png)

## Operaciones

Los procesos se pueden controlar de manera externa.

El comando `kill`, `xkill` o `killall` permite enviarle señales a los
procesos. Por ejemplo la señal de terminación:

![](img/cfp-procesos-08.png)

## Jerarquía

El comando pstree nos permite ver la organización de los procesos en
ejecución:

``` {.bash org-language="sh" exports="both" results="output"}
ps -fax | grep -A 10 bash | head
```

``` {.example}
2686 ?        S     50:52 /bin/bash /usr/share/siguibui/backend/shellserver.sh --daemon
21395 ?        S      0:00  \_ sleep 1
2691 ?        S      2:54 /usr/bin/python /usr/share/pywwetha/pywwetha.py --daemon
2692 ?        Ss     0:00 /usr/sbin/acpi_fakekeyd
2731 ?        Ss     0:28 /usr/sbin/acpid
2935 ?        Ss     0:30 /usr/sbin/apache2 -k start
3138 ?        S      0:00  \_ /usr/sbin/apache2 -k start
3139 ?        S      0:00  \_ /usr/sbin/apache2 -k start
3140 ?        S      0:00  \_ /usr/sbin/apache2 -k start
3141 ?        S      0:00  \_ /usr/sbin/apache2 -k start
```

``` {.bash org-language="sh" exports="both" results="output"}
pstree -p -U | head
```

``` {.example}
init(1)─┬─NetworkManager(3472)─┬─dhclient(3639)
│                      ├─{NetworkManager}(3518)
│                      └─{NetworkManager}(3662)
├─accounts-daemon(4022)───{accounts-daemon}(4024)
├─acpi_fakekeyd(2692)
├─acpid(2731)
├─apache2(2935)─┬─apache2(3138)
│               ├─apache2(3139)
│               ├─apache2(3140)
│               ├─apache2(3141)
```

## En tiempo real

Para visualizar los procesos en ejecución, también se puede usar `htop`
o `top`:

``` {.bash org-language="sh" exports="both" results="output"}
export TERM=linux
top -b -n1 | head -20
```

``` {.example}
top - 18:34:37 up 11 days,  1:02,  6 users,  load average: 0,76, 0,88, 0,86
Tasks: 180 total,   1 running, 179 sleeping,   0 stopped,   0 zombie
%Cpu(s): 13,9 us,  4,8 sy,  0,0 ni, 80,1 id,  0,6 wa,  0,5 hi,  0,2 si,  0,0 st
KiB Mem:   2044852 total,  1709304 used,   335548 free,    89148 buffers
KiB Swap:        0 total,        0 used,        0 free,   600420 cached

PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM     TIME+ COMMAND
8203 root      20   0  121m  18m 6500 S   5,9  0,9   3:47.59 Xorg
26355 osiris    20   0 26096 1488 1080 R   5,9  0,1   0:00.02 top
1 root      20   0 10648  788  652 S   0,0  0,0   0:12.03 init
2 root      20   0     0    0    0 S   0,0  0,0   0:00.16 kthreadd
3 root      20   0     0    0    0 S   0,0  0,0  14:15.93 ksoftirqd/0
6 root      rt   0     0    0    0 S   0,0  0,0   0:00.00 migration/0
7 root      -2   0     0    0    0 S   0,0  0,0   3:50.22 rcuc/0
8 root      rt   0     0    0    0 S   0,0  0,0   0:00.00 rcun/0
9 root      -2   0     0    0    0 S   0,0  0,0   0:00.00 rcub/0
10 root      rt   0     0    0    0 S   0,0  0,0   0:00.00 rcun/1
11 root      -2   0     0    0    0 S   0,0  0,0   0:00.00 rcub/1
12 root      rt   0     0    0    0 S   0,0  0,0   0:00.00 migration/1
14 root      -2   0     0    0    0 S   0,0  0,0   5:24.04 rcuc/1
```

![](img/cfp-procesos-11.png)

## Resumen

-   Los procesos son instancias de programas en funcionamiento.
-   Los recursos del sistema son limitados, el sistema administra y hace
posible compartir recursos.
-   Cada proceso tiene un identiﬁcador (`PID`), que nos sirve para
enviar señales.

## Changelog

\[2013-03-18 lun\] migro [slides
pdf](http://wiki.gcoop.coop/_media/apuntes:procesos.pdf) de Hugo
Ruscitti a `.org`

# Automatizando tareas: `sleep`, `jobs`, `crontab`

## Procesos padres e hijos

Cada vez que ejecutamos un comando en una terminal, éste comando se
convierte en un proceso hijo de la terminal que estamos ejecutando. Por
ejemplo, si estamos en la interfase gráfica, la terminal sería
**gnome-terminal** quien a su vez invoca al intérprete **bash** y desde
ahí podríamos invocar a **firefox**. Esto se puede visualizar de la
siguiente manera:

``` {.example}
# ps fax | grep -C3 firefox

4444 ?        Ssl    0:13 gnome-terminal
4453 ?        Z      0:00  \_ gnome-pty-helper
4454 pts/10   Ss     0:00  \_ bash
4509 pts/10   S+     0:52      \_ firefox
6347 pts/13   Ss     0:00  \_ bash
11781 pts/13   S+     0:01  |   \_ ps fax
11782 pts/13   S+     0:01  |   \_ grep -C3 firefox
```

Lo que vemos es el árbol de ejecución de procesos y si cerramos la
terminal, también se cerraría **firefox** por depender del proceso
**terminal**.

## Para mí, vos estás en segundo plano

Al ejecutar un comando en una terminal, por ejemplo **top**, este
comando pasa a estar en primer plano y hasta que no interrumpamos el
comando presionando **CTRL-C** o saliendo del mismo mediante la tecla
**q**, no se puede ejecutar ningún otro comando en el misma terminal.
Para solucionar este inconveniente es posible pasar el proceso a
**segundo plano**, para esto sólo basta presionar **CTRL-Z**, lo cual
nos devuelve el **PROMPT** de la terminal para que invoquemos nuevos
comandos.

Es posible visualizar la lista de tareas mediante el comando **jobs**,
en este caso nos mostraría que está detenido:

``` {.example}
# jobs
[1]+  Detenido                top
```

Para recuperar la ejecución de **top** podemos escribir **fg** que
significa **foreground** o sea, pasar a primer plano.

## Sos tan lento... que no te quiero ver

También se puede enviar a segundo plano un comando ni bien lo invocamos,
generalmente esto, se hace con comandos que sabemos que van a tardar
mucho, como por ejemplo listar todos los archivos que hay en el disco
rígido y enviarlo a un archivo, para esto solo basta agregar el caracter
**&** o **ampersand** al final de un comando:

``` {.example}
# find / >/tmp/archivos.log &
```

De esta manera, el comando **find** lista todos los archivos que se
encuentran en la raíz **/** y los envía a un archivo usando **\>**.

Podemos ver que el total de líneas del archivo crece mediante el comando
**wc**:

``` {.example}
# wc -l /tmp/archivos.log
```

Algunos comandos ya incluyen una función de segundo plano, por ejemplo
**wget** que sirve para descargar archivos, mediante el parámetro **-b**
redirecciona la salida del comando al archivo **wget-log** y nos permite
seguir trabajando.

``` {.example}
# wget -b http://releases.ubuntu.com/precise/ubuntu-12.04.1-desktop-i386.iso
Continuando en segundo plano, pid 12949.
La salida será escrita a “wget-log”.
```

Para visualizar si se completó la descargar, solo basta mirar el archivo
**wget-log**, en la última línea debería decir 100%:

``` {.example}
cat ~/wget-log

--2012-10-29 18:28:50--  http://releases.ubuntu.com/precise/ubuntu-12.04.1-desktop-i386.iso
Resolviendo localhost (localhost)... 127.0.0.1
Conectando con localhost (localhost)[127.0.0.1]:8123... conectado.
Petición Proxy enviada, esperando respuesta... 200 OK
Longitud: 729067520 (695M) [application/x-iso9660-image]
Grabando a: “ubuntu-12.04.1-desktop-i386.iso”

0K .......... .......... .......... .......... ..........  0% 24,7K 8h0m
50K .......... .......... .......... .......... ..........  0% 68,8K 5h26m
100K .......... .......... .......... .......... ..........  0% 61,5K 4h41m
150K .......... .......... .......... .......... ..........  0% 66,8K 4h15m
```

## Esta compu, se destruye en 5 minutos!

En ocasiones es necesario ejecutar algún comando dentro de cierto
tiempo, por ejemplo dentro de 5 minutos, para ello se puede utilizar
**sleep**, luego se ingresa el tiempo usando **s** para segundos, **m**
para minutos y **h** para horas:

``` {.example}
# sleep 5m; reboot
```

## Tengo un crontab para no olvidar nada

Mediante el uso del **crontab** es posible definir la ejecución de
tareas de manera específica.

Es posible entonces programar una tarea de manera diaria, semanal,
mensual, etc:

``` {.example}
# Usar numeral para escribir comentarios
# +---------------- minutos (0 - 59)
# |  +------------- horas (0 - 23)
# |  |  +---------- día del mes (1 - 31)
# |  |  |  +------- mes (1 - 12)
# |  |  |  |  +---- día de la semana (0 - 7) (Domingo=0 or 7)
# |  |  |  |  |
# *  *  *  *  *     comando a ejecutar

*/5  *  *  *  *     /root/cada-5-minutos.sh
0 23  *  *  *     /root/backup-diario.sh
0  0  1  *  *     /root/backup-mensual.sh
0 23 31 12  *     /root/backup-anual.sh
0 12  *  *  0     DISPLAY=:0.0 /usr/bin/notify-send "asadito"
0 12 29  *  *     DISPLAY=:0.0 /usr/bin/notify-send "ñoquis"
```

Para editar, ejecutar:

``` {.example}
# crontab -e
```

Para listar, ejecutar:

``` {.example}
# crontab -l
```

## Robotizando el mouse

Muchas veces, puede resultar muy útil automatizar tareas de la interfase
gráfica pero usando una terminal, para esto es necesario instalar
**xautomation**:

``` {.example}
# sudo apt-get install xautomation
```

Una vez instalado, es posible mover el mouse y hacer click en un lugar
determinado de la pantalla de la siguiente manera:

``` {.example}
# xte 'mousemove 100 300'; xte 'mouseclick 1'
```

La orden **mousemove 100 300** hace que el mouse se mueva a la posicion
100 en el eje X, o sea a 100 pixels de la esquina izquiera del monitor,
de igual manera a 300 pixels en el eje Y.

La orden **mouseclick 1** emula un click en el botón izquierdo del
mouse.

Imaginemos que por algún motivo, necesitamos movernos a un lugar en la
pantalla y hacer muchos clicks, por ejemplo para avanzar de página en
internet y queremos capturar la pantalla antes de hacer click y asi
guardar lo que se está mostrando.

Entonces necesitamos instalar un capturador de pantalla que funcione
desde la terminal, por ejemplo **scrot**:

``` {.example}
# sudo apt-get install scrot
```

Ahora bien, ya sabemos movernos por la pantalla, hacer click y tenemos
un comando que captura la pantalla, sólo bastaría hacer un pequeño
programa que repita la operación, por ejemplo 186 veces!:

``` {.example}
# for i in {1..186};do scrot; xte 'mousemove 100 300'; xte 'mouseclick 1'; sleep 3s;done
```

Listo, en una sóla línea es posible definirlo, basta con presionar
**ENTER** y vamos a obtener 186 imágenes distintas.

Veamos que hace cada línea, paso a paso:

``` {.example}
for i in {1..186}  # incrementa el valor de i desde 1 a 186
do # inicia la ejecucion
scrot # captura la pantalla
xte 'mousemove 100 300' # mueve el mouse a la posicion 100,300
xte 'mouseclick 1' # presiona click izquierdo del mouse
sleep 3s # espera 3 segundos
done # termina la ejecucion
```

De esta simple manera, se pueden automatizar muchísimas tareas!

# Análisis de tráfico de red con `tcpdump` y `wireshark`

## la era de la inocencia

Iniciamos Firefox como es costumbre de todos los días y empezamos a
saltar de un sitio web a otro. Nada extraño sucede, leemos y escribimos
comentarios, ingresamos a algún chat, en fin nos comunicamos con otras
personas a través de la red.

Suponemos que debido a que estamos solos frente a la compu, nadie más
está viendo todo lo que enviamos y recibimos a través de la red... :-S

## olfateando la red

Si mientras estamos usando la red, se nos ocurre ver qué datos pasan a
través de la red, sólo necesitamos usar `tcpdump`:

``` {.example}
sudo apt-get install tcpdump
```

Su uso es muy simple, solo basta indicar la interfaz de red:

``` {.bash org-language="sh" results="output" exports="code"}
sudo tcpdump -i eth2
```

El resultado es similar al siguiente:

``` {.example}
10:09:54.261674 IP malbec.ssh > osiale.gcoop.com.ar.49322: Flags [P.], seq 2750542384:2750543808, ack 4116367059, win 1331, options [nop,nop,TS val 20388916 ecr 20607900], length 1424
10:09:54.261748 IP osiale.gcoop.com.ar.49322 > malbec.ssh: Flags [.], ack 1424, win 1321, options [nop,nop,TS val 20607950 ecr 20388916], length 0
10:09:54.263027 IP osiale.gcoop.com.ar.46685 > malbec.domain: 7023+ PTR? 18.1.168.192.in-addr.arpa. (45)
10:09:54.263195 IP malbec.domain > osiale.gcoop.com.ar.46685: 7023* 1/0/0 PTR osiale.gcoop.com.ar. (78)
10:09:54.540654 IP malbec.ssh > osiale.gcoop.com.ar.49322: Flags [P.], seq 1424:2512, ack 1, win 1331, options [nop,nop,TS val 20388986 ecr 20607950], length 1088
10:09:54.540690 IP osiale.gcoop.com.ar.49322 > malbec.ssh: Flags [.], ack 2512, win 1321, options [nop,nop,TS val 20608019 ecr 20388986], length 0
10:09:54.606095 IP osiale.gcoop.com.ar.48150 > malbec.domain: 29621+ A? daisy.ubuntu.com. (34)
10:09:54.606229 IP malbec.domain > osiale.gcoop.com.ar.48150: 29621 2/0/0 A 91.189.95.55, A 91.189.95.54 (66)
10:09:54.785237 IP malbec.ssh > osiale.gcoop.com.ar.49322: Flags [.], seq 2512:3960, ack 1, win 1331, options [nop,nop,TS val 20389047 ecr 20608019], length 1448
10:09:54.785281 IP osiale.gcoop.com.ar.49322 > malbec.ssh: Flags [.], ack 3960, win 1321, options [nop,nop,TS val 20608081 ecr 20389047], length 0
```

Lo que vemos, es la información del encabezado de cada paquete que pasa
por la interfaz de red, en este caso `eth2`.

Si no sabemos qué interfaz de red utilizar o simplemente ver cuáles
están disponibles, usamos el comando `ifconfig`:

``` {.bash org-language="sh" results="output" exports="code"}
ifconfig
```

Veríamos un listado similar al siguiente:

``` {.example}
eth0      Link encap:Ethernet  direcciónHW 00:15:d2:19:5b:7d
ACTIVO DIFUSIÓN MULTICAST  MTU:1500  Métrica:1
Paquetes RX:0 errores:0 perdidos:0 overruns:0 frame:0
Paquetes TX:0 errores:0 perdidos:0 overruns:0 carrier:0
colisiones:0 long.colaTX:1000
Bytes RX:0 (0.0 B)  TX bytes:0 (0.0 B)
Interrupción:19 Dirección base: 0xa000

eth2      Link encap:Ethernet  direcciónHW 00:15:84:2b:6b:8e
Direc. inet:192.168.1.18  Difus.:192.168.1.255  Másc:255.255.255.0
Dirección inet6: fe80::215:84ff:fe2b:6b8e/64 Alcance:Enlace
ACTIVO DIFUSIÓN FUNCIONANDO MULTICAST  MTU:1500  Métrica:1
Paquetes RX:632042 errores:0 perdidos:0 overruns:0 frame:0
Paquetes TX:647823 errores:0 perdidos:0 overruns:0 carrier:0
colisiones:0 long.colaTX:1000
Bytes RX:207733278 (207.7 MB)  TX bytes:291419413 (291.4 MB)
Interrupción:18 Dirección base: 0xc800

lo        Link encap:Bucle local
Direc. inet:127.0.0.1  Másc:255.0.0.0
Dirección inet6: ::1/128 Alcance:Anfitrión
ACTIVO BUCLE FUNCIONANDO  MTU:16436  Métrica:1
Paquetes RX:186169 errores:0 perdidos:0 overruns:0 frame:0
Paquetes TX:186169 errores:0 perdidos:0 overruns:0 carrier:0
colisiones:0 long.colaTX:0
Bytes RX:37061384 (37.0 MB)  TX bytes:37061384 (37.0 MB)
```

En este caso contamos con `eth0`, `eth2` y `lo` que es la interfaz
local. Como se puede ver, la `eth2` tiene la dirección **IP**
`192.168.1.18`.

Si quisieramos ver las **IPs** y los números de puertos en lugar de los
nombres de dominio y servicios asociados, debemos usar el parámetro
`-n`:

``` {.bash org-language="sh" results="output" exports="code"}
sudo tcpdump -i eth2 -n
```

Ahora se reemplaza `osiale.gcoop.com.ar` por `192.168.1.18`, `ssh` por
`22`, `domain` por `53` y `malbec` por `192.168.1.1`:

``` {.example}
10:09:54.261674 IP 192.168.1.1.22 > 192.168.1.18.49322: Flags [P.], seq 2750542384:2750543808, ack 4116367059, win 1331, options [nop,nop,TS val 20388916 ecr 20607900], length 1424
10:09:54.261748 IP 192.168.1.18.49322 > 192.168.1.1.22: Flags [.], ack 1424, win 1321, options [nop,nop,TS val 20607950 ecr 20388916], length 0
10:09:54.263027 IP 192.168.1.18.46685 > 192.168.1.1.53: 7023+ PTR? 18.1.168.192.in-addr.arpa. (45)
10:09:54.263195 IP 192.168.1.1.53 > 192.168.1.18.46685: 7023* 1/0/0 PTR 192.168.1.18. (78)
10:09:54.540654 IP 192.168.1.1.22 > 192.168.1.18.49322: Flags [P.], seq 1424:2512, ack 1, win 1331, options [nop,nop,TS val 20388986 ecr 20607950], length 1088
10:09:54.540690 IP 192.168.1.18.49322 > 192.168.1.1.22: Flags [.], ack 2512, win 1321, options [nop,nop,TS val 20608019 ecr 20388986], length 0
10:09:54.606095 IP 192.168.1.18.48150 > 192.168.1.1.53: 29621+ A? daisy.ubuntu.com. (34)
10:09:54.606229 IP 192.168.1.1.53 > 192.168.1.18.48150: 29621 2/0/0 A 91.189.95.55, A 91.189.95.54 (66)
10:09:54.785237 IP 192.168.1.1.22 > 192.168.1.18.49322: Flags [.], seq 2512:3960, ack 1, win 1331, options [nop,nop,TS val 20389047 ecr 20608019], length 1448
10:09:54.785281 IP 192.168.1.18.49322 > 192.168.1.1.22: Flags [.], ack 3960, win 1321, options [nop,nop,TS val 20608081 ecr 20389047], length 0
```

El tráfico de red que capturamos depende mucho de en que lugar de la red
estamos parados, no es lo mismo hacerlo desde un punto terminal que
hacerlo entre un **router** y un **switch** o desde el **gateway** de
salida a internet de toda la red. En los puntos donde se concentran
todas conexiones vamos va ver el tráfico de más máquinas, es decir más
personas!

## mirando en profundidad

Es posible el contenido de los paquetes en formato ASCII mediante el
parámetro `-A`, indicar la cantidad de paquetes a capturar con `-c` y
aplicar filtros, como por ejemplo que solo nos interesar capturar el
tráfico que enviamos a los sitios web, o sea filtrar por puerto de
destino `80`.

La sentencia sería la siguiente:

``` {.bash org-language="sh" results="output" exports="code"}
tcpdump -i eth2 -n -A -c 1 dst port 80
```

En este caso logramos capturar la consulta al sitio `osiux.com` que
corresponde a la **IP** `67.208.113.123` y puerto `80`, para esto se
está usando un `Firefox` versión `15.0.1` en una máquina con `Ubuntu` y
el idioma preferido es `es_ar` (Español, Argentina).

En este caso, el que realiza la consulta es la **IP** `192.168.1.18`
desde el puerto `57935`.

``` {.example}
10:49:31.622425 IP 192.168.1.18.57935 > 67.208.113.123.80: Flags [P.], seq 3592177738:3592178048, ack 4115460638, win 457, options [nop,nop,TS val 21202290 ecr 455625744], length 310
E..j..@.@.....
.C.q{.O.P..HJ.L............
.C.r.(L.GET / HTTP/1.1
Host: osiux.com
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.0.1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: es-ar,es;q=0.8,en-us;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Connection: keep-alive
```

Es muchísima información la que se puede obtener con observar un sólo
paquete de red!

Entonces podemos saber:

-   qué sitios se visitan
-   quiénes los miran
-   qué escriben
-   qué leen

## y si chateamos?

Probemos que sucede si chateamos en la red local, sin salir a Internet.
Para esto, usamos **Pidgin**, un programa que soporta casi todos los
protocolos y servicios de chat existentes.

Primero instalamos **Pidgin**:

``` {.example}
sudo apt-get install pidgin
```

Luego lo iniciamos, escribiendo `pidgin` en una terminal o lo buscamos
en el menú de la interfaz gráfica, debería estar en
**Aplicaciones-\>Internet-\>Pidgin**

Al iniciar, nos solicita **añadir** una cuenta, elegimos el protocolo
**Bonjour** e ingresamos nuestro **Nombre** y **Apodo**, para finalizar
presionamos **Aceptar** y luego **Cerrar**.

Listo, ahora vamos a poder chatear con todos aquellos que en la red
local, tengan instalando un programa que soporte el protocolo
**Bonjour**, también conocido como **IChat** o **Avahi**.

Comenzamos a chatear con nuestros amigos y al mismo tiempo ejecutamos
`tcpdump` filtrando por el puerto `5298`

``` {.bash org-language="sh" results="output" exports="code"}
tcpdump -i eth2 -n -A -c5 port 5298
```

El resultado de capturar 5 paquetes es:

``` {.example}
11:15:55.330043 IP6 fe80::215:84ff:fe2b:6b8e.51378 > fe80::3e07:54ff:fe55:62d4.5298: Flags [P.], seq 31812643:31812912, ack 3913411495, win 551, options [nop,nop,TS val 21598217 ecr 29125604], length 269
`....-.@.............<Z.........>.T..Ub.......l#.A.....'.U.....
.I.	..k.<message to='Leito@zapata' from='osiris@osiale' type='chat'><body>bien, escribiendo el curso de ayer</body><html xmlns='http://www.w3.org/1999/xhtml'><body><font>bien, escribiendo el curso de ayer</font></body></html><x xmlns='jabber:x:event'><composing/></x></message>
11:15:55.330428 IP6 fe80::3e07:54ff:fe55:62d4.5298 > fe80::215:84ff:fe2b:6b8e.51378: Flags [.], ack 269, win 274, options [nop,nop,TS val 29130803 ecr 21598217], length 0
`.... .@........>.T..Ub..............<Z......A....m0....n......
...3.I.
11:16:05.557354 IP6 fe80::215:84ff:fe2b:6b8e.51378 > fe80::3e07:54ff:fe55:62d4.5298: Flags [P.], seq 269:554, ack 1, win 551, options [nop,nop,TS val 21600774 ecr 29130803], length 285
`....=...............<Z.........>.T..Ub.......m0.A.....'.e.....
.I.....3<message to='Leito@zapata' from='osiris@osiale' type='chat'><body>y necesito capturar el tr..fico de Bonjour</body><html xmlns='http://www.w3.org/1999/xhtml'><body><font>y necesito capturar el tr..fico de Bonjour</font></body></html><x xmlns='jabber:x:event'><composing/></x></message>
11:16:05.557715 IP6 fe80::3e07:54ff:fe55:62d4.5298 > fe80::215:84ff:fe2b:6b8e.51378: Flags [.], ack 554, win 291, options [nop,nop,TS val 29133360 ecr 21600774], length 0
`.... ..........>.T..Ub..............<Z......A....nM...#Y......
...0.I..
11:16:07.356720 IP6 fe80::215:84ff:fe2b:6b8e.51378 > fe80::3e07:54ff:fe55:62d4.5298: Flags [P.], seq 554:761, ack 1, win 551, options [nop,nop,TS val 21601223 ecr 29133360], length 207
`....................<Z.........>.T..Ub.......nM.A.....'.......
.I.....0<message to='Leito@zapata' from='osiris@osiale' type='chat'><body>:-P</body><html xmlns='http://www.w3.org/1999/xhtml'><body><font>:-P</font></body></html><x xmlns='jabber:x:event'><composing/></x></message>
```

Si miramos el primer paquete ignorando los caracteres especiales, se
puede ver que el mensaje es para **Leito** desde la máquina **zapata** y
lo envía **osiris** desde la máquina **osiale** y el cuerpo del mensaje
se encuentra entre las **etiquetas** `<body>` y `</body>`.

``` {.example}
<message to='Leito@zapata' from='osiris@osiale' type='chat'>
<body>bien, escribiendo el curso de ayer</body>
<html xmlns='http://www.w3.org/1999/xhtml'>
<body>
<font>bien, escribiendo el curso de ayer</font>
</body>
</html>
<x xmlns='jabber:x:event'><composing/></x>
</message>
```

Entonces, quiere decir que tanto lo que navegamos como lo que chateamos
puede ser interceptado y leído por cualquiera en la red, solo basta usar
`tcpdump`.

## el fin de la privacidad?

Cualquier **sniffer** como `tcpdump` puede capturar todo el tráfico de
la red y hasta se podría modificar el contenido de los paquetes que
viajan a través de la red sin que nos demos cuenta.

Y entonces, cómo hacemos para tener algo de privacidad?

La respuesta es **no enviar mensajes en texto plano**, para esto lo
mejor es **cifrar todos los mensajes**, hay varios protocolos que envían
y reciben todos los datos de manera cifrada.

En el caso de los sitios webs es posible acceder por **HTTPS** en lugar
de **HTTP**, por ejemplo, en lugar de ir a `http://google.com` podemos
acceder a `https://encrypted.google.com/` y asi todo lo que enviemos a
**google** irá cifrado y aunque alguien capture ese tráfico de red, **no
podrá entenderlo**, aunque no evitaremos que sepan que estamos
ingresando al sitio **google.com**.

Tener que tipear **https** en lugar de **http** todo el tiempo no es
algo cómodo y además la mayoría de las páginas web hacen enlaces a los
sitios usando **http**. La solución a este problema es instalar un
**plugin** en el navegador, por ejemplo para **Firefox** existe
**HTTPSEveryWhere**, que hace esto por nosotros y soporta una gran lista
de sitios webs, obviamente los más usados.

Para instalarlo, acceder a: <https://www.eff.org/https-everywhere-node>

También existen otras alternativas como usar un **túnel SSH**. Siempre
que dispongamos de una máquina remota con GNU/Linux conectada a internet
(en nuestra casa, por ejemplo) podríamos usarla para cifrar nuestra
conexión y lograr (por lo menos) que en la red local, en la que estamos
actualmente nadie pueda ver lo que hacemos.

Para esto, podemos hacer lo siguiente:

``` {.example}
ssh -fN -D 9090 osiris@osiux.com
```

De esta manera, de ahora en más vamos a tener un **Proxy SOCKS**
corriendo en el puerto `9090`, sólo bastaría decirle a todas las
aplicaciones que usan la red, que no se conecten directamente, sino que
utilicen `localhost:9090` como servidor **Proxy**.

En **Firefox** ir a
**Editar-\>Preferencias-\>Avanzadas-\>Red-\>Configuración**

Ahí seleccionamos **Configuración manual de proxy** e ingresamos en
**Servidor proxy SOCKS** la dirección **localhost y el puerto 9090**,
presionamos **Aceptar**, y listo, ya podemos navegar tranquilos.

En realidad, sólo estamos cifrando un tramo de la conexión, desde la
máquina en donde estamos hasta la máquina remota, desde esta última el
tráfico viajará sin el cifrado de **SSH**.

## por las dudas yo guardo el tráfico de red ;-)

Podemos decirle a `tcpdump` que en lugar de mostrarnos el tráfico de
red, lo guarde en un archivo, para luego analizarlo en profundidad.
También se utiliza para hacer monitoreo remoto o buscar la causa de
algún problema en la red, detectar alguna intrusión no autorizada, hacer
auditorías, etc.

Mediante `-s 0` indicamos que capture el paquete completo y con `-w` se
especifica el archivo donde se guarda el tráfico.

``` {.example}
sudo tcpdump -i eth2 -n -s 0 -w porlasdudas.pcap
```

Existen muchas herramientas que leen archivos `.pcap`, una de ellas es
**Wireshark**, que es un analizador de protocolos muy completo y que
además posee interfaz gráfica.

Lo instalamos:

``` {.example}
apt-get install wireshark
```

Podemos indicar a **WireShark** que inicie leyendo el archivo:

``` {.example}
wireshark -r porlasdudas.pcap
```

También se puede iniciar desde el menú
**Aplicaciones-\>Internet-\>Wireshark**

Una vez iniciado, se puede apreciar que la pantalla está dividida en
tres partes, que serían:

-   el listado de paquetes
-   panel de detalles del paquete seleccionado
-   panel de bytes del paquete seleccionado

Es bastante intuitivo y muy interesante para los curiosos! :-D

## no entendí nada! :-(

El análisis de tráfico de red, requiere de ciertos conocimientos básicos
de redes, sobre el modelo **OSI** y el modelo **TCP/IP**, saber sobre
**DNS**, **ARP** y otras tantas cosas como los **RFC**, pero a no
desesperar, leer aunque sea muy por arriba los siguiente links:

-   <https://es.wikipedia.org/wiki/Modelo_osi>
-   <https://es.wikipedia.org/wiki/Modelo_TCP/IP>

La próxima entrega veremos en un lenguaje muy simple y claro, lo básico
de cómo funcionan las redes y sobre todo cómo interactúan los distintos
elementos que la componen.

La idea de usar **tcpdump** era volverlos un poquito paranoicos, ahora
saben que es muy probable que alguien en algún punto de la red, esté
mirando (y hasta guardando) todos los datos que enviamos y recibimos,
aunque sólo se trate del *Administrador de la Red*.

# Introducción a las redes TCP/IP

## Topología, redes y Subredes

-   centralizada

![](img/redes-centralizadas.png)

-   descentralizada

-   en malla o *mesh*

![](img/redes-mesh.png)

## Asignación de IPs por medio de DHCP

-   DHCP server
-   DHCP client

### Red de 4 equipos

![](img/redes-lan.png)

### `B` dice, **necesito una IP!**

-   mensaje: `DHCPDISCOVER`
-   protocolo: UDP
-   puerto destino: 67
-   dirección física: 01:12:23:34:45:bb

![](img/redes-dhcp-discover.png)

### `D` dice, **yo te puedo dar IP!**

-   mensaje: `DHCPOFFER`
-   dirección física: 01:12:23:34:45:dd
-   dirección IP: 192.168.10.102
-   gateway: 192.168.10.1
-   dns primario: 8.8.8.8
-   dns secundario: 8.8.4.4

![](img/redes-dhcp-offer.png)

### `B` dice, confirmo recepción!

-   mensaje: `DHCPREQUEST`

![](img/redes-dhcp-request.png)

### `D` dice, confirmo confirmación!

-   mensaje: `DHCPACK`

![](img/redes-dhcp-ack.png)

## Resolución de nombres de dominios DNS

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
host localhost
```

``` {.example}
localhost.gcoop.com.ar has address 127.0.0.1
```

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
dig osiux.com
```

``` {.example}
; <<>> DiG 9.8.4-P1 <<>> osiux.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12788
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;osiux.com.			IN	A

;; ANSWER SECTION:
osiux.com.		300	IN	A	96.8.118.129

;; Query time: 198 msec
;; SERVER: 192.168.10.3#53(192.168.10.3)
;; WHEN: Tue Apr  9 23:29:33 2013
;; MSG SIZE  rcvd: 43

```

### viendo un paquete de query dns

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
tcpdump -r dns-query.pcap -nvX
```

``` {.example}
02:14:20.301428 IP (tos 0x0, ttl 64, id 27874, offset 0, flags [none], proto UDP (17), length 55)
127.0.0.1.57039 > 127.0.0.1.53: 39172+ A? osiux.com. (27)
0x0000:  4500 0037 6ce2 0000 4011 0fd2 7f00 0001  E..7l...@.......
0x0010:  7f00 0001 decf 0035 0023 fe36 9904 0100  .......5.#.6....
0x0020:  0001 0000 0000 0000 056f 7369 7578 0363  .........osiux.c
0x0030:  6f6d 0000 0100 01                        om.....
```

### analizando un paquete de query dns

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
tshark -r dns-query.pcap -VO dns
```

``` {.example}
Frame 1: 71 bytes on wire (568 bits), 71 bytes captured (568 bits)
Linux cooked capture
Internet Protocol Version 4, Src: 127.0.0.1 (127.0.0.1), Dst: 127.0.0.1 (127.0.0.1)
User Datagram Protocol, Src Port: 57039 (57039), Dst Port: domain (53)
Domain Name System (query)
Transaction ID: 0x9904
Flags: 0x0100 Standard query
0... .... .... .... = Response: Message is a query
.000 0... .... .... = Opcode: Standard query (0)
.... ..0. .... .... = Truncated: Message is not truncated
.... ...1 .... .... = Recursion desired: Do query recursively
.... .... .0.. .... = Z: reserved (0)
.... .... ...0 .... = Non-authenticated data: Unacceptable
Questions: 1
Answer RRs: 0
Authority RRs: 0
Additional RRs: 0
Queries
osiux.com: type A, class IN
Name: osiux.com
Type: A (Host address)
Class: IN (0x0001)

```

### capturar consultas al dns

``` {.example}
ssh root@linksys '/usr/sbin/tcpdump -i br0 -s 0 -w - dst port 53' >linksys.pcap
```

### ranking de dns

``` {.example}
tcpdump -r linksys.pcap -c 2000 -nnnA dst port 53 | \
egrep -o "A+\? .*\." | sed s/".$"//g | awk '{print $2}' | \
egrep -v "(osiux|fbcdn|akamai)" | sort | uniq -c | sort -nr | head
```

::: {#ranking-dns}
---- --------------------------
47   www.facebook.com
42   dns.msftncsi.com
41   su.ff.avast.com
37   ssl.google-analytics.com
37   ipv6.msftncsi.com
32   www.habbo.es
26   imap.googlemail.com
21   dynamic.zoneedit.com
19   www.msftncsi.com
18   kiwwwi.com.ar
---- --------------------------
:::

![](img/ranking-dns.png)

## Sniffers nmap, dsniff

### nmap

``` {.bash org-language="sh" session="yes" results="output"}
nmap -sV --open 192.168.10.0/24 -p22 | head
```

``` {.example}
Starting Nmap 5.21 ( http://nmap.org ) at 2014-01-04 21:39 ART
Nmap scan report for obelisco.osiux.bal (10.4.14.225)
Host is up (0.0047s latency).
PORT   STATE SERVICE VERSION
22/tcp open  ssh     Dropbear sshd 0.48 (protocol 2.0)
Service Info: OS: Linux

Nmap scan report for caipiroska.osiux.bal (10.4.14.229)
Host is up (0.0013s latency).
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 5.9p1 Debian 5ubuntu1.1 (protocol 2.0)
Service Info: OS: Linux

Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 256 IP addresses (2 hosts up) scanned in 33.07 seconds
```

## Túneles y Redes Privadas Virtuales VPN

### Redireccionar puertos con `ssh`

``` {.example}
ssh -L 2525:localhost:25 osiux.com
```

### Proxy Socks mediante ssh

``` {.example}
ssh -D 9090 osiux.com
```

### Tunel reverso con ssh

``` {.example}
ssh -R 12345:localhost:22 osiux.com
```

## Cómo saber la IP de un equipo?

### B dice, **cuál es la IP de D?**

-   Se que D es **00:14:d1:18:4a:dd**
-   Yo soy B y mi mac es **00:14:d1:18:4a:bb**
-   Todos reciben paquete ARP por difusión

![](img/redes-arp-1.png)

### D contesta, **mi IP es 10.4.14.225**

![](img/redes-arp-2.png)

### Quénes están en esta red?

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
sudo arp-scan --interface eth0 --localnet
```

:

``` {.example}
0 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.8.1: 256 hosts scanned in 1.625 seconds (157.54 hosts/sec). 0 responded
```

### pingueando

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ping -c 5 127.0.0.1
```

``` {.example}
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_req=1 ttl=64 time=0.066 ms
64 bytes from 127.0.0.1: icmp_req=2 ttl=64 time=0.050 ms
64 bytes from 127.0.0.1: icmp_req=3 ttl=64 time=0.050 ms
64 bytes from 127.0.0.1: icmp_req=4 ttl=64 time=0.048 ms
64 bytes from 127.0.0.1: icmp_req=5 ttl=64 time=0.049 ms

--- 127.0.0.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 3999ms
rtt min/avg/max/mdev = 0.048/0.052/0.066/0.010 ms
```

### capturando pings

``` {.example}
sudo tcpdump -i lo -nnnt -c 5 icmp
```

### viendo un `ping`

``` {.example}
sudo tcpdump -i lo -nnntvvX -c 1 -e icmp
```

``` {.example}
00:00:00:00:00:00 > 00:00:00:00:00:00, ethertype IPv4 (0x0800), length 98: (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto ICMP (1), length 84)
127.0.0.1 > 127.0.0.1: ICMP echo request, id 4177, seq 329, length 64
0x0000:  4500 0054 0000 4000 4001 3ca7 7f00 0001  E..T..@.@.<.....
0x0010:  7f00 0001 0800 a68d 1051 0149 e754 5e51  .........Q.I.T^Q
0x0020:  022f 0d00 0809 0a0b 0c0d 0e0f 1011 1213  ./..............
0x0030:  1415 1617 1819 1a1b 1c1d 1e1f 2021 2223  .............!"#
0x0040:  2425 2627 2829 2a2b 2c2d 2e2f 3031 3233  $%&'()*+,-./0123
0x0050:  3435 3637                                4567
```

## traceroute

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
traceroute -m 100 216.81.59.173
```

``` {.example}
traceroute to 216.81.59.173 (216.81.59.173), 100 hops max, 60 byte packets
1  malbec (192.168.10.3)  0.107 ms  0.087 ms  0.083 ms
2  10.29.64.1 (10.29.64.1)  9.180 ms  9.206 ms  9.190 ms
3  cpe-181-47-254-17.telecentro-reversos.com.ar (181.47.254.17)  9.645 ms  9.653 ms  9.706 ms
4  telecentro.baires1.bai.seabone.net (195.22.220.33)  10.882 ms  10.307 ms  10.762 ms
5  bundle-ether1.baires1.bai.seabone.net (195.22.220.32)  15.964 ms  16.074 ms  15.974 ms
6  * * *
7  xe-1-2-0.mia10.ip4.tinet.net (77.67.71.97)  142.397 ms  139.703 ms  142.354 ms
8  xe-2-1-0.atl11.ip4.tinet.net (89.149.184.21)  156.811 ms xe-3-0-0.atl11.ip4.tinet.net (89.149.180.202)  158.695 ms  158.561 ms
9  epik-networks-gw.ip4.tinet.net (77.67.69.158)  159.786 ms  159.491 ms  159.581 ms
10  po0-3.dsr2.atl.epikip.net (216.81.59.2)  176.330 ms  176.462 ms  176.281 ms
11  * * *
12  Episode.IV (206.214.251.1)  224.463 ms  226.258 ms  220.950 ms
13  A.NEW.HOPE (206.214.251.6)  250.974 ms  247.808 ms  259.092 ms
14  It.is.a.period.of.civil.war (206.214.251.9)  259.944 ms  250.907 ms  255.839 ms
15  Rebel.spaceships (206.214.251.14)  218.522 ms  226.211 ms  219.834 ms
16  striking.from.a.hidden.base (206.214.251.17)  241.201 ms  236.375 ms  232.261 ms
17  have.won.their.first.victory (206.214.251.22)  241.703 ms  236.591 ms  224.864 ms
18  against.the.evil.Galactic.Empire (206.214.251.25)  216.832 ms  216.318 ms  214.477 ms
19  During.the.battle (206.214.251.30)  208.949 ms  210.051 ms  208.008 ms
20  Rebel.spies.managed (206.214.251.33)  212.787 ms  212.294 ms  212.273 ms
21  to.steal.secret.plans (206.214.251.38)  255.908 ms  258.825 ms  257.972 ms
22  to.the.Empires.ultimate.weapon (206.214.251.41)  213.769 ms  213.009 ms  216.689 ms
23  the.DEATH.STAR (206.214.251.46)  218.461 ms  218.095 ms  219.359 ms
24  an.armored.space.station (206.214.251.49)  209.458 ms  211.553 ms  213.325 ms
25  with.enough.power.to (206.214.251.54)  216.680 ms  215.119 ms  215.551 ms
26  destroy.an.entire.planet (206.214.251.57)  229.043 ms  225.637 ms  225.987 ms
27  Pursued.by.the.Empires (206.214.251.62)  217.677 ms  217.609 ms  221.162 ms
28  sinister.agents (206.214.251.65)  212.421 ms  218.351 ms  217.477 ms
29  Princess.Leia.races.home (206.214.251.70)  217.438 ms  215.519 ms  215.707 ms
30  aboard.her.starship (206.214.251.73)  208.869 ms  211.286 ms  209.410 ms
31  custodian.of.the.stolen.plans (206.214.251.78)  254.545 ms  257.170 ms  257.258 ms
32  that.can.save.her (206.214.251.81)  230.703 ms  226.975 ms  224.884 ms
33  people.and.restore (206.214.251.86)  213.461 ms  212.716 ms  210.437 ms
34  freedom.to.the.galaxy (206.214.251.89)  240.426 ms  238.993 ms  238.415 ms
35  0-----I-------I-----0 (206.214.251.94)  225.745 ms  228.150 ms  227.564 ms
36  0------------------0 (206.214.251.97)  239.726 ms  242.001 ms  241.268 ms
37  0-----------------0 (206.214.251.102)  216.268 ms  217.171 ms  219.559 ms
38  0----------------0 (206.214.251.105)  213.450 ms  212.874 ms  210.651 ms
39  0---------------0 (206.214.251.110)  211.686 ms  212.642 ms  213.635 ms
40  0--------------0 (206.214.251.113)  243.655 ms  241.858 ms  238.552 ms
41  0-------------0 (206.214.251.118)  218.823 ms  217.698 ms  217.625 ms
42  0------------0 (206.214.251.121)  221.651 ms  217.936 ms  217.573 ms
43  0-----------0 (206.214.251.126)  254.899 ms  255.905 ms  253.906 ms
44  0----------0 (206.214.251.129)  219.658 ms  214.849 ms  218.945 ms
45  0---------0 (206.214.251.134)  254.542 ms  255.310 ms  258.304 ms
46  0--------0 (206.214.251.137)  221.805 ms  218.502 ms  216.293 ms
47  0-------0 (206.214.251.142)  218.543 ms  219.614 ms  218.705 ms
48  0------0 (206.214.251.145)  213.497 ms  216.123 ms  215.188 ms
49  0-----0 (206.214.251.150)  250.876 ms  250.727 ms  253.698 ms
50  0----0 (206.214.251.153)  217.614 ms  218.582 ms  219.936 ms
51  0---0 (206.214.251.158)  216.849 ms  214.232 ms  212.980 ms
52  0--0 (206.214.251.161)  217.178 ms  216.413 ms  215.734 ms
53  0-0 (206.214.251.166)  228.141 ms  231.885 ms  226.433 ms
54  00 (206.214.251.169)  255.405 ms  258.888 ms  258.736 ms
55  I (206.214.251.174)  239.065 ms  241.727 ms  241.572 ms
56  By.Ryan.Werber (206.214.251.177)  228.102 ms  226.607 ms  228.030 ms
57  Blizzards.Breed.CCIE.Creativity (206.214.251.182)  239.656 ms  238.884 ms  239.301 ms
58  Please.Try.Again.Tracerote.to.obiwan.scrye.net (206.214.251.185)  215.164 ms  215.725 ms  216.688 ms
59  read.more.at.beaglenetworks.net (206.214.251.190)  228.818 ms * *
```

``` {.bash org-language="sh" session="yes" results="output"}
traceroute -m 255 obiwan.scrye.net | awk {'print $2'}
```

## protocolos

![](img/redes-protocolos-1.png)

![](img/redes-protocolos-2.png)

### Qué tiene un paquete TCP/IP?

``` {.example}
+------------------------+--------------------------+
| MAC origen fe:ca:fe:ca | MAC destino  ca:fe:ca:fe |
+------------------------+--------------------------+
| IP origen 192.168.1.22 | IP destino  96.8.118.129 |
+---------------------------------------------------+
| Puerto origen    45678 | Puerto destino: 80       |
+------------------------+--------------------------+
| Nro Secuencia    12345 | Nro ACK                  |
+---+---+---+---+---+----+--------------------------+
| U | A | P | R | S | F | GET / HTTP/1.0            |
| R | C | S | S | Y | I |                           |
| G | K | H | T | N | N |                           |
+---+---+---+---+---+---+---------------------------+
```

### Ethernet header

``` {.example}
|                   |1                  |2                  |3  |
|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Hardware type         |          Protocol type        |
+---------------+---------------+-------------------------------+
|Hw address len.|Pr address len.|             Opcode            |
+---------------+---------------+-------------------------------+
|               Source hardware address                         |
+---------------------------------------------------------------+
|               Source protocol address                         |
+---------------------------------------------------------------+
|               Destination hardware address                    |
+---------------------------------------------------------------+
|               Destination protocol address                    |
+---------------------------------------------------------------+
|                            Data                               |
+---------------------------------------------------------------+
```

## IP header

``` {.example}
|                   |1                  |2                  |3  |
|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version|  IHL  | Diff.Services |     Total length              |
+-------+-------+---------------+-----+-------------------------+
|        Identification         |Flags|         Fragment offset |
+---------------+---------------+-----+-------------------------+
|    TTL        | Protocol      | Header checksum               |
+---------------+---------------+-------------------------------+
|                       Source IP address                       |
+---------------------------------------------------------------+
|                  Destination IP address                       |
+---------------------------------------------------------------+
|                     Options and padding                       |
+---------------------------------------------------------------+
```

## UPD header

``` {.example}
|                   |1                  |2                  |3  |
|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |        Destination Port       |
+-------------------------------+-------------------------------+
|          Length               |        Checksum               |
+-------------------------------+-------------------------------+
|                           Data                                |
+---------------------------------------------------------------+
```

## TCP header

``` {.example}
|                   |1                  |2                  |3  |
|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|2|3|4|5|6|7|8|9|0|1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |        Destination Port       |
+-------------------------------+-------------------------------+
|                        Sequence Number                        |
+-------------------------------+-------------------------------+
|                     Acknowledgment Number                     |
+-------+-----+-----+-+-+-+-+-+-+-------------------------------+
|dOffset|rsrvd| ECN |U|A|P|R|S|F|        Window                 |
|       |     |     |R|C|S|S|Y|I|                               |
|       |     |     |G|K|H|T|N|N|                               |
+-------+-----+-----+-+-+-+-+-+-+-------------------------------+
| Checksum                      | Urgent Pointer                |
+-------------------------------+-------------------------------+
|                      Options and padding                      |
+---------------------------------------------------------------+
|                           Data                                |
+---------------------------------------------------------------+
```

## ChangeLog

-   \[2013-06-05 mié\] simplifico y hago correcciones varias
-   \[2013-04-09 mar\] corrijo gráficos ascii-art
-   \[2013-04-04 jue\] primer borrador general

# Configuración de servicios básicos

## Apache

Instalar Apache

``` {.bash org-language="sh" exports="code"}
apt-get install apache2-mpm-prefork libapache2-mod-php5
```

Crear un VirtualHost

Primero se debe crear un archivo preferentemente con el nombre del
dominio y ubicarlo en `sites-available`.

``` {.bash org-language="sh" exports="code"}
vi /etc/apache2/sites-available/sitioweb.com
```

El contenido debe tener al menos los siguientes parámetros:

``` {.example}
<VirtualHost *:80>
ServerName  sitioweb.com
ServerAlias www.sitioweb.com
DocumentRoot /var/www/sitioweb
<Directory /var/www/>
Options Indexes FollowSymLinks MultiViews
AllowOverride None
Order allow,deny
allow from all
</Directory>
ErrorLog /var/log/apache2/error.log
LogLevel warn
CustomLog /var/log/apache2/access.log combined
</VirtualHost>
```

Luego se debe habilitar el sitio, de la siguiente manera:

``` {.bash org-language="sh" exports="code"}
a2ensite sitioweb.com
```

Iniciar, Detener y Reiniciar Apache

Los cambios en los VirtualHost son aplicados sólo cuando se reinicia el
servicio, es posible hacerlo de dos maneras:

``` {.bash org-language="sh" exports="code"}
/etc/init.d/apache2 start|stop|restart
apache2ctl stop|start|graceful
```

## PHP

## Instalar PHP

``` {.bash org-language="sh" exports="code"}
apt-get install php5 php-pear php-mail php-doc phpmyadmin libapache2-mod-php5 php5-cli php5-mysql php5-xdebug
```

## Configurar PHP

``` {.example}
vi /etc/php5/apache2/php.ini

memory_limit = 128M
error_reporting  =  E_ALL
upload_max_filesize = 20M
```

## Programar PHP

``` {.example}
vi /var/www/contacts_emails.php

<?
include "DB.php";
mysql = new DB();
$dsn = 'mysqli://usuario:secreto@localhost/mibase;
b = $mysql->connect($dsn);
echo '<table bgcolor="gray" border="0" cellspacing="1" cellpadding="1">';
$query = "SELECT      c.name, e.email_address from contacts c
INNER JOIN  contacts_emails ce on ce.contact_id = c.id
INNER JOIN  emails e on e.id = ce.email_id
ORDER BY    c.name, e.address;";
$result = $db->query($query);
while($row = $result->fetchRow (DB_FETCHMODE_ASSOC))
{
printf('<tr>
<td bgcolor="white">%s</td>
<td bgcolor="white">%s</td>
</tr>',$row['name'],$row['address']);
}
echo '</table>';
?>
```

## MySQL

## Crear Base y Usuario

``` {.example}
CREATE DATABASE sugar CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE user sugar;
GRANT ALL ON sugar.* TO 'sugar'@'%';
SET PASSWORD FOR 'sugar'@'%'=PASSWORD('sugar');
```

## Otorgar privilegios a un usuario\@host a una base

``` {.example}
GRANT ALL PRIVILEGES ON mydb.* TO myuser@localhost IDENTIFIED BY 'mypasswd';
```

## UTF8

Definir UTF8 en el cliente

``` {.example}
mysql --default-character-set=utf8
```

Definir UTF8

``` {.example}
SET NAMES utf8; SELECT * FROM contacts;
```

## MySQL de Bash

Definir Alias

``` {.example}
set alias sugar = 'mysql --default-character-set=utf8 -u sugar -psugar -B sugar -h localhost '
```

Ejecutar consulta

``` {.example}
echo "SELECT user_name FROM users WHERE is_admin = 1;" | sugar
```

Listado de Tablas

``` {.example}
set alias tablas='echo "show tables" | sugar | grep -v Tables_in | sort -u'
```

Listado Tabla Campo

``` {.example}
set alias tablacampo='echo "show tables" | sugar | grep -v Tables_in | while read t; \
do d=$(echo "desc "$t";" | cct15 | grep -v Field | awk1); \
for c in $d;do echo $t"__"$c;done ;done'
```

Quitar nombre de campo

``` {.example}
mysql -N
```

Vaciar todas las tablas que contengan la palabra **calls**

``` {.example}
sugar < $(echo "show tables" | sugar | grep calls | while read t;do echo "TRUNCATE table $t;";done)
```

## MySQL desde Vim

Agregar en `.vimrc`

``` {.example}
command -range=% SUGAR :<line1>,<line2>w !mysql -u sugar -psugar -B sugar -t -v -v -v
```

Ejecutar todo el archivo

``` {.example}
:SUGAR
```

Ejecutar la línea actual

``` {.example}
:. SUGAR
```

Ejecutar un rango de líneas

``` {.example}
:3,8 SUGAR
```

Ejecutar desde línea actual hasta el final

``` {.example}
:.,$ SUGAR
```

Usar diccionarios

``` {.example}
:set dictionary=tablas, tablacampo

CTRL-X CTRL-K
```

## Reemplazar Texto

### Traducir valores

``` {.sql engine="mysql" exports="code"}
SELECT      REPLACE(REPLACE(direction,'Inbound','Entrante'),'Outbound','Saliente') AS direccion
FROM        calls;
```

### Actualizar registros

``` {.sql engine="mysql" exports="code"}
UPDATE contacts SET last_name = REPLACE(last_name, 'NUNEZ', 'NUÑEZ');
```

## Buscar duplicados

``` {.sql engine="mysql" exports="code"}
SELECT      last_name, first_name, COUNT(id) AS total
FROM        contacts
GROUP BY    first_name, last_name
HAVING      total > 1
ORDER BY    last_name, first_name;
```

## Agrupar

``` {.sql engine="mysql" exports="code"}
SELECT      name,
(
SELECT  CASE
WHEN    EXTRACT(HOUR FROM date_start) < 12
THEN    'mañana'
ELSE    'tarde'
END
) AS turno,
COUNT(id) as total
FROM        calls
GROUP BY    name, turno
HAVING      total > 500
ORDER BY    total DESC;
```

## Cruzando tablas

Explicito mejor que implicito

``` {.sql engine="mysql" exports="code"}
SELECT      COUNT(cc.id) AS total
FROM        calls_contacts cc
LEFT JOIN   contacts co ON co.id = cc.contact_id ;
AND         cc.deleted = 0
AND         co.deleted = 0

SELECT      COUNT(cc.id) AS total
FROM        calls_contacts cc, contacts co
WHERE       co.deleted = 0
AND         co.id = cc.contact_id
AND         cc.deleted = 0
```

Contactos con llamadas

``` {.sql engine="mysql" exports="code"}
SELECT      COUNT(cc.id) AS total
FROM        calls_contacts cc
LEFT JOIN   contacts co ON co.id = cc.contact_id;
```

Contactos con llamadas entrantes

``` {.sql engine="mysql" exports="code"}
SELECT      co.last_name,
co.first_name,
CONVERT_TZ(date_start, '+00:00', '-03:00') as fecha
FROM        contacts co
INNER JOIN  calls_contacts cc ON (cc.contact_id = co.id AND cc.deleted = 0)
INNER JOIN  calls ca ON (ca.id = cc.call_id AND ca.deleted = 0)
WHERE       co.deleted = 0
AND         last_name IS NOT NULL
LIMIT       20;
```

Actualizar las llamadas de un contacto

``` {.sql engine="mysql" exports="code"}
UPDATE      calls ca, contacts co, calls_contacts cc
SET         ca.assigned_user_id = (
SELECT  id
FROM    users
WHERE   user_name = 'osiris'
)
WHERE       ca.id = cc.call_id
AND         co.id = cc.contact_id
AND         co.id = '2a756d50-ae20-0754-a7c7-49beb64cee37';


UPDATE      calls ca
INNER JOIN  calls_contacts cc ON cc.call_id = ca.id
INNER JOIN  contacts co ON co.id = cc.contact_id
SET         ca.assigned_user_id = (
SELECT  id
FROM    users
WHERE   user_name = 'osiris'
)
WHERE       co. = '2a756d50-ae20-0754-a7c7-49beb64cee37';
```

## Insertar desde otra tabla

``` {.sql engine="mysql" exports="code"}
DROP TABLE IF EXISTS calls_contacts_today;

CREATE TABLE `calls_contacts_today` (
`id` varchar(36) NOT NULL,
`contact_id` varchar(36) NOT NULL,
`call_id` varchar(36) NOT NULL,
`status` varchar(25) default NULL,
`direction` varchar(25) default NULL,
PRIMARY KEY  (`call_id`)
);

INSERT INTO calls_contacts_today
(id, contact_id, call_id, status, direction)
SELECT      UUID(), cc.contact_id, ca.id, ca.status, ca.direction
FROM        calls ca
INNER JOIN  calls_contacts cc ON cc.call_id = ca.id
WHERE       DATE(ca.date_start) = CURDATE();
```

## AUTOCOMPLETE

``` {.sql engine="mysql" exports="code"}
\#

SELECT FROM t<Presionar TAB>
```

## COUNT

``` {.sql engine="mysql" exports="code"}
UPDATE calls set deleted = 1 WHERE status = 'Not Held';
SELECT COUNT(*) FROM calls;
SELECT COUNT(id) FROM calls;
SELECT COUNT(id) FROM calls WHERE deleted = 0;
SELECT SQL_CALC_FOUND_ROWS id FROM calls WHERE deleted = 0 LIMIT 1; SELECT FOUND_ROWS();
```

## EXPLAIN

``` {.sql engine="mysql" exports="code"}
EXPLAIN SELECT      COUNT(id)
FROM        calls
WHERE       deleted = 0
AND         assigned_user_id = 'ba8630eb-7442-73f9-a88e-49b6be5882c2';
```

## INDEX

``` {.sql engine="mysql" exports="code"}
SHOW INDEX IN calls;
ALTER TABLE calls ADD INDEX idx_deleted_user (deleted, assigned_user_id);
ALTER TABLE calls DROP INDEX idx_deleted_user;
```

## UNIQUE

``` {.sql engine="mysql" exports="code"}
ALTER TABLE calls_contacts_today ADD UNIQUE idx_contact_call (contact_id, call_id);
```

## AUTO~INCREMENT~

``` {.sql engine="mysql" exports="code"}
ALTER TABLE tracker AUTO_INCREMENT = 9;
ALTER TABLE tracker MODIFY id INT(11) AUTO_INCREMENT;
```

## REGEXP

``` {.sql engine="mysql" exports="code"}
UPDATE      contacts
SET         postal = SUBSTR(postal,4,7)
WHERE       postal NOT REGEXP '^[0-9]{4}$'
AND         postal REGEXP '^[A-Z]{3}[0-9]{4}$'
```

## RANDOM

``` {.sql engine="mysql" exports="code"}
SELECT RAND();
SELECT MD5(RAND());
SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 8);
```

## Postfix

`TODO`

## DHCP

### `dhcp3`

1.  configuración

Es muy simple la sintaxis del archivo `/etc/dhcp3/dhcpd.conf` donde
podemos especificar los sevidores de dns (**domain-name-servers**)
entre otros parámetros, lo importante es definir la subred, en el
caso de tratarse de una LAN es muy común la siguiente configuración:

``` {.example}
dns-update-style none;
option domain-name-servers 200.45.191.35,200.45.48.233;
default-lease-time 6000;
max-lease-time 7200;
log-facility local7;

subnet 192.168.0.0 netmask 255.255.255.0 {
range 192.168.0.100 192.168.0.150;
option routers 192.168.0.1;
}
```

-   Se trata de una red `/24`, es decir que los primeros tres
octetos están fijos, tal como indica la máscara de red
`255.255.255.0`.
-   Se entregarán IPs dinámicamente desde la `192.168.0.100` a la
`192.168.0.150`, siendo `192.168.0.1` la IP del `gateway`.

En el mismo archivo se pueden asignar IPs fijas, ingresando la
dirección física (**MAC Address**) y la IP elegida:

``` {.example}
host syrah {
hardware ethernet 00:AC:DC:00:CA:FE;
fixed-address 192.168.0.4;
}
```

2.  iniciar y detener el servicio

``` {.example}
/etc/init.d/dhcp start
/etc/init.d/dhcp stop
```

# Metodologías ágiles de trabajo

## Time Management for System Administrators

-   <http://www.tomontime.com/>

## GTD

Es un método de gestión de las actividades y el título de un libro de
David Allen [^1], libro que en español se ha editado con el título
**Organízate con eficacia** [^2].

**GTD** se basa en el principio de que una persona necesita borrar de su
mente todas las tareas que tiene pendientes guardándolas en un lugar
específico. De este modo, se libera a la mente del trabajo de recordar
todo lo que hay que hacer, y se puede concentrar en la efectiva
realización de aquellas tareas.

A diferencia de otros expertos en gestión del tiempo, **Allen** no se
centra en el establecimiento de prioridades. En su lugar, él insta a la
creación de listas de tareas específicas para cada contexto, por
ejemplo, una lista de llamadas telefónicas pendientes o recados que
hacer en la ciudad. También sugiere que cualquier nueva tarea que pueda
ser completada en menos de dos minutos debería ser hecha inmediatamente.

## Workflow

![](img/gtd-workflow.png){width="640" height="480" title="GTD Workflow"}

## Recopilar

-   Capturar todo en ****INBOX**** y seguir trabajando
-   Ideas
-   Tareas
-   Recordatorios
-   Cosas por hacer en general
-   Utilizar una herramienta de captura ágil
-   Capturar... y olvidarse de momento
-   Aplicar **regla de los 2 minutos**

## Procesar

-   Procesar por completo el **INBOX**
-   Si requiere actuar
-   Delegar a alguien
-   Asignar a carpeta (sólo si depende de mi)
-   No requiere actuar
-   Eliminar
-   Archivar
-   Procesar de manera ágil, tomar decisiones rápidas
-   Aislarse de las distracciones
-   Aplicar **regla de los 2 minutos**

## Organizar

-   Asignar acciones a una carpeta
-   **PRÓXIMO**, a realizar en un lapso de tiempo corto
-   **PROYECTO**, cosas a realizar dentro de un proyecto
-   **EN ESPERA**, depende de otra persona
-   **ALGÚN DÍA**, no tiene prioridad temporal

## Revisar

-   Fijar un momento para la revisión
-   Revisión ágil y diligente
-   Localizar y cuidar las tareas clave
-   Las acciones cambian de carpeta

## Scrum

`TODO`

[DONE]{.done .DONE} Sprint \<2012-08-06 lun\>--\<2012-08-10 vie\>

1.  disponibilidad horaria estimada

lun    mar   mie   jue    vie   tot
-------- ------ ----- ----- ------ ----- ------
diego    2.5    3     0     1.5    3     10\.
joac     3      3     0     1.5    3     10.5
jose     6      6     0     3      6     21
hugo     4      0     0     3      6     13
osiris   3      3     0     3      6     15
18.5   15    0     12\.   24    69.5

2.  disponibilidad horaria real

lun    mar   mie   jue    vie   tot
-------- ------ ----- ----- ------ ----- ------
diego    2.5    3     0     1.5    3     10\.
joac     3      3     0     1.5    3     10.5
jose     6      6     0     3      6     21
hugo     4      0     0     3      6     13
osiris   3      3     0     3      6     15
18.5   15    0     12\.   24    69.5

3.  estimado versus real

fecha        est    real   pend est   pend real
------------ ------ ------ ---------- -----------
2012-08-05   0      0      34.75      34.75
2012-08-06   9.25   9      25.5       25.75
2012-08-07   7.5    7.5    18\.       18.25
2012-08-08   0      0      18\.       18.25
2012-08-09   6      6      12\.       12.25
2012-08-10   12     4      0\.        8.25

4.  burndown

![](gca-scrum-2012-08-06.png)

## Pomodoro

`TODO`

## Autofocus

`TODO`

## Kanban

`TODO`

# Aplicaciones de Consola

## chat

-   irssi
-   centerim
-   finch

## copias

-   rdiffbackup
-   rsync
-   scp

## correo

-   alpine
-   mutt
-   sup

## descargas

-   axel
-   rtorrent
-   wget
-   ncftp

## disco

-   ncdu

## editores

-   emacs
-   vim

## explorador de archivos

-   mc
-   ranger
-   vifm

## monitoreo

### `top`

### `atop`

Es posible consultar el registro de un día en particular, por ejemplo
qué procesos estaban consumiendo mayor acceso a disco el 24/01/2014 en
el servidor tempranillo entre las 10 y 12hs:

``` {.bash org-language="sh" session="yes" results="output"}
ssh tempranillo atop -r /var/log/atop/atop_20140121 -b 10:00 -e 12:00 -D | head -30
```

``` {.example}

ATOP - tempranillo       2014/01/21  10:00:02       ------         10m0s elapsed
PRC | sys    4.15s | user   7.35s | #proc    255 | #zombie    0 | #exit    330 |
CPU | sys       1% | user      1% | irq       0% | idle    798% | wait      0% |
cpu | sys       0% | user      0% | irq       0% | idle     99% | cpu000 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu001 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu005 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu002 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu007 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu006 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu004 w  0% |
cpu | sys       0% | user      0% | irq       0% | idle    100% | cpu003 w  0% |
CPL | avg1    0.00 | avg5    0.01 | avg15   0.05 | csw   137938 | intr  135127 |
MEM | tot     3.8G | free   44.8M | cache   2.1G | buff  258.7M | slab  225.9M |
SWP | tot     4.0G | free    3.9G |              | vmcom   2.3G | vmlim   5.9G |
PAG | scan      84 | stall      0 |              | swin       0 | swout      0 |
DSK |         xvdb | busy      0% | read     171 | write    923 | avio 0.83 ms |
DSK |         xvda | busy      0% | read       8 | write   1095 | avio 0.22 ms |
NET | transport    | tcpi    3900 | tcpo    3845 | udpi     351 | udpo     372 |
NET | network      | ipi     4312 | ipo     3829 | ipfrw      0 | deliv   4295 |
NET | eth0    ---- | pcki    2153 | pcko    1670 | si    3 Kbps | so   18 Kbps |
NET | lo      ---- | pcki    2160 | pcko    2160 | si    5 Kbps | so    5 Kbps |

PID  SYSCPU  USRCPU  VGROW  RGROW  RDDSK  WRDSK ST EXC S  DSK CMD
3595   0.43s   0.61s     0K    28K     0K  2856K --   - S  19% mysqld
4400   0.02s   0.07s  1876K   152K  2180K    56K --   - S  15% imap
2573   0.01s   0.00s     0K     0K     0K  2164K --   - S  15% jbd2/xvdb-8
1358   0.01s   0.00s     0K     0K     0K  1732K --   - S  12% kjournald
2238   0.25s   0.89s   552K   596K     0K  1676K --   - R  11% /usr/sbin/amav
```

### `htop`

### `iftop`

### `iotop`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh malbec 'sudo iotop -b -o -n 2 -d 5'
```

``` {.example}
Total DISK READ: 0.00 B/s | Total DISK WRITE: 0.00 B/s
TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN      IO    COMMAND
Total DISK READ: 0.00 B/s | Total DISK WRITE: 0.00 B/s
TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN      IO    COMMAND
1552 be/4 root        0.00 B/s  815.89 B/s  0.00 %  0.00 % syslogd
```

### `ioping`

``` {.bash org-language="sh" session="yes" results="output"}
ioping -c 5 /mnt/data
```

``` {.example}
4096 bytes from /mnt/data (xfs /dev/mapper/data): request=1 time=20.8 ms
4096 bytes from /mnt/data (xfs /dev/mapper/data): request=2 time=0.6 ms
4096 bytes from /mnt/data (xfs /dev/mapper/data): request=3 time=0.6 ms
4096 bytes from /mnt/data (xfs /dev/mapper/data): request=4 time=0.6 ms
4096 bytes from /mnt/data (xfs /dev/mapper/data): request=5 time=0.6 ms

--- /mnt/data (xfs /dev/mapper/data) ioping statistics ---
5 requests completed in 4023.8 ms, 216 iops, 0.8 mb/s
min/avg/max/mdev = 0.6/4.6/20.8/8.1 ms
```

### mon

### monit

### munin

### `mtr`

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
mtr -r -c 5 -n osiux.com
```

``` {.example}
HOST: amaretto                    Loss%   Snt   Last   Avg  Best  Wrst StDev
1.|-- 192.168.10.3               0.0%     5    0.2   0.2   0.2   0.2   0.0
2.|-- 10.29.64.1                 0.0%     5    7.3   7.3   6.9   8.0   0.4
3.|-- 181.47.254.17              0.0%     5    8.4   8.4   7.1   9.8   1.0
4.|-- 208.178.195.210            0.0%     5    9.4  10.1   8.8  11.9   1.4
5.|-- 208.178.195.209            0.0%     5    7.5   7.8   7.0   9.1   0.9
6.|-- 67.16.142.93               0.0%     5  171.9 175.3 170.2 192.6   9.7
7.|-- 204.93.144.25              0.0%     5  171.4 178.4 171.4 201.7  13.1
8.|-- 204.93.204.153            40.0%     5  173.3 174.2 173.3 174.6   0.8
9.|-- 50.31.170.122              0.0%     5  180.6 180.9 179.6 183.6   1.6
10.|-- 206.217.137.250            0.0%     5  181.1 182.3 179.5 188.5   3.6
11.|-- 96.8.118.251              20.0%     5  178.4 178.0 176.9 178.7   0.8
12.|-- 96.8.118.129              20.0%     5  181.5 182.2 181.5 183.0   0.6
```

### sysstat

### `vnstat`

1.  top 10

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh osiux 'vnstat -i venet0 -t'
```

``` {.example}
venet0  /  top 10

#      day          rx      |     tx      |    total    |   avg. rate
-----------------------------+-------------+-------------+---------------
1   03/19/13       4.09 GiB |   64.21 GiB |   68.30 GiB |    6.63 Mbit/s
2   03/20/13     930.99 MiB |   23.57 GiB |   24.48 GiB |    2.38 Mbit/s
3   11/09/13       3.58 GiB |   18.64 GiB |   22.23 GiB |    2.16 Mbit/s
4   03/26/13       1.02 GiB |   18.19 GiB |   19.22 GiB |    1.87 Mbit/s
5   03/25/13     735.60 MiB |   16.55 GiB |   17.27 GiB |    1.68 Mbit/s
6   03/27/13     695.73 MiB |   13.61 GiB |   14.29 GiB |    1.39 Mbit/s
7   03/21/13     700.46 MiB |   13.58 GiB |   14.26 GiB |    1.38 Mbit/s
8   04/09/13     648.98 MiB |   13.32 GiB |   13.95 GiB |    1.35 Mbit/s
9   01/07/14      13.21 GiB |  356.93 MiB |   13.56 GiB |    1.32 Mbit/s
10   07/03/13     830.55 MiB |   12.69 GiB |   13.50 GiB |    1.31 Mbit/s
-----------------------------+-------------+-------------+---------------
```

2.  vista mensual

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh osiux 'vnstat -i venet0 -m'
```

``` {.example}
venet0  /  monthly

month        rx      |     tx      |    total    |   avg. rate
------------------------+-------------+-------------+---------------
Mar '13     16.50 GiB |  190.62 GiB |  207.12 GiB |  648.70 kbit/s
Apr '13     20.32 GiB |  125.04 GiB |  145.36 GiB |  470.42 kbit/s
May '13     15.09 GiB |    6.23 GiB |   21.33 GiB |   66.79 kbit/s
Jun '13     15.15 GiB |   10.28 GiB |   25.43 GiB |   82.29 kbit/s
Jul '13     19.02 GiB |   19.53 GiB |   38.55 GiB |  120.75 kbit/s
Aug '13     24.59 GiB |   21.24 GiB |   45.83 GiB |  143.53 kbit/s
Sep '13     15.25 GiB |    8.18 GiB |   23.43 GiB |   75.84 kbit/s
Oct '13     26.23 GiB |   25.19 GiB |   51.42 GiB |  161.03 kbit/s
Nov '13     10.20 GiB |   30.08 GiB |   40.28 GiB |  130.36 kbit/s
Dec '13      1.67 GiB |    9.41 GiB |   11.08 GiB |   34.69 kbit/s
Jan '14     25.88 GiB |    7.73 GiB |   33.61 GiB |  105.25 kbit/s
Feb '14      4.46 GiB |    2.76 GiB |    7.22 GiB |   70.61 kbit/s
------------------------+-------------+-------------+---------------
estimated     12.57 GiB |    7.79 GiB |   20.36 GiB |
```

3.  vista semanal

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh osiux 'vnstat -i venet0 -w'
```

``` {.example}
venet0  /  weekly

rx      |     tx      |    total    |   avg. rate
---------------------------+-------------+-------------+---------------
last 7 days      3.16 GiB |    2.30 GiB |    5.46 GiB |   76.48 kbit/s
last week      3.19 GiB |    2.19 GiB |    5.39 GiB |   74.70 kbit/s
current week    418.63 MiB |  265.81 MiB |  684.44 MiB |   70.05 kbit/s
---------------------------+-------------+-------------+---------------
estimated      3.12 GiB |    1.98 GiB |    5.09 GiB |
```

4.  vista por horas

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
ssh osiux 'vnstat -i venet0 -h'
```

``` {.example}
venet0                                                                   22:14
^                                                                       r
|                                                                       r
|  r  r  r  r  r  r  r  r  r  r                                         r
|  r  r  r  r  rt r  r  r  r  r                                         r
|  r  r  r  r  rt r  r  r  r  r                           t             r
|  r  r  r  r  rt r  r  r  r  rt                          t        t    r
|  rt r  r  r  rt r  rt r  r  rt                          t  t     t    r
|  rt r  r  r  rt r  rt rt r  rt                       t  t  t     t    r
|  rt rt rt r  rt r  rt rt r  rt              t  t     t  t  t     t    r
|  rt rt rt r  rt r  rt rt r  rt        t  t  t  t  t  t  t rt  t  t  t r
-+--------------------------------------------------------------------------->
|  23 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22

h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)
23      38043      18600    07      39022       3080    15       1618       6379
00      39348       9530    08      38429      23452    16       2715      17279
01      39080      10637    09       1997       3372    17       3533      27827
02      38853       3011    10       2148       3307    18       4522      21075
03      38293      32727    11       1117       5484    19       2201       6809
04      38632       4056    12       2979       7545    20       4449      23659
05      39518      18170    13       2040      10555    21       2587       8113
06      37873      14265    14       3063      10136    22      44656       1721
```

### multitail

### logcheck

## musica

-   moc

## navegadores web

-   elinks
-   links
-   lynx
-   w3m

## red

-   wicd-curses
-   tshark
-   tcpdump
-   netcat
-   nmap

## rss

-   newsbeuter

## seguridad

-   chrootkit
-   cron-apt
-   fail2ban
-   rkhunter

## utilitarios

-   screen
-   tmux

## versionado

-   etckeeper
-   git-core
-   mercurial
-   subversion
-   tig

## ssh

### `parallel-ssh`

Armamos un listado con los **hostnames** de cada servidor y lo
guardarmos en un archivo, por ejemplo en `~/.ssh/gcoop`, ahora solo
falta indicar el comando a ejecutar `uptime` en este caso y listo!

``` {.bash org-language="sh" session="yes" results="output" exports="both"}
parallel-ssh -i -h ~/.ssh/gcoop uptime | tee
```

``` {.example}
[1] 13:14:09 [SUCCESS] redmine
13:13:37 up 6 days, 12:08,  0 users,  load average: 0.00, 0.02, 0.00
[2] 13:14:09 [SUCCESS] mysqlcentos
13:13:37 up 6 days, 12:38,  0 users,  load average: 0.00, 0.00, 0.00
[3] 13:14:09 [SUCCESS] torrontes
13:13:37 up 37 days, 22:39,  0 users,  load average: 0.20, 0.21, 0.22
[4] 13:14:09 [SUCCESS] ssug0003lx
13:13:37 up 6 days, 12:11,  0 users,  load average: 0.00, 0.00, 0.00
[5] 13:14:09 [SUCCESS] squeeze
13:13:37 up 6 days, 12:16,  0 users,  load average: 0.00, 0.00, 0.00
[6] 13:14:09 [SUCCESS] symfony
13:13:37 up 6 days, 12:25,  0 users,  load average: 0.00, 0.00, 0.00
[7] 13:14:09 [SUCCESS] tempranillo
13:13:37 up 67 days, 17:51,  0 users,  load average: 0,07, 0,09, 0,06
[8] 13:14:09 [SUCCESS] malbec
13:13:50 up 37 days, 22:45,  0 users,  load average: 0.01, 0.58, 0.57
[9] 13:14:09 [SUCCESS] merlot
13:13:59 up 97 days,  4:57,  0 users,  load average: 0.28, 0.12, 0.05
[10] 13:14:12 [FAILURE] recibos Exited with error code 255
Stderr: ssh_exchange_identification: Connection closed by remote host
```

[^1]: <http://davidco.com>

[^2]: <http://www.cuspide.com/isbn/849662708X>
