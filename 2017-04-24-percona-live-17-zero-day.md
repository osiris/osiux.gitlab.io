---
title: Percona Live 17 =Zero Day= tutorials
date: 2017-04-24
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-24-percona-live-17-zero-day.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/2017-04-24-percona-live-17-zero-day.md) |
[`.gmi`](gemini://gmi.osiux.com/2017-04-24-percona-live-17-zero-day.gmi) |
[`.html`](https://osiux.gitlab.io/2017-04-24-percona-live-17-zero-day.html)

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
