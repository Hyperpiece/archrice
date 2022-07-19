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

" Enumerate lines
set number

" Use Linus Torvalds's formatting style
set shiftwidth=8
set tabstop=8
set textwidth=80
set wrap
autocmd BufWritePre * :%s/\s\+$//e
