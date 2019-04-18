#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2019 Osiris Alejandro Gomez <osiux@osiux.com>
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

for i in *.org
do

HD=$(egrep '^\#\+DATE:' "$i" | head -1 | grep -v 'modification-time' | awk '{print $2,$3}')
DD=$(echo "$HD" | egrep -o "[0-9]{4}-[0-9]{2}-[0-9]{2}")
HT=$(echo "$HD" | egrep -o "[0-9]{2}:[0-9]{2}")

[[ -z "$HD" ]] && continue
[[ ! -z "$HT" ]] && continue

T=$(git log "$i" | grep Date: | tail -1 | awk '{print $5}' | cut -c -5)

echo "SET #+DATE: $DD $T in $i" 
sed -i "s/\+DATE:\ \+${DD}/\+DATE:      $DD $T/g" "$i"

done


