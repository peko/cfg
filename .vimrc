set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'
Plugin 'wting/rust.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

" remap


" line numbers

set nu

" colors

let g:solarized_termcolors=256
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

