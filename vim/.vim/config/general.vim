" Enable syntax highlighting
syntax on

" Copy indent from current line when starting a new line
set autoindent

" Use colors that look nice on a dark background
set background=dark

" Allow backspacing over everything in Insert mode
set backspace=indent,eol,start

" Set characer encoding (incl. buffers, registers, and expression strings)
set encoding=utf-8

" Use syntax highlighting to specify folds
set foldmethod=syntax

" Show incremental search matches as they are typed
set incsearch

" When inserting a bracket, briefly jump to its match
set matchtime=3
set showmatch

" Enable mouse usage in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Remove trailing whitespace
command Rws %s/\s\+$//g|norm!``