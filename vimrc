set nocompatible " be iMproved
filetype off     " required for Vundle
let mapleader=","

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'chikamichi/mediawiki.vim', { 'for': 'mediawiki' }
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'godlygeek/tabular'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

"we now return to your regularly scheduled vimrc...
filetype plugin indent on

syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set encoding=utf-8   " Necessary to show unicode glyphs
set foldmethod=syntax
set incsearch
"set laststatus=2    " Always show the statusline
set matchtime=3
set mouse=a
set noerrorbells
set nohlsearch
set pastetoggle=<F2>
set showmatch
noremap <space> :
noremap <leader>n :set number!<CR>

" Wrapping rules
set textwidth=80
set wrapmargin=2    " Hard wraps at -2 from last column
set linebreak       " Don't break in-word when wrapping text
set showbreak=…
command! -nargs=* Wrap set wrap linebreak nolist
command Rws %s/\s\+$//g|norm!``  " Remove trailing whitespace
noremap <leader>w :set wrap!<CR>
noremap <leader>p gwip

" Tabbing rules (good idea to keep softtabstop == tabstop)
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

"Let ctags work up a directory tree until it reaches $HOME
set tags=./tags;$HOME

" Invisible characters
noremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

colorscheme jellybeans

if has('gui_running')
    set guifont=Ubuntu\ Mono\ 11
endif

" Fortran stuff
let fortran_do_enddo=1
let fortran_fold=1
let fortran_free_source=1
set foldlevel=1

" Options for vim-latexsuite (recommended by
" /usr/share/doc/vim-latexsuite/README.Debian)
set grepprg=grep\ -nh\ $*
let g:tex_flavor='latex'

autocmd BufRead,BufNew *.md set filetype=markdown

function SetLaTeXOptions()
  setlocal textwidth=0
  setlocal wrapmargin=0
endfunction
autocmd FileType tex call SetLaTeXOptions()
