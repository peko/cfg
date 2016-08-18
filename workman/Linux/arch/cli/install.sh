#!/bin/sh


# copy keymap
cp workman-arch.map /usr/share/kbd/keymaps/i386

# enable layout on system start
echo KEYMAP=workman-arch >> /etc/vconsole.conf

# install terminus
pacman -S terminus-font

# set font
echo FONT=ter-c16n >>/etc/vconsole.conf

