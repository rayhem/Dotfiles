call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'nanotech/jellybeans.vim'

" languages
Plug 'chikamichi/mediawiki.vim', { 'for' : 'mediawiki' }
Plug 'rust-lang/rust.vim',       { 'for' : 'rust' }
Plug 'vim-latex/vim-latex',      { 'for' : 'tex' }
Plug 'rhysd/vim-clang-format',   { 'for' : 'cpp' }

" editing 
Plug 'SirVer/ultisnips'
if isdirectory($HOME."/.vim/UltiSnips")
  let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/UltiSnips"]
endif

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" environment
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'

call plug#end()
