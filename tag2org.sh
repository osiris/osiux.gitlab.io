#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2023 Osiris Alejandro Gomez <osiux@osiux.com>
# Copyright (C) 2023 Osiris Alejandro Gomez <osiris@gcoop.coop>
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
# along with this program. If not, see <http://www.gnu.FILES/licenses/>.

function get_title()
{
  grep -E "^\#\+TITLE:" "$1" | cut -d: -f2- | sed 's/^ \+//g'
}

function get_lang()
{
  grep -E "^\#\+LANGUAGE:.*e(n|s)" "$1" | cut -d: -f2- | tr -d ' '
}

[[ -n "$TAG"    ]] || TAG="${1^}"
[[ -z "$TAG"    ]] && exit 1
[[ -n "$HEADER" ]] || HEADER="header-${TAG,,}.org"
[[ -e "$HEADER" ]] && cat "$HEADER"
[[ -n "$ORG"    ]] || ORG="${TAG,,}.org$"

FILES="$(mktemp)"
FILTER="$(mktemp)"
VIDEOS="$(mktemp)"
TAGS="$(mktemp)"

true > "$VIDEOS"

find . -maxdepth 1 -type f -iname '*.org' \
  | cut -d '/' -f2-                       \
  | grep -vE "^($ORG|$HEADER)$"           > "$FILES"

while read -r FILE
do

  ORG_LANG="$(get_lang "$FILE")"
  [[ "$ORG_LANG" != 'es' ]] && continue
  grep -lE "^\#\+KEYWORDS:.*$TAG" "$FILE"

done < "$FILES" | sort -nr > "$FILTER"

printf "\\n** %s\\n\\n" "Posts"

while read -r FILE
do

  TITLE="$(get_title "$FILE")"
  printf "%s [[file:%s][%s]]\\n" '-' "$FILE" "$TITLE"

  VIDEO="$(grep -E '(source src=.*.mp4|iframe.*youtube)' "$FILE")"
  [[ -z "$VIDEO" ]] || echo "$FILE $VIDEO" >> "$VIDEOS"

done < "$FILTER"

printf "\\n** %s\\n\\n" "Videos"

while read -r FILE VIDEO
do

  printf "*** %s\\n\\n" "$(get_title $FILE)"
  grep -C2 "$VIDEO" "$FILE"
  printf "\\n"

done < "$VIDEOS"

rm -f "$FILES"
rm -f "$FILTER"
rm -f "$VIDEOS"
