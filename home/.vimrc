filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

set nocompatible
" Search
set hlsearch
set incsearch
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
" set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
" display "real world tabs" set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" Visual behaviour
syntax on
colorscheme jellybeans
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

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

" Spell checking
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

" 'sudo' save:
cmap w!! %!sudo tee > /dev/null %

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" delete without saving to register
nnoremap d "_d
vnoremap d "_d

nnoremap s "_s
vnoremap s "_s
" replace currently selected text with default register without yanking it
vnoremap p "_dP

noremap <Leader>1 :NERDTreeToggle<CR>
noremap <Leader>3 :GundoToggle<CR>
noremap <leader>4 <Plug>TaskList
noremap <Leader>7 <ESC>:Tlist<CR>
" Hide ^M characters which occur at the end of a line
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Show invisibles
nmap <leader>l :set list!<CR>

" PHP parser check (CMD-5)
autocmd FileType php noremap <Leader>5 :!/usr/bin/php -l %<CR>
autocmd FileType xsd,xml noremap <Leader>5 :!/usr/bin/xmllint %<CR>
autocmd FileType py noremap <Leader>5 :!/usr/local/bin/pep8 --show-source --show-pep8 %<CR>

if exists("+autochdir") 
    set autochdir
endif

if has('gui_running')
    autocmd FileType javascript,js noremap <Leader>5 :ToggleJSLint<CR>
endif

autocmd FileType make set noexpandtab

"autocmd BufWritePre * :%s/\s\+$//e  "escaping whitespace on save.
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.ngx set filetype=nginx
" vimcasts #24 - Auto-reload vimrc on save
autocmd bufwritepost .vimrc source $MYVIMRC
 
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

" Powerline
set t_Co=256
set laststatus=2
let g:Powerline_symbols='unicode' " 'fancy' will also work and makes better use of patched fonts
if has('gui_running')
    set transparency=1        " set transparent window
endif

" NERDtree configuration
let NERDTreeWinSize=30
let NERDTreeIgnore = ['\.pyc$']
" let NERDTreeSortOrder=[]

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"Autoload
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" for some reason the jslint plugin is not compatible within the terminal
if !has('gui_running')
    call add(g:pathogen_disabled, 'ultisnip')
    call add(g:pathogen_disabled, 'jslint')
endif

call add(g:pathogen_disabled, 'minibuffexplorer')
call pathogen#infect()
call pathogen#helptags()
