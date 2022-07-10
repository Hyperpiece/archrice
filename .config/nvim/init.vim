" Hyper's vim config

set nocompatible

" vim-plug
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

filetype plugin indent on

" gruvbox
let g:gruvbox_italic=1
if (has("termguicolors"))
    set termguicolors
endif

autocmd vimenter * ++nested colorscheme gruvbox

" vim-airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  :'
let g:airline_symbols.maxlinenr = '☰  '
let g:airline_symbols.dirty='⚡'

let g:airline_detect_spell=1
let g:airline_detect_spelllang='flag'

" Enumerate lines
set number

" Use 4 spaces per indentation level
set expandtab
set shiftwidth=4
set softtabstop=4

set tabstop=4

" Limit all lines to a maximum of 79 characters
set textwidth=79
set wrap

" Translation
map <F1> :setlocal spell spelllang=pt_br<CR>
map <F2> :setlocal spell spelllang=es_es<CR>
map <F3> :setlocal spell spelllang=en_us<CR>
map <F4> :setlocal spell spelllang=fr<CR>
map <F5> :setlocal nospell<CR>

map <F7> :set scrollbind cursorbind<CR>
map <F8> :set noscrollbind nocursorbind<CR>

set encoding=utf-8
set fileencoding=utf-8

" Automatically remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
