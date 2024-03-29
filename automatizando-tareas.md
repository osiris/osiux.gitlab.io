---
title: Automatizando Tareas
date: 2022-10-11
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/automatizando-tareas.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/automatizando-tareas.md) |
[`.gmi`](gemini://gmi.osiux.com/automatizando-tareas.gmi) |
[`.html`](https://osiux.gitlab.io/automatizando-tareas.html)

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
