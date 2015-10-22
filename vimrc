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
Plugin 'chikamichi/mediawiki.vim'

call vundle#end()
filetype plugin indent on "we now return to your regularly scheduled vimrc...

syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set encoding=utf-8   " Necessary to show unicode glyphs
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

let fortran_do_enddo=1
let fortran_free_source=1

" Options for vim-latexsuite (recommended by
" /usr/share/doc/vim-latexsuite/README.Debian)
set grepprg=grep\ -nh\ $*
let g:tex_flavor='latex'

"Auto-source vimrc on change
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
augroup END

autocmd BufRead,BufNew *.md set filetype=markdown
