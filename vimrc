set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler
set showcmd
set incsearch
set laststatus=2

set number
set numberwidth=5

set cursorline
set scrolloff=5
set t_Co=256
set guifont=Consolas\ 13

set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b

set clipboard=unnamedplus

set list listchars=tab:»·,trail:·

if has("gui_running")
  set lines=40 columns=90
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype off

" Declare bundles are handled via Vundler
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>

set background=light
colorscheme solarized

filetype plugin indent on

" Leader
let mapleader = " "

" open configuration file
nnoremap <leader>ec :edit $HOME/.vim/vimrc<CR>
" Reload configuration file
nnoremap <leader>rc :source $HOME/.vim/vimrc<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
