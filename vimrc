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
set laststatus=2    " Always show the statusline
set matchtime=3
set mouse=a
set nocompatible    " Disable Vi-compatibility
set noerrorbells
set nohlsearch
set shiftwidth=4
set showmatch
set tabstop=4
set textwidth=0

let fortran_do_enddo=1
let fortran_free_source=1
let mapleader=","

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" Folding
set foldopen-=search
set foldopen-=undo
:au FileType c,cpp :set cindent
