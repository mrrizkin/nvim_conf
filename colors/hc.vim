hi clear
set bg=dark
if version > 580
	if exists('syntax_on')
		syntax reset
	endif
endif
let g:colors_name = 'hc'

hi Normal         guifg='#D4D4D4' guibg=NONE      gui=NONE
hi ColorColumn    guifg=NONE      guibg='#222222' gui=NONE
hi Cursor         guifg='#51504F' guibg='#AEAFAD' gui=NONE
hi CursorLine     guifg=NONE      guibg=NONE      gui='underline'
hi CursorColumn   guifg=NONE      guibg='#222222' gui=NONE
hi Directory      guifg='#569CD6' guibg='#000000' gui=NONE
hi DiffAdd        guifg=NONE      guibg='#4B5632' gui=NONE
hi DiffChange     guifg=NONE      guibg='#4B1818' gui=NONE
hi DiffDelete     guifg=NONE      guibg='#FB0101' gui=NONE
hi DiffText       guifg=NONE      guibg='#FB0101' gui=NONE
hi EndOfBuffer    guifg='#000000' guibg=NONE      gui=NONE
hi ErrorMsg       guifg='#F44747' guibg='#000000' gui=NONE
hi VertSplit      guifg='#444444' guibg=NONE      gui=NONE
hi Folded         guifg='#636369' guibg='#252526' gui='underline'
hi FoldColumn     guifg='#5A5A5A' guibg='#000000' gui=NONE
hi SignColumn     guifg=NONE      guibg=NONE      gui=NONE
hi IncSearch      guifg=NONE      guibg='#4B5632' gui=NONE
" hi LineNr         guifg='#5A5A5A' guibg=NONE      gui=NONE
hi LineNr         guifg='#D4D4D4' guibg=NONE      gui=NONE
hi CursorLineNr   guifg='#ff8700' guibg=NONE      gui=NONE
hi MatchParen     guifg=NONE      guibg='#51504F' gui=NONE
hi ModeMsg        guifg='#D4D4D4' guibg=NONE      gui=NONE
hi MoreMsg        guifg='#D4D4D4' guibg=NONE      gui=NONE
hi NonText        guifg='#5A5A5A' guibg='#000000' gui=NONE
hi Pmenu          guifg='#BBBBBB' guibg='#2D2D30' gui=NONE
hi PmenuSel       guifg='#BBBBBB' guibg='#073655' gui=NONE
hi PmenuSbar      guifg=NONE      guibg='#3D3D40' gui=NONE
hi PmenuThumb     guifg=NONE      guibg='#BBBBBB' gui=NONE
hi Question       guifg='#569CD6' guibg='#000000' gui=NONE
hi Search         guifg=NONE      guibg='#264F78' gui=NONE
hi SpecialKey     guifg='#569CD6' guibg=NONE      gui=NONE
hi StatusLine     guifg='#ff8700' guibg=NONE      gui=NONE
hi StatusLineNC   guifg='#D4D4D4' guibg=NONE      gui=NONE
hi TabLine        guifg='#D4D4D4' guibg='#2D2D2D' gui=NONE
hi TabLineFill    guifg='#D4D4D4' guibg='#252526' gui=NONE
hi TabLineSel     guifg='#D4D4D4' guibg='#1E1E1E' gui=NONE
hi Title          guifg=NONE      guibg=NONE      gui='bold'
hi Visual         guifg=NONE      guibg='#264F78' gui=NONE
hi VisualNOS      guifg=NONE      guibg='#264F78' gui=NONE
hi WarningMsg     guifg='#CE9178' guibg='#000000' gui=NONE
hi WildMenu       guifg=NONE      guibg='#264F78' gui=NONE
hi Comment        guifg='#6A9955' guibg=NONE      gui='italic'
hi Constant       guifg='#569CD6' guibg=NONE      gui=NONE
hi String         guifg='#CE9178' guibg=NONE      gui=NONE
hi Character      guifg='#CE9178' guibg=NONE      gui=NONE
hi Number         guifg='#B5CEA8' guibg=NONE      gui=NONE
hi Boolean        guifg='#569CD6' guibg=NONE      gui=NONE
hi Float          guifg='#B5CEA8' guibg=NONE      gui=NONE
hi Identifier     guifg='#9CDCFE' guibg=NONE      gui=NONE
hi Function       guifg='#DCDCAA' guibg=NONE      gui=NONE
hi Statement      guifg='#C586C0' guibg=NONE      gui=NONE
hi Conditional    guifg='#C586C0' guibg=NONE      gui=NONE
hi Repeat         guifg='#C586C0' guibg=NONE      gui=NONE
hi Label          guifg='#C586C0' guibg=NONE      gui=NONE
hi Operator       guifg='#D4D4D4' guibg=NONE      gui=NONE
hi Keyword        guifg='#C586C0' guibg=NONE      gui=NONE
hi Exception      guifg='#C586C0' guibg=NONE      gui=NONE
hi PreProc        guifg='#C586C0' guibg=NONE      gui=NONE
hi Include        guifg='#C586C0' guibg=NONE      gui=NONE
hi Define         guifg='#C586C0' guibg=NONE      gui=NONE
hi Macro          guifg='#C586C0' guibg=NONE      gui=NONE
hi Type           guifg='#569CD6' guibg=NONE      gui=NONE
hi StorageClass   guifg='#569CD6' guibg=NONE      gui=NONE
hi Structure      guifg='#569CD6' guibg=NONE      gui=NONE
hi Typedef        guifg='#569CD6' guibg=NONE      gui=NONE
hi Special        guifg='#D7BA7D' guibg=NONE      gui=NONE
hi SpecialChar    guifg='#D4D4D4' guibg=NONE      gui=NONE
hi Tag            guifg='#D4D4D4' guibg=NONE      gui=NONE
hi Delimiter      guifg='#D4D4D4' guibg=NONE      gui=NONE
hi SpecialComment guifg='#6A9955' guibg=NONE      gui=NONE
hi Debug          guifg='#D4D4D4' guibg=NONE      gui=NONE
hi Underlined     guifg=NONE      guibg=NONE      gui='underline'
hi Conceal        guifg='#D4D4D4' guibg='#000000' gui=NONE
hi Ignore         guifg='#D4D4D4' guibg=NONE      gui=NONE
hi Error          guifg='#F44747' guibg='#000000' gui='undercurl' guisp='#F44747'
hi Todo           guifg='#000000' guibg='#C586C0' gui='bold'
hi SpellBad       guifg='#F44747' guibg='#000000' gui='undercurl' guisp='#F44747'
hi SpellCap       guifg='#F44747' guibg='#000000' gui='undercurl' guisp='#F44747'
hi SpellRare      guifg='#F44747' guibg='#000000' gui='undercurl' guisp='#F44747'
hi SpellLocal     guifg='#F44747' guibg='#000000' gui='undercurl' guisp='#F44747'

hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
hi! link CompeDocumentation Pmenu

" Tresitter
hi TSError              guifg='#F44747' guibg=NONE gui=NONE
hi TSPunctDelimiter     guifg='#D4D4D4' guibg=NONE gui=NONE
hi TSPunctBracket       guifg='#D4D4D4' guibg=NONE gui=NONE
hi TSPunctSpecial       guifg='#D4D4D4' guibg=NONE gui=NONE
hi TSConstant           guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSConstBuiltin       guifg='#569CD6' guibg=NONE gui=NONE
hi TSConstMacro         guifg='#4EC9B0' guibg=NONE gui=NONE
hi TSStringRegex        guifg='#CE9178' guibg=NONE gui=NONE
hi TSString             guifg='#CE9178' guibg=NONE gui=NONE
hi TSStringEscape       guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSCharacter          guifg='#CE9178' guibg=NONE gui=NONE
hi TSNumber             guifg='#B5CEAB' guibg=NONE gui=NONE
hi TSBoolean            guifg='#569CD6' guibg=NONE gui=NONE
hi TSFloat              guifg='#B5CEAB' guibg=NONE gui=NONE
hi TSAnnotation         guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSAttribute          guifg='#4EC9B0' guibg=NONE gui=NONE
hi TSNamespace          guifg='#4EC9B0' guibg=NONE gui=NONE
hi TSFuncBuiltin        guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSFunction           guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSFuncMacro          guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSParameter          guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSParameterReference guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSMethod             guifg='#DCDCAA' guibg=NONE gui=NONE
hi TSField              guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSProperty           guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSConstructor        guifg='#4EC9B0' guibg=NONE gui=NONE
hi TSConditional        guifg='#C586C0' guibg=NONE gui=NONE
hi TSRepeat             guifg='#C586C0' guibg=NONE gui=NONE
hi TSLabel              guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSKeyword            guifg='#569CD6' guibg=NONE gui=NONE
hi TSKeywordFunction    guifg='#C586C0' guibg=NONE gui=NONE
hi TSKeywordOperator    guifg='#569CD6' guibg=NONE gui=NONE
hi TSOperator           guifg='#D4D4D4' guibg=NONE gui=NONE
hi TSException          guifg='#C586C0' guibg=NONE gui=NONE
hi TSType               guifg='#4EC9B0' guibg=NONE gui=NONE
hi TSTypeBuiltin        guifg='#569CD6' guibg=NONE gui=NONE
hi TSStructure          guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSInclude            guifg='#C586C0' guibg=NONE gui=NONE
hi TSVariable           guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSVariableBuiltin    guifg='#9CDCFE' guibg=NONE gui=NONE
hi TSText               guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSStrong             guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSEmphasis           guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSUnderline          guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSTitle              guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSLiteral            guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSURI                guifg='#D7BA7D' guibg=NONE gui=NONE
hi TSTag                guifg='#569CD6' guibg=NONE gui=NONE
hi TSTagDelimiter       guifg='#808080' guibg=NONE gui=NONE

" Gitgutter
hi GitGutterAdd    guifg='#6A9955' guibg=NONE gui=NONE
hi GitGutterChange guifg='#DCDCAA' guibg=NONE gui=NONE
hi GitGutterDelete guifg='#F44747' guibg=NONE gui=NONE

" Git Signs
hi GitSignsAdd      guifg='#6A9955' guibg=NONE      gui=NONE
hi GitSignsChange   guifg='#DCDCAA' guibg=NONE      gui=NONE
hi GitSignsDelete   guifg='#F44747' guibg=NONE      gui=NONE
hi GitSignsAddLn    guifg='#000000' guibg='#6A9955' gui=NONE
hi GitSignsChangeLn guifg='#000000' guibg='#DCDCAA' gui=NONE
hi GitSignsDeleteLn guifg='#000000' guibg='#F44747' gui=NONE

" NvimTree
hi NvimTreeRootFolder       guifg='#D4D4D4' guibg=NONE      gui='bold'
hi NvimTreeGitDirty         guifg='#DCDCAA' guibg=NONE      gui=NONE
hi NvimTreeGitNew           guifg='#6A9955' guibg=NONE      gui=NONE
hi NvimTreeImageFile        guifg='#646695' guibg=NONE      gui=NONE
hi NvimTreeIndentMarker     guifg='#5A5A5A' guibg=NONE      gui=NONE
hi NvimTreeEmptyFolderName  guifg='#808080' guibg=NONE      gui=NONE
hi NvimTreeFolderName       guifg='#D4D4D4' guibg=NONE      gui=NONE
hi NvimTreeFolderIcon       guifg='#569CD6' guibg=NONE      gui=NONE
hi NvimTreeSpecialFile      guifg='#C586C0' guibg=NONE      gui='underline'
hi NvimTreeNormal           guifg='#D4D4D4' guibg=NONE      gui=NONE
hi NvimTreeCursorLine       guifg=NONE      guibg='#373737' gui=NONE
hi NvimTreeVertSplit        guifg='#444444' guibg=NONE      gui=NONE
hi NvimTreeEndOfBuffer      guifg='#252526' guibg=NONE      gui=NONE
hi NvimTreeOpenedFolderName guifg='#D4D4D4' guibg=NONE      gui=NONE

" Bufferline
hi BufferLineIndicatorSelected guifg='#252526' guibg=NONE      gui=NONE
hi BufferLineFill              guifg=NONE      guibg='#252526' gui=NONE

" IndentBlankLine
hi IndentBlanklineContextChar guifg='#F44747' guibg=NONE gui='nocombine'
hi IndentBlanklineChar        guifg='#5A5A5A' guibg=NONE gui='nocombine'
hi IndentBlanklineSpaceChar   guifg='#5A5A5A' guibg=NONE gui='nocombine'

" LSP
hi LspDiagnosticsDefaultError         guifg='#F44747' guibg=NONE gui=NONE
hi LspDiagnosticsDefaultWarning       guifg='#DCDCAA' guibg=NONE gui=NONE
hi LspDiagnosticsDefaultInformation   guifg='#569CD6' guibg=NONE gui=NONE
hi LspDiagnosticsDefaultHint          guifg='#569CD6' guibg=NONE gui=NONE
hi LspDiagnosticsUnderlineError       guifg='#F44747' guibg=NONE gui='undercurl'
hi LspDiagnosticsUnderlineWarning     guifg='#DCDCAA' guibg=NONE gui='undercurl'
hi LspDiagnosticsUnderlineInformation guifg='#569CD6' guibg=NONE gui='undercurl'
hi LspDiagnosticsUnderlineHint        guifg='#569CD6' guibg=NONE gui='undercurl'
hi LspReferenceText                   guifg='#D7BA7D' guibg=NONE gui=NONE
hi LspReferenceRead                   guifg='#D7BA7D' guibg=NONE gui=NONE
hi LspReferenceWrite                  guifg='#D7BA7D' guibg=NONE gui=NONE
hi LspFloatWinNormal                  guifg='#D4D4D4' guibg=NONE gui=NONE
hi LspFloatWinBorder                  guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaHoverBorder                 guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaSignatureHelpBorder         guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaCodeActionBorder            guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaDefPreviewBorder            guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspLinesDiagBorder                 guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaRenameBorder                guifg='#5A5A5A' guibg=NONE gui=NONE
hi LspSagaBorderTitle                 guifg='#51504F' guibg=NONE gui=NONE
