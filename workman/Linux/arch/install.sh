#!/bin/bash

# patch creation
# diff -rup /usr/share/X11/xkb/ xkb/ > xkb_ru.patch

# applying patch
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd /
sudo patch -p0 < $DIR/xkb_ru.patch

sudo cp ./xkb/10-evdev.conf /etc/X11/xorg.conf.d/
