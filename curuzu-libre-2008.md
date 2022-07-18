---
title: Primeras Charlas Software Libre Curuzú Cuatiá 6 y 7 Nov 2008
date: 2008-11-15
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/curuzu-libre-2008.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/curuzu-libre-2008.md) |
[`.gmi`](gemini://gmi.osiux.com/curuzu-libre-2008.gmi) |
[`.html`](https://osiux.gitlab.io/curuzu-libre-2008.html)

## Qué es el Software Libre?

### ¿Cómo empezó todo?

1.  GNU

<https://osiux.com/img/GNU.png>

En 1984, Richard Stallman [^1] comenzó a trabajar en el proyecto GNU
[^2], y un año más tarde fundó la Free Software Foundation (FSF
[^3]). Stallman introdujo una definición para free software y el
concepto de **copyleft**, el cual desarrolló para dar a los usuarios
libertad y para restringir las posibilidades de apropiación del
software.

2.  Linux

<https://osiux.com/img/tux.png>

Hacia 1991, cuando la primera versión del núcleo Linux [^4] fue
liberada, el proyecto GNU había producido varios de los componentes
del sistema operativo, incluyendo un intérprete de comandos, una
biblioteca C y un compilador, pero aún no contaba con el núcleo que
permitiera completar el sistema operativo. Entonces, el núcleo
creado por Linus Torvalds [^5], quien se encontraba por entonces
estudiando en la Universidad de Helsinki, llenó el \"hueco\" final
que el sistema operativo GNU exigía.

### Las cuatro libertades

1.  libertad 0

Ejecutar el programa con cualquier propósito (privado, educativo,
público, comercial, militar, etc.)

2.  libertad 1

Estudiar y modificar el programa (para lo cual es necesario acceder
al código fuente).

3.  libertad 2

Copiar el programa de manera que se pueda ayudar al vecino o a
cualquiera.

4.  libertad 3

Mejorar el programa y publicar las mejoras (para lo cual es
necesario acceder al código fuente).

### GPL

La **Licencia Pública General de GNU** o más conocida por su nombre en
inglés **GNU General Public License** [^6] o simplemente su acrónimo del
inglés **GNU GPL**, es una licencia creada por la Free Software
Foundation a mediados de los 80, y está orientada principalmente a
proteger la libre distribución, modificación y uso de software. Su
propósito es declarar que el software cubierto por esta licencia es
software libre y protegerlo de intentos de apropiación que restrinjan
esas libertades a los usuarios.

### Copyleft

<https://osiux.com/img/copyleft.png>

Copyleft describe un grupo de derechos aplicados a una obra. Nace dentro
de la comunidad del Software Libre como una estrategia legal para
**liberar** el Software.

Su objetivo es: **Garantizar ciertas libertades sobre la explotación y
utilización de la obra y de sus obras derivadas.** Cualquier trabajo
derivado de un trabajo con copyleft debe a su vez atenerse a los
principios del copyleft

## Creative Commons

Las licencias **Creative Commons** o **CC** están inspiradas en la
licencia GPL (General Public License) de la Free Software Foundation,
sin embargo no son un tipo de licenciamiento de software. La idea
principal es posibilitar un modelo legal ayudado por herramientas
informáticas para así facilitar la distribución y el uso de contenidos.

Existen una serie de licencias Creative Commons [^7], cada una con
diferentes configuraciones o principios, como el derecho del autor
original a dar libertad para citar su obra, reproducirla, crear obras
derivadas, ofrecerla públicamente y con diferentes restricciones como no
permitir el uso comercial o respetar la autoría original.

----------------------------------------------- ----------
Attribution                                     BY
Attribution-Share Alike                         BY-SA
Attribution-No Derivative Works                 BY-ND
Attribution-Noncommercial                       BY-NC
Attribution-Noncommercial-No Derivative Works   BY-NC-ND
Attribution-Noncommercial-Share                 BY-NC-SA
----------------------------------------------- ----------

<https://osiux.com/img/CC-BY.png> <https://osiux.com/img/CC-SA.png> <https://osiux.com/img/CC-ND.png>
<https://osiux.com/img/CC-NC.png>

## Distribuciones GNU/Linux

### Primeras Distribuciones

-   H J Lu\'s \"Boot-root\"
-   MCC Interim Linux
-   TAMU
-   SLS (Softlanding Linux System)
-   Yggdrasil Linux

### Principales Distribuciones

-   Slackware (inicialmente basada en SLS)
-   Debian
-   RedHat
-   Suse (inicialmente basada en Slackware)
-   Gentoo (basada en código fuente)

## Consola versus Escritorio

-   Todo lo que hacemos en el entorno gráfico lo podemos hacer desde la
consola...
-   No todo lo que hacemos desde la consola se puede hacer en el entorno
gráfico...
-   No siempre tendremos acceso gráfico al sistema...
-   Pero siempre podremos acceder desde consola.

### Ejemplos Consola

1.  Reescalar fotos mediante imagemagick

``` {.bash org-language="sh" exports="code"}
mkdir -p 800;for f in *.jpg;do echo $f;convert -filter cubic -resize 800 $f ./800/$f;done
```

2.  Grabar un CD usando wodim

``` {.bash org-language="sh" exports="code"}
wodim -v dev=/dev/hda speed=4 imagen.iso
```

3.  Grabar un DVD usando growisofs

``` {.bash org-language="sh" exports="code"}
nice --10 growisofs -dvd-compat -speed=2 -Z /dev/hda -R -J -V iso /home/iso
```

4.  Reemplazar texto en varios archivos

``` {.bash org-language="sh" exports="code"}
for i in *.txt;do cat $i | sed s/hola/chau/g >$i.tmp;mv $i.tmp $i;done
```

5.  Backup de archivos usando rsync

``` {.bash org-language="sh" exports="code"}
rsync -e ssh -vzogtprul /home/directorio/ usuario@host:/backup/directorio
```

6.  Instalar aplicaciones usando apt-get/aptitude

``` {.bash org-language="sh" exports="code"}
apt-get install aplicacion
aptitude install aplicacion
```

7.  Acceso remoto usando ssh, scp, screen

``` {.bash org-language="sh" exports="code"}
ssh usuario@equipo comando

scp * usuario@equipo:/directorio

screen C-a c
screen C-a d
screen -r
```

## Línea de Tiempo GNU/Linux

<https://osiux.com/img/linux-distro-timeline-7.6-web.png>

## Aplicaciones libres

Existen programas libres para hacer todo lo que habitualmente se
necesita hacer con una computadora. No es más dificil ni más fácil
usarlos, en la mayoría de los casos sólo es ligeramente distinto.

Web           Chat           FTP/P2P      Oficina      Graficos   Multimedia   3D
------------- -------------- ------------ ------------ ---------- ------------ -----------
Firefox       aMSN           aMule        OO Writer    Scribus    Mplayer      Blender
Konqueror     emesene        gFTP         AbiWord      Inkscape   VLC          k3d
KompoZer      Pidgin         KTorrent     Kile         The Gimp   Audacity     pythoncad
Akregator     Ekiga          LimeWire     OO Calc      F-Spot     Audacious    raster3d
Liferea       ChatZilla      Vuze         Gnumeric     imgSeek    Kino
RSSOwl        Konversation   Freeloader   OO Impress   Xsane      Avidemux
Amaya         Kopete         ncftp        KPDF         Digikam
Bluefish      KVIrc          rtorrent     Evince       Imagick
Epiphany      X-Chat                      Korganizer
Quanta                                    OO Base
KMail                                     OO Draw
Thunderbird                               Latex
Evolution

## Virtualizar o Emular

### QEMU

QEMU [^8] es un emulador de procesadores basado en la traducción
dinámica de binarios (conversión del código binario de la arquitectura
fuente en código entendible por la arquitectura huésped). QEMU también
tiene capacidades de virtualización dentro de un sistema operativo, ya
sea Linux, Windows, o cualquiera de los sistemas operativos admitidos
(de hecho es la forma más común de uso). Esta máquina virtual puede
ejecutarse en cualquier tipo de Microprocesador o arquitectura (x86,
x86-64, PowerPC, MIPS, SPARC, etc.). Está licenciado en parte con la
LGPL y la GPL de GNU.

El objetivo principal es emular un sistema operativo dentro de otro sin
tener que reparticionar el disco duro, empleando para su ubicación
cualquier directorio dentro de éste.

El programa no dispone de GUI, pero existe otro programa llamado QEMU
manager que hace las veces de interfaz gráfica si se utiliza QEMU desde
Windows. También existe una versión para Linux llamado qemu-launcher. En
Mac OS X puede utilizarse el programa Q que dispone de una interfaz
gráfica para crear y administrar las máquinas virtuales.

### VirtualBox

Sun xVM VirtualBox [^9] es un software de virtualización para
arquitecturas x86 que fue desarrollado originalmente por la empresa
alemana innotek GmbH, pero que pasó a ser propiedad de la empresa Sun
Microsystems en febrero de 2008 cuando ésta compró a innotek. Por medio
de esta aplicación es posible instalar sistemas operativos adicionales,
conocidos como \"sistemas invitados\", dentro de otro sistema operativo
\"anfitrión\", cada uno con su propio ambiente virtual. Por ejemplo, se
podrían instalar diferentes distribuciones de Linux en un VirtualBox
instalado en Windows XP o viceversa.

Entre los sistemas operativos soportados (en modo anfitrión) se
encuentran GNU/Linux, Mac OS X, OS/2 Warp , Windows, y
Solaris/OpenSolaris, y dentro de éstos es posible virtualizar los
sistemas operativos FreeBSD, GNU/Linux, OpenBSD, OS/2 Warp, Windows y
Solaris.

La aplicación fue inicialmente ofrecida bajo una Licencia de software no
libre\|licencia de software privado, pero en enero de 2007, después de
años de desarrollo, surgió VirtualBox OSE (Open Source Edition) bajo la
licencia GPL 2.

### Xen

Xen [^10] es una máquina virtual de código abierto desarrollada por la
Universidad de Cambridge. La meta del diseño es poder ejecutar
instancias de sistemas operativos con todas sus características, de
forma completamente funcional en un equipo sencillo. Xen proporciona
aislamiento seguro, control de recursos, garantías de calidad de
servicio y migración de máquinas virtuales en caliente. Los sistemas
operativos deben ser modificados explícitamente para correr Xen (aunque
manteniendo la compatibilidad con aplicaciones de usuario). Esto permite
a Xen alcanzar virtualización de alto rendimiento sin un soporte
especial de hardware

Xen utiliza una técnica llamada paravirtualización para alcanzar alto
rendimiento. Con la paravirtualización, se puede alcanzar alto
rendimiento incluso en arquitecturas (x86) que no suelen conseguirse con
técnicas tradicionales de virtualización. A diferencia de las máquinas
virtuales tradicionales, que proporcionan entornos basados en software
para simular hardware, Xen requiere portar los sistemas operativos para
adaptarse al API de Xen. Hasta el momento hay ports para NetBSD, Linux,
FreeBSD y Plan 9. En 2005, Novell muestra un port de NetWare para Xen.
Un port de Windows XP fue creado durante el desarrollo inicial de Xen,
pero las licencias de Microsoft prohíben su lanzamiento público.

### Redes Libres

<https://osiux.com/img/BAL.png>

En un mundo cada vez mas concentrado en bienes e información, se plantea
como alternativa una red administrada por los propios vecinos de cada
barrio, donde cada uno de ellos toma parte activa en la red y en su
construcción, cada uno es un pilar de la red y a medida que nuevas
personas suman su equipo a la red, crece la red y de esta manera vecinos
y colegios mas alejados pueden conectarse a la red. La red
principalmente es una base, desde la cual se pueden brindar soluciones a
las necesidades sociales, educativas, comunitarias y de esta manera
acercar y compartir el conocimiento. Además con el uso de las redes
libre se logran establecer comunicaciones sin tener que pasar por un
agente externo que puede estar monitoreando como también se optimiza el
uso de recursos ya que todas las comunicaciones son a nivel
local/regional.

1.  Antenas

Existen diversos tipos de antenas, se distingen por el patrón de
radiación emitido.

-   Omnidireccionales, cubren los 360 grados.
-   Direccionales, de alta ganancia, son ideales para enlaces punto
a punto.

2.  AccesPoints

Son puntos de acceso WiFi, los mismos pueden ser APs (routers) o
ProAPs (PCs), en el primer caso la ventaja está dada por la
alimentación de 12V fácilmente transportables usando PoE en un cable
UTP, su reducido tamaño permite usar varios APs en una misma caja
estanca, son muy simples de administrar y según el firmware
utilizado se los pueden usar para brindar servicios básicos además
de enrutar tráfico. La contra de los APs es que se necesita uno por
cada interfase wireless, es decir que si se pretende tener un nodo
con una Omni y dos enlaces, son necesarios 3 APs. No sucede lo mismo
con los ProAPs, los cuales son PCs que en función de la cantidad de
slots PCI se pueden tantas interfases wifi como lo permita el
motherboard, maximizando el uso de la PC, solo basta agregar una
nueva placa wifi por cada antena, la desventaja principal es tener
que enviar 220V y que generalmente requieren mayor mantenimiento y/o
conocimientos técnicos de hardware.

1.  Linksys WRT54G [^11]

Sin duda uno de los routers inalámbricos más usados, dada las
capacitades de expansión del equipo mediante el uso de firmware
basados en OpenWRT [^12], DD-WRT [^13] y otros. Es posible
modificarlo para agregar un lector de tarjetas de memoria SD.

2.  Edimax 7209Apg

La principal característica es la potencia del equipo, hasta
400mW como máximo, aunque en la práctica se usan a menos de la
mitad, ya que levantan mucha temperatura las cuales ocasionan el
cuelge o funcionamiento erróneo del equipo. En segundo lugar
este router permite usarlo en modo bridge, un método bastante
práctico y cómodo para la configuración del enlace.

3.  PoE

Una de las maneras más simple de alimentar un router colocado sobre
una torre o en una terraza es utilizar la técnica PoE o Power Over
Ethernet [^14] que consite en aprovechar el mismo cableado UTP para
inyectar el voltaje necesario (normalmente 12V), esto se lograr
usando los pares 1,2,3 y 6 para datos y 4,5,7 y 8 para la
alimentación.

4.  Enrutamiento

Existen varios protocolos de enrutamiento, para el caso de las redes
inalámbricas es conveniente usar un protocolo dinámico como OLSR
[^15] el mismo permite que las rutas se vayan armando
automáticamente en función de los enlaces actuales.

<https://osiux.com/img/olsr.png>

## Cómo Migrar?

La migración a GNU/Linux es un **proceso**, esto es, ha de hacerse en
etapas, concediendole a cada una, y concediendose el usuario, todo el
tiempo que necesiten ambos: la etapa y el usuario.

-   Migran las personas, no los programas.
-   Una migración compulsiva está destinada al fracaso.

En la primera parte, **A - Migrando al usuario**, hablamos del
protagonista de la migración: el usuario. En la segunda parte, **B -
Migrando programas**, veremos los muchos recursos para conocer, probar y
evaluar aplicaciones y distribuciones. En **C - Capacitación**
analizamos qué es lo que debe saber el usuario y cómo adquirir ese
conocimiento. Contenidos:

A. Migrando al usuario B. Migrando programas C. Capacitación

## Servidor LAMP

El acrónimo LAMP [^16] se refiere a un conjunto de subsistemas software
necesarios para alcanzar una solución global, en este caso configurar
sitios web o Servidores dinámicos con un esfuerzo reducido.

En las tecnologías LAMP esto se consigue mediante la unión de las
siguientes tecnologías:

-   Linux, el sistema operativo.
-   Apache, el servidor web.
-   MySQL, el gestor de bases de datos.
-   Perl, PHP, o Python, lenguajes de programación.

La combinación de estas tecnologías es usado primariamente para definir
la infraestructura de un servidor web, utilizando un paradigma de
programación para desarrollo.

A pesar de que el origen de estos programas de código abierto no han
sido específicamente diseñado para trabajar entre sí, la combinación se
popularizó debido a su bajo coste de adquisición y ubicuidad de sus
componentes (ya que vienen pre-instalados en la mayoría de las
distribuciones linux). Cuando son combinados, representan un conjunto de
soluciones que soportan servidores de aplicaciones.

### Apache

Apache tiene amplia aceptación en la red: desde 1996, Apache, es el
servidor HTTP más usado. Alcanzó su máxima cuota de mercado en 2005
siendo el servidor empleado en el 70% de los sitios web en el mundo, sin
embargo ha sufrido un descenso en su cuota de mercado en los últimos
años.

<https://osiux.com/img/apache.png>

Las principales ventajas son: modularidad, open-source,
multi-plataforma, extensible, popular, gratuito.

1.  Instalar Apache

``` {.bash org-language="sh" exports="code"}
aptitude install apache2-mpm-prefork libapache2-mod-php5
```

2.  Crear un VirtualHost

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

3.  Iniciar, Detener y Reiniciar Apache

Los cambios en los VirtualHost son aplicados sólo cuando se reinicia
el servicio, es posible hacerlo de dos maneras:

``` {.bash org-language="sh" exports="code"}
/etc/init.d/apache2 start|stop|restart
apache2ctl stop|start|graceful
```

## MySQL

MySQL [^17] es un sistema de gestión de base de datos relacional,
multihilo y multiusuario con más de seis millones de instalaciones.
MySQL AB -desde enero de 2008 una subsidiaria de Sun Microsystems-
desarrolla MySQL como software libre en un esquema de licenciamiento
dual.

Por un lado se ofrece bajo la GNU GPL para cualquier uso compatible con
esta licencia, pero las empresas que quieran incorporarlo en productos
privativos pueden comprar a la empresa una licencia específica que les
permita este uso. Está desarrollado en su mayor parte en ANSI C.

Al contrario que proyectos como Apache, donde el software es
desarrollado por una comunidad pública y el copyright del código está en
poder del autor individual, MySQL es propiedad y está patrocinado por
una empresa privada, que posee el copyright de la mayor parte del
código.

MySQL es una base de datos muy rápida en la lectura cuando utiliza el
motor no transaccional MyISAM, pero puede provocar problemas de
integridad en entornos de alta concurrencia en la modificación. En
aplicaciones web hay baja concurrencia en la modificación de datos y en
cambio el entorno es intensivo en lectura de datos, lo que hace a MySQL
ideal para este tipo de aplicaciones.

### Usuarios destacados

-   Uladech-Universidad Los Angeles de Chimbote, Administrar Sistema
Académico SIGA,docencia y maestría.
-   Cox Communications - La cuarta televisión por cable más importante
de EEUU, tienen más de 3.600 tablas y aproximadamente dos millones
de inserciones cada hora.
-   flickr, usa MySQL para gestionar millones de fotos y usuarios.
-   Google - Para el motor de búsqueda de la aplicación AdWords.
-   Nokia, usa un cluster MySQL para mantener información en tiempo real
sobre usuarios de redes de móviles.
-   Slashdot - con cerca de 50 millones de páginas servidas cada día.
-   Wikipedia, sirve más de 200 millones de consultas y 1,2 millones de
actualizaciones cada día, con picos de 11.000 consultas por segundo.
-   WordPress, con cientos de blogs alojados en él.
-   Yahoo! - para muchas aplicaciones críticas.

### Instalar MySQL

``` {.bash org-language="sh" exports="code"}
aptitude install mysql-client-5.0 mysql-server-5.0
```

### Crear Bases y Usuarios

``` {.sql engine="mysql" exports="code"}
CREATE DATABASE mibase;
CREATE USER usuario;
SET PASSWORD FOR 'usuario'@'%'=Password('secreto');
GRANT ALL ON mibase.* TO 'usuario'@'%';
```

### Backup y Restore

``` {.bash org-language="sh" exports="code"}
mysql -u usuario -psecreto -B mibase --opt > backup-mibase.sql
mysql -u usuario -psecreto -B mibase < backup-mibase.sql
```

### Usando el cliente mysql

``` {.bash org-language="sh" exports="code"}
mysql -u usuario -psecreto
```

``` {.sql engine="mysql" exports="code"}
USE mibase;

CREATE TABLE emails (
id INT AUTO_INCREMENT PRIMARY KEY,
address VARCHAR(150) NOT NULL DEFAULT ''
);
CREATE TABLE contacts (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL DEFAULT ''
);
CREATE TABLE contacts_emails (
contact_id INT NOT NULL DEFAULT 0,
email_id INT NOT NULL DEFAULT 0
);

SELECT     c.name, e.email_address
FROM       contacts c
INNER JOIN contacts_emails ce ON ce.contact_id = c.id
INNER JOIN emails e ON e.id = ce.email_id
ORDER BY   c.name, e.address;
```

## PHP

### Instalar PHP

``` {.bash org-language="sh" exports="code"}
aptitude install php5 php-pear php-mail php-doc phpmyadmin libapache2-mod-php5 php5-cli php5-mysql php5-xdebug
```

### Configurar PHP

``` {.example}
vi /etc/php5/apache2/php.ini

memory_limit = 128M
error_reporting  =  E_ALL
upload_max_filesize = 20M
```

### Programar PHP

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

## Creditos

-   Todos los párrafos que hacen referencia a Wikipedia son obra
derivada de la misma bajo licencia GFDL [^18].
-   La sección **Cómo Migrar** está extraído del sitio web de María
Elena Casañas [^19].
-   El comienzo de la sección **Consola versus Escritorio** es obra
derivada del **Curso de administración básica GNU/Linux** de Jesús
David Navarro [^20].
-   La sección **Copyleft** es obra derivada de **Un pequeño parche para
una sociedad minada de bugs** [^21].
-   La sección **Aplicaciones Libres** es obra derivada de **Qué es el
software libre y porqué es importante para mi?** [^22].
-   El resto del documento está bajo Licencia Creative Commons by-sa
Argentina 2.5 [^23].

## ChangeLog

-   [`2021-02-02 19:26`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/5cb24a0a8faadd95ed544b0eac1c08689fdcf9a0)
elimino ChangeLog manual en Curuzú Libre 2008
-   [`2019-04-18 00:21`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/e46ec52748a7ecc60f09c3b95e363e92eaa0bebc)
Agregar hora en header date
-   [`2019-04-18 00:01`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/5c8643b83930c6269569c76602608bd33f93008b)
Corregir identación header \#+INCLUDE:
-   [`2015-07-03 04:31`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/bbc3bbc728f2a3eeb4fe2e0a012ee5d8d613e3ef)
@ 00:05 hs - elimino \#+OPTIONS: de todos los archivos excepto
header.org
-   [`2014-04-22 11:35`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/74165280ffad770d1f8b8acbfa7f22b95459b52a)
@ 00:34 hs - Agrego timestamp:nil
-   [`2013-04-24 08:04`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/5ad3755a3df07cdfbdc75d56cae06db2fee4b5f2)
@ 01:50 hs - migro a org 8.0
-   [`2013-03-16 16:25`](https://gitlab.com/osiux/osiux.gitlab.io/-/commit/a3da9afd3f083518602076347be4e9bad67351b9)
@ 01:31 hs - Agrego 2 artículos y robots.txt

[^1]: <http://es.wikipedia.org/wiki/Stallman>

[^2]: <http://es.wikipedia.org/wiki/Gnu>

[^3]: <http://es.wikipedia.org/wiki/FSF>

[^4]: <http://es.wikipedia.org/wiki/Linux>

[^5]: <http://es.wikipedia.org/wiki/Linus_Torvalds>

[^6]: <http://es.wikipedia.org/wiki/GNU_General_Public_License>

[^7]: <http://es.wikipedia.org/wiki/Creative_commons>

[^8]: <http://es.wikipedia.org/wiki/QEMU>

[^9]: <http://es.wikipedia.org/wiki/VirtualBox>

[^10]: <http://es.wikipedia.org/wiki/Xen>

[^11]: <http://es.wikipedia.org/wiki/WRT54G>

[^12]: <http://es.wikipedia.org/wiki/OpenWrt>

[^13]: <http://es.wikipedia.org/wiki/DD-WRT>

[^14]: <http://wiki.buenosaireslibre.org/PoE>

[^15]: <http://es.wikipedia.org/wiki/OLSR>

[^16]: <http://es.wikipedia.org/wiki/LAMP>

[^17]: <http://es.wikipedia.org/wiki/MySQL>

[^18]: <http://es.wikipedia.org/wiki/GFDL>

[^19]: <http://casanas.com.ar/web.php?sec=como&ssec=c1>

[^20]: <http://www.jesusda.com/docs/tallerintroadminlinux/s5-linux>

[^21]: <http://jose.rebeldes.org.ar/wp-content/uploads/2007/04/copyleft_jose_flisol2007.pdf>

[^22]: <http://www.vialibre.org.ar/materiales/>

[^23]: <http://creativecommons.org/licenses/by-sa/2.5/ar>
