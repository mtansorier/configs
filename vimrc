" set color template 
colo desert

" enable syntax highlighting
syntax on

" you can show line numbers
set number

" surligne resultat de recherche
set hlsearch

" taglist
filetype plugin on

" font
set guifont=Monospace\ 9

" alias, tags enter with 't'
map t <C-]>

" Cursor color (#F0E68C)
highlight Cursor guifg=black guibg=#F0E68C

" Cursor line
highlight CursorLine guibg=#242424 gui=none
"
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" 80 col line
highlight ColorColumn ctermbg=235 guibg=#242424
set colorcolumn=80

" autocompletion
set wildmenu
set wildmode=longest:list,full

" set E to Explore
cabbrev E Explore

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" force tab caratctere instead of space
set noexpandtab

"autocmd vimenter * NERDTree
