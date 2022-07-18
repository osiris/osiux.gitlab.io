---
title: Instalar y Configurar PHP5
date: 2014-02-10
author: Osiris Alejandro Gómez osiux@osiux.com
---

[`.org`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/instalar-y-configurar-php5.org) |
[`.md`](https://gitlab.com/osiux/osiux.gitlab.io/-/raw/master/instalar-y-configurar-php5.md) |
[`.gmi`](gemini://gmi.osiux.com/instalar-y-configurar-php5.gmi) |
[`.html`](https://osiux.gitlab.io/instalar-y-configurar-php5.html)

## Instalar PHP

``` {.bash org-language="sh" exports="code"}
apt-get install php5 php-pear php-mail php-doc phpmyadmin libapache2-mod-php5 php5-cli php5-mysql php5-xdebug
```

## Configurar PHP

``` {.example}
vi /etc/php5/apache2/php.ini

memory_limit = 128M
error_reporting  =  E_ALL
upload_max_filesize = 20M
```

## Programar PHP

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
