set nocompatible

filetype on                          " set filetype stuff to on
filetype plugin on
filetype indent on

" 'sudo' save:
cmap w!! %!sudo tee > /dev/null %

" Key Shortcuts
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

map <D-1> :NERDTreeToggle<CR>
map <D-3> :GundoToggle<CR>
"todo on position cmd+4 show todo's marked in documents
" PHP parser check (CMD-5)
autocmd FileType php noremap <D-5> :!/usr/bin/php -l %<CR>
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
au FocusLost * :wa

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

"Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
let Tlist_Display_Tag_Scope = 0

" svndiff plugin
if has("gui_running")
	let g:svndiff_autoupdate = 1
	let g:svndiff_one_sign_delete = 1
	noremap <D-8> :call Svndiff("prev")<CR>
	noremap <D-9> :call Svndiff("next")<CR>
	noremap <D-0> :call Svndiff("clear")<CR>
	hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
	hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
	hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'
end

" php-doc plugin
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" escaping whitespace on save.
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=less

" No more toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Commands
command! -nargs=* Wrap set wrap linebreak nolist

"Autoload
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
