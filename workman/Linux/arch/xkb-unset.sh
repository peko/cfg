#!/bin/bash
# put this line to ~/.xinitrc
setxkbmap -layout us -variant workman -option "altwin:hyper_win,caps:backspace" -option "grp"
#setxkbmap -option caps:backspace
#setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"
