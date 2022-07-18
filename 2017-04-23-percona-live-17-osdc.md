---
title: Percona Live 17 Open Source Databases Conference
date: 2017-04-23
author: Osiris Alejandro Gómez osiris@gcoop.coop
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-23-percona-live-17-osdc.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-23-percona-live-17-osdc.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-04-23-percona-live-17-osdc.gmi) |
[`.html`](https://osiux.gitlab.io/2017-04-23-percona-live-17-osdc.html)

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## gcoop presente en Percona Live 17

Hace rato que en **gcoop** [^1] decidimos que en lugar de sponsorear un
evento, era mucho mejor participar de un evento, ya sea como disertante
o asistente ya que de esta manera nos capacitamos o capacitamos y
contribuimos con la comunidad del **Software Libre** en primera persona.

A fin de 2016 vimos que se venía el **Percona Live 17**, del cual nunca
habíamos participado y como cada día que pasa necesitamos exprimir mas
nuestros motores de Bases de Datos (*MySQL/MariaDB/Percona/PostgreSQL*)
era una excelente oportunidad para participar del evento.

Resulta que el evento era en la ciudad de *Santa Clara*, estado de
*California* en *Estados Unidos*, asi que el primer paso era obtener la
*VISA* (y no hablo de la tarjeta de crédito) para poder ingresar, en fin
luego del trámite obtuve la *B1*, asi que con pasajes en mano y
*tickets* de la conferencia ya estaba en condiciones de viajar.

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Viajando desde EZE con escala en DFW para llegar a SJO

Fue mi primera vez en viajar a *EEUU* asi que toda una experiencia
nueva, empezando por la distancia a recorrer 8523Km en línea recta entre
*Ezeiza* y *Dallas* donde fue mi primer escala y desde ahí hasta el
aeropuerto de *San Jose* otros 2334Km aprox, que traducido en horas,
fueron 10hs el vuelo internacional y 3hs el vuelo de cabotaje.

No deja de sorprenderme cada vez que subo a un avión como logran
despegar y estar en el aire menos de 60 segundos que por lo general son
50 segundos de tomar carrera y los últimos 10 segundos ya empezó a
volar.

El avión llegó temprano a *Dallas* (04:40 AM Hora del pacífico) y
tuvimos que esperar porque todavía Migración no había abierto, luego el
primer control, una máquina que escanea el pasaporte y te hace unas
preguntas para finalmente imprimir un papel y con éste ir a charlar con
el oficial de migración no sin antes pasar por un scanner 3d sin
zapatos, cinturón, ni nada de lo que llevás encima, todo eso pasa por
otro scanner. Una vez que el oficial te sella el pasaporte, pasas al
espacio en tránsito y en este aeropuerto en participar hay que tomarse
un tren para ir de una terminal a otra, son 4 de la A a la D y cada
terminal es enorme.

## AirBnB

El alojamiento que recomendaba el evento era en el Hyatt Regency, el
cual esta conectado al centro de convenciones de Santa Clara, pero claro
por lo que salía una sola noche, conseguí por el mismo precio las 7
noches gracias a AirBnB a unas pocas cuadras, cruzando el Levi\'s
Stadium

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Tutorials

El día previo a la conferencia, era el día de tutoriales y el que elegí
fue **MySQL InnoDB Cluster and Group Replication in a Nutshell: Hands-On
Tutorial**, para el cual el día previo recibí un mail con el *link* para
la descarga de 3 *VMs* de **VirtualBox** para tener la base del
*cluster* armado y ahorrar tiempo.

Tuve inconvenientes con la terminal de **VirtualBox**, asi que terminé
accediendo vía por `ssh` a `localhost:2222` y `screen` mediante accedí
asi a los 3 nodos.

El estado inicial del *cluster* era que estaba roto :P y había que
arreglarlo, para que la replicación *Master/Slave* de **MySQL** quedara
operativa.

Con el *Master* y los 2 *Slaves* operativos, la idea era ir al nodo3,
cambiar los paquetes de *MySQL* standard por **PXC** (**Percona XtraDB
Cluster**) e iniciar la configuración de un nuevo *cluster* pero sin
detener la replicación, de esta manera se iría actualizando de a un nodo
por vez para migrar a *PXC* sin afectar a la aplicación que accede al
*cluster*.

Aunque las *VMs* era idénticas para todos los asistentes, hubo algunos
inconvenientes en general, al parecer al realizar un *copy/paste* desde
el *PDF* del tutorial hacia la terminal de **VirtualBox** y/o `ssh` se
agregaban espacios en blanco y/o caracteres no imprimibles que generaban
error al ejecutar la línea de comandos, un error pavote pero molesto, ya
que a simple vista lo pegado era igual a lo copiado, esto ocasionó que
algunos comandos fallaran y no se pudiera realizar la secuencia de pasos
tal y como estaba estipulado, por ello durante la mañana tuve el
*cluster* un poco roto (pero operativo)

En el almuerzo me quedé a solucionarlo, repitiendo todos los pasos,
luego de un rato descubrí los dos pasos que fallaron, el primero fue el
cambio de versión de **MySQL a PXC**, algunos paquetes no se instalaron
y el segundo error fue que no se realizó el *upgrade* de la base
*MySQL*.

Pude corregir los dos errores y avanzar con la migración del cluster a
PXC, funcionó perfecto y probamos el monitoreo y como bajar un nodo y
volverlo a levantar y que todo siga operativo. :)

Por la tarde vimos temas un poco más avanzados y quedó pendiente
realizar los ejercicios, ya que no nos daba el tiempo para realizar
todos in situ.

El tutorial es público y estos son los links:

## Stands

Luego de los tutoriales y un merecido cofee-break lleno de cosas dulces
se abrió el salón A donde estaban los diferentes stands de cada sponsor,
donde además de obtener pins, stickers, folletos y hasta remeras había
folletos y demostraciones ao-vivo de cada producto/servicio ofrecido
pudiendo realizar consultas técnicas de avanzada.

Me agradó encontrar un stand de Grafana y charlar con especialistas de
Percona sobre qué topología HA (High Availibity o Alta Disponibilidad)
conviene más en función del tipo y tamaño de base de datos, según
entendí PXC es recomendable sólo en bases menores a 2TB.

Me llamó la atención Continuent y Tungsteng, que ofrecen MySQL como SaaS
en multiconteniente, incluso Alibaba y RackSpace ofrecen su hosting de
MySQL, en general con esquemas HA.

También había un par de empresas ofreciendo sus herramientas de
monitoreo, Solarwins y VividCortex, éste último ofrece un servicion en
la nube que pareciera ser superador al resto de las plataformas de
monitoreo, tiene el foco en MySQL (aunque también soporta Postgres y
Redis) y gráficamente muestra un ranking de quieries lentos con la
ejecución detallada pudiendo estar anominizada y en más de un host al
miemos tiempo, la demo mostraba unos 240 hosts y se veía rápida y muy
dinámica.

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Day One

### MySQL Load Balancers - MaxScale, ProxySQL, HAProxy, MySQL Router & nginx - a close up look

[![](https://osiux.com/tmb/2017-04-25-percona-mysql-ha-closeup.png)](https://osiux.com/img/2017-04-25-percona-mysql-ha-closeup.png)

Un excelente resumen de los pros y contras de cada herramienta \"HA\" y
en que casos combiene usar uno u otro.

-   Web [^2]
-   PDF [^3]

1.  HAProxy

-   Soporta balanceo de carga y es un proxy a nivel TCP

-   Tiene la habilidad de separar lectura de escritura pero necesita
un puerto específico para cada backend

-   No entiende de MySQL, solo maneja la autenticación

-   Se puede combinar con clustercheck para lograr monitoreo del
MySQL

-   Ejemplo de configuración:

``` {.example}
listen haproxy_172.30.3.215_3307
bind *:3307
mode tcp
```

:

``` {.example}
listen haproxy_172.30.3.215_3308
bind *:3308
mode tcp
```

2.  `keepalived`

-   diseñado para detectar fallas de nodos y moverse mediante una
VIP (Virtual IP)
-   una sola VIP para las conexiones no es posible balanceo
-   puede ser util para contruir HA si te conectas a un solo nodo
-   se puede usar con Galera Cluster para HA
-   se instala keepalived en todos los nodos
-   usando mysqlchk o percona clustercheck

3.  `nginx`

-   Si ya estás usando nginx como proxy reverso lo podes aprovechar
-   Es similar a haproxy
-   Se puede separar Lectura/Escritura usando 2 puertos
-   No entiende los estados de MySQL/Galera
-   Puede ser usado con clustercheck-iptables

4.  `maxscale`

-   Automáticamente monitorea la salud de los nodos
-   Entiende los estados de Mysql/Galera
-   Puede separar Lectura/Escritura
-   Soporta SSL
-   Soporta Replicacion Mysql/Galera
-   Posee integración con Nagios
-   Maneja varios tipos de ruteo
-   Dificultad para obtener estadísticas de tráfico en tiempo real
-   Desde la version 2.0 no es GPL
-   Hay un fork GPL de la versión 1.3 por AirBnB
-   Tiene serios problemas de escabilidad con mas de 100 threads
concurrentes

5.  `proxysql`

-   Diseñado para topologías complejas
-   Implementa separación Lectura/Escritura
-   Soporta multiples grupos de hosts
-   Monitorea la salud de los backends
-   Ruteo avanzado basado en reglas de queries
-   Interfaz de Administración en SQL
-   Configuración al estilo Cisco
-   Casi todas las variables pueden ser cambiadas dinámicamente sin
reiniciar el servicio
-   Reconoce queries usando regex, hash, user, schema, ip, port
-   Ruteo de queries basado en condiciones
-   Permite reescribir queries
-   Cache de queries
-   Minimiza las conexiones a los backends utilizando multiplex
connections
-   Soporte Replicacion MySQL y y Replicacion de Grupo
-   Soporta Galera Cluster utilizando scripts externos
-   Estadísticas detalladas del tráfico manejado por ProxySQL

### Use ProxySQL to Improve Your MySQL High Availability Solution

[![](https://osiux.com/tmb/2017-04-25-percona-proxysql-improve-ha.png)](https://osiux.com/img/2017-04-25-percona-proxysql-improve-ha.png)

-   Web [^4]
-   PDF [^5]

ProxySQL es un HAProxy que entiende de SQL, puede hacer cosas en función
de regex de queries o por queries exactas, reescribir queries, hacer
balanceo, es muy liviano y se usa el mysql-client para configurarlo
aunque por detrás es un sqlite.

En la charla mostraron diferentes formas de usar ProxySQL, como
configurarlo y mejores prácticas, muy didáctica.

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Day Two

### Galera Cluster Data Consistency

[![](https://osiux.com/tmb/2017-04-26-percona-multi-site-master.png)](https://osiux.com/img/2017-04-26-percona-multi-site-master.png)

-   Web [^6]
-   PDF [^7]

Nuevamente si tenes Master-Slaves casi no hay problemas, si usas
Multiples Masters es problematico y quedo claro porque un nodo de
Galera/PXC ni bien detecta una inconsistencia deja de escribir y se
suicida (`kill -9`) y la única manera de volver es de una copia completa
(como agregar un nodo nuevo), aunque si es un slave y a tu aplicación no
le molesta mucho la integridad podés ponerlo en modo read-only que siga
devolviendo `SELECT` :)

### Optimizing *MySQL* without *SQL* or touching `my.cnf`

[![](https://osiux.com/tmb/2017-04-26-percona-optimizing-without-sql.png)](https://osiux.com/img/2017-04-26-percona-optimizing-without-sql.png)

-   Web [^8]
-   PDF [^9]

Un flaco de *Dropbox* contando que tenian **1000** *MySQLs*, que se
creaban 1.200.000.000 de archivos por día y había mucha data por manejar
y que en lugar de ponerse a tunear *MySQL*, se pusieron a ver como se
comportaba el *SO*, dieron un par de tuneos simples y efectivos para
*GNU/Linux* pero mostraron su laboratorio perfilando *MySQL*.

Primero vieron que *TCPWrapper* hace un montón de *syscalls* revisando
`/etc/hosts.deny` y `/etc/hosts.accept` para comprorar si el *host* que
se esta conectado tiene permiso para hacerlo, esto es un *legacy* y
básicamente eliminaron eso del *source* de la *lib* y pusieron reglas de
`iptables`, como tenían que compilar *MySQL*.

Empezaron a hacer *tests* con diferentes compiladores, `cgolang` y 2
versiones de `gcc`, resulto que la versión mas nueva de `gcc` era menos
performante que la vieja, pero que no podían hacer un *downgrade*, asi
que se pusieron a jugar con todos los parámetros de `gcc` para lograr
una excelente performance, básicamente uso de instrucciones modernas
para el hardware con el que contaban y unas optimizaciones locas, entre
otras cosas reemplazaron el código de *fastmutex* del *source* de
*MySQL* por algo mas performante y *fast* posta.

Y como todos estos *tests* son fabulosos con *unit tests* vieron como
simular una carga real, para esto hablo uno de *Percona* mostrando una
*tool* `pt-query-playback`, que básicamente lee un *slow-query* y lo
ejecuta y con eso perfilaron y lo usaron de base para recompilar con
`gcc` y lograr que sea casi el doble de rápido!

### Multi-Site, Multi-Master Done Right

[![](https://osiux.com/tmb/2017-04-26-percona-multi-site-master.png)](https://osiux.com/img/2017-04-26-percona-multi-site-master.png)

Estuve poco tiempo porque era muy bonito todo lo que contaban sobre la
dificultad de tener replicación multi-continentes pero por lo que
entendí es un *SaaS* (*Software as a Service*) y en otras charlas le
pegaron varios palos porque ofrecen *HA* y contaban que no siempre
funciona el *HA* :P

-   Web [^10]
-   PDF [^11]

### Caching your application data with MySQL and TokuDB

[![](https://osiux.com/tmb/2017-04-26-percona-caching-tokudb-without-pkey.png)](https://osiux.com/img/2017-04-26-percona-multi-site-master.png)

-   Web [^12]
-   PDF [^13]

Un par de tanos que descubrieron que *tokudb* era más rápido que
*innodb* si las tablas no tenían *primary key*, porque la aplicación
genera un *uuid* y entonces sólo crean el campo *id* como *index* (no
*unique*) y combinado con logran responder para un sitio de alto tráfico
como lastminute.

### Securing your MySQL/MariaDB data

-   Web [^14]
-   PDF [^15]

Vi apenas unos minutos, pero lo esencial sobre permisos en la *DB*.

### ZFS on Linux at Salesforce. A real world example of why Pardot, a Salesforce company, trusts and uses ZoL with their production MySQL servers.

-   Web
<https://www.percona.com/live/17/sessions/zfs-linux-salesforce-real-world-example-why-pardot-salesforce-company-trusts-and-uses-zol>

Llegué al final de esta, logré ver algunos *tips* de configuración de
*ZFS* como *filesystem* de *MySQL*, la mala es que el *speaker* de
Salesforce no tenía autorización para compartir los *slides* (menos mal
que saque fotos)

### Bash One-Liners and Other Tools to Simplify MySQL Ops at Scale

-   Web
<https://www.percona.com/live/17/sessions/bash-one-liners-and-other-tools-simplify-mysql-ops-scale>

No podía faltar a esta, si bien de `bash` no vi casi nada nuevo, resultó
muy útil algunos ejemplos para interactuar con `mysql`, era un developer
de dropbox y tenían unos 450 MySQLs!

### Protecting MySQL network traffic

-   <https://www.percona.com/live/17/sessions/protecting-mysql-network-traffic>

Como configurar *TLS* entre cliente y servidor, básicamente **[lento
pero seguro]{.underline}**

### Percona XtraDB Cluster 5.7 with ProxySQL for your high availability and clustering needs

-   <https://www.percona.com/live/17/sessions/percona-xtradb-cluster-57-proxysql-your-high-availability-and-clustering-needs>

Mas datos sobre ProxySQL + PXC en diferentes escenarios.

### Advance Sharding Solution with ProxySQL

-   Web
<https://www.percona.com/live/17/sessions/advance-sharding-solution-proxysql>

Como construir reglas para reescribir queries on-the-fly para hacer
sharding

### MyRocks Engineering: deploying a new MySQL storage engine to production at Facebook

-   Web
<https://www.percona.com/live/17/sessions/myrocks-engineering-deploying-new-mysql-storage-engine-production-facebook>

Como laburan en FaceBook haciendo replicas de InnoDB en MyRocks y en
TokuDB para que todo funcione rapido y sin downtime

### ProxySQL + Orchestrator

La última fue una de las mejores, no habia slides ni nada preparado, se
trato de una charla entre *Shlomi Noach* [^16] desarrollador de
**Orchestrator** [^17] y *René Cannaò* [^18] desarrollador de
**ProxySQL** [^19] escuchando las sugerencias de la comunidad sobre como
debían interactuar estas 2 aplicaciones y fue muy productiva, porque
todos tenían diferentes escenarios y necesidades, pero se llego a la
conclusión que debían haber 2 opciones: **consistencia vs
disponibilidad**, debido a que ambas herramientas son utilizadas en
entornos de *alta disponibilidad* pero que ante una falla hay que
decidir si seguir operando posiblemente con problemas de consistencia o
*split-brain* [^20] (lo mas común en entornos *multi-master*) o pasar a
un esquema *single-master* o incluso *readonly* hasta ver como
resolverlo.

### Community Dinner

Post charlas fue la *Community Dinner*, donde básicamente le queme la
cabeza a varios sobre **our cooperative company model** :P

Según charlé con uno de los *sponsors*, esta es la conferencia mas
grande sobre **open-source-databases** y estimaban unos 500 *attendees*

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Day Three

La manaña nuevamente comenzó con los keynotes, Paul Dix de Influx hablo
sobre los posibles modelos para tener una emrpesa Open-source, desde su
perspectiva, (justo ayer hablamos sobre la dificultad de entender el
software libre sin un modelo de negocios, a el le sorprendía que el de
SQLite viviera solo haciendo consultorías ya que su aplicación esta en
el dominio publico) y si bien su vision era extremadamente comercial
pensando en lograr una gran empresa y ganar mucho dinero, hablo de que
redhat es lo más parecido a la mafia y que hay empresas que se dedican a
vampirizar productos open-source (palo para Percona), estuvo buena y
según el veía, estaba la posibilidad de trabajar en un core (y
liberarlo) y luego vender plugins, extensiones, etc.

### Consultoría

### Oracle

Hablaron de lo nuevo de MySQL 5.8

### charla inspiradora

Fue la de **Aaron Schwartz**, que habló sobre para que lado va el mundo.

-   Observavilidad
-   Velocidad
-   Distribuido

### el cierre

Un Panel moderador por Richard Hipp (SQLite) en el que participaron
Peter Zaisev, Baron Schwartz y MC Brown

-   las TSDB (Time Series Databases) son realmente algo nuevo? deben ser
un nuevo motor o pueden ser extensiones de motores actuales

-   que esperamos del mundo de las DBs en 2020

-   las nuevas generaciones de programadores no saben SQL y que hoy ha
varias herramientas que con sus diferentes abstraciones permiten
generar SQL sin entenderlo y que obviamente no existe un solo
standard de SQL y que si bien era muy importante entederlo y poder
escribir quieries eficientes, en el futuro cada vez menos developers
van a entender SQL, aunque tambien pareceria ser cultural porque hay
leguajes como LINQ que es un SQL dentro del codigo .net para el
manejo de objetos y que si preguntas en una conferencia de MS todos
los Developers lo usan

<https://www.percona.com/live/17/sessions/keynote-panel-percona-vividcortex-continuent>

### keynotes

### Chau Percona

El cierre fue un poco abrupto para mi, aunque como indicaba el
cronograma, a las 16 terminban las charlas y a las 16:15 era la entrega
de premios, ni bien terminó la entrega de premios dijeron, chau y todo
termino exactamente a las 16:30 hs, aunque intenté alargar un poco yendo
al bar del hotel y clavarme un percona punch por solo 6 USD (mas
impuestos) la mayoría ya se tomaba el palo. :(

Asi que aproveche para ir a un Target y comprar regalos para mi familia
:)

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## San Francisco

Aprovechando que no estaba muy lejos, emprendí la excursión a San
Francisco, para esto primero tomé el Ligth Rail Train hasta Down Town
Mountan View y ahí combiné con el CALTrain hasta San Francisco, en la
combinación me topé con una Señora Argentina que al escuchar su acento
porteño la encaré para pedirle sugerencias sobre San Francisco y para
hacerla corta me contó la historia de su vida, vino a Santa Clara con la
crisis del 2001 y en resumen no fue fácil adaptarse y me dijo que no hay
que tomarse con liviandad lo de vivir en otro país. La buena fue luego
de compartir un viaje de intercambio de costumbres argentinas y gringas
nos dimos un beso y un fuerte abrazo, parece mentira pero no lo hice con
nadie más en toda mi estadía, no es común invadir el espacio personal
por estos lados.

Desde la terminal de CALTrain en la 4th y Kings caminé como para
recorrer un poco el lugar y terminé en el AT&T Park al lado del stadio
de beisbol de los Gigantes de San Francisco, asi llegué a ver el
esplendor de la bahía de San Francisco, seguí paseando y llegué al Museo
de Arte Moderno de San Francico y avancé al parque Yerba Buena, luego
fui a Market y la 5th y subí a un tranvía, el cual presentó el
inconveniente de que era solo efectivo y pago exacto, asi que en lugar
de abonar 2.5 USD me costó 3.00 USD (no termino de entender porqué una
máquina que recibe monedas no da cambio?)

Con el tranvía llegué hasta Pier 39 donde pasando los puestos de comida
muy para turistas, encontré la atracción del lugar, un par de decenas de
Leones Marinos intentando tomar una siesta sobre un muelle y disputando
los lugares haciendo mucho ruido.

Desde este lugar se vía con claridad Alcatraz y se vislumbraba el Golden
Gate, asi que miré en el mapa y parecía estar cerca, había un sendero
para ciclistas y no me convenció el alquiler de bicicletas (36 USD las
24hs o 8 USD por hora, más depósito) asi que dije, si veo el puente, tan
lejos no está y emprendí la marcha. Hacía mucho tiempo que no caminaba
tanto! :P a medida que me acercaba, el puente parecía estar más cerca y
al mismo tiempo seguía estando lejos, dejé de cruzarme con peatones y ya
estaba en la zona de ascenso de la autopista hacia el puente y no estaba
claro que hubiera manera de subir para un peatón, asi que me propuse
llegar hasta la base por lo menos, la buena es que pasee por una pequeña
playa y luego un muelle para finalmente encontrar un empinado sendero
hacia el puente.

Ya caminando por el puente, me di cuenta de dos cosas:

1.  El puente es muy alto
2.  Tengo vértigo :P

... Pero bueno, parecía bastante sólido, es increíble que sea un puente
colgante de 1890.

Desde arriba se podía ver el océano pacífico o el comienzo al menos ya
que había bastante niebla. El ruido de los autos pasar era un tanto
ruidoso, pero bueno ahí estaba en la mitad del puente y obtuve buenas
fotos, aunque cansado de tanto caminar obtuve una gratificación, el tema
era seguir caminado hasta el otro lado o volver? Pregunté si había algún
Bus del otro lado y una gringa me dijo que no tenía idea, que podía
pedir un Uber XD así que volví para el lado sur y en el camino paré a un
oficial de policía en bicicleta y me indicó como llegar a la parada del
Bus, así que caminé hasta ahí, tuve que pasar por debajo de un túnel y
encontré lo mismo de siempre en las paradas de transporte público,
asiáticos que al parecer junto a los latinos e indios son medios los
únicos que usan el transporte público. En fin había un cartel que
indicaba que líneas pasaban y dónde me dejaban, el tema es que estaba
claro que debía abonar 5 USD exactos y en efectivo, por suerte tenía
justo uno y luego de una espera, pude subir y llegar hasta mocase, como
ya era de noche, ni bien bajé del Bus corrí hasta el CalTrain porque
suponía que ya era tarde para el tren, fue una decisión doblemente
acertada, primero porque gracias a la corrida llegué justo al tren de
las 20:30 y en Montan View llegué a las 21:44, asi que baje corriendo
para combinar con el Ligth Trail y mientras estaba por salir yo cruzaba
los dedos mientras la expendedora me decía **autorizando tarjeta de
crédito** y dio error (la puse al revés, capa 8), ni bien salió el
ticket corrí y lo agarré justo, entré y tome una de las guías con
horarios, miré hasta que hora había servicio y descubrí que era el
último del día...(en esos momentos uno se vuelve creyente o al menos un
suertudo)

Me quedaron mil cosas por conocer en San Francisco, claramente tiene
todo para disfrutar, paisajes, arte y mucha vida nocturna, aunque me
sorprendió muchísimo la cantidad de homeless que hay, incluso en mi
corrida e cruce a una larga fila intentando pasar la noche en un
albergue.

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Santa Clara

Último día y muchas posibilidades, asi que teniendo en cuenta el
agotador día anterior, opte por un recorrido mas cercano, comencé a
caminar con dirección al Intel Museum, si bien podía hacer alguna
combinación entre metro y bus, el tiempo era el mismo que ir a pata y de
esta manera podría conocer un poco mas la ciudad. Definitivamente Santa
Clara no es una ciudad para caminar, si bien las veredas están limpias y
parquizadas, es casi un desierto, no te cruzas a nadie por el camino,
son todas avenidas, autopistas y no existe el concepto de kiosco, asi
que no donde comprar algo en el camino, aunque con un poco de suerte
cada 30 cuadras (para nada uniformes) te topas con una especie de
mini-super.

### Intel Museum

El museo lo recorrés en 10 minutos y no creo que resulte interesante si
no sos un ñoño que aprecie ver un ALTAIR, no hay mucho mas para decir.

### Milpitas

Volvi a patear hasta el Ligth Trail para bajar en Milpitas y volver a
patear hasta llegar a un BestBuy, Ross y Wallmart

### Alviso Marina County Park

Nuevamente volver a patear hasta el Ligth Trail para bajar en Lock Mill
y tomar el Guadalupe Creek Trail, un sendero para ciclistas que según vi
en OpenStreetMap me llevava hasta el Alviso Marina County Park,
larguisima la caminata, aunque interesante el paisaje a medida que
avanzaba se volvia mas agreste hasta llegar al borde la Bahía y
descubrir una reversa ecológica con amplia variedad de aves y lo mejor,
lo que quedó de la extrción de sales, eso le da esos colores extraños a
las fotos satelitales, un bonito atardecer y otra vez a patear, no hay
otra opción si no tenés bici o auto.

# [Percona Live 17 - Open Source Databases Conference](2017-04-23-percona-live-17-osdc)

-   [EZE -\> DFW -\> SJO](2017-04-23-percona-live-17-sjo)
-   [Zero Day](2017-04-24-percona-live-17-zero-day)
-   [Day One](2017-04-25-percona-live-17-day-one)
-   [Day Two](2017-04-26-percona-live-17-day-two)
-   [Day Three](2017-04-27-percona-live-17-day-three)
-   [San Francisco](2017-04-28-percona-live-17-san-francisco)
-   [Santa Clara](2017-04-29-percona-live-17-santa-clara)
-   [SJO -\> DFW -\> EZE](2017-04-30-percona-live-17-eze)

## Volviendo de EEUU

Partí muy temprano y muy amablemente Jocelyn (la dueña de casa) se
ofreció a llevarme en su auto hasta el aeropuerto de San Jose hasta
Dallas For Worth.

Antes de partir, nos informaron que todos los vuelos en Dallas estaban
demorados por condiciones climáticas pero que no nos preocupemos, todas
conexiones iban a ser reajustadas. En el vuelo hubo bastante turbulencia
asi que fue un tanto molesto aunque arribamos a horario a las 13:00 PM
(Hora Central)

En el aeropuerto de Dallas FW tuve que esperar unas 5 horas para partir
a Ezeiza, asi que luego de una recorrida por los locales comerciales y
degustar un sandwich de pollo con papas brabas y una fresca Corona, me
dediqué a cargar baterías (Celu y Compu) y observé en el noticiero que
había pasado un tornado por Texas, era eso lo de \"condiciones
climáticas\". Finalmente llegó el horario de partida y ya en el avión,
el capitán nos informó que había que esperar un poco más porque faltaban
97 pasajeros todos demorados por otros vuelos, no quedaba otra asi que
empecé a mirar películas...

[^1]: <https://www.gcoop.coop/>

[^2]: <https://www.percona.com/live/17/sessions/mysql-load-balancers-maxscale-proxysql-haproxy-mysql-router-nginx-close-look>

[^3]: <https://www.percona.com/live/17/sites/default/files/slides/PLSC%20-%20MySQL%20Loadbalancers.pdf>

[^4]: <https://www.percona.com/live/17/sessions/use-proxysql-improve-your-mysql-high-availability-solution>

[^5]: <https://www.percona.com/live/17/sites/default/files/slides/Proxysql_HA_PLSC_2017.pdf>

[^6]: <https://www.percona.com/live/17/sessions/galera-cluster-data-consistency>

[^7]: <https://www.percona.com/live/17/sites/default/files/slides/M17_2017_Galera_Conflict_Resolution.pdf>

[^8]: <https://www.percona.com/live/17/sessions/optimizing-mysql-without-sql-or-touching-mycnf>

[^9]: <https://www.percona.com/live/17/sites/default/files/slides/percona.pdf>

[^10]: <https://www.percona.com/live/17/sessions/multi-site-multi-master-done-right>

[^11]: <https://www.percona.com/live/17/sites/default/files/slides/MSMM%20done%20right.pdf>

[^12]: <https://www.percona.com/live/17/sessions/caching-your-application-data-mysql-and-tokudb>

[^13]: <https://www.percona.com/live/17/sites/default/files/slides/PL17-4541.pdf>

[^14]: <https://www.percona.com/live/17/sessions/securing-your-mysqlmariadb-data>

[^15]: <https://www.percona.com/live/17/sites/default/files/slides/pl17-4795.pdf>

[^16]: <https://github.com/shlomi-noach>

[^17]: <https://github.com/github/orchestrator>

[^18]: <https://github.com/renecannao>

[^19]: <https://github.com/sysown/proxysql>

[^20]: <https://en.wikipedia.org/wiki/Split-brain_(computing)>
