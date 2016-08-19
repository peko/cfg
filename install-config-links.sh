#!/bin/bash

pwd=`pwd`

ln -s $pwd/.nanorc ~/.nanorc
ln -s $pwd/.vimrc ~/.vimrc
ln -s $pwd/.vim ~/.vim

mv ~/.config ~/.config.bak
ln -s $pwd/.config ~/.config
