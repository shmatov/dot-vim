set nocompatible
set history=100
set ruler
set showcmd
set nohlsearch
set incsearch
set laststatus=2
"set lazyredraw

"set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000
set noswapfile

"set number
"set numberwidth=5

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

set wildmenu

autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
autocmd Filetype html setlocal tabstop=4 shiftwidth=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab

function! TrimWhitespace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre *.py :call TrimWhitespace()
autocmd BufWritePre *.rs :call TrimWhitespace()
autocmd BufWritePre *.js :call TrimWhitespace()
autocmd BufWritePre *.cpp :call TrimWhitespace()

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.rpy set filetype=python

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

"                                                                     <Plugins>
"==============================================================================
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"                                                               <Plugins|Ruby/>
"------------------------------------------------------------------------------
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-endwise'

"                                                             <Plugins|Python/>
"------------------------------------------------------------------------------
" Plugin 'jmcantrell/vim-virtualenv'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'python_match.vim'

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
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
autocmd FileType rust let b:delimitMate_quotes = "\""
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
      \ 'dir':  'build\|node_modules\|DS_Store\|git\|target',
      \ 'file': '\.pyc$'
      \ }

Plugin 'rking/ag.vim'

Plugin 'Valloric/YouCompleteMe' 
" , { 'do': './install.py'}
let g:ycm_min_num_identifier_candidate_chars = 100
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>

"let $GOPATH='/Users/shmatov/Code/go'
"let g:go_bin_path = expand("~/.gotools")
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_fmt_autosave = 0
"Plugin 'fatih/vim-go'

" function! GoToDecl()
"    if &ft == 'go'
"        call go#def#Jump()
"    else
"        execute 'YcmCompleter GoToDeclaration'
"    endif
" endfunction
" nnoremap <leader>d :call GoToDecl()<CR>

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
autocmd FileType go setlocal completeopt-=preview

Plugin 'scrooloose/syntastic'
"let g:syntastic_error_symbol = "•""
"let g:syntastic_warning_symbol = "•""
"let g:syntastic_style_error_symbol = "•"
"let g:syntastic_style_warning_symbol = "•""
"highlight SyntasticStyleErrorSign guifg=white guibg=red
"highlight SyntasticStyleWarningSign guifg=white guibg=red
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": [],
      \ "passive_filetypes": [] }
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--ignore=E501"

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
"let g:NERDCustomDelimiters = {
"      \ 'python': { 'left': '# ', 'leftAlt': '', 'rightAlt': '' },
"      \ 'cpp': { 'left': '// ', 'leftAlt': '', 'rightAlt': '' },
"      \ }

Plugin 'godlygeek/tabular'

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeWinSize = 35
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

Plugin 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy='T'
let g:buffergator_autoexpand_on_split=0
let g:buffergator_sort_regime="mru"
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
silent! colorscheme solarized

" Leader
let mapleader = " "

" open configuration file
nnoremap <leader>ec :edit $HOME/.vim/vimrc<CR>
" Reload configuration file
nnoremap <leader>rc :source $HOME/.vim/vimrc<CR>

nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

nnoremap <leader>h :set hls!<CR>
nnoremap <leader>f :let @+ = expand("%@")<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap k gk
nnoremap j gj

set colorcolumn=80
