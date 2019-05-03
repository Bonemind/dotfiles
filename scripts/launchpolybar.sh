#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -r native > /dev/null 2>&1 &
polybar -r work > /dev/null 2>&1 &
