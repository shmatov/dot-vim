set nocompatible
set history=100
set ruler
set showcmd
set nohlsearch
set incsearch
set laststatus=2
set lazyredraw

"set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000
set noswapfile

set number
set numberwidth=5

set cursorline
set scrolloff=5
set t_Co=256
set guifont=Consolas:h14

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

set visualbell

set clipboard=unnamed

set listchars=tab:▸·,eol:¬

if has("gui_running")
  set lines=40 columns=90
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
autocmd Filetype html setlocal tabstop=4 shiftwidth=4

function! TrimWhitespace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre *.py :call TrimWhitespace()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

"                                                                     <Plugins>
"==============================================================================
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"                                                               <Plugins|Ruby/>
"------------------------------------------------------------------------------
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-endwise'

"                                                             <Plugins|Python/>
"------------------------------------------------------------------------------
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'hynek/vim-python-pep8-indent'

"                                                         <Plugins|JavaScript/>
"------------------------------------------------------------------------------
"Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'jQuery'

"                                                                <Plugins|Web/>
"------------------------------------------------------------------------------
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-haml'

"                                                       <Plugins|Colorschemes/>
"------------------------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'

"                                                              <Plugins|Tools/>
"------------------------------------------------------------------------------
Plugin 'sjl/gundo.vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
      \ 'dir':  'build\|node_modules\|DS_Store\|git',
      \ 'file': '\.pyc$'
      \ }

Plugin 'rking/ag.vim'

Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_min_num_identifier_candidate_chars = 100
"Plugin 'davidhalter/jedi-vim'
"let g:jedi#completions_enabled = 1
"let g:jedi#show_call_signatures = 0
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#use_tabs_not_buffers = 0
autocmd FileType python setlocal completeopt-=preview


Plugin 'scrooloose/nerdcommenter'
let g:NERDCustomDelimiters = {
      \ 'python': { 'left': '# ', 'leftAlt': '', 'rightAlt': '' },
      \ }
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeWinSize = 25
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>

Plugin 'bling/vim-airline'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

Plugin 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy='T'
let g:buffergator_autoexpand_on_split=0
nmap <silent> <F3> :BuffergatorToggle<CR>
imap <silent> <F3> <ESC>:BuffergatorToggle<CR>
vmap <silent> <F3> <ESC>:BuffergatorToggle<CR>
Plugin 'Lokaltog/vim-easymotion'

Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'

call vundle#end()
filetype plugin indent on
"                                                                    </Plugins>
"==============================================================================

set noshowmode

set background=light
colorscheme solarized

" Leader
let mapleader = " "

" open configuration file
nnoremap <leader>ec :edit $HOME/.vim/vimrc<CR>
" Reload configuration file
nnoremap <leader>rc :source $HOME/.vim/vimrc<CR>

nnoremap <leader>s :set hls!<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap k gk
nnoremap j gj

set colorcolumn=80
