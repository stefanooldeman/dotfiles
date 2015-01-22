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
set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
" display "real world tabs" set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=2 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
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

" resize horizontal
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" resize vertical
nnoremap <silent> <Leader>+ :exe "vertical-resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "vertical-resize " . (winwidth(0) * 2/3)<CR>

autocmd FileType make setlocal noexpandtab
autocmd FileType php noremap <Leader>5 :!/usr/bin/php -l %<CR>
autocmd FileType xsd,xml noremap <Leader>5 :!/usr/bin/xmllint %<CR>
autocmd FileType py noremap <Leader>5 :!/usr/local/bin/pep8 --show-source --show-pep8 %<CR>

"if exists("+autochdir") 
"    set autochdir
"endif
" can be uncommented when the CTAGS can be used from one location

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

" CtrlPBuffer
let g:ctrlp_cmd = 'CtrlPBuffer'

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

" Tlist configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 0
let Tlist_Auto_Update = 0
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 0
let Tlist_File_Fold_Auto_Close = 0
let tlist_css_settings = 'css;e:SECTIONS'

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
