#!/bin/bash
# put this line to ~/.xinitrc
setxkbmap -layout us,ru -variant workman,workman -option "altwin:hyper_win,grp:lalt_lshift_toggle,caps:backspace"
#setxkbmap -option caps:backspace
#setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"
