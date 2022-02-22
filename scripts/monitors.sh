#!/bin/env bash
# xrandr --output eDP1 --scale 1x1 --pos 0x0
#xrandr --output DP-2 --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 3840x0
#exit 0
#xrandr --output eDP1 --auto --output DP-2 --mode "3840x2160_fixed" --left-of eDP1
#exit 0;
EXTERNAL=DP1
EXTERNAL2=DP2
INTERNAL=eDP1
PRESENTATION=DP-2

if xrandr | grep "$EXTERNAL2 disconnected"; then
	xrandr --output "$EXTERNAL" --off --output "$EXTERNAL2" --off --output "$INTERNAL" --mode 1920x1080
else
	#xrandr --output $EXTERNAL --scale 1x1 --mode 1920x1200 --pos 0x0 --output $INTERNAL --mode 1920x1080 --scale 1x1 --pos 1920x0
	# xrandr --output $EXTERNAL --scale 2x2 --mode 1920x1200 --fb 11520x2400 --left-of $INTERNAL --pos 0x0
	# xrandr --output $EXTERNAL2 --scale 2x2  --fb 11520x2400 --mode 1920x1200 --left-of $EXTERNAL  --pos 3840x0
	# xrandr --output $INTERNAL --scale 1x1 --mode 3840x2160 --pos 7680x0
	xrandr --output $INTERNAL --mode 1920x1080
#	xrandr --output $EXTERNAL --mode 1920x1200 --left-of $INTERNAL 
	#xrandr --output $EXTERNAL2 --mode 1920x1200 --left-of $EXTERNAL
	#xrandr --output $EXTERNAL2 --mode 1920x1200 --left-of $INTERNAL
	xrandr --output $EXTERNAL2 --mode 1920x1200 --left-of $INTERNAL
fi

# if xrandr | grep "DP1 connected 3840"; then
#   	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
# elif xrandr | grep "DP1 connected"; then
# else
#   	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
# fi
