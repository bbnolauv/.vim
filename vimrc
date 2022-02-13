"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
"         

" === first time uses Todos
" === .... 


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader = " "
syntax on
set showcmd
set wrap
set wildmenu
set number
set relativenumber
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

"=======================
"==== color setting=====
"=======================
set t_Co=256



set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=n
set encoding=utf-8

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2


noremap j h
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap h i
noremap H I
noremap n nzz
noremap N Nzz

map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"split

map sj :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

"分屏移动

map <LEADER>j <C-w>h
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j

"map <up> k
"map <down> j
"map <left> h
"map <right> l
"分屏大小调整
map <C-k> :res -5<CR>
map <C-i> :res +5<CR>
map <C-l> :vertical resize-5<CR>
map <C-j> :vertical resize+5<CR>
"标签页移动
noremap tu :tabnew<CR>
map tj :tabp<CR>
map tl :tabn<CR>
"swich vertical-horizontal
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


set laststatus=2
"光标自动定位到上一次操作的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline-themes'

"Plug 'connorholyday/vim-snazzy'

Plug 'morhetz/gruvbox'

"Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

call plug#end()

"====
"====fileSearch
"====
nnoremap <c-f> :Leaderf file<CR>

"let g:airline_theme='dark'
"colorscheme default
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'lighter'
"default, palenight, ocean, lighter, and darker.
colorscheme gruvbox
set background=dark

"=====
"===  coc.nvim
"=====
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-vimlsp']

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Use <c-space> to trigger completion. !!!! DONT WORK !!!!
inoremap <silent><expr> <NUL> coc#refresh()
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-0> coc#refresh()
"endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

