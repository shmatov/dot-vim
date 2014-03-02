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
set guifont=Menlo\ for\ Powerline:h16

set fileencodings=utf-8,cp1251

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


set clipboard=unnamed

set listchars=tab:▸·,eol:¬

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

"                                                                      <Bundles>
"===============================================================================
filetype off

" Declare bundles are handled via Vundler
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"                                                                <Bundles|Ruby/>
"-------------------------------------------------------------------------------
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-endwise'
Bundle 'sunaku/vim-ruby-minitest'

"                                                              <Bundles|Python/>
"-------------------------------------------------------------------------------
Bundle 'davidhalter/jedi-vim'
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview

"                                                          <Bundles|JavaScript/>
"-------------------------------------------------------------------------------
Bundle 'pangloss/vim-javascript'
Bundle 'jQuery'

"                                                                 <Bundles|Web/>
"-------------------------------------------------------------------------------
Bundle 'othree/html5.vim'
Bundle 'slim-template/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'mattn/emmet-vim'

"                                                        <Bundles|Colorschemes/>
"-------------------------------------------------------------------------------
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'

"                                                               <Bundles|Tools/>
"-------------------------------------------------------------------------------
Bundle 'sjl/gundo.vim'
Bundle 'Raimondi/delimitMate'
"Bundle 'maxbrunsfeld/vim-yankstack'
"Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
let NERDTreeWinSize = 25
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
let g:Powerline_symbols='fancy'
Bundle 'fholgado/minibufexpl.vim'
nmap <silent> <F3> :MBEToggle<CR>
imap <silent> <F3> <ESC>:MBEToggle<CR>
vmap <silent> <F3> <ESC>:MBEToggle<CR>
"Bundle 'troydm/easybuffer.vim'
"nmap <silent> <F3> :EasyBuffer<CR>
"imap <silent> <F3> <ESC>:EasyBuffer<CR>
"vmap <silent> <F3> <ESC>:EasyBuffer<CR>
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

filetype plugin indent on
"                                                                     </Bundles>
"===============================================================================

set noshowmode

set background=dark
colorscheme base16-tomorrow

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
