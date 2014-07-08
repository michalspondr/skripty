#!/bin/sh
#
# Put random graphics effect on screenshot and use this image as lock image for i3lock
# Effects are chosen so the readability is disabled
#
# Use it with e.g. xautolock. Add this to your ~/.profile:
# xautolock -time 10 -locker 'lock.sh' &


EFFECT_COUNT=10	# don't forget to increase it if you add new effects
FILENAME=/tmp/screenshot.png

import -window root $FILENAME

let "v = RANDOM % $EFFECT_COUNT"

case $v in
	"0")
		mogrify -scale 10% -scale 1000% $FILENAME
		;;
	"1")
		mogrify -adaptive-blur 0x5 $FILENAME
		;;
	"2")
		mogrify -adaptive-blur 0x6 $FILENAME
		;;
	"3")
		mogrify -charcoal 11 -blur 0x3 $FILENAME
		;;
	"4")
		mogrify -blur 0x3 -edge 15 $FILENAME
		;;
	"5")
		mogrify -emboss 17 -blur 0x3 $FILENAME
		;;
	"6")
		mogrify -implode 1 -motion-blur 0x8 -emboss 5 $FILENAME
		;;
	"7")
		mogrify -posterize 8 -noise 5x5 $FILENAME
		;;
	"8")
		mogrify -sketch 3x3 -emboss 7 -threshold 90 -blur 0x3 $FILENAME
		;;
	"9")
		mogrify -monochrome -wave 8x8 $FILENAME
		;;
	*)
		zenity --info --text "Selection out of range"
		mogrify -scale 10% -scale 1000% $FILENAME
		;;
esac

# Change this to use a different screen locker
i3lock -i $FILENAME
