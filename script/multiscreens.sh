#!/bin/bash

if type "xrandr"; then
    i=0
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        i=$((i+1))
    done
    if [ $i -ge 2 ]; then
       xrandr --output HDMI-1-0 --mode 1920x1080 -r 144&
       xrandr --output eDP-1 --off &
   else
       xrandr --output eDP-1 --mode 1920x1080 -r 240 &
    fi
fi
