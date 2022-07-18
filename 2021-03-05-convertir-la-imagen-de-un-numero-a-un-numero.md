---
title: convertir la imagen de un número a un número usando gocr
date: 2021-03-05
author: Osiris Alejandro Gomez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-05-convertir-la-imagen-de-un-numero-a-un-numero.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2021-03-05-convertir-la-imagen-de-un-numero-a-un-numero.md) |
[`.gmi`](gemini://gmi.osiux.com/2021-03-05-convertir-la-imagen-de-un-numero-a-un-numero.gmi) |
[`.html`](https://osiux.gitlab.io/2021-03-05-convertir-la-imagen-de-un-numero-a-un-numero.html)

[![](img/gocr-imagen-a-numeros.png)](https://osiux.com/img/gocr-imagen-a-numeros.png)

## porqué me mandan imágenes de números?

Muchas veces uno debe intercambiar información y no siempre recibir una
imagen es la mejor opción, al menos no, cuando se trata de números, un
ejemplo clásico es recibir la imagen de un *`CBU`* [^1] que es un número
larguísimo y difícil de tipear como número dónde se necesita ingresar.

## y lo puedo convertir a texto?

Gracias a `gocr` es posible convertirlo rápidamente desde la consola y
sin necesidad de un editor de imágenes gráfico!

Gracias a `imagemagick` se puede recortar la porción de la imagen que
necesito, por ejemplo, hace unos días recibí una imagen con fechas y
números, no importa que significan, importa que necesito los números
como números y no como pixeles!

Solo hay que instalar estos paquetes:

``` {.bash org-language="sh" exports="code"}
apt install imagemagick gocr

```

## `identify`

Lo primero fue recortar la imagen, para ello primero debo saber que
tamaño tiene usando `identify`

``` {.bash org-language="sh" exports="code"}
identify gocr-fecha-nro.png

gocr-fecha-nro.png PNG 157x286 157x286+0+0 8-bit sRGB 22286B 0.000u 0:00.000

```

[![](img/gocr-fecha-nro.png)](https://osiux.com/img/gocr-fecha-nro.png)

## `crop`

Necesito la segunda columa, y estimo que tiene 50 pixeles de ancho, asi
que sabiendo el alto total de la imagen la corto y genero una nueva
imagen, solo con los números:

``` {.bash org-language="sh" exports="code"}
convert -crop 50x286+105+0 gocr-fecha-nro.png gocr-solo-nro.png

```

[![](img/gocr-solo-nro.png)](https://osiux.com/img/gocr-fecha-nro.png)

## `gocr`

Finalmente ****la magia ocurre con una sola línea de comandos****:

``` {.bash org-language="sh" exports="code"}
gocr -i gocr-solo-nro.png -C 0-9

247
218
173
303
70
2
4
15
65
42
50
60
1

```

El parámetro `C 0-9` indica que solo espero reconocer números, esto es
vital para que el `1` no lo tome como una `l` o un `8` como una `B`,
todo depende mucho de la calidad de la imagen y la tipografía utilizada.

## ChangeLog

-   [`2021-03-06 07:45`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/b5680a24a67d648b63f03438d3b6ea263e6af0e1)
corregir imágenes y agregar link a CBU
-   [`2021-03-05 23:33`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/40ddb751721f2dfd6687fc99a86b59a9c3af73fe)
agregar *convertir la imagen de un número a un número*

[^1]: <https://es.wikipedia.org/wiki/Clave_Bancaria_Uniforme>
