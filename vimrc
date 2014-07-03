set nocompatible " be iMproved
filetype off     " required for Vundle
let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle -- required!
Plugin 'gmarik/vundle'

Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

call vundle#end()
filetype plugin indent on "we now return to your regularly scheduled vimrc...

syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set encoding=utf-8  " Necessary to show unicode glyphs
set incsearch
"set laststatus=2    " Always show the statusline
set matchtime=3
set mouse=a
set noerrorbells
set nohlsearch
set pastetoggle=<F2>
set showmatch

" Wrapping rules
set linebreak       " Don't break in-word when wrapping text
set wrapmargin=2    " Hard wraps at -2 from last column
set showbreak=…
command! -nargs=* Wrap set wrap linebreak nolist
nmap <leader>p gwip

" Tabbing rules (good idea to keep softtabstop == tabstop)
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" Invisible characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nmap <leader>w :set wrap!<CR>

if has('gui_running')
    colorscheme solarized
    set guifont=Ubuntu\ Mono\ 11
endif

let fortran_do_enddo=1
let fortran_free_source=1

" Options for vim-latexsuite (recommended by
" /usr/share/doc/vim-latexsuite/README.Debian)
" set grepprg=grep\ -nh\ $*
" let g:tex_flavor='latex'
" autocmd Filetype tex set sw=2 " use just a little indentation for tex

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
