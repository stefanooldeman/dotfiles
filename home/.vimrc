set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

" Key Shortcuts

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


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
set expandtab

" Visaul behaviour
syntax on
colorscheme blackboard
set gfn=Bitsteam\ Vera\ Sans\ Mono\ 12  " Use the Bitstream font:

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
