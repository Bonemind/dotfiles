#!/bin/env bash
# xrandr --output eDP1 --scale 1x1 --pos 0x0
# xrandr --output DP2 --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 3840x0
# xrandr --output eDP1 --auto --output DP2 --mode "3840x2160_fixed" --left-of eDP1

if xrandr | grep "DP1 connected 3840"; then
  	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
elif xrandr | grep "DP1 connected"; then
	xrandr --output DP1 --scale 2x2 --mode 1920x1200 --fb 7680x2400 --pos 0x0 && xrandr --output eDP1 --scale 1x1 --pos 3840x0
else
  	xrandr --output eDP1 --auto --pos 0x0 --fb 3840x2160 --output DP1 --off
fi
