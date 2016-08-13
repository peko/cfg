#!/bin/bash

function palette {
    for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";
}

echo "Press enter to change theme"
for theme in ./colors/terminal.sexy/base16/*; do read -s -n 1; setcolors $theme; palette; echo $theme; done
