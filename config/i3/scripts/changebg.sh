#!/bin/bash

bgn=$(cat ~/.config/i3/scripts/.save)

function chbg() {
    echo $bgn
    
    if [ $1 -eq 1 ] ;
    then
        bgn=$((bgn+1))
    elif [ $1 -eq 2 ]
    then
        bgn=$((bgn-1))
    fi
    if [ $bgn -eq 10 ] ;
    then 
        bgn=1
    elif [ $bgn -eq 0 ] ;
    then
        bgn=9
    fi
    rm ~/.config/i3/scripts/.save
    echo $bgn >> ~/.config/i3/scripts/.save

    case $bgn in
        1)
            feh --bg-fill ~/.config/i3/BG/bg1hd.png ;;
        2)
            feh --bg-fill ~/.config/i3/BG/bg2hd.png ;;
        3)
            feh --bg-fill ~/.config/i3/BG/bg3hd.png ;;
        4)
            feh --bg-fill ~/.config/i3/BG/bg4hd.png ;;
        5)
            feh --bg-fill ~/.config/i3/BG/bg5hd.png ;;
        6)
            feh --bg-fill ~/.config/i3/BG/bg6hd.png ;;
        7)
            feh --bg-fill ~/.config/i3/BG/bg7hd.png ;;
        8)
            feh --bg-fill ~/.config/i3/BG/bg8hd.png ;;
        9)
            feh --bg-fill ~/.config/i3/BG/bg9hd.png ;;


        *)
            echo "Error incorect number"
    esac
}

chbg "$@"
