#!/bin/env bash
# xrandr --output eDP1 --scale 1x1 --pos 0x0
#xrandr --output DP-2 --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 3840x0
#exit 0
#xrandr --output eDP1 --auto --output DP-2 --mode "3840x2160_fixed" --left-of eDP1
#exit 0;
EXTERNAL=DP1
INTERNAL=eDP1
PRESENTATION=DP-2

if xrandr | grep "$EXTERNAL disconnected"; then
	xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
else
	#xrandr --output $EXTERNAL --scale 1x1 --mode 1920x1200 --pos 0x0 --output $INTERNAL --mode 1920x1080 --scale 1x1 --pos 1920x0
	xrandr --output $EXTERNAL --scale 2x2 --mode 1920x1200 --fb 7680x2400 --pos 0x0 && xrandr --output $INTERNAL --scale 1x1 --pos 3840x0 --mode 3840x2160
fi

# if xrandr | grep "DP1 connected 3840"; then
#   	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
# elif xrandr | grep "DP1 connected"; then
# else
#   	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
# fi
