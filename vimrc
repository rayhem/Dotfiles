filetype plugin indent on
let fortran_free_source=1
let fortran_do_enddo=1

syntax on

set autoindent 
set background=dark
set backspace=indent,eol,start
set expandtab
set incsearch 
set matchtime=3
set mouse=a
set nocompatible
set noerrorbells
set nohlsearch
set shiftwidth=2
set showmatch
set tabstop=2
set textwidth=0

"set foldmethod=marker

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" Folding
set foldopen-=search
set foldopen-=undo
:au FileType c,cpp :set cindent
