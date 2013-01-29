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
set guifont=Consolas\ for\ Powerline\ 12

" Disable toolbar
set guioptions-=T
" Disable left scrollbar
set guioptions-=l
set guioptions-=L
" Disable right scrollbar
set guioptions-=r
set guioptions-=R
" Disable bottom scrollbar
set guioptions-=b
" Disable welcome screen
set shortmess+=I


set clipboard=unnamedplus

set list listchars=tab:»·,trail:·

if has("gui_running")
  set lines=45 columns=130
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
Bundle 'tpope/vim-endwise'
Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>

Bundle "pangloss/vim-javascript"
Bundle "jQuery"
Bundle "troydm/easybuffer.vim"
nmap <silent> <F3> :EasyBuffer<CR>
imap <silent> <F3> <ESC>:EasyBuffer<CR>
vmap <silent> <F3> <ESC>:EasyBuffer<CR>

Bundle "scrooloose/nerdcommenter"
Bundle "kien/ctrlp.vim"
Bundle 'sjl/gundo.vim'
Bundle 'Raimondi/delimitMate'
"Bundle 'roman/golden-ratio'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

filetype plugin indent on

set noshowmode

set background=light
colorscheme solarized

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
