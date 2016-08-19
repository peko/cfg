#!/bin/bash

cd /tmp/
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -sri
cd ..

git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -sri
cd ..
