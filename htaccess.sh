#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2021 Osiris Alejandro Gomez <osiux@osiux.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

HEAD=$(cat << EOF
ErrorDocument 404 /404.html
AddDefaultCharset utf-8
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteRule ^(.*?).txt$ \$1.html
    RewriteRule ^(.*?).org$ \$1.html
    RewriteRule rss.xml index.xml
    RewriteRule feed index.xml
    RewriteRule robots.html robots.txt
    RewriteRule ^2013-09-30-hacks-hackers-buenos-aires-2013.html$ /2013-08-30-hacks-hackers-buenos-aires-2013.html [R=301,NC]
    RewriteRule ^about$ /about.html
EOF
)

FOOT=$(cat << EOF
</ifModule>
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresDefault "now"
    ExpiresByType text/html "now"
    ExpiresByType text/xml "now"
    ExpiresByType text/css "access plus 1 week"
    ExpiresByType image/gif "access plus 1 month"
    ExpiresByType image/jpeg "access plus 1 month"
    ExpiresByType image/png "access plus 1 month"
    ExpiresByType image/x-icon "access plus 1 month"
    ExpiresByType text/javascript "access plus 1 month"
    ExpiresByType application/x-javascript "access plus 1 month"
    ExpiresByType application/pdf "access plus 1 month"
</IfModule>
EOF
)

echo "$HEAD"

echo "    RewriteRule ^$ /index.html"

find . -maxdepth 1 -type f -iname '*.org'  \
  | cut -d/ -f2                            \
  | grep -E '^[0-9]{4}-[0-9]{2}-[0-9]{2}-' \
  | sed 's/\.org/.html/g'                  \
  | while read -r F
    do
      R="$(echo "$F" | cut -d- -f4- | sed 's/\.html$//g')"
      echo "    RewriteRule ^$R$ /$F"
    done | sort

echo "$FOOT"
