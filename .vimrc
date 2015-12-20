call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'

call plug#end()

" powerline
let g:Powerline_symbols = 'fancy'

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

" remap
"set langmap=hn,je,ko,li
"sed -n l
execute "set <M-n>=\en"
execute "set <M-e>=\ee"
execute "set <M-o>=\eo"
execute "set <M-i>=\ei"

nnoremap <M-n> <left>
nnoremap <M-e> <down>
nnoremap <M-o> <up>
nnoremap <M-i> <right>
inoremap <M-n> <left>
inoremap <M-e> <down>
inoremap <M-o> <up>
inoremap <M-i> <right>



