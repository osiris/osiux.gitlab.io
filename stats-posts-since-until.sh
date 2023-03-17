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

# shellcheck disable=SC2002

SINCE_ISO="$(date '+%F' -d 'now - 30 days')"
UNTIL_ISO="$(date '+%F' -d now)"

[[ ! -z "$1" ]] && SINCE_ISO="$1"
[[ ! -z "$1" ]] && UNTIL_ISO="$2"

SINCE_DATE="$(LC_ALL=en_US.UTF-8 date '+%b %d %Y' -d "$SINCE_ISO")"
UNTIL_DATE="$(LC_ALL=en_US.UTF-8 date '+%b %d %Y' -d "$UNTIL_ISO")"
SINCE="00:00 ${SINCE_DATE^}"
UNTIL="23:59 ${UNTIL_DATE^}"

function git_get_duration ()
{
  git show --pretty --format='%B' --name-only "$1" \
    | grep -E '@ [0-9]{2}:[0-9]{2} hs' | awk '{print $2}'
}

function title2 ()
{
  printf "\\n** %s\\n\\n" "$1"
}

function begin ()
{
  printf "\\n#+BEGIN_EXAMPLE\\n\\n"
}

function end ()
{
  printf "\\n#+END_EXAMPLE\\n\\n"
}

function get_title ()
{
  grep -E '^#\+TITLE:' "$1" \
    | cut -d: -f2-          \
    | sed 's/^ \+//g'       \
    | sed 's/ \+$//g'
}

TMP0="$(mktemp)"
TMP1="$(mktemp)"
TMP2="$(mktemp)"

function post_header ()
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

git log --after "$SINCE" --before "$UNTIL" \
  --date=iso --pretty --format='%h %ad %s' \
  --no-merges                              \
  | sed 's/-0300 //g'                      \
  | grep -v ChangeLog:                     \
  | while read -r HASH DATE T SUBJECT
  do

    TIME="$(git_get_duration "$HASH")"
    HOUR="$(echo "$T" | cut -d: -f1-2)"
    [[ -z "$TIME" ]] && TIME='00:05'

    printf "%s %s %s %s %s \\n" \
           "$HASH" "$DATE" "$HOUR" "$TIME" "$SUBJECT"

  done > "$TMP0"

GIT_ORIGIN="$(git-remote-geturl | sed 's/\.git$//g')"
GIT_URL="$GIT_ORIGIN/-/commit"

LAST_HASH=$(head -1 "$TMP0" | awk '{print $1}')
FIRST_HASH=$(tail -1 "$TMP0" | awk '{print $1}')
FIRST_URL="$(printf "[[%s/%s][=%s=]]" "$GIT_URL" "$FIRST_HASH" "$FIRST_HASH")"
LAST_URL="$(printf  "[[%s/%s][=%s=]]" "$GIT_URL" "$LAST_HASH" "$LAST_HASH")"

git diff --name-only "$FIRST_HASH..$LAST_HASH" > "$TMP1"
grep -E '\.org$' "$TMP1" > "$TMP2"
#FIXME timesum by filename
TOTAL_TIME="$(timesum "$(awk '{print $4}' "$TMP0")")"
TOTAL_COMMITS="$(cat    "$TMP0" | wc -l)"
TOTAL_BLOG_POSTS="$(cat "$TMP2" | wc -l)"


TABLE=$(cat << EOF
| item                    | value                |
|-------------------------|----------------------|
| =LAST_HASH=             | $LAST_URL            |
| =FIRST_HASH=            | $FIRST_URL           |
| =TOTAL_TIME=            | =$TOTAL_TIME hs=     |
| =TOTAL_COMMITS=         | =$TOTAL_COMMITS=     |
| =TOTAL_BLOG_POSTS=      | =$TOTAL_BLOG_POSTS=  |
EOF
)
#FIXME restrict git-streak between 2 dates
STREAK="$(ANSI=0 git-streak | sed 's/ $//g')"

post_header "/posts/ $SINCE_ISO - $UNTIL_ISO"
echo
title2 "Actividad por día"
begin
printf "%s\\n" "$STREAK"
end

title2 "Resumen"
echo "$TABLE"
echo
title2 "Total de /commits/ por día"
begin
awk '{print $2}' "$TMP0" | sort | uniq -c | ./barra
end
echo
title2 "Total de /commits/ por hora"
begin
awk '{print $3}' "$TMP0" | cut -d: -f1 | sort | uniq -c | ./barra
end
echo
title2 "Total de /commits/ por tiempo"
begin
awk '{print $4}' "$TMP0" | sort | uniq -c | ./barra
end

title2 "Detalle de /posts/ nuevos, modificados y autogenerados"
sort -r "$TMP2" | while read -r FILE
do
  [[ -e "$FILE" ]] || continue
  NAME="$(basename "$FILE" .org)"
  TITLE="$(get_title "$FILE")"
  [[ -z "$TITLE" ]] && TITLE="$NAME"
  printf "*** [[file:%s][%s]]\\n\\n" "$FILE" "$TITLE"
done
