"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set incsearch
set hlsearch
" set autowrite
set nobackup
set wildmenu
set ignorecase
set smartcase
set nocompatible
set wildmode=full
set clipboard=unnamed
syntax on
filetype plugin on
runtime macros/matchit.vim
colorscheme slate

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
call plug#end()

set rtp+=/usr/local/opt/fzf
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
let mapleader = "\<Space>" 

" Leave insert mode
inoremap jj <esc>

" Mute search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <C-up> <C-w>+
noremap <C-down> <C-w>-
noremap <C-left> <C-w>>
noremap <C-right> <C-w><

" Fix Kitty background color
let &t_ut=''

" macOS Mode Settings
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
