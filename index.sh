#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2017 Osiris Alejandro Gomez <osiux@osiux.com>
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

DIR="$PWD"
IDX="$DIR/index.org"

BLOG_HEAD=$(cat << EOF
#+TITLE:     ABSOLUTELLY NO WARRANTY
#+AUTHOR:    Osiris Alejandro Gómez
#+EMAIL:     osiux@osiux.com
#+LANGUAGE:  es
#+LINK_HOME: index.html
#+INCLUDE:   header.org
#+DATE:      {{{modification-time(%Y-%m-%d %H:%M)}}}
#+HTML_HEAD: <meta property="og:title"       content="ABSOLUTELLY NO WARRANTY | OSiUX Blog" />
#+HTML_HEAD: <meta property="og:type"        content="website" />
#+HTML_HEAD: <meta property="og:url"         content="https://osiux.com/" />
#+HTML_HEAD: <meta property="og:image"       content="https://osiux.com/img/no-soy-un-pirata-compartir-es-bueno.jpg" />
#+HTML_HEAD: <meta property="og:image:alt"   content="No soy un Pirata, Compartir es Bueno" />
#+HTML_HEAD: <meta property="og:description" content="GNU/Linux and Free Libre Open Software posts" />
#+HTML_HEAD: <meta property="og:site_name"   content="OSiUX" />
#+HTML_HEAD: <meta property="og:locale"      content="es_AR" />
EOF
)

printf "%s\\n\\n" "$BLOG_HEAD" > "$IDX"

PREVIOUS_DATE='1970-01-01'

EXCLUDE="$DIR/.exclude"

find . -type f -name '*.org' \
  | cut -c 3-                \
  | grep -Evf "$EXCLUDE"     \
  | sort -nr                 \
  | head -30                 \
  | while read -r ORG
do
  HEAD=$(head -9 "$ORG")
  DATE=$(echo "$HEAD" | grep DATE: | grep -Eo "[0-9]{4}\\-[0-9]{2}\\-[0-9]{2}")
  TIME=$(echo "$HEAD" | grep DATE: | grep -Eo "[0-9]{2}:[0-9]{2}")
  TITLE=$(echo "$HEAD" | grep TITLE: | head -1 | cut -d: -f2- | sed 's/^\ \+//g')

  if [[ -z "$TITLE" ]]
  then
    TITLE=$(echo "$ORG" | tr '-' ' ' | sed 's/.org$//g')
  fi

  if [[ -z "$TIME" ]]
  then
    TIMESTAMP=$(stat -c %y "$ORG" | cut -c -16)
    TIME=$(echo "$TIMESTAMP" | cut -c 12-16)
    [[ -z "$DATE" ]] && DATE=$(echo "$TIMESTAMP" | cut -c -10)
  fi

  [[ -z "$DATE" ]] && continue

  if [[ "$GROUP_BY_DATE" -eq 1 ]]
  then
    if [[ "$PREVIOUS_DATE" != "$DATE" ]]
    then
      printf "** =%s=\\n\\n" "$DATE" >> "$IDX"
    fi
  fi

  if [[ "$SHOW_TIMESTAMP" ]]
  then
    printf "*** =%s= [[file:%s][%s]]\\n\\n" \
           "$TIME" "$ORG" "$TITLE"        >> "$IDX"
  else
    printf "*** [[file:%s][%s]]\\n\\n" "$ORG" "$TITLE" >> "$IDX"
  fi

  PREVIOUS_DATE="$DATE"
done

BLOG=$(cat << EOF

** [[file:blog.org][=blog=]]

#+INCLUDE: "years.org"

EOF
)

echo "$BLOG" >> "$IDX"

