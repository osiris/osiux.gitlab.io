---
title: Conectar Igualdad, empaquetando Intel Theft Deterrent Agent TDA
date: 2011-09-30
author: NicoEchániz nicoechaniz@altermundi.net
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/conectar-igualdad-empaquetando-intel-theft-deterrent-agent.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/conectar-igualdad-empaquetando-intel-theft-deterrent-agent.md) |
[`.gmi`](gemini://gmi.osiux.com/conectar-igualdad-empaquetando-intel-theft-deterrent-agent.gmi) |
[`.html`](https://osiux.gitlab.io/conectar-igualdad-empaquetando-intel-theft-deterrent-agent.html)

Uno de los principales problemas que nos encontramos al experimentar con
diferentes distribuciones de **GNU/Linux** en las netbooks de **Conectar
Igualdad** [^1] fue que no existía forma de instalarles el software de
seguridad **Theft Deterrent Agent** (*TDA*), que viene pre-instalado con
las distribuciones oficiales.

Sin embargo, este software es originalmente instalado desde un paquete y
por lo tanto, podemos re-generarlo fácilmente utilizando `dpkg-repack`.

En la netbook que tiene el *TDA* instalado, desde donde queremos generar
nuestro paquete, primero instalamos el software necesario:

``` {.example}
sudo apt-get install dpkg-repack
```

Luego generamos los paquetes (como usuario root o con sudo, según qué
modelo de netbook sea y cómo esté configurada).:

``` {.example}
dpkg-repack tdagent libtdagent
```

Esto nos creará, en la carpeta donde nos encontramos, dos archivos
`.deb` que copiaremos a las computadoras donde queremos instalar el
*TDA*.

Una vez copiados los paquetes a la computadora de destino, desde la
misma carpeta donde pusimos los archivos `.deb`, los instalamos:

``` {.example}
sudo dpkg -i libtdagent_XXX.deb
sudo dpkg -i tdagent_XXX.deb
```

Reemplazando `XXX` por lo que `dpkg-repack` haya agregado al nombre de
cada paquete, que variará según la versión que estaba instalada en la
máquina de origen.

Hay que instalarlos en ese orden para que funcione porque tdagent
depende de libtdagent.

Eso completa la instalación.

También podemos copiar `/etc/xdg/autostart/theftdeterrent.desktop` desde
la máquina de origen a `/usr/share/applications` en la máquina de
destino para que nos aparezca la aplicación en los menúes del sistema.

Si queremos que autoarranque, podemos crear un link simbólico en
`~/.config/autostart` (si el directorio no existe hay que crearlo).

Los mensajes recurrentes del programa resultan bastante molestos cuando
la computadora no está conectada a la red de la escuela, por lo que si
lo tenemos puesto en auto-arranque, cuando deseemos apagarlo podemos
abrir una consola y ejecutar:

``` {.example}
sudo killall theftdeterrent
```

Los paquetes resultantes de una **Exomate x352**, son compatibles con
**Ubuntu 10.04**, **Ubuntu 11.04** y **Debian Squeeze**. Seguramente
también funcionarán con otras distribuciones basadas en **Debian**, como
**Mint-Debian**. El único problema que encontramos: en **Unity** el
ícono en la barra de estado no es visible.

Como muestra de este procedimiento, en los contenidos relacionados, se
encuentra un archivo con los `.deb` generados durante nuestras pruebas.

Esperamos sea de utilidad esta información.

[^1]: <http://www.conectarigualdad.gob.ar>
