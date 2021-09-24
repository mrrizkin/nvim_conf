" Name      : jomblo.vim
" Maintainer: Rizki Nugraha <nugrhrizki@tutanota.com>
" Homepage  : https://nugrhrizki.netlify.com/jomblo.vim

" Biasa... kehidupan para jomblokan putih abu :(
" BTW ini mendukung treesitter ya, biarpun jomblo tapi harus up to date B)

highlight clear
set background=dark
if version > 580
	if exists('syntax_on')
		syntax reset
	endif
endif
let g:colors_name = 'jomblo'

" Kalo mau ada teks miring diterminalnya. Pake terminal yang mendukung italic,
" Kalo gak ada atau gak bisa ya syukurin aja yang ada.
" Kalo gak mau ada italic walaupun terminalnya mendukung edit aja Bund Kodenya
if has("gui_running") || &t_Co == 256
    hi Normal       cterm=NONE         ctermfg=250  ctermbg=16   gui=NONE         guifg=#bcbcbc guibg=#000000
    hi Keyword      cterm=NONE         ctermfg=255  ctermbg=16   gui=NONE         guifg=#eeeeee guibg=#000000
    hi Constant     cterm=NONE         ctermfg=252  ctermbg=16   gui=NONE         guifg=#d0d0d0 guibg=#000000
    hi String       cterm=NONE         ctermfg=245  ctermbg=16   gui=NONE         guifg=#8a8a8a guibg=#000000
	if (has('unix') && system('tput sitm') ==# "\e[3m")
		hi Comment  cterm=italic       ctermfg=240  ctermbg=16   gui=italic       guifg=#585858 guibg=#000000
	else
		hi Comment  cterm=NONE         ctermfg=240  ctermbg=16   gui=NONE         guifg=#585858 guibg=#000000
	endif
    hi Number       cterm=NONE         ctermfg=196  ctermbg=16   gui=NONE         guifg=#ff0000 guibg=#000000
    hi Error        cterm=NONE         ctermfg=255  ctermbg=88   gui=NONE         guifg=#eeeeee guibg=#870000
    hi ErrorMsg     cterm=NONE         ctermfg=255  ctermbg=124  gui=NONE         guifg=#eeeeee guibg=#af0000
    hi Search       cterm=NONE         ctermfg=245  ctermbg=236  gui=NONE         guifg=#8a8a8a guibg=#303030
    hi IncSearch    cterm=reverse      ctermfg=255  ctermbg=245  gui=reverse      guifg=#eeeeee guibg=#8a8a8a
    hi DiffChange   cterm=NONE         ctermfg=160  ctermbg=255  gui=NONE         guifg=#d70000 guibg=#eeeeee
    hi DiffText     cterm=bold         ctermfg=250  ctermbg=196  gui=bold         guifg=#bcbcbc guibg=#ff0000
    " hi SignColumn   cterm=NONE         ctermfg=124  ctermbg=240  gui=NONE         guifg=#af0000 guibg=#585858
    hi SpellBad     cterm=undercurl    ctermfg=255  ctermbg=88   gui=undercurl    guifg=#eeeeee guibg=#870000
    hi SpellCap     cterm=NONE         ctermfg=255  ctermbg=124  gui=NONE         guifg=#eeeeee guibg=#af0000
    hi SpellRare    cterm=NONE         ctermfg=124  ctermbg=16   gui=NONE         guifg=#af0000 guibg=#000000
    hi WildMenu     cterm=NONE         ctermfg=240  ctermbg=255  gui=NONE         guifg=#585858 guibg=#eeeeee
    hi Pmenu        cterm=NONE         ctermfg=255  ctermbg=240  gui=NONE         guifg=#eeeeee guibg=#585858
    hi PmenuThumb   cterm=NONE         ctermfg=232  ctermbg=240  gui=NONE         guifg=#080808 guibg=#585858
    hi SpecialKey   cterm=NONE         ctermfg=16   ctermbg=255  gui=NONE         guifg=#000000 guibg=#eeeeee
    hi MatchParen   cterm=NONE         ctermfg=16   ctermbg=240  gui=NONE         guifg=#000000 guibg=#585858
    hi CursorLine   cterm=NONE         ctermfg=NONE ctermbg=233  gui=NONE         guifg=NONE    guibg=#121212
    hi StatusLine   cterm=bold,reverse ctermfg=16   ctermbg=245  gui=bold,reverse guifg=#000000 guibg=#8a8a8a
    hi StatusLineNC cterm=reverse      ctermfg=16   ctermbg=236  gui=reverse      guifg=#000000 guibg=#303030
    hi Visual       cterm=reverse      ctermfg=250  ctermbg=16   gui=reverse      guifg=#bcbcbc guibg=#000000
	hi VertSplit    cterm=NONE         ctermfg=236  ctermbg=16   gui=NONE         guifg=#303030 guibg=#000000
	hi LineNr       cterm=NONE         ctermfg=240  ctermbg=16   gui=NONE         guifg=#585858 guibg=#000000
    hi TermCursor   cterm=reverse      ctermfg=NONE ctermbg=NONE gui=reverse      guifg=NONE    guibg=NONE
else
    hi Normal       cterm=NONE         ctermfg=Gray     ctermbg=Black
    hi Keyword      cterm=NONE         ctermfg=White    ctermbg=Black
    hi Constant     cterm=NONE         ctermfg=Gray     ctermbg=Black
    hi String       cterm=NONE         ctermfg=Gray     ctermbg=Black
	if (has('unix') && system('tput sitm') ==# "\e[3m")
		hi Comment  cterm=italic       ctermfg=DarkGray ctermbg=Black
	else
		hi Comment  cterm=NONE         ctermfg=DarkGray ctermbg=Black
	endif
    hi Number       cterm=NONE         ctermfg=Red      ctermbg=Black
    hi Error        cterm=NONE         ctermfg=White    ctermbg=DarkRed
    hi ErrorMsg     cterm=NONE         ctermfg=White    ctermbg=Red
    hi Search       cterm=NONE         ctermfg=Gray     ctermbg=DarkGray
    hi IncSearch    cterm=reverse      ctermfg=White    ctermbg=Gray
    hi DiffChange   cterm=NONE         ctermfg=Red      ctermbg=White
    hi DiffText     cterm=bold         ctermfg=Gray     ctermbg=Red
    hi SignColumn   cterm=NONE         ctermfg=Red      ctermbg=DarkGray
    hi SpellBad     cterm=undercurl    ctermfg=White    ctermbg=DarkRed
    hi SpellCap     cterm=NONE         ctermfg=White    ctermbg=Red
    hi SpellRare    cterm=NONE         ctermfg=Red      ctermbg=Black
    hi WildMenu     cterm=NONE         ctermfg=DarkGray ctermbg=White
    hi Pmenu        cterm=NONE         ctermfg=White    ctermbg=DarkGray
    hi PmenuThumb   cterm=NONE         ctermfg=Black    ctermbg=DarkGray
    hi SpecialKey   cterm=NONE         ctermfg=Black    ctermbg=White
    hi MatchParen   cterm=NONE         ctermfg=Black    ctermbg=DarkGray
    hi CursorLine   cterm=NONE         ctermfg=NONE     ctermbg=Black
    hi StatusLine   cterm=bold,reverse ctermfg=Black    ctermbg=Gray
    hi StatusLineNC cterm=reverse      ctermfg=Black    ctermbg=DarkGray
    hi Visual       cterm=reverse      ctermfg=Gray     ctermbg=Black
	hi VertSplit    cterm=reverse      ctermfg=NONE     ctermbg=Black
	hi LineNr       cterm=NONE         ctermfg=240      ctermbg=16
    hi TermCursor   cterm=reverse      ctermfg=NONE     ctermbg=NONE
endif

hi! link Boolean        Normal
hi! link Delimiter      Normal
hi! link Identifier     Normal
hi! link Title          Normal
hi! link Debug          Normal
hi! link Exception      Normal
hi! link FoldColumn     Normal
hi! link Macro          Normal
hi! link ModeMsg        Normal
hi! link MoreMsg        Normal
hi! link Question       Normal
hi! link Conditional    Keyword
hi! link Statement      Keyword
hi! link Operator       Keyword
hi! link Structure      Keyword
hi! link Function       Keyword
hi! link Include        Keyword
hi! link Type           Keyword
hi! link Typedef        Keyword
hi! link Todo           Keyword
hi! link Label          Keyword
hi! link Define         Keyword
hi! link DiffAdd        Keyword
hi! link diffAdded      Keyword
hi! link diffCommon     Keyword
hi! link Directory      Keyword
hi! link PreCondit      Keyword
hi! link PreProc        Keyword
hi! link Repeat         Keyword
hi! link Special        Keyword
hi! link SpecialChar    Keyword
hi! link StorageClass   Keyword
hi! link SignColumn		Keyword
hi! link SpecialComment String
hi! link CursorLineNr   String
hi! link Character      Number
hi! link Float          Number
hi! link Tag            Number
hi! link Folded         Number
hi! link WarningMsg     Number
hi! link iCursor        SpecialKey
hi! link SpellLocal     SpellCap
hi! link NonText        Comment
hi! link DiffDelete     Comment
hi! link diffRemoved    Comment
hi! link PmenuSbar      Visual
hi! link PmenuSel       Visual
hi! link VisualNOS      Visual
hi! link Cursor         StatusLine
hi! link Underlined     SpellRare
hi! link rstEmphasis    SpellRare
hi! link diffChanged    DiffChange
