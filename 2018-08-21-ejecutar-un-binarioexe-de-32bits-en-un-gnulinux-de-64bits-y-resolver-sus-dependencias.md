---
title: Ejecutar un =Binario.exe= de 32bits en un /GNU/Linux/ de 64bits y resolver sus dependencias
date: 2018-08-21
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-08-21-ejecutar-un-binarioexe-de-32bits-en-un-gnulinux-de-64bits-y-resolver-sus-dependencias.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2018-08-21-ejecutar-un-binarioexe-de-32bits-en-un-gnulinux-de-64bits-y-resolver-sus-dependencias.md) |
[`.gmi`](gemini://gmi.osiux.com/2018-08-21-ejecutar-un-binarioexe-de-32bits-en-un-gnulinux-de-64bits-y-resolver-sus-dependencias.gmi) |
[`.html`](https://osiux.gitlab.io/2018-08-21-ejecutar-un-binarioexe-de-32bits-en-un-gnulinux-de-64bits-y-resolver-sus-dependencias.html)

## Instalar Wine 32 bits en Debian/Ubuntu 64bits

Tengo que probar si un dispositivo (que no posee driver para
*GNU/Linux*) funcionaría utilizando `wine` [^1]. El operativo
*GNU/Linux* es 64bits pero el binario a ejecutar es de 32bits, asi que
hay que forzar la arquitectura 32bits y luego instalar **Wine**

``` {.example}
# dpkg --add-architecture i386
```

:

``` {.example}
# apt update
```

:

``` {.example}
# apt install wine32
```

\#\# Dependencias fallidas de un `.exe`

Luego de instalar **Wine** al ejecutar el binario obtengo el error:

``` {.example}
# wine Binario.exe
```

:

``` {.example}
0009:err:module:import_dll Library MSVBVM60.DLL (which is needed by L"Z:\\home\\test\\Binario.exe") not found
0009:err:module:attach_dlls Importing dlls for L"Z:\\home\\test\\Binario.exe" failed, status c0000135
```

Buscando un poco cómo instalar la **DLL** faltante, la cual es parte del
**VisualBasic 6 Runtime**, encuentro `winetricks` [^2] que permite
simplificar la instalación de **fonts**, **DLLs** y gran parte de las
aplicaciones mas utilizadas en **wine**:

``` {.example}
# wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```

:

``` {.example}
# chmod +x winetricks
```

:

``` {.example}
# ./winetricks corefonts vb6run
```

:

``` {.example}
# wine Binario.exe
```

[^1]: <https://www.winehq.org/>

[^2]: <https://wiki.winehq.org/Winetricks>
