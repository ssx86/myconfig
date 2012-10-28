set t_Co=256
:colorscheme wombat256mod
syntax on
set nu
set autoindent
set cindent
set ruler
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nobackup
set paste

filetype plugin indent on

let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1 
let Tlist_Exit_OnlyWindow=1

"let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

let NERDTreeWinSize = 22
map <F5> :NERDTree<CR>
map <F6> :Tlist<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
map <F9> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <silent> <F10> :A<CR>
set tags=tags;

"Markdown language syntax settings
au BufNewFile,BufRead *.rb set softtabstop=2 | set shiftwidth=2  
au FileType ruby set softtabstop=2 | set shiftwidth=2 

augroup mkd
    autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
    "autocmd BufNewFile,BufRead *.mkd set wrap nonumber
augroup END

set nocp
set fdm=marker
set bs=2

" use comma as <Leader> key instead of backslash
let mapleader=","
"
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"
map <leader>f :FufFile<cr>
nnoremap <leader><leader> <c-^>

"utf-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese



"gb* encoding
"set encoding=gb2312
"set fileencoding=chinese
"set fileencodings=chinese,ucs-bom,utf-8
