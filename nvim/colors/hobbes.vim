" Vim color file
" Maintainer: Vish Vishvanath
" Last Change: 26 Feb 2017

" The colours are mostly taken from the great peachpuff scheme, with extra
" boldness added so that it looks just right with Essential PragmataPro regular
" and bold at 12pt aliased.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="hobbes"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
    return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
        endif
    endif
endfun

hi Normal guibg=black guifg=white

hi Cursor guifg=bg guibg=fg
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#3d3f49 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3d3f49 gui=NONE
hi DiffAdd term=bold ctermbg=4 guibg=White
hi DiffChange term=bold ctermbg=5 guibg=#edb5cd
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=LightBlue guibg=#f6e8d0
hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#ff8060
hi Directory term=bold ctermfg=4 guifg=Blue
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=DarkBlue guibg=Gray80
hi Folded term=standout ctermfg=4 ctermbg=7 guifg=Black guibg=#e3c1a5
hi IncSearch term=reverse cterm=reverse gui=reverse
hi LineNr term=underline ctermfg=3 guifg=Red3
hi ModeMsg term=bold cterm=bold gui=bold
hi MoreMsg term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
hi Question term=standout ctermfg=2 gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=3 guibg=Gold2
hi SpecialKey term=bold ctermfg=4 guifg=Blue
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold guifg=White guibg=Black
hi StatusLineNC term=reverse cterm=reverse gui=bold guifg=PeachPuff guibg=Gray45
hi Title term=bold ctermfg=5 gui=bold guifg=DeepPink3
hi VertSplit term=reverse cterm=reverse gui=bold guifg=White guibg=Gray45
hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey80 guibg=fg
hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg term=standout ctermfg=1 gui=bold guifg=Red
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
hi lCursor guifg=bg guibg=fg

" Colors for syntax highlighting
hi Comment term=bold cterm=bold ctermfg=240 guifg=#555555
hi Constant term=underline cterm=bold ctermfg=1 guifg=#c00058
hi Special term=bold ctermfg=5 guifg=SlateBlue
hi Identifier term=underline ctermfg=74 guifg=DarkCyan
hi Statement term=bold cterm=bold ctermfg=3 gui=bold guifg=Brown
hi PreProc term=underline ctermfg=5 guifg=Magenta3
hi Type term=underline cterm=bold ctermfg=2 gui=bold guifg=SeaGreen
hi Ignore cterm=bold cterm=bold ctermfg=7 guifg=bg
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
hi Todo term=standout ctermfg=0 ctermbg=3 guifg=Blue guibg=Yellow


hi Function ctermfg=4 ctermbg=0 cterm=bold guifg=Blue guibg=Yellow
hi String ctermfg=196 ctermbg=0 guifg=Blue guibg=Yellow


hi Include term=underline ctermfg=5 guifg=Magenta3
hi Define term=underline ctermfg=5 guifg=Magenta3
hi Macro term=underline ctermfg=60 guifg=Magenta3
hi PreCondit term=underline ctermfg=91 guifg=Magenta3

hi Character term=underline cterm=bold ctermfg=100 guifg=#c00058
hi Number term=underline cterm=bold ctermfg=120 guifg=#c00058
hi Boolean term=underline ctermfg=128 guifg=#c00058
hi Float term=underline cterm=bold ctermfg=198 guifg=#c00058

hi Conditional term=bold cterm=bold ctermfg=3 gui=bold guifg=Brown
hi Repeat term=bold cterm=bold ctermfg=150 gui=bold guifg=Brown
hi Label term=bold cterm=bold ctermfg=160 gui=bold guifg=Brown
hi Operator term=bold cterm=bold ctermfg=7 gui=bold guifg=Brown
hi Keyword term=bold cterm=bold ctermfg=180 gui=bold guifg=Brown
hi Exception term=bold cterm=bold ctermfg=190 gui=bold guifg=Brown


hi link IncSearch		Visual
"hi link String			Constant
"hi link Character		Constant
"hi link Number			Constant
"hi link Boolean			Constant
"hi link Float			Number
"hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
"hi link Include			PreProc
"hi link Define			PreProc
"hi link Macro			PreProc
"hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

if v:version >= 700
  exec "hi Pmenu          cterm=NONE   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)
  exec "hi PmenuSel       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)
  exec "hi PmenuSbar      cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)
  exec "hi PmenuThumb     cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)

  exec "hi SpellBad       cterm=NONE ctermbg=" . <SID>X(32)
  exec "hi SpellRare      cterm=NONE ctermbg=" . <SID>X(33)
  exec "hi SpellLocal     cterm=NONE ctermbg=" . <SID>X(36)
  exec "hi SpellCap       cterm=NONE ctermbg=" . <SID>X(21)
  exec "hi MatchParen     cterm=NONE ctermbg=" . <SID>X(14) . "ctermfg=" . <SID>X(25)
endif
if v:version >= 703
  exec "hi Conceal      cterm=NONE      ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
  exec "hi ColorColumn  cterm=NONE      ctermbg=" . <SID>X(81)
endif
