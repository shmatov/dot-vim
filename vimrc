set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler
set showcmd
set incsearch
set laststatus=2

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

filetype plugin indent on 

" Leader
let mapleader = " "
 
" open configuration file
nnoremap <leader>ve :edit $HOME/.vim/vimrc<CR> 
" Reload configuration file
nnoremap <leader>vr :source $HOME/.vim/vimrc<CR>
