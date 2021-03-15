#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
sleep 1

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
