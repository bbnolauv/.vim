" vim:fileencoding=utf-8:foldmethod=marker

" Options {{{
let mapleader = " "
"set nowrap
set clipboard=unnamed
set guifont=Consolas:h12
set hlsearch
set ignorecase
set number
set scrolloff=4
set smartcase
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()
" }}}

" Keymaps {{{

" File search
noremap <LEADER>u :Files<CR>
noremap <LEADER>o :History<CR>
noremap <LEADER>k :Rg<CR>

" Quickfix navigation
noremap [q :cprevious<CR>
noremap ]q :cnext<CR>
" }}}

" Useful tricks {{{

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" For cursor style in windows terminal
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" }}}
