---
title: SSH para gobernar el mundo!
date: 2022-10-11
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/ssh-para-gobernar-el-mundo.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/ssh-para-gobernar-el-mundo.md) |
[`.gmi`](gemini://gmi.osiux.com/ssh-para-gobernar-el-mundo.gmi) |
[`.html`](https://osiux.gitlab.io/ssh-para-gobernar-el-mundo.html)

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
