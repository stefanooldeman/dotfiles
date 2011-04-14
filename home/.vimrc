set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

" Key Shortcuts
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

map <D-1> :NERDTreeToggle<CR>
map <D-H> :set hls!<bar> set hls?<CR>

" cmd+shift+,
map <D-lt> :vsplit $MYVIMRC<CR>
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

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
set backupdir=~/.vim/tmp/bkp// " backups
set directory=~/.vim/tmp/swp//   " swap files set backup

" Tabs/spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Visaul behaviour
syntax on
colorscheme ir_black
set gfn=Bitsteam\ Vera\ Sans\ Mono\ 12  " Use the Bitstream font:
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

"Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0

" Search
set hlsearch

" escaping whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Commands
command! -nargs=* Wrap set wrap linebreak nolist

"Autoload
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
