set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

" Hide ^M characters which occur at the end of a line
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" 'sudo' save:
cmap w!! %!sudo tee > /dev/null %

" Key Shortcuts
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" delete without saving to register
nnoremap d "_d
vnoremap d "_d

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

map <D-1> :NERDTreeToggle<CR>
map <D-3> :GundoToggle<CR>
"todo on position cmd+4 show todo's marked in documents
" PHP parser check (CMD-5)
autocmd FileType php noremap <D-5> :!/usr/bin/php -l %<CR>
autocmd FileType xsd,xml noremap <D-5> :!/usr/bin/xmllint %<CR>
map <D-7> <ESC>:Tlist<CR>

" go to matching bracket
nmap <D-P> %
vmap <D-P> %

" Search
" Make case-insensitive search the norm
set ignorecase
set smartcase
set hlsearch
" toggle the search highlighting (netbeans style: cmd+shift+h)
map <D-H> :set hls!<bar> set hls?<CR> 

" vimcasts #24
" Auto-reload vimrc on save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
" Load vimrc in virtical split window with cmd+shift+comma
map <D-lt> :vsplit $MYVIMRC<CR>

" vimcast #1
" Show invisibles
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

" The escape key is a long ways away. This maps it to the sequence jj
:map! jj <esc>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :

" TextMate’s “save on losing focus” feature.
" au FocusLost * :wa

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
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4

" Visaul behaviour
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
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" escaping whitespace on save.
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=less

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Commands
command! -nargs=* Wrap set wrap linebreak nolist

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"Autoload
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
