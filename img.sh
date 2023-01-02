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

HEADER='img-header.org'

get_title()
{
   grep -E "\+TITLE: " "$FILE" | head -1 | cut -d: -f2- | sed 's/^ \+//g'
}

TMP="$(mktemp)"

[[ -e "$HEADER" ]] && cat "$HEADER"

find . -type f -iname '*.org' \
  | cut -d/ -f2- \
  | sort -nr \
  | grep -v img.org \
  | grep -v 2021-03-06-galeria-de-imagenes.org \
  | while read -r FILE
do

  grep '\[file:img' "$FILE" | sed 's/file:tmb/file:icn/g' > "$TMP"

  [[ -s "$TMP" ]] || continue
  
  TITLE="$(get_title "$FILE")"
  printf "** [[file:%s][%s]]\\n\\n" "$FILE" "$TITLE"

  while read -r IMG
  do
    printf "%s\\n\\n" "$IMG"
  done < "$TMP"

done
