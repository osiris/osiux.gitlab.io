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

find img -type f           \
  | grep -E '\.(png|jpg)$' \
  | cut -d/ -f2-           \
  | while read -r IMG
do

  ICN="icn/$IMG"
  [[ -e "$ICN" ]] && continue

  DIR="$(dirname "$IMG")"
  mkdir -p "icn/$DIR"

  echo "## convert $IMG to $ICN ..."
  convert -resize 200x "img/$IMG" "$ICN"

done
