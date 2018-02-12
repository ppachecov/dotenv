#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example &

for i in $(polybar -m | awk -F: '{print $1}'); 
    do MONITOR=$i 
        if [ "$MONITOR" = "LVDS1" ]; then  
            polybar top    -c ~/.config/polybar/config & 
            polybar bottom -c ~/.config/polybar/config & 
        else
            polybar external -c ~/.config/polybar/config &
        fi; 
    done
feh --bg-scale ~/.config/wall.png

echo "Bars launched..."
