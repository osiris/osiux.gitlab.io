---
title: Reescribir URLs con mod_rewrite en Apache
date: 2010-05-12
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/apache-mod-rewrite-htaccess.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/apache-mod-rewrite-htaccess.md) |
[`.gmi`](gemini://gmi.osiux.com/apache-mod-rewrite-htaccess.gmi) |
[`.html`](https://osiux.gitlab.io/apache-mod-rewrite-htaccess.html)

## Migrando URLs

Tuve que migrar de servidor y además cambié la url de
<http://blog.osiux.com> a <http://osiux.com>. Así que para no perder los
enlaces de otros sitios y buscadores a <http://blog.osiux.com> los tuve
que redireccionar manteniendo las urls anteriores hacia el nuevo sitio.
Para hacer esto basta con crear un archivo `.htaccess` con las reglas
que definen la reescritura de la url.

## `mod-rewrite`

Es necesario habilitar el módulo de apache:

``` {.bash org-language="sh" exports="code"}
a2enmod rewrite
```

En el `.htaccess` de <http://blog.osiux.com> definí lo siguiente:

``` {.example}
RewriteEngine On
RewriteBase /

RewriteRule ^/$  http://osiux.com/
RewriteRule ^(tutorial/)$  http://osiux.com/find/$1
#RewriteRule ^\=(.+)$  http://osiux.com/find/$1

RewriteCond %{QUERY_STRING} s=(.*)
RewriteRule ^(.*)$  http://osiux.com/find/%1

RewriteRule ^(buenos-aires-libre)/$  http://osiux.com/find/$1
RewriteRule ^200./(.+)/$  http://osiux.com/find/$1.txt
RewriteRule ^category/(.+)/$  http://osiux.com/find/$1
RewriteRule ^(tag)/(.+)/$  http://osiux.com/find/$2
RewriteRule ^(.+)\.txt$  http://osiux.com/$1.txt
```

## Referencias

# <http://www.askapache.com/htaccess/mod_rewrite-tips-and-tricks.html#default-mod-rewrite-hint>

# <http://www.sinctrl.com/2008/04/14/%C2%BFque-son-las-rewrite-rules/>

# <http://www.askapache.com/htaccess/ultimate-htaccess-file-sample.html>

# <http://briancray.com/2010/03/18/htaccess-hack-remove-url-query-strings/>

# <http://corz.org/serv/tricks/htaccess2.php>
