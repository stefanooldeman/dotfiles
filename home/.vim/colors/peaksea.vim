" Vim color file - peaksea
" Generated by http://bytefluent.com/vivify 2013-06-14
set background=light
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "peaksea"

hi IncSearch guifg=#f0f0f0 guibg=#806060 guisp=#806060 gui=NONE ctermfg=255 ctermbg=95 cterm=NONE
hi WildMenu guifg=#000000 guibg=#d0d090 guisp=#d0d090 gui=NONE ctermfg=NONE ctermbg=186 cterm=NONE
hi SignColumn guifg=#000000 guibg=#90e090 guisp=#90e090 gui=NONE ctermfg=NONE ctermbg=114 cterm=NONE
hi SpecialComment guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi Typedef guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Title guifg=#a030a0 guibg=NONE guisp=NONE gui=NONE ctermfg=133 ctermbg=NONE cterm=NONE
hi Folded guifg=NONE guibg=#b0e0b0 guisp=#b0e0b0 gui=NONE ctermfg=NONE ctermbg=151 cterm=NONE
hi PreCondit guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi Include guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#000000 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#002090 guibg=#d0d0d0 guisp=#d0d0d0 gui=NONE ctermfg=18 ctermbg=252 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=NONE guibg=#c0e080 guisp=#c0e080 gui=NONE ctermfg=NONE ctermbg=150 cterm=NONE
hi ErrorMsg guifg=#000000 guibg=#f0b090 guisp=#f0b090 gui=NONE ctermfg=NONE ctermbg=216 cterm=NONE
hi Ignore guifg=#e0e0e0 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi Debug guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=#000000 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
hi Identifier guifg=#a030a0 guibg=NONE guisp=NONE gui=NONE ctermfg=133 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#686868 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Conditional guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Todo guifg=#800000 guibg=#e0e090 guisp=#e0e090 gui=NONE ctermfg=3 ctermbg=186 cterm=NONE
hi Special guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi LineNr guifg=#686868 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#000000 guibg=#a6caf0 guisp=#a6caf0 gui=NONE ctermfg=NONE ctermbg=153 cterm=NONE
hi Normal guifg=#000000 guibg=#e0e0e0 guisp=#e0e0e0 gui=NONE ctermfg=NONE ctermbg=254 cterm=NONE
hi Label guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#f0f0f0 guibg=#806060 guisp=#806060 gui=NONE ctermfg=255 ctermbg=95 cterm=NONE
hi Search guifg=NONE guibg=#f8f8f8 guisp=#f8f8f8 gui=NONE ctermfg=NONE ctermbg=15 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi Statement guifg=#2060a8 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#606000 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
hi Character guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi Float guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi Number guifg=#907000 guibg=NONE guisp=NONE gui=NONE ctermfg=94 ctermbg=NONE cterm=NONE
hi Boolean guifg=#2060a8 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Operator guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
"hi Union -- no settings --
hi TabLineFill guifg=#000000 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
hi Question guifg=#000000 guibg=#d0d090 guisp=#d0d090 gui=NONE ctermfg=NONE ctermbg=186 cterm=NONE
hi WarningMsg guifg=#b02000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
hi VisualNOS guifg=#000000 guibg=#b0b0e0 guisp=#b0b0e0 gui=NONE ctermfg=NONE ctermbg=146 cterm=NONE
hi DiffDelete guifg=#002090 guibg=#d0d0d0 guisp=#d0d0d0 gui=NONE ctermfg=18 ctermbg=252 cterm=NONE
hi ModeMsg guifg=#000000 guibg=#b0b0e0 guisp=#b0b0e0 gui=NONE ctermfg=NONE ctermbg=146 cterm=NONE
hi CursorColumn guifg=NONE guibg=#f0b090 guisp=#f0b090 gui=NONE ctermfg=NONE ctermbg=216 cterm=NONE
hi Define guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi Function guifg=#a030a0 guibg=NONE guisp=NONE gui=NONE ctermfg=133 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#000000 guibg=#90e090 guisp=#90e090 gui=NONE ctermfg=NONE ctermbg=114 cterm=NONE
hi PreProc guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#a6caf0 guisp=#a6caf0 gui=NONE ctermfg=NONE ctermbg=153 cterm=NONE
hi MoreMsg guifg=#489000 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
"hi SpellCap -- no settings --
hi VertSplit guifg=#000000 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
hi Exception guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Keyword guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Type guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi DiffChange guifg=NONE guibg=#e0b0e0 guisp=#e0b0e0 gui=NONE ctermfg=NONE ctermbg=182 cterm=NONE
hi Cursor guifg=#f0f0f0 guibg=#008000 guisp=#008000 gui=NONE ctermfg=255 ctermbg=2 cterm=NONE
"hi SpellLocal -- no settings --
hi Error guifg=#c03000 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenu guifg=#000000 guibg=#e0b0e0 guisp=#e0b0e0 gui=NONE ctermfg=NONE ctermbg=182 cterm=NONE
hi SpecialKey guifg=#1050a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Constant guifg=#007068 guibg=NONE guisp=NONE gui=NONE ctermfg=6 ctermbg=NONE cterm=NONE
"hi DefinedName -- no settings --
hi Tag guifg=#a030a0 guibg=NONE guisp=NONE gui=NONE ctermfg=133 ctermbg=NONE cterm=NONE
hi String guifg=#007068 guibg=NONE guisp=NONE gui=NONE ctermfg=6 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=#000000 guibg=#c0e080 guisp=#c0e080 gui=NONE ctermfg=NONE ctermbg=150 cterm=NONE
hi MatchParen guifg=NONE guibg=#c0e080 guisp=#c0e080 gui=NONE ctermfg=NONE ctermbg=150 cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#a030a0 guibg=NONE guisp=NONE gui=NONE ctermfg=133 ctermbg=NONE cterm=NONE
hi Structure guifg=#0850a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Macro guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi Underlined guifg=#6a5acd guibg=NONE guisp=NONE gui=underline ctermfg=62 ctermbg=NONE cterm=underline
hi DiffAdd guifg=NONE guibg=#b0b0e0 guisp=#b0b0e0 gui=NONE ctermfg=NONE ctermbg=146 cterm=NONE
hi TabLine guifg=#000000 guibg=#c0c0c0 guisp=#c0c0c0 gui=NONE ctermfg=NONE ctermbg=7 cterm=NONE
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
"hi clear -- no settings --
hi constant guifg=#007068 guibg=NONE guisp=NONE gui=NONE ctermfg=6 ctermbg=NONE cterm=NONE
hi lcursor guifg=#e0e0e0 guibg=#000000 guisp=#000000 gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi preproc guifg=#009030 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi incsearch guifg=#f0f0f0 guibg=#806060 guisp=#806060 gui=NONE ctermfg=255 ctermbg=95 cterm=NONE
hi linenr guifg=#686868 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi moremsg guifg=#489000 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE