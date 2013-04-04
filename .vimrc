set magic
set number
set nowrap
set showcmd
set wildmenu
set autochdir
set helplang=cn
set nocompatible
set ambiwidth=double
set visualbell t_vb=
set virtualedit=block
set incsearch hlsearch
set fileformats=unix,dos
set nrformats=octal,hex,alpha
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set history=1000 undolevels=1000
set nowritebackup noswapfile autoread
set showmatch matchpairs=(:),[:],{:},<:>
set list listchars=tab:--,trail:-,nbsp:*
set nofoldenable foldmethod=indent foldtext=
set complete=.,w,b,u,t,i,d completeopt=longest,menu
set encoding=utf-8 termencoding=utf-8 fileencoding=utf-8
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab
set autoindent smartindent copyindent cindent cinoptions=:0g0t0(0
set fileencodings=ucs-bom,utf-8,chinese,gb18030,big5,euc-jp,euc-kr,latin1
set laststatus=2 statusline=Format:%{&fileformat}\ \ Encoding:%{(&fenc!=''?&fenc:&enc)}%=%7.7l,%-7.7c%3.3p%%
syntax on
colorscheme desert
let g:netrw_liststyle=3
filetype plugin indent on
autocmd CursorMoved * set number
autocmd BufRead * if line("'\"") > 1 && line("'\"") <= line("$") | silent exe "normal! g`\"" | endif
function! IsWinGvim()
    if(has("gui_running") && (has("win95") || has("win16") || has("win32") || has("win64"))) | return 1 | endif
    return 0
endfunction
if(has("gui_running"))
    autocmd GUIEnter * set visualbell t_vb= | winpos 500 20
    autocmd BufRead,TabEnter * let &titlestring=expand("%:p")
    set lazyredraw clipboard+=unnamed lines=37 columns=100 guioptions=e showtabline=2 guitablabel=%t\ %M
endif
if(IsWinGvim())
    set langmenu=zh_CN.utf-8
    language messages zh_CN.utf-8
"    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
function! ToggleMaxWindow()
    if(IsWinGvim())
        if !exists("s:gvim_max_window") | let s:gvim_max_window="normal" | endif
        if s:gvim_max_window == "normal" | silent exe "simalt ~X" | let s:gvim_max_window="max"
        else | silent exe "simalt ~R" | let s:gvim_max_window="normal" | endif
    endif
endfunction
function! ToggleFolding()
    if !exists("s:folding_state") | let s:folding_state="zR" | endif
    if s:folding_state == "zR" | silent exe "normal! zM" | let s:folding_state="zM"
    else | silent exe "normal! zR" | let s:folding_state="zR" | endif
endfunction
function! InputDelimiter()
    let g:duplicate_lines_delimiter=input("delimiter:")
endfunction
function! DeleteDuplicateLines()
    if !exists("g:duplicate_lines_delimiter") | let g:duplicate_lines_delimiter="" | endif
    let number1=line(".")  | call cursor(number1+1,0)
    let number2=line(".")  | call cursor(number1,0)
    if  number1 == number2 | return | endif
    let line1=getline(number1) | let line2=getline(number2)
    if g:duplicate_lines_delimiter != ""
        let pos=stridx(line1,g:duplicate_lines_delimiter)
        if  pos == -1 | return | endif
        let line1=strpart(line1,0,pos) | let line2=strpart(line2,0,pos)
    endif
    if line1 == line2 | silent exe "normal! dd" | else | call cursor(number2,0) | endif
endfunction
:nnoremap <silent> <C-J>   <Esc>gt
:nnoremap <silent> <C-K>   <Esc>gT
:nnoremap <silent> <C-F>   <Esc>:tabedit .<CR>
:nnoremap <silent> <C-Q>   <Esc>:call ToggleMaxWindow()<CR>
:inoremap <silent> <C-Q>   <C-O>:call ToggleMaxWindow()<CR>
:nnoremap <silent> <Space> <Esc>:call ToggleFolding()<CR>
:nnoremap <silent> <C-L>   <Esc>:call InputDelimiter()<CR>
:nnoremap <silent> <C-P>   <Esc>:call DeleteDuplicateLines()<CR>
:nnoremap <silent> <F12>   <Esc>:set  paste!<CR>:set paste?<CR>
:inoremap <silent> <F12>   <C-O>:set  paste!<CR>:set paste?<CR>
:nnoremap <silent> <F11>   <Esc>:set  wrap!<CR>:set wrap?<CR>
:inoremap <silent> <F11>   <C-O>:set  wrap!<CR>:set wrap?<CR>
:nnoremap <silent> <F10>   <Esc>:set  list!<CR>:set list?<CR>
:inoremap <silent> <F10>   <C-O>:set  list!<CR>:set list?<CR>
:nnoremap <silent> <F9>    <Esc>:set  cursorline!<CR>:set cursorline?<CR>
:inoremap <silent> <F9>    <C-O>:set  cursorline!<CR>:set cursorline?<CR>
:nnoremap <silent> <F8>    <Esc>:set  cursorcolumn!<CR>:set cursorcolumn?<CR>
:inoremap <silent> <F8>    <C-O>:set  cursorcolumn!<CR>:set cursorcolumn?<CR>
:nnoremap <silent> <F1>    <Esc>:tab  help<CR>
:inoremap <silent> <F1>    <C-O>:tab  help<CR>


