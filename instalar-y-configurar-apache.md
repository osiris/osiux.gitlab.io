---
title: Instalar y Configurar Apache
date: 2014-02-10
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/instalar-y-configurar-apache.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/instalar-y-configurar-apache.md) |
[`.gmi`](gemini://gmi.osiux.com/instalar-y-configurar-apache.gmi) |
[`.html`](https://osiux.gitlab.io/instalar-y-configurar-apache.html)

Instalar Apache

``` {.bash org-language="sh" exports="code"}
apt-get install apache2-mpm-prefork libapache2-mod-php5
```

Crear un VirtualHost

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

Iniciar, Detener y Reiniciar Apache

Los cambios en los VirtualHost son aplicados sólo cuando se reinicia el
servicio, es posible hacerlo de dos maneras:

``` {.bash org-language="sh" exports="code"}
/etc/init.d/apache2 start|stop|restart
apache2ctl stop|start|graceful
```
