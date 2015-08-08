call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'easymotion/vim-easymotion'
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'
Plug 'wting/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'

call plug#end()

" remap
" set langmap=hn,je,ko,li
nnoremap <A-n> <left>
nnoremap <A-e> <down>
nnoremap <A-o> <up>
nnoremap <A-i> <right>

" esc to tab
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" line numbers
set nu

" Nerdtree
map <C-b> :NERDTreeToggle<CR>

" EаsyMotion
" nmap <tab>i <Plug>(easymotion-lineforward)
" nmap <tab>n <Plug>(easymotion-linebackward)
" nmap <tab>e <Plug>(easymotion-j)
" nmap <tab>o <Plug>(easymotion-k)

nmap t <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1


autocmd BufNewFile,BufRead *.iced set filetype=coffee

" colors
let g:solarized_termcolors=256
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" powerline
let g:Powerline_symbols = 'fancy'

