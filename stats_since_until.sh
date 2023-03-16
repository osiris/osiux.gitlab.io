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

DATES=$(cat << EOF
2021-01-25 2021-02-25
2021-03-01 2021-03-31
2023-02-15 2023-03-15
EOF
)

function get_value()
{
  grep "$1" "$2" | grep -Eo "$3" | tr -d '=' | sed 's/ \+$//g'
}

function get_first_hash()
{
  get_value '=FIRST_HASH=' "$1" '=[a-f0-9]{7}='
}

function get_last_hash()
{
  get_value '=LAST_HASH=' "$1" '=[a-f0-9]{7}='
}

function get_time()
{
  get_value '=TOTAL_TIME=' "$1" '=[0-9]{2}:[0-9]{2} hs='
}

function get_commits()
{
  get_value '=TOTAL_COMMITS=' "$1" '=[0-9]+='
}

function get_posts()
{
  VALUE="$(get_value '=TOTAL_BLOG_POSTS=' "$1" '=[0-9]+=')"
  echo "$VALUE"
}

TMP="$(mktemp)"
echo "$DATES" | grep -v '\#' > "$TMP"

while read -r SINCE UNTIL
do

  ORG="$SINCE-$UNTIL-posts.org"
  ./stats-posts-since-until.sh "$SINCE" "$UNTIL" > "$ORG" || continue
  DATE="$(stat -c %w "$ORG")"
  printf "%s "         "${DATE%.*}"
  printf "file=%s "    "$ORG"
  printf "first=%s "   "$(get_first_hash "$ORG")"
  printf "last=%s "    "$(get_last_hash "$ORG")"
  printf "time=%s "    "$(get_time "$ORG")"
  printf "commits=%s " "$(get_commits "$ORG")"
  printf "posts=%s "   "$(get_posts "$ORG")"
  printf "\\n"

done < "$TMP"

rm -f "$TMP"
