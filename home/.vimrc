set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

let mapleader = ","

" Hide ^M characters which occur at the end of a line
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Show invisibles
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`
" Load vimrc in virtical split window with cmd+shift+comma
map <leader>, :vsplit $MYVIMRC<CR>
" No autoindent for the current file
map <leader>8 :setl noai nocin nosi inde=<CR>

" 'sudo' save:
cmap w!! %!sudo tee > /dev/null %

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map alt+ hjkl to arrow keys, to move in insert mode
if has('gui_running')
    :set invmmta
endif

" moving in insert mode with alt- as prefix (somewhat stupid)
" imap <M-h> <Left>
" imap <M-j> <Down>
" imap <M-k> <Up>
" imap <M-l> <Right>
" " jump words in insert mode
" imap <M-w> <C-Right>
" imap <M-b> <C-Left>

" delete without saving to register
nnoremap d "_d
vnoremap d "_d

nnoremap s "_s
vnoremap s "_s

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

" start at the current search hit (prevent jumping to end of file)
noremap * *N
" don't go to the line-ending char
vnoremap $ $h

noremap <Leader>0 :set nonumber!<CR>:set foldcolumn=0<CR>
noremap <Leader>1 :NERDTreeToggle<CR>
noremap <Leader>3 :GundoToggle<CR>
map <leader>4 <Plug>TaskList
" PHP parser check (CMD-5)
autocmd FileType php noremap <Leader>5 :!/usr/bin/php -l %<CR>
autocmd FileType xsd,xml noremap <Leader>5 :!/usr/bin/xmllint %<CR>
autocmd FileType py noremap <Leader>5 :!/usr/local/bin/pep8 --show-source --show-pep8 %<CR>
noremap <Leader>7 <ESC>:Tlist<CR>

" Search
" Make case-insensitive search the norm
set ignorecase
set smartcase
set hlsearch
set incsearch
" toggle the search highlighting (netbeans style: cmd+shift+h)
map <Leader>h :set hls!<bar> set hls?<CR>

" vimcasts #24
" Auto-reload vimrc on save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Basic options
set encoding=utf-8
set scrolloff=3
set showcmd
set hidden
set wildmenu
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set nowrap

" Backups
set noswapfile
set nobackup
" set backupdir=~/.vim/tmp/bkp// " backups
" set directory=~/.vim/tmp/swp//   " swap files set backup

" Tabs/spaces
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
autocmd FileType make set noexpandtab
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
 
" Visual behaviour
syntax on
colorscheme jellybeans
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Spell checking
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

" JSlint plugin configuration
let JSLintHighlightErrorLine=0

command! -n=0 -bar ToggleJSLint call s:toggle_js_lint()
func! s:toggle_js_lint()
    " toglle the visuals
    if g:JSLintHighlightErrorLine == 1
        let g:JSLintHighlightErrorLine = 0
    else
        let g:JSLintHighlightErrorLine = 1
    endif
endfunc

if has('gui_running')
    autocmd FileType javascript,js noremap <Leader>5 :ToggleJSLint<CR>
endif

" Powerline
set t_Co=256
set laststatus=2
let g:Powerline_symbols='unicode' " 'fancy' will also work and makes better use of patched fonts
if has('gui_running')
    set transparency=1        " set transparent window
endif

" Set font according to system
if has("mac")
    set gfn=Menlo:h12
    set shell=/bin/bash
elseif has("win32")
      set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("unix")
      set gfn=Monospace\ 10
      set shell=/bin/bash
endif

" NERDtree configuration
let NERDTreeWinSize=30
let NERDTreeIgnore = ['\.pyc$']
" let NERDTreeSortOrder=[]

" Tlist configuration
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 0
let Tlist_Auto_Update = 0
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let tlist_css_settings = 'css;e:SECTIONS'

" php-doc plugin
inoremap <Leader>D <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>D :call PhpDocSingle()<CR>
vnoremap <Leader>D> :call PhpDocRange()<CR>

" escaping whitespace on save.
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.ngx set filetype=nginx

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Commands
command! -nargs=* Wrap set wrap linebreak nolist

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"Autoload
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" for some reason the jslint plugin is not compatible within the terminal
if !has('gui_running')
    call add(g:pathogen_disabled, 'jslint')
endif
call pathogen#infect()
call pathogen#helptags()
