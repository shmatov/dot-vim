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
set nowrap

"set number
"set numberwidth=5

set cursorline
set scrolloff=5
set t_Co=256
"set guifont=Hack:h14
set guifont=Consolas:h14
"set guifont=Menlo:h14
"set guifont=mononoki:h14

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

autocmd Filetype cpp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
autocmd Filetype html setlocal tabstop=4 shiftwidth=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab

function! TrimWhitespace()
    %s/\s\+$//e
endfunction

function! GoImports()
  let l:winview = winsaveview()
  %!goimports
  call winrestview(l:winview)
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

call plug#begin('~/.vim/plugged')

"                                                             <Plugins|Python/>
"------------------------------------------------------------------------------
" Plug 'jmcantrell/vim-virtualenv'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/python_match.vim'

"                                                         <Plugins|JavaScript/>
"------------------------------------------------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

"                                                       <Plugins|Colorschemes/>
"------------------------------------------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

"                                                              <Plugins|Tools/>
"------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
autocmd FileType rust let b:delimitMate_quotes = "\""

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
      \ 'dir':  'build\|node_modules\|DS_Store\|git\|target',
      \ 'file': '\.pyc$'
      \ }
let g:ctrlp_buftag_types = {'go' : '--language-force=go'}
let g:ctrlp_match_window = 'max:15'

"nnoremap <C-j> :CtrlPBufTagAll<cr>
nnoremap <C-j> :CtrlPBufTag<cr>

Plug 'rking/ag.vim'
Plug 'mhinz/vim-grepper'

Plug 'Valloric/YouCompleteMe', {
      \ 'do': 'python3 install.py --gocode-completer --js-completer'
      \ }
let g:ycm_auto_trigger = 0
"let g:ycm_python_binary_path = '/usr/local/bin/python2'
let g:ycm_python_binary_path = 'python'
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_log_level = 'debug'

Plug 'fatih/vim-go'
"let $GOPATH='/Users/shmatov/Code/go'
"let g:go_bin_path = expand("~/.gotools")
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_fmt_autosave = 0
"
let g:go_fmt_command = "goimports"

" function! GoToDecl()
"    if &ft == 'go'
"        call go#def#Jump()
"    else
"        execute 'YcmCompleter GoToDeclaration'
"    endif
" endfunction
" nnoremap <leader>d :call GoToDecl()<CR>

"Plug 'davidhalter/jedi-vim'
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

Plug 'w0rp/ale'
let g:ale_linters = { 
      \ 'python': ['flake8'], 
      \ 'javascript': ['eslint'] 
      \ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 0
let g:ale_max_signs = 0
let g:ale_lint_delay = 100

"let g:ale_python_flake8_executable = 'python'   " or 'python' for Python 2
"let g:ale_python_flake8_args = '-m flake8'
"let g:ale_open_list = 1

"Plug 'neomake/neomake'
"let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_javascript_enabled_makers = ['eslint']

"let g:neomake_error_sign = {'text': 'E', 'texthl': 'NeomakeErrorSign'}
"let g:neomake_warning_sign = {'text': 'W', 'texthl': 'NeomakeWarningSign'}
"let g:neomake_message_sign = {'text': 'M', 'texthl': 'NeomakeMessageSign'}
"let g:neomake_info_sign = {'text': 'I', 'texthl': 'NeomakeInfoSign'}
let g:neomake_place_signs = 0
let g:neomake_remove_invalid_entries = 1
let g:neomake_open_list = 2

Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'

Plug 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeWinSize = 35
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy='T'
let g:buffergator_autoexpand_on_split=0
let g:buffergator_sort_regime="mru"
nmap <silent> <F3> :BuffergatorToggle<CR>
imap <silent> <F3> <ESC>:BuffergatorToggle<CR>
vmap <silent> <F3> <ESC>:BuffergatorToggle<CR>
Plug 'Lokaltog/vim-easymotion'

Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tomlion/vim-solidity'


call plug#end()
"                                                                    </Plugins>
"==============================================================================

set noshowmode

set background=light
silent! colorscheme solarized

" Leader
let mapleader = " "

nnoremap <leader>ce :edit $HOME/.vim/vimrc<CR>
nnoremap <leader>cr :source $HOME/.vim/vimrc<CR>

"nnoremap <leader>m :Neomake<CR>
"nnoremap <leader>gi :call GoImports()<CR>

"nnoremap <leader>s :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>f :ALEFix<CR>

nnoremap <leader>h :set hls!<CR>
nnoremap <leader>gp :let @+ = expand("%@")<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap k gk
nnoremap j gj

set colorcolumn=80
