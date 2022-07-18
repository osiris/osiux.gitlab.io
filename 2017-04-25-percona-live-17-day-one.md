---
title: Percona Live 17 =Day One= MySQL Load Balancers
date: 2017-04-25
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-25-percona-live-17-day-one.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-25-percona-live-17-day-one.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-04-25-percona-live-17-day-one.gmi) |
[`.html`](https://osiux.gitlab.io/2017-04-25-percona-live-17-day-one.html)

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

-   Web [^1]
-   PDF [^2]

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

-   Web [^3]
-   PDF [^4]

ProxySQL es un HAProxy que entiende de SQL, puede hacer cosas en función
de regex de queries o por queries exactas, reescribir queries, hacer
balanceo, es muy liviano y se usa el mysql-client para configurarlo
aunque por detrás es un sqlite.

En la charla mostraron diferentes formas de usar ProxySQL, como
configurarlo y mejores prácticas, muy didáctica.

[^1]: <https://www.percona.com/live/17/sessions/mysql-load-balancers-maxscale-proxysql-haproxy-mysql-router-nginx-close-look>

[^2]: <https://www.percona.com/live/17/sites/default/files/slides/PLSC%20-%20MySQL%20Loadbalancers.pdf>

[^3]: <https://www.percona.com/live/17/sessions/use-proxysql-improve-your-mysql-high-availability-solution>

[^4]: <https://www.percona.com/live/17/sites/default/files/slides/Proxysql_HA_PLSC_2017.pdf>
