#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2018 Osiris Alejandro Gomez <osiris@gcoop.coop>
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

DOMAIN='osiux.com'

WEB="https://$DOMAIN"
XML='sitemap.xml'
TXT='sitemap.txt'

HEAD=$(cat << EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOF
)

> "$TXT"
echo "$HEAD" > "$XML"

find . -type f -name '*.html' \
  | sort \
  | while read -r i
do
  E=$(stat --format "%Z" "$i")
  D=$(date --date @$E "+%FT%T%:z")
  F=$(echo "$i" | cut -c 3- | sed 's/index.html//g')

URL=$(cat << EOF
<url>
 <loc>$WEB/$F</loc>
 <lastmod>$D</lastmod>
</url>
EOF
)

  echo "$WEB/$F"   >> "$TXT"
  echo "$URL"      >> "$XML"

done

echo "</urlset>" >> "$XML"

gzip -f "$XML"
