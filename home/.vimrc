filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

" set rubydll=/usr/local/opt/ruby/lib/libruby.2.6.dylib
" set luadll=/usr/local/opt/lua/lib/liblua.5.3.5.dylib

set nocompatible
" Search
set hlsearch
set incsearch
" Basic options
set encoding=utf-8
set scrolloff=4
set showcmd
set hidden
set wildmenu
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu
set rnu
set nowrap
set tags=.tags,tags;


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
set tabstop=4

" Do not fix line ending on end of file
set nofixendofline

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


command! -nargs=* -bar Wrap call s:wrap_linebreak()
func! s:wrap_linebreak()
    set wrap
    set linebreak
    set nolist
    set showbreak=>\ \ 
endfunc
func! s:all_latex()
    color habiLight
    set list
    set scrolloff=5
    set scroll=5
    set nostartofline
    set cursorline
endfunc
" For using with latex or text
autocmd BufRead *.tex call s:all_latex()
autocmd BufRead *.tex call s:wrap_linebreak()
autocmd BufWritePre *.tex :%s/\s\+$//e

" 'sudo' save:
cmap w!! %!sudo tee > /dev/null %

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split defaults side of current pane
set splitbelow
set splitright

" delete without saving to register
nnoremap d "_d
vnoremap d "_d

nnoremap s "_s
vnoremap s "_s
" replace currently selected text with default register without yanking it
vnoremap p "_dP

nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
noremap <Leader>1 :NERDTreeMirror<CR>:NERDTreeFocus<CR>
noremap <Leader>3 :GundoToggle<CR>
noremap <leader>4 <Plug>TaskList
noremap <Leader>7 <ESC>:Tlist<CR>
" Hide ^M characters which occur at the end of a line
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <Leader>g <ESC>:GundoToggle<CR>
noremap <Leader>t :CtrlPCurFile<CR>
" Show invisibles
nmap <leader>l :set list!<CR>

" resize horizontal
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" resize vertical
nnoremap <silent> <Leader>+ :exe "vertical-resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "vertical-resize " . (winwidth(0) * 2/3)<CR>

autocmd FileType ruby,yaml set sw=2 et sts=2 sr ai ts=2
autocmd FileType make setlocal noexpandtab
autocmd FileType php noremap <Leader>5 :!/usr/bin/php -l %<CR>
autocmd FileType xsd,xml noremap <Leader>5 :!/usr/bin/xmllint %<CR>
autocmd FileType py noremap <Leader>5 :!/usr/local/bin/pep8 --show-source --show-pep8 %<CR>
autocmd FileType go setlocal ai ts=2 sw=2 noexpandtab
" Go vim-go mappings (https://github.com/fatih/vim-go)
autocmd FileType go nmap <leader>5 <Plug>(go-build)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)

"if exists("+autochdir") 
"    set autochdir
"endif
" can be uncommented when the CTAGS can be used from one location

autocmd FileType make set noexpandtab

"autocmd BufWritePre * :%s/\s\+$//e  "escaping whitespace on save.
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.ngx set filetype=nginx
" vimcasts #24 - Auto-reload vimrc on save
autocmd bufwritepost .vimrc source $MYVIMRC

" remove delay for sql files when leaving insert mode with Ctrl+C
" https://stackoverflow.com/questions/24931088/disable-omnicomplete-or-ftplugin-or-something-in-vim
let g:omni_sql_no_default_maps = 1


" ################ PATHOGEN PLUGIN LOADER #################################

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
 

" ################ START CONFIGURING PLUGINS #################################

" AutoSave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option


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
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_root_markers = ['.git', 'pom.xml', 'venv', 'tox.ini', 'Gemfile', 'pyproject.toml']



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
let NERDTreeShowHidden=1
" let NERDTreeSortOrder=[]
" always keep quickfix at the bottom
augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


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


" Vim Smooth Scroll
" https://vimawesome.com/plugin/comfortable-motion-vim


" Ag/Ack find under cursor
" noremap <leader>a :Ag! -Q <C-r>=expand('<cword>')<CR><CR>
noremap <leader>a :Ack! -Q <C-r>=expand('<cword>')<CR><CR>
" using Ack.vim with the_silver_searcher (Ag)
if executable('ag')
 let g:ackprg = 'ag --vimgrep'
endif


" Go colors!!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_gocode_propose_source = 1
" Autom import missing Go paths
let g:go_fmt_command = "goimports"


" Dash mapping
:nmap <silent> <leader>d <Plug>DashSearch


" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1


" Tagalong
let g:tagalong_additional_filetypes = ['erb']

" Fugative support for Gitlab
" let g:fugitive_gitlab_domains = ['https://some-other-domain']
