" ------------------------------------------------------------
" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" ------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" ------------------------------------------------------------
" Plugins
" ------------------------------------------------------------

" General
Bundle 'Indent-Guides' 
"<leader>ig
let g:indent_guides_guide_size = 1
"sudo apt-get install ack-grep
"ln -s /usr/bin/ack-grep /usr/bin/ack
Bundle 'ack.vim'
Bundle 'scrooloose/nerdtree'
nmap <silent> <F2> :NERDTreeToggle<CR>
imap <silent> <F2> <ESC>:NERDTreeToggle<CR>
vmap <silent> <F2> <ESC>:NERDTreeToggle<CR>
Bundle 'scrooloose/nerdcommenter'
nmap <silent> <F3> <leader>c<space>
imap <silent> <F3> <ESC><leader>c<space>
vmap <silent> <F3> <leader>c<space>
Bundle 'bufexplorer.zip'
nmap <silent> <F4> :BufExplorer<CR>
imap <silent> <F4> <ESC>:BufExplorer<CR>
vmap <silent> <F4> <ESC>:BufExplorer<CR>
Bundle 'vim-scripts/Command-T'
Bundle 'tpope/vim-endwise'
Bundle 'majutsushi/tagbar'
nmap <F5> :TagbarToggle<CR>
Bundle 'file-line'
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
Bundle 'mattn/zencoding-vim'
"let g:user_zen_leader_key = '<c-y>'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" JavaScript
Bundle 'jQuery'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Javascript-syntax-with-Ajax-Support'

" Other languages
Bundle 'gmarik/vim-markdown'
Bundle 'mutewinter/nginx.vim'
Bundle 'tpope/vim-haml'
Bundle 'othree/html5.vim'
Bundle 'Better-CSS-Syntax-for-Vim'

" Snippets
Bundle 'gmarik/snipmate.vim'
Bundle 'honza/snipmate-snippets'

" UI
Bundle 'molokai'
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
set background=light
colorscheme solarized
"Toggle solarized colorscheme
call togglebg#map("<F8>")
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
set ttimeoutlen=10






filetype plugin indent on  






" general
"""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest
"Кодировка файлов по умолчанию
set encoding=utf-8 
"Возможные кодировки файлов
set fileencodings=utf8,cp1251,KOI8-R 
"Новое окно появляется снизу
set splitbelow
"Включить поддержку мыши
set mouse=a 
"Спрятать курсор мыши когда набираем текст
set mousehide
"Отступ от строки с курсором n строк
set scrolloff=8
"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
"убираем заставку при старте
set shortmess+=tToOI
"не разрывать строку
set wrap
"разрываем строку только между словами
set linebreak
"показывать первое совпадение при наборе шаблона
setlocal incsearch
"подсветка найденного
setlocal hlsearch
" Always show status line
set laststatus=2


" UI
"""""""""""""""""""""""""""""""""""""""""""""""""""
"Размер окна: 90x39
set lines=39 
set columns=90
"Включаем нумерацию строк
set number 
"Включаем 256 цветов в терминале
set t_Co=256 
"Устанавливаем шрифт
"set guifont=Consolas\ 13 
"set guifont=Anonymous\ Pro\ 12
set guifont=Monaco\ for\ Powerline\ 12
"Включить подсветку синтаксиса
syntax on 
" Подсвечивать синтаксис в соответсвии с стандартом C99
let c_C99 = 1
"Подсвечиваем все что можно
let python_highlight_all = 1 
"Кодировка терминала
set termencoding=utf-8
"Не мигать 
set novisualbell 
"Не пищать
set t_vb= 
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,] 
"Вырубаем строку табов
"set showtabline=0 
"Подсветка строки с курсором
set cursorline
"Отключение тулбара
set guioptions-=T
"Отключаем меню
set guioptions-=m
"Отключение gui строки табов
set guioptions-=e
"Отключение полос прокрутки
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set noshowmode


" mapings
"""""""""""""""""""""""""""""""""""""""""""""""""""

"CTRL-F для omni completion
imap <nul> <C-X><C-O>
"Использовать пробел для открытия\закрытия фолдов
nnoremap <space> za
vnoremap <space> zf
"Закрыть окно подсказок Omni Complete
inoremap <F5> <Esc>:pclose!<CR>a
"Копи\паст ctrl+c\v
"sudo apt-get install xclip
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <ESC>:call setreg("\"",system("xclip -o -selection clipboard"))<CR>pa
"Навигация по сплитам Alt-left/right/up/down
nmap <M-right> <C-w><right>
nmap <M-left> <C-w><left>
nmap <M-down> <C-w><down>
nmap <M-up> <C-w><up>
"Команды при русской раскладке
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>







" folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Колоночка, чтобы показывать плюсики для скрытия блоков кода
set foldcolumn=1 
"По умолчанию все фолды закрыты
set foldlevel=0


" indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
"Размер табуляции по умолчанию
set shiftwidth=2 
"Включить умные отступы
set smartindent 
"Ставим табы пробелами
set expandtab 
set smarttab
"4 пробела в табе
"set softtabstop=2 
"Наследовать отступы предидущей строки
"set autoindent 



"Удаление пробелов в конце файлов
"autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
"В .py файлах включаем умные отступы после ключевых слов
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class






" omnicompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" автозакрытие сплита omnicompletion
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" размер меню автодополнения
set pumheight=7
" режимы автодополнения
set completeopt=longest,menu,preview





" leader
"""""""""""""""""""""""""""""""""""""""""""""""""""
" открыть vimrc по \ev
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ev :e $HOME/.vim/vimrc<CR>
" включение\отключение элементов gui
nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <leader>r :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>






" AutoCommands " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" " }}}







