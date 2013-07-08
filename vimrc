call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set encoding=utf-8  " Necessary to show unicode glyphs
set expandtab
set incsearch
"set laststatus=2    " Always show the statusline
set matchtime=3
set mouse=a
set nocompatible    " Disable Vi-compatibility
set noerrorbells
set nohlsearch
set pastetoggle=<F2>
set shiftwidth=2
set showmatch
set tabstop=2
set textwidth=0

if has('gui_running')
    colorscheme solarized
    set guifont=Ubuntu\ Mono\ 11
endif

let fortran_do_enddo=1
let fortran_free_source=1
let mapleader=","

" Options for vim-latexsuite (recommended by
" /usr/share/doc/vim-latexsuite/README.Debian)
set grepprg=grep\ -nh\ $*
let g:tex_flavor='latex'
autocmd Filetype tex set sw=2 " use just a little indentation for tex
