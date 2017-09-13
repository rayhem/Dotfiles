" Keybind to toggle paste mode. (Dis/En)ables re-formatting of text pasted to
" the buffer
set pastetoggle=<F2>

" Reset leader key; default is \
let mapleader=","

" Toggle line numbers
noremap <leader>n :set number!<CR>

" Toggle line wrapping
noremap <leader>w :set wrap!<CR>

" Toggle invisible characters
set listchars=tab:▸\ ,eol:¬
noremap <leader>l :set list!<CR>

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
