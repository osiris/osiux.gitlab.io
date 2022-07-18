---
title: Percona Live 17 =Day Two= Too Many Talks
date: 2017-04-26
author: Osiris Alejandro Gómez osiris@gcoop.coop
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-26-percona-live-17-day-two.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-26-percona-live-17-day-two.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-04-26-percona-live-17-day-two.gmi) |
[`.html`](https://osiux.gitlab.io/2017-04-26-percona-live-17-day-two.html)

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

-   Web [^1]
-   PDF [^2]

Nuevamente si tenes Master-Slaves casi no hay problemas, si usas
Multiples Masters es problematico y quedo claro porque un nodo de
Galera/PXC ni bien detecta una inconsistencia deja de escribir y se
suicida (`kill -9`) y la única manera de volver es de una copia completa
(como agregar un nodo nuevo), aunque si es un slave y a tu aplicación no
le molesta mucho la integridad podés ponerlo en modo read-only que siga
devolviendo `SELECT` :)

### Optimizing *MySQL* without *SQL* or touching `my.cnf`

[![](https://osiux.com/tmb/2017-04-26-percona-optimizing-without-sql.png)](https://osiux.com/img/2017-04-26-percona-optimizing-without-sql.png)

-   Web [^3]
-   PDF [^4]

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

-   Web [^5]
-   PDF [^6]

### Caching your application data with MySQL and TokuDB

[![](https://osiux.com/tmb/2017-04-26-percona-caching-tokudb-without-pkey.png)](https://osiux.com/img/2017-04-26-percona-multi-site-master.png)

-   Web [^7]
-   PDF [^8]

Un par de tanos que descubrieron que *tokudb* era más rápido que
*innodb* si las tablas no tenían *primary key*, porque la aplicación
genera un *uuid* y entonces sólo crean el campo *id* como *index* (no
*unique*) y combinado con logran responder para un sitio de alto tráfico
como lastminute.

### Securing your MySQL/MariaDB data

-   Web [^9]
-   PDF [^10]

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
trato de una charla entre *Shlomi Noach* [^11] desarrollador de
**Orchestrator** [^12] y *René Cannaò* [^13] desarrollador de
**ProxySQL** [^14] escuchando las sugerencias de la comunidad sobre como
debían interactuar estas 2 aplicaciones y fue muy productiva, porque
todos tenían diferentes escenarios y necesidades, pero se llego a la
conclusión que debían haber 2 opciones: **consistencia vs
disponibilidad**, debido a que ambas herramientas son utilizadas en
entornos de *alta disponibilidad* pero que ante una falla hay que
decidir si seguir operando posiblemente con problemas de consistencia o
*split-brain* [^15] (lo mas común en entornos *multi-master*) o pasar a
un esquema *single-master* o incluso *readonly* hasta ver como
resolverlo.

### Community Dinner

Post charlas fue la *Community Dinner*, donde básicamente le queme la
cabeza a varios sobre **our cooperative company model** :P

Según charlé con uno de los *sponsors*, esta es la conferencia mas
grande sobre **open-source-databases** y estimaban unos 500 *attendees*

[^1]: <https://www.percona.com/live/17/sessions/galera-cluster-data-consistency>

[^2]: <https://www.percona.com/live/17/sites/default/files/slides/M17_2017_Galera_Conflict_Resolution.pdf>

[^3]: <https://www.percona.com/live/17/sessions/optimizing-mysql-without-sql-or-touching-mycnf>

[^4]: <https://www.percona.com/live/17/sites/default/files/slides/percona.pdf>

[^5]: <https://www.percona.com/live/17/sessions/multi-site-multi-master-done-right>

[^6]: <https://www.percona.com/live/17/sites/default/files/slides/MSMM%20done%20right.pdf>

[^7]: <https://www.percona.com/live/17/sessions/caching-your-application-data-mysql-and-tokudb>

[^8]: <https://www.percona.com/live/17/sites/default/files/slides/PL17-4541.pdf>

[^9]: <https://www.percona.com/live/17/sessions/securing-your-mysqlmariadb-data>

[^10]: <https://www.percona.com/live/17/sites/default/files/slides/pl17-4795.pdf>

[^11]: <https://github.com/shlomi-noach>

[^12]: <https://github.com/github/orchestrator>

[^13]: <https://github.com/renecannao>

[^14]: <https://github.com/sysown/proxysql>

[^15]: <https://en.wikipedia.org/wiki/Split-brain_(computing)>
