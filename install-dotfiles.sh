#!/bin/bash

pwd=`pwd`

echo DOTCONFIG
echo ---------

for dir in $pwd/dotconfig/*/
do
    dir=${dir%*/}
    dir_name=${dir##*/}
    echo link $dir_name
    mv ~/.config/$dir_name ~/.config/$dir_name.bak
    ln -s $pwd/dotconfig/$dir_name ~/.config/$dir_name
done

echo DOTFILES
echo --------

for file in $pwd/dotfiles/.[^.]*
do
    file_name=${file##*/}
    echo link $file_name
    mv ~/$file_name ~/$file_name.bak
    ln -s $file ~/$file_name
done

#ln -s $pwd/.nanorc ~/.nanorc
#ln -s $pwd/.vimrc ~/.vimrc
#ln -s $pwd/.vim ~/.vim
#ln -s $pwd/.spacemacs ~/.spacemacs

#mv ~/.config ~/.config.bak
#ln -s $pwd/.config ~/.config

