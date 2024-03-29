---
title: Como hacer andar el modem HUAWEI E166 3g de CLARO en Debian Lenny
date: 2008-11-29
author: JoMaX jose@dotlinux.com.ar
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/modem-3g-claro.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/modem-3g-claro.md) |
[`.gmi`](gemini://gmi.osiux.com/modem-3g-claro.gmi) |
[`.html`](https://osiux.gitlab.io/modem-3g-claro.html)

En el trabajo los compraron para tener conectividad fuera de la oficina,
y pase mucho tiempo sin poder usarlo en mi Linux. Antes que nada quiero
agradecer a German que me paso unos datos muy importantes.

Para configurarlo lo vamos a hacer desde consola:

-   Instalar el paquete `wvdial` instalado `sudo apt-get install wvdial`

-   Antes que nada debemos ver si tenemos en `/dev/` los `ttyUSB*`. Para
eso hacemos un `ls /dev/`, si no estan conectamos el modem y
reiniciamos, hacemos un `ls /dev/` y ya deberia aparecer
`/dev/ttyUSB0`

-   Los dispositivos USB se identifican con dos ID: el idVendor y el
idProduct, que corresponden respectivamente al fabricante y al
producto.

-   Cuando se enchufan, el sistema de detección de hardware formado por
udev, dbus, hal, intenta determinar qué driver cargar para manejar
ese dispositivo en base a la pareja (`idVendor`, `idProduct`)

-   Para averiguar el idVendor y el idProduct debemos tipear en consola
`lsusb -v` y buscar donde aparezca el nombre de nuestro modem.

-   Yo para buscarlo mejor, ejecuto `lsusb -v | less` asi se hace mas
facil la busqueda antes de estar subiendo la pantalla de la consola

-   En mi caso al hacer `lsusb -v | less` me sale esto:

``` {.example}
Bus 002 Device 003: ID 12d1:1001 Huawei Technologies Co., Ltd. E620 USB Modem
Device Descriptor:
bLength 18
bDescriptorType 1
bcdUSB 1.10
bDeviceClass 0 (Defined at Interface level)
bDeviceSubClass 0
bDeviceProtocol 0
bMaxPacketSize0 64
idVendor 0x12d1 Huawei Technologies Co., Ltd. <<---- esto es lo importante para luego cargar el modulo de nuestro
idProduct 0x1001 E620 USB Modem  <<---- modem usb 3g
bcdDevice 0.00
iManufacturer 1
iProduct 2 HUAWEI Mobile
iSerial 1
bNumConfigurations 1
Configuration Descriptor: 1003

Anotamos lo que dice =idVendor 0x12d1= y =idProduct 0x1001= y cargamos
el modulo con modprobe usbserial vendor=0x12d1 product=0x1001

- Ahora configuramos =wvdial=, ejecutando desde una consola
=wvdialconf=. Les deberia salir algo asi:

#+BEGIN_EXAMPLE
# wvdialconf
Editing "/etc/wvdial.conf".
Scanning your serial ports for a modem.
WvModem<*1>: Cannot get information for serial port.
ttyUSB0<*1>: ATQ0 V1 E1 -- OK
ttyUSB0<*1>: ATQ0 V1 E1 Z -- OK
ttyUSB0<*1>: ATQ0 V1 E1 S0=0 -- OK
ttyUSB0<*1>: ATQ0 V1 E1 S0=0 &C1 -- OK
ttyUSB0<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 -- OK
ttyUSB0<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
ttyUSB0<*1>: Modem Identifier: ATI -- Manufacturer: huawei
ttyUSB0<*1>: Speed 4800: AT -- OK
ttyUSB0<*1>: Speed 9600: AT -- OK
ttyUSB0<*1>: Speed 19200: AT -- OK
ttyUSB0<*1>: Speed 38400: AT -- OK
ttyUSB0<*1>: Speed 57600: AT -- OK
ttyUSB0<*1>: Speed 115200: AT -- OK
ttyUSB0<*1>: Speed 230400: AT -- OK
ttyUSB0<*1>: Speed 460800: AT -- OK
ttyUSB0<*1>: Max speed is 460800; that should be safe.
ttyUSB0<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
WvModem<*1>: Cannot get information for serial port.
ttyUSB1<*1>: ATQ0 V1 E1 -- failed with 2400 baud, next try: 9600 baud
ttyUSB1<*1>: ATQ0 V1 E1 -- failed with 9600 baud, next try: 115200 baud
ttyUSB1<*1>: ATQ0 V1 E1 -- and failed too at 115200, giving up.
WvModem<*1>: Cannot get information for serial port.
ttyUSB2<*1>: ATQ0 V1 E1 -- OK
ttyUSB2<*1>: ATQ0 V1 E1 Z -- OK
ttyUSB2<*1>: ATQ0 V1 E1 S0=0 -- OK
ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 -- OK
ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 -- OK
ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
ttyUSB2<*1>: Modem Identifier: ATI -- Manufacturer: huawei
ttyUSB2<*1>: Speed 4800: AT -- OK
ttyUSB2<*1>: Speed 9600: AT -- OK
ttyUSB2<*1>: Speed 19200: AT -- OK
ttyUSB2<*1>: Speed 38400: AT -- OK
ttyUSB2<*1>: Speed 57600: AT -- OK
ttyUSB2<*1>: Speed 115200: AT -- OK
ttyUSB2<*1>: Speed 230400: AT -- OK
ttyUSB2<*1>: Speed 460800: AT -- OK
ttyUSB2<*1>: Max speed is 460800; that should be safe.
ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
Found a modem on /dev/ttyUSB0
Modem configuration written to /etc/wvdial.conf
ttyUSB0: Speed 460800; init "ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0"
ttyUSB2: Speed 460800; init "ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0"
```

-   Una vez hecho esto, editamos el file ubicado en
`/etc/wvdial.conf` y borren lo que tenga escrito y pegan esto
tal cual:

``` {.example}
[Dialer Defaults]
Modem = /dev/ttyUSB0
Baud = 115200
Init1 = ATZ
Init2 = ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0
Init3 = AT+CGDCONT=1,"IP","internet.ctimovil.com.ar"
Modem Type = USB Modem
Area Code =
Phone = *99#
ISDN = 0
Password = ctigprs999
Username = ctigprs
Modem = /dev/ttyUSB0
Ask Password = 0
Dial Command = ATD
Stupid Mode = 1
Compuserve = 0
Force Address =
DialMessage1 =
DialMessage2 =
ISDN = 0
Auto DNS = 1
```

-   Con esto ya el modem deberia poder funcionar. Desde la consola
ejecutamos `wvdial`, despues de unos segundos nuestro modem
deberia aparecer como conectado (se mantiene prendida una luz
cuando estamos conectados)

-   Si el modem conecta debemos modificar el `resolv.conf` porque
por algun motivo que desconozco el dhcp no entrega los DNS que
corresponden. German me paso los siguientes:

``` {.example}
nameserver 170.51.255.100
nameserver 170.51.242.18
```

Pero yo probe con los de IPLAN y funcionan perfectamente. Ojala les
sirva tanto como a mi. PD: Gracias German, sos mi google personal ;)

-   <http://www.joseschenone.com.ar/2008/11/como-hacer-andar-el-modem-huawei-e166_29.html>
