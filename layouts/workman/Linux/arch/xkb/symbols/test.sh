#!/bin/bash
# put this line to ~/.xinitrc
# toggle variants /usr/share/X11/xkb/rules/base.lst
setxkbmap -layout us,us -variant workman,workman-coding -option "altwin:hyper_win,grp:shifts_toggle,caps:backspace"
#setxkbmap -option caps:backspace
#setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"
