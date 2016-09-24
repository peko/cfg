#!/bin/bash
# Status script for dwm
# colours: 01:normal 02:white 03:red 04:green 05:yellow 
# 06:blue 07:cyan 08:magenta 09:grey

music(){
    track="$(mpc current)"
    artist="${track%%- *}"
    title="${track##*- }"
    if [[ -n "$artist" ]]; then
        echo -e "\x09 $artist\x01\x07$title\x01 "
    fi
}

bat(){
    onl="$(grep "on-line" <(acpi -V))"
    charge="$(awk '{print +$4}' <(acpi -b))"
    remain="$(awk '{print $5}' <(acpi -b))"
    if [[ ( -z $onl && $charge -gt 20 ) ]]; then 
        echo -e "\x06\x01 $charge% $remain"
    elif [[ ( -z $onl && $charge -le 20 ) ]]; then
        echo -e "\x03 $charge% $remain\x01"
    else
        echo -e "\x06\x01 $charge%"
    fi
}

mem(){
    mem="$(awk '/^-/ {print $3}' <(free -m))"
    echo -e "\x04\x01 $mem"
}

cpu(){
    read cpu a b c previdle rest < /proc/stat 
    prevtotal=$((a+b+c+previdle))
    sleep 0.5 
    read cpu a b c idle rest < /proc/stat 
    total=$((a+b+c+idle))
    cpu="$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))%" 
    echo -e "\x05\x01 $cpu" 
}

lda(){
    lda="$(awk '{print $1,$2,$3}' </proc/loadavg)" 
    echo -e "\x08\x01 $lda" 
}

hdd(){
    hdd="$(df -P | awk '/^\/dev/{s=s (s?" ":"") $5} END {printf "%s",s}')" 
    echo -e "\x08\x01$hdd" 
}

eml(){
    maildirs="$HOME/Mail/*/INBOX/new/"
    ml="$(find $maildirs -type f | wc -l)"
    if [[ $ml -eq 0 ]]; then
        echo -n ""
    else
        echo -en "\x03 $ml  \x01"
    fi
}

int(){
    host google.com>/dev/null &&   
    echo -e "\x06ON\x01" || echo -e "\x03OFF\x01"
}

vol(){
        vol="$(ponymix get-volume)"
        if ponymix is-muted; then
          echo -e "\x03\x01"
        else
          echo -e "\x04\x01 $vol%"
        fi
}

dte(){
    dte1="$(date "+%a %d %b")"
    dte2="$(date "+%R")"
    echo -e "\x09$dte1\x01 \x02 $dte2\x01"
}

wifi(){
      STATUS="X`/usr/sbin/iwgetid`"
      if test "$STATUS" != "X" ; then
        ESSID="`/usr/sbin/iwgetid |awk -F ":" '{print $2}'|sed -e 's/"//g'`"
        LINK="`awk '/wlp3s0:/ {print $3}' /proc/net/wireless |sed -e 's/\.//g'`"
      echo " $ESSID:$LINK"
      fi
    } 

# Pipe to status bar
xsetroot -name "$(music) $(bat)  $(cpu)  $(mem)  $(lda)  $(wifi) $(eml)$(vol)  $(dte) "
