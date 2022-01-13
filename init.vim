"
" Basics {
"
if &compatible
    set nocompatible
endif

set number
set nowrap

set expandtab
set tabstop=4
set shiftwidth=4

set clipboard+=unnamedplus

" }


"
" Keymaps {
"
let mapleader = ' '

nnoremap <C-p> :cp<CR>
nnoremap <C-n> :cn<CR>

nnoremap giw *:vimgrep /<C-r>// **/*<CR>
autocmd QuickFixCmdPost *vimgrep* cwindow

" }


"
" Terminal {
"
set sh=bash

tnoremap <Esc> <C-\><C-n>

autocmd TermOpen * setlocal nonumber norelativenumber
" autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" autocmd BufEnter * if &buftype ==# 'terminal' | startinsert | endif

" }


"
" autoread {
"
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" }


"
" dein {
"

" Directories
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/.config/nvim/dein')

" Install dein if not
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Options
let g:dein#install_check_diff  = v:true

" Load plugins
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let tomls = glob(s:toml_dir . "/*.toml")
    for toml in split(tomls, "\n")
        call dein#load_toml(toml, {})
    endfor

    call dein#end()
    call dein#save_state()
endif

" Install plugins if not
if dein#check_install()
    call dein#install()
endif

" Required
filetype plugin indent on
syntax enable

" }
