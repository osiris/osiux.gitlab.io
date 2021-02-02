#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2020 Osiris Alejandro Gomez <osiux@osiux.com>
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

TMP0=$(mktemp)
TMP1=$(mktemp)
TMP2=$(mktemp)

ORG='blog.org'

get_title()
{
  grep -E 'TITLE:' "$1"  \
    | head -1            \
    | cut -d: -f2-       \
    | sed 's/^ \+//g'    \
    | sed 's/ \+$//g'
}

get_image()
{
  grep -Eo 'file:(tmb|img)/.*\.(png|jpg|gif)' "$FILE" \
    | sed 's/\]\[/\n/g' \
    | head -1 2>/dev/null
}

header()
{
cat << EOF
#+TITLE:     ABSOLUTELLY NO WARRANTY $1
#+AUTHOR:    Osiris Alejandro Gómez
#+EMAIL:     osiux@osiux.com
#+LANGUAGE:  es
#+LINK_HOME: index.html
#+INCLUDE:   header.org
#+DATE:      {{{modification-time(%Y-%m-%d %H:%M)}}}


EOF
}

footer()
{
  printf "\\n** [[file:archive.org][=ARCHIVE=]]\\n" >> "$1"
  printf "\\n#+INCLUDE: years.org\\n" >> "$1"
}

header '' >"$ORG"

R='.*/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-.*\.org$'
find . -type f -regextype sed -regex "$R" | cut -c 3- | sort -nr >"$TMP0"

cut -c -4 "$TMP0" | sort -unr >"$TMP1"

while read -r Y
do

  grep "^$Y" "$TMP0" >"$TMP2"

  YEAR="${Y}.org"
  printf "** [[file:%s][%s]]\\n" "$YEAR" "$Y" >> "$ORG"
  header "$Y" > "$YEAR"

  while read -r FILE
  do
    DATE="$(echo "$FILE" | cut -c -10)"
    TITLE="$(get_title "$FILE")"

    printf "*** [[file:%s][=%s= %s]]\\n" "$FILE" "$DATE" "$TITLE">>"$ORG"
    printf "** [[file:%s][=%s= %s]]\\n" "$FILE" "$DATE" "$TITLE">>"$YEAR"

    IMAGE="$(get_image "$FILE")"
    if [[ ! -z "$IMAGE" ]]
    then
      printf "\\n   [[file:%s][%s]]\\n\\n" "$FILE" "$IMAGE" >> "$YEAR"
    fi
  done < "$TMP2"

  footer "$YEAR"

done < "$TMP1"

footer "$ORG"

rm -f "$TMP0"
rm -f "$TMP1"
rm -f "$TMP2"
