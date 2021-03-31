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
#2021-01-25 2021-02-25
2021-03-01 2021-03-31
EOF
)

echo "$DATES" | grep -v '\#' | while read -r SINCE UNTIL
do
  ORG="$SINCE-$UNTIL-posts.org"
  ./stats-posts-since-until.sh "$SINCE" "$UNTIL" > "$ORG"
done
