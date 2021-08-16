if !(exists('g:colors_name') && g:colors_name ==# 'everbush')
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'everbush'

" g:everbush#tmux: is in tmux < 2.9 or not {{{
let g:everbush#tmux = executable('tmux') && $TMUX !=# '' ?
                  \ (str2float(system("tmux -V | grep -oE '[0-9]+\.[0-9]*'")) < 2.9 ?
                    \ 1 :
                    \ 0) :
                  \ 0 "}}}

" pallete {{{
let s:palette = {
            \ 'bg0':        ['#2f383e',   '235'],
            \ 'bg1':        ['#374247',   '236'],
            \ 'bg2':        ['#404c51',   '237'],
            \ 'bg3':        ['#4a555b',   '238'],
            \ 'bg4':        ['#525c62',   '239'],
            \ 'bg5':        ['#596763',   '240'],
            \ 'bg_visual':  ['#573e4c',   '52'],
            \ 'bg_red':     ['#544247',   '52'],
            \ 'bg_green':   ['#445349',   '22'],
            \ 'bg_blue':    ['#3b5360',   '17'],
            \ 'bg_yellow':  ['#504f45',   '136'],
            \ 'fg':         ['#d3c6aa',   '223'],
            \ 'red':        ['#e67e80',   '167'],
            \ 'orange':     ['#e69875',   '208'],
            \ 'yellow':     ['#dbbc7f',   '214'],
            \ 'green':      ['#a7c080',   '142'],
            \ 'aqua':       ['#83c092',   '108'],
            \ 'blue':       ['#7fbbb3',   '109'],
            \ 'purple':     ['#d699b6',   '175'],
            \ 'grey0':      ['#7a8478',   '243'],
            \ 'grey1':      ['#859289',   '245'],
            \ 'grey2':      ['#9da9a0',   '247'],
            \ 'statusline1':['#a7c080',   '142'],
            \ 'statusline2':['#d3c6aa',   '223'],
            \ 'statusline3':['#e67e80',   '167'],
            \ 'none':       ['NONE',      'NONE']
            \ } "}}}

let s:terminal = {
        \ 'black':    s:palette.bg3,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.aqua,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.fg
        \ }

function! everbush#highlight(group, fg, bg, ...) "{{{
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ (g:everbush#tmux ?
              \ 'underline' :
              \ 'undercurl') :
            \ a:1) :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ 'underline' :
            \ a:1) :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction "}}}

" UI: {{{
call everbush#highlight('Normal', s:palette.fg, s:palette.bg0)
call everbush#highlight('Terminal', s:palette.fg, s:palette.bg0)
call everbush#highlight('EndOfBuffer', s:palette.bg0, s:palette.bg0)
call everbush#highlight('Folded', s:palette.grey1, s:palette.bg1)
call everbush#highlight('ToolbarLine', s:palette.fg, s:palette.bg2)
call everbush#highlight('SignColumn', s:palette.fg, s:palette.none)
call everbush#highlight('FoldColumn', s:palette.grey0, s:palette.none)
call everbush#highlight('IncSearch', s:palette.bg0, s:palette.red)
call everbush#highlight('Search', s:palette.bg0, s:palette.green)
call everbush#highlight('ColorColumn', s:palette.none, s:palette.bg1)
call everbush#highlight('Conceal', s:palette.grey0, s:palette.none)
call everbush#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
if &diff
  call everbush#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call everbush#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call everbush#highlight('CursorLine', s:palette.none, s:palette.bg1)
  call everbush#highlight('CursorColumn', s:palette.none, s:palette.bg1)
endif
call everbush#highlight('LineNr', s:palette.grey0, s:palette.none)
if &diff
  call everbush#highlight('CursorLineNr', s:palette.grey2, s:palette.none, 'underline')
elseif (&relativenumber == 1 && &cursorline == 0)
  call everbush#highlight('CursorLineNr', s:palette.grey2, s:palette.none)
else
  call everbush#highlight('CursorLineNr', s:palette.grey2, s:palette.bg1)
endif
call everbush#highlight('DiffAdd', s:palette.bg_green, s:palette.none)
call everbush#highlight('DiffChange', s:palette.bg_blue, s:palette.none)
call everbush#highlight('DiffDelete', s:palette.bg_red, s:palette.none)
call everbush#highlight('DiffText', s:palette.bg0, s:palette.blue)
call everbush#highlight('Directory', s:palette.green, s:palette.none)
call everbush#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call everbush#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call everbush#highlight('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call everbush#highlight('MoreMsg', s:palette.yellow, s:palette.none, 'bold')
call everbush#highlight('MatchParen', s:palette.none, s:palette.bg4)
call everbush#highlight('NonText', s:palette.bg4, s:palette.none)
call everbush#highlight('Whitespace', s:palette.bg4, s:palette.none)
call everbush#highlight('SpecialKey', s:palette.bg3, s:palette.none)
call everbush#highlight('Pmenu', s:palette.fg, s:palette.bg2)
call everbush#highlight('PmenuSbar', s:palette.none, s:palette.bg2)
call everbush#highlight('PmenuSel', s:palette.bg0, s:palette.statusline1)
call everbush#highlight('PmenuThumb', s:palette.none, s:palette.grey0)
call everbush#highlight('NormalFloat', s:palette.fg, s:palette.bg2)
call everbush#highlight('Question', s:palette.yellow, s:palette.none)
call everbush#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call everbush#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
call everbush#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.aqua)
call everbush#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.purple)
call everbush#highlight('StatusLine', s:palette.grey1, s:palette.bg1)
call everbush#highlight('StatusLineTerm', s:palette.grey1, s:palette.bg1)
call everbush#highlight('StatusLineNC', s:palette.grey1, s:palette.bg0)
call everbush#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg0)
call everbush#highlight('TabLine', s:palette.grey2, s:palette.bg3)
call everbush#highlight('TabLineFill', s:palette.grey1, s:palette.bg1)
call everbush#highlight('TabLineSel', s:palette.bg0, s:palette.statusline1)
call everbush#highlight('VertSplit', s:palette.bg4, s:palette.none)
call everbush#highlight('Visual', s:palette.none, s:palette.bg_visual)
call everbush#highlight('VisualNOS', s:palette.none, s:palette.bg_visual)
call everbush#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call everbush#highlight('Debug', s:palette.orange, s:palette.none)
call everbush#highlight('debugPC', s:palette.bg0, s:palette.green)
call everbush#highlight('debugBreakpoint', s:palette.bg0, s:palette.red)
call everbush#highlight('ToolbarButton', s:palette.bg0, s:palette.green)
call everbush#highlight('Substitute', s:palette.bg0, s:palette.yellow)
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
highlight! link WildMenu PmenuSel
highlight! link LspDiagnosticsFloatingError ErrorFloat
highlight! link LspDiagnosticsFloatingWarning WarningFloat
highlight! link LspDiagnosticsFloatingInformation InfoFloat
highlight! link LspDiagnosticsFloatingHint HintFloat
highlight! link LspDiagnosticsDefaultError ErrorText
highlight! link LspDiagnosticsDefaultWarning WarningText
highlight! link LspDiagnosticsDefaultInformation InfoText
highlight! link LspDiagnosticsDefaultHint HintText
highlight! link LspDiagnosticsVirtualTextError VirtualTextError
highlight! link LspDiagnosticsVirtualTextWarning VirtualTextWarning
highlight! link LspDiagnosticsVirtualTextInformation VirtualTextInfo
highlight! link LspDiagnosticsVirtualTextHint VirtualTextHint
highlight! link LspDiagnosticsUnderlineError ErrorText
highlight! link LspDiagnosticsUnderlineWarning WarningText
highlight! link LspDiagnosticsUnderlineInformation InfoText
highlight! link LspDiagnosticsUnderlineHint HintText
highlight! link LspDiagnosticsSignError RedSign
highlight! link LspDiagnosticsSignWarning YellowSign
highlight! link LspDiagnosticsSignInformation BlueSign
highlight! link LspDiagnosticsSignHint AquaSign
highlight! link LspReferenceText CurrentWord
highlight! link LspReferenceRead CurrentWord
highlight! link LspReferenceWrite CurrentWord
highlight! link TermCursor Cursor
highlight! link healthError Red
highlight! link healthSuccess Green
highlight! link healthWarning Yellow
" }}}
" Syntax: {{{
call everbush#highlight('Boolean', s:palette.purple, s:palette.none)
call everbush#highlight('Number', s:palette.purple, s:palette.none)
call everbush#highlight('Float', s:palette.purple, s:palette.none)
call everbush#highlight('PreProc', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('PreCondit', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('Include', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('Define', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('Conditional', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Repeat', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Keyword', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Typedef', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Exception', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Statement', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('Error', s:palette.red, s:palette.none)
call everbush#highlight('StorageClass', s:palette.orange, s:palette.none)
call everbush#highlight('Tag', s:palette.orange, s:palette.none)
call everbush#highlight('Label', s:palette.orange, s:palette.none)
call everbush#highlight('Structure', s:palette.orange, s:palette.none)
call everbush#highlight('Operator', s:palette.orange, s:palette.none)
call everbush#highlight('Title', s:palette.orange, s:palette.none, 'bold')
call everbush#highlight('Special', s:palette.yellow, s:palette.none)
call everbush#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call everbush#highlight('Type', s:palette.yellow, s:palette.none)
call everbush#highlight('Function', s:palette.green, s:palette.none)
call everbush#highlight('String', s:palette.green, s:palette.none)
call everbush#highlight('Character', s:palette.green, s:palette.none)
call everbush#highlight('Constant', s:palette.aqua, s:palette.none)
call everbush#highlight('Macro', s:palette.aqua, s:palette.none)
call everbush#highlight('Identifier', s:palette.blue, s:palette.none)
call everbush#highlight('Comment', s:palette.grey1, s:palette.none, 'italic')
call everbush#highlight('SpecialComment', s:palette.grey1, s:palette.none, 'italic')
call everbush#highlight('Todo', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('Delimiter', s:palette.fg, s:palette.none)
call everbush#highlight('Ignore', s:palette.grey1, s:palette.none)
call everbush#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call everbush#highlight('Fg', s:palette.fg, s:palette.none)
call everbush#highlight('Grey', s:palette.grey1, s:palette.none)
call everbush#highlight('Red', s:palette.red, s:palette.none)
call everbush#highlight('Orange', s:palette.orange, s:palette.none)
call everbush#highlight('Yellow', s:palette.yellow, s:palette.none)
call everbush#highlight('Green', s:palette.green, s:palette.none)
call everbush#highlight('Aqua', s:palette.aqua, s:palette.none)
call everbush#highlight('Blue', s:palette.blue, s:palette.none)
call everbush#highlight('Purple', s:palette.purple, s:palette.none)
call everbush#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
call everbush#highlight('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
call everbush#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
call everbush#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
call everbush#highlight('AquaItalic', s:palette.aqua, s:palette.none, 'italic')
call everbush#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
call everbush#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
call everbush#highlight('RedSign', s:palette.red, s:palette.bg1)
call everbush#highlight('OrangeSign', s:palette.orange, s:palette.bg1)
call everbush#highlight('YellowSign', s:palette.yellow, s:palette.bg1)
call everbush#highlight('GreenSign', s:palette.green, s:palette.bg1)
call everbush#highlight('AquaSign', s:palette.aqua, s:palette.bg1)
call everbush#highlight('BlueSign', s:palette.blue, s:palette.bg1)
call everbush#highlight('PurpleSign', s:palette.purple, s:palette.bg1)
call everbush#highlight('ErrorText', s:palette.none, s:palette.bg_red, 'undercurl', s:palette.red)
call everbush#highlight('WarningText', s:palette.none, s:palette.bg_yellow, 'undercurl', s:palette.yellow)
call everbush#highlight('InfoText', s:palette.none, s:palette.bg_blue, 'undercurl', s:palette.blue)
call everbush#highlight('HintText', s:palette.none, s:palette.bg_green, 'undercurl', s:palette.green)
call everbush#highlight('ErrorFloat', s:palette.red, s:palette.bg2)
call everbush#highlight('WarningFloat', s:palette.yellow, s:palette.bg2)
call everbush#highlight('InfoFloat', s:palette.blue, s:palette.bg2)
call everbush#highlight('HintFloat', s:palette.green, s:palette.bg2)
if &diff
  call everbush#highlight('CurrentWord', s:palette.bg0, s:palette.green)
else
  call everbush#highlight('CurrentWord', s:palette.none, s:palette.bg2)
endif
highlight clear ErrorLine
highlight clear WarningLine
highlight clear InfoLine
highlight clear HintLine
highlight! link VirtualTextWarning Yellow
highlight! link VirtualTextError Red
highlight! link VirtualTextInfo Blue
highlight! link VirtualTextHint Green
" }}}
" Terminal: {{{
let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
" }}}
" Diff: {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Aqua
highlight! link diffLine Grey
highlight! link diffIndexLine Purple
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
call everbush#highlight('TSStrong', s:palette.none, s:palette.none, 'bold')
call everbush#highlight('TSEmphasis', s:palette.none, s:palette.none, 'bold')
call everbush#highlight('TSUnderline', s:palette.none, s:palette.none, 'underline')
call everbush#highlight('TSNote', s:palette.bg0, s:palette.blue, 'bold')
call everbush#highlight('TSWarning', s:palette.bg0, s:palette.yellow, 'bold')
call everbush#highlight('TSDanger', s:palette.bg0, s:palette.red, 'bold')
highlight! link TSAnnotation Purple
highlight! link TSAttribute Purple
highlight! link TSBoolean Purple
highlight! link TSCharacter Aqua
highlight! link TSComment Comment
highlight! link TSConditional Red
highlight! link TSConstBuiltin BlueItalic
highlight! link TSConstMacro BlueItalic
highlight! link TSConstant Fg
highlight! link TSConstructor Green
highlight! link TSException Red
highlight! link TSField Green
highlight! link TSFloat Purple
highlight! link TSFuncBuiltin Green
highlight! link TSFuncMacro Green
highlight! link TSFunction Green
highlight! link TSInclude Red
highlight! link TSKeyword Red
highlight! link TSKeywordFunction Red
highlight! link TSKeywordOperator Orange
highlight! link TSLabel Orange
highlight! link TSMethod Green
highlight! link TSNamespace YellowItalic
highlight! link TSNone Fg
highlight! link TSNumber Purple
highlight! link TSOperator Orange
highlight! link TSParameter Fg
highlight! link TSParameterReference Fg
highlight! link TSProperty Green
highlight! link TSPunctBracket Fg
highlight! link TSPunctDelimiter Grey
highlight! link TSPunctSpecial Blue
highlight! link TSRepeat Red
highlight! link TSString Aqua
highlight! link TSStringEscape Green
highlight! link TSStringRegex Green
highlight! link TSStructure BlueItalic
highlight! link TSSymbol Fg
highlight! link TSTag Orange
highlight! link TSTagDelimiter Green
highlight! link TSText Green
highlight! link TSStrike Grey
highlight! link TSMath Blue
highlight! link TSType Yellow
highlight! link TSTypeBuiltin YellowItalic
highlight! link TSURI markdownUrl
highlight! link TSVariable Fg
highlight! link TSVariableBuiltin BlueItalic
" }}}
" nvim-telescope/telescope.nvim {{{
call everbush#highlight('TelescopeMatching', s:palette.green, s:palette.none, 'bold')
highlight! link TelescopeBorder Grey
highlight! link TelescopePromptPrefix Orange
highlight! link TelescopeSelection DiffAdd
" }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
