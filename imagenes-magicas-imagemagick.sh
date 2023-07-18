#!/bin/bash

# green
convert -size 1920x1080 xc:green img/green.png

identify img/green.png

# green-cc-by
convert img/green.png -fill yellow \
-font ~/.fonts/cc-icons.ttf \
-pointsize 32 -gravity SouthEast \
-annotate 0 'cba ' \
img/green-cc-by.jpg

# gradient
convert -size 1920x1080 gradient:none-gray img/gradient.png

# gradient + green-cc-by = dark-green
composite -compose colorburn img/gradient.png \
img/green-cc-by.jpg img/dark-green.jpg

# dark-green + OSiUX.com = green-font
convert img/dark-green.jpg -fill yellow \
-font /usr/share/fonts/truetype/inconsolata/Inconsolata.otf \
-pointsize 32 -gravity SouthEast \
-annotate 0 'OSiUX.com        ' \
img/green-font.jpg

# dither + colorspace
convert img/osiux-color.jpg +dither -colors 2 -colorspace gray -contrast-stretch 0 img/osiux-gray-2.jpg
convert img/osiux-color.jpg +dither -colors 4 -colorspace gray -contrast-stretch 0 img/osiux-gray-4.jpg
convert img/osiux-color.jpg +dither -colors 8 -colorspace gray -contrast-stretch 0 img/osiux-gray-8.jpg
convert -append img/osiux-gray-2.jpg img/osiux-gray-4.jpg img/osiux-gray-8.jpg img/osiux-gray.jpg

# edge
convert img/osiux-color.jpg -colorspace Gray -edge 1 img/osiux-edge-1.jpg
convert img/osiux-color.jpg -colorspace Gray -edge 2 img/osiux-edge-2.jpg
convert img/osiux-color.jpg -colorspace Gray -edge 3 img/osiux-edge-3.jpg
convert -append img/osiux-edge-1.jpg img/osiux-edge-2.jpg img/osiux-edge-3.jpg img/osiux-edge.jpg

# edge + negate
convert img/osiux-color.jpg -colorspace Gray -edge 1 -negate img/osiux-edge-negate-1.jpg
convert img/osiux-color.jpg -colorspace Gray -edge 2 -negate img/osiux-edge-negate-2.jpg
convert img/osiux-color.jpg -colorspace Gray -edge 3 -negate img/osiux-edge-negate-3.jpg
convert -append img/osiux-edge-negate-1.jpg img/osiux-edge-negate-2.jpg img/osiux-edge-negate-3.jpg img/osiux-edge-negate.jpg

# edge + negate + blur
for i in {1..3};do convert img/osiux-edge-negate-$i.jpg -blur 0x1 img/osiux-edge-negate-blur-$i.jpg;done
convert -append img/osiux-edge-negate-blur-1.jpg img/osiux-edge-negate-blur-2.jpg img/osiux-edge-negate-blur-3.jpg img/osiux-edge-negate-blur.jpg

# charcoal (edge + negate + blur)
for i in {1..3};do convert img/osiux-color.jpg -charcoal $i img/osiux-charcoal-$i.jpg;done
convert -append img/osiux-charcoal-1.jpg img/osiux-charcoal-2.jpg img/osiux-charcoal-3.jpg img/osiux-charcoal.jpg

# append
convert +append img/osiux-gray.jpg img/osiux-edge.jpg img/osiux-edge-negate.jpg img/osiux-charcoal.jpg img/osiux-edge-negate-blur.jpg img/osiux-5x3.jpg
composite -compose colorburn -gravity Center img/osiux-5x3.jpg img/green-font.jpg img/osiux-image-magick.jpg
