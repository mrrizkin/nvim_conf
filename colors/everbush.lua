local fn = vim.fn
local g = vim.g
local cmd = vim.api.nvim_command
if fn.exists("g:colors_name") and vim.g.colors_name == "everbush" then
    cmd [[hi clear]]
    if fn.exists("syntax_on") then
        cmd [[syntax reset]]
    end
end

vim.o.termguicolors = true
g.colors_name = "everbush"

local colors = {
    bg0        = "#22282c",
    bg1        = "#272f34",
    bg2        = "#2f383e",
    bg3        = "#374247",
    bg4        = "#404c51",
    bg5        = "#4a555b",
    bg6        = "#525c62",
    grey0      = "#7f897d",
    grey1      = "#859289",
    grey2      = "#9aa79d",
    fg0        = "#bdc3af",
    fg1        = "#d3c6aa",
    fg2        = "#fdf6e3",
    red        = "#e67e80",
    orange     = "#e69875",
    yellow     = "#dbbc7f",
    green      = "#a7c080",
    aqua       = "#83c092",
    blue       = "#7fbbb3",
    purple     = "#d699b6",
    dimRed     = "#da6362",
    dimOrange  = "#d77f48",
    dimYellow  = "#bf983d",
    dimGreen   = "#899c40",
    dimAqua    = "#569d79",
    dimBlue    = "#5a93a2",
    dimPurple  = "#b87b9d",
    bg_visual  = "#573e4c",
    bg_red     = "#544247",
    bg_green   = "#445349",
    bg_blue    = "#3b5360",
    bg_yellow  = "#504f45",
    none       = "NONE"
}

g.terminal_color_0 = colors.bg0
g.terminal_color_1 = colors.dimRed
g.terminal_color_2 = colors.dimGreen
g.terminal_color_3 = colors.dimYellow
g.terminal_color_4 = colors.dimBlue
g.terminal_color_5 = colors.dimPurple
g.terminal_color_6 = colors.dimAqua
g.terminal_color_7 = colors.fg0
g.terminal_color_8 = colors.bg5
g.terminal_color_9 = colors.red
g.terminal_color_10 = colors.green
g.terminal_color_11 = colors.yellow
g.terminal_color_12 = colors.blue
g.terminal_color_13 = colors.purple
g.terminal_color_14 = colors.aqua
g.terminal_color_15 = colors.fg2
g.terminal_color_background = colors.bg2
g.terminal_color_foreground = colors.fg1

--[[ TODO:
--  * [ ] conditional highlighting
--  * [ ] 256 color support
--]]
local function highlight(class)
    for group, params in pairs(class) do
        if type(params) == "table" then
            local style = params.style and "gui=" .. params.style or "gui=NONE"
            local fg = params.fg and "guifg=" .. params.fg or "guifg=NONE"
            local bg = params.bg and "guibg=" .. params.bg or "guibg=NONE"
            local sp = params.sp and "guisp=" .. params.sp or ""
            cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
        end
        if type(params) == "string" then
            cmd("highlight! link " .. group .. " " .. params)
        end
        if type(params) == "number" then
            cmd("highlight clear " .. group)
        end
    end
end

local PredefinedColors = {
    Fg           = { fg = colors.fg1,    bg = colors.none },
    Grey         = { fg = colors.grey1,  bg = colors.none },
    Red          = { fg = colors.red,    bg = colors.none },
    Orange       = { fg = colors.orange, bg = colors.none },
    Yellow       = { fg = colors.yellow, bg = colors.none },
    Green        = { fg = colors.green,  bg = colors.none },
    Aqua         = { fg = colors.aqua,   bg = colors.none },
    Blue         = { fg = colors.blue,   bg = colors.none },
    Purple       = { fg = colors.purple, bg = colors.none },
    RedItalic    = { fg = colors.red,    bg = colors.none, style = 'italic' },
    OrangeItalic = { fg = colors.orange, bg = colors.none, style = 'italic' },
    YellowItalic = { fg = colors.yellow, bg = colors.none, style = 'italic' },
    GreenItalic  = { fg = colors.green,  bg = colors.none, style = 'italic' },
    AquaItalic   = { fg = colors.aqua,   bg = colors.none, style = 'italic' },
    BlueItalic   = { fg = colors.blue,   bg = colors.none, style = 'italic' },
    PurpleItalic = { fg = colors.purple, bg = colors.none, style = 'italic' },
    RedSign      = { fg = colors.red,    bg = colors.bg3 },
    OrangeSign   = { fg = colors.orange, bg = colors.bg3 },
    YellowSign   = { fg = colors.yellow, bg = colors.bg3 },
    GreenSign    = { fg = colors.green,  bg = colors.bg3 },
    AquaSign     = { fg = colors.aqua,   bg = colors.bg3 },
    BlueSign     = { fg = colors.blue,   bg = colors.bg3 },
    PurpleSign   = { fg = colors.purple, bg = colors.bg3 },
    ErrorText    = { fg = colors.none,   bg = colors.bg_red,    style = 'undercurl', sp = colors.red },
    WarningText  = { fg = colors.none,   bg = colors.bg_yellow, style = 'undercurl', sp = colors.yellow },
    InfoText     = { fg = colors.none,   bg = colors.bg_blue,   style = 'undercurl', sp = colors.blue },
    HintText     = { fg = colors.none,   bg = colors.bg_green,  style = 'undercurl', sp = colors.green },
    ErrorFloat   = { fg = colors.red,    bg = colors.bg4 },
    WarningFloat = { fg = colors.yellow, bg = colors.bg4 },
    InfoFloat    = { fg = colors.blue,   bg = colors.bg4 },
    HintFloat    = { fg = colors.green,  bg = colors.bg4 },
    CurrentWord  = { fg = colors.none,   bg = colors.bg4 }, -- nondiff
    ErrorLine    = 0,
    WarningLine  = 0,
    InfoLine     = 0,
    HintLine     = 0,
    VirtualTextWarning = "Yellow",
    VirtualTextError   = "Red",
    VirtualTextInfo    = "Blue",
    VirtualTextHint    = "Green",
}

local UI = {
    Normal           = { fg = colors.fg1,      bg = colors.bg2 },
    Terminal         = "Normal",
    EndOfBuffer      = { fg = colors.bg2,      bg = colors.bg2 },
    Folded           = { fg = colors.grey1,    bg = colors.bg3 },
    ToolbarLine      = { fg = colors.fg1,      bg = colors.bg4 },
    SignColumn       = { fg = colors.fg1,      bg = colors.none },
    FoldColumn       = { fg = colors.grey0,    bg = colors.none },
    IncSearch        = { fg = colors.bg2,      bg = colors.red },
    Search           = { fg = colors.bg2,      bg = colors.green },
    ColorColumn      = { fg = colors.none,     bg = colors.bg3 },
    Conceal          = "FoldColumn",
    Cursor           = { fg = colors.none,     bg = colors.none, style = "reverse" },
    CursorLine       = "ColorColumn", -- nondiff
    CursorColumn     = "ColorColumn", -- nondiff
    LineNr           = "FoldColumn",
    CursorLineNr     = { fg = colors.grey2,    bg = colors.none }, -- relative nondif
    DiffAdd          = { fg = colors.bg_green, bg = colors.none },
    DiffChange       = { fg = colors.bg_blue,  bg = colors.none },
    DiffDelete       = { fg = colors.bg_red,   bg = colors.none },
    DiffText         = { fg = colors.bg2,      bg = colors.blue },
    Directory        = { fg = colors.green,    bg = colors.none },
    MsgArea          = { fg = colors.fg1,      bg = colors.bg0 },
    ErrorMsg         = { fg = colors.red,      bg = colors.none, style = 'bold,underline' },
    WarningMsg       = { fg = colors.yellow,   bg = colors.none, style = 'bold' },
    ModeMsg          = { fg = colors.fg1,      bg = colors.none, style = 'bold' },
    MoreMsg          = { fg = colors.yellow,   bg = colors.none, style = 'bold' },
    MatchParen       = { fg = colors.none,     bg = colors.bg6 },
    NonText          = { fg = colors.bg6,      bg = colors.none },
    Whitespace       = "NonText",
    SpecialKey       = { fg = colors.bg5,      bg = colors.none },
    Pmenu            = "ToolbarLine",
    PmenuSbar        = { fg = colors.none,     bg = colors.bg4 },
    PmenuSel         = { fg = colors.bg2,      bg = colors.green },
    PmenuThumb       = { fg = colors.none,     bg = colors.grey0 },
    NormalFloat      = "ToolbarLine",
    Question         = { fg = colors.yellow,   bg = colors.none },
    SpellBad         = { fg = colors.none,     bg = colors.none, style = 'undercurl', sp = colors.red },
    SpellCap         = { fg = colors.none,     bg = colors.none, style = 'undercurl', sp = colors.blue },
    SpellLocal       = { fg = colors.none,     bg = colors.none, style = 'undercurl', sp = colors.aqua },
    SpellRare        = { fg = colors.none,     bg = colors.none, style = 'undercurl', sp = colors.purple },
    StatusLine       = { fg = colors.grey1,    bg = colors.bg1 },
    StatusLineTerm   = "StatusLine",
    StatusLineNC     = { fg = colors.grey1,    bg = colors.bg2 },
    StatusLineTermNC = "StatusLineNC",
    TabLine          = { fg = colors.grey2,    bg = colors.bg5 },
    TabLineFill      = "StatusLine",
    TabLineSel       = { fg = colors.bg2,      bg = colors.green },
    VertSplit        = { fg = colors.bg6,      bg = colors.none },
    Visual           = { fg = colors.none,     bg = colors.bg_visual },
    VisualNOS        = { fg = colors.none,     bg = colors.bg_visual },
    QuickFixLine     = { fg = colors.purple,   bg = colors.none, style = 'bold' },
    Debug            = { fg = colors.orange,   bg = colors.none },
    debugPC          = { fg = colors.bg2,      bg = colors.green },
    debugBreakpoint  = { fg = colors.bg2,      bg = colors.red },
    ToolbarButton    = { fg = colors.bg2,      bg = colors.green },
    Substitute       = { fg = colors.bg2,      bg = colors.yellow },
    vCursor          = "Cursor",
    iCursor          = "Cursor",
    lCursor          = "Cursor",
    CursorIM         = "Cursor",
    WildMenu         = "PmenuSel",
    TermCursor       = "Cursor",
    healthError      = "Red",
    healthSuccess    = "Green",
    healthWarning    = "Yellow",
    LspDiagnosticsDefaultError           = "ErrorText",
    LspDiagnosticsDefaultHint            = "HintText",
    LspDiagnosticsDefaultInformation     = "InfoText",
    LspDiagnosticsDefaultWarning         = "WarningText",
    LspDiagnosticsFloatingError          = "ErrorFloat",
    LspDiagnosticsFloatingHint           = "HintFloat",
    LspDiagnosticsFloatingInformation    = "InfoFloat",
    LspDiagnosticsFloatingWarning        = "WarningFloat",
    LspDiagnosticsSignError              = "RedSign",
    LspDiagnosticsSignHint               = "AquaSign",
    LspDiagnosticsSignInformation        = "BlueSign",
    LspDiagnosticsSignWarning            = "YellowSign",
    LspDiagnosticsUnderlineError         = "ErrorText",
    LspDiagnosticsUnderlineHint          = "HintText",
    LspDiagnosticsUnderlineInformation   = "InfoText",
    LspDiagnosticsUnderlineWarning       = "WarningText",
    LspDiagnosticsVirtualTextError       = "VirtualTextError",
    LspDiagnosticsVirtualTextHint        = "VirtualTextHint",
    LspDiagnosticsVirtualTextInformation = "VirtualTextInfo",
    LspDiagnosticsVirtualTextWarning     = "VirtualTextWarning",
    LspReferenceRead                     = "CurrentWord",
    LspReferenceText                     = "CurrentWord",
    LspReferenceWrite                    = "CurrentWord",
}

local Syntax = {
    Boolean        = "Purple",
    Number         = "Purple",
    Float          = "Purple",
    PreProc        = "PurpleItalic",
    PreCondit      = "PurpleItalic",
    Include        = "PurpleItalic",
    Define         = "PurpleItalic",
    Conditional    = "RedItalic",
    Repeat         = "RedItalic",
    Keyword        = "RedItalic",
    Typedef        = "RedItalic",
    Exception      = "RedItalic",
    Statement      = "RedItalic",
    Error          = "Red",
    StorageClass   = "Orange",
    Tag            = "Orange",
    Label          = "Orange",
    Structure      = "Orange",
    Operator       = "Orange",
    Title          = { fg = colors.orange, bg = colors.none, style = 'bold' },
    Special        = "Yellow",
    SpecialChar    = "Yellow",
    Type           = "Yellow",
    Function       = "Green",
    String         = "Green",
    Character      = "Green",
    Constant       = "Aqua",
    Macro          = "Aqua",
    Identifier     = "Blue",
    Comment        = { fg = colors.grey1,  bg = colors.none, style = 'italic' },
    SpecialComment = "Comment",
    Todo           = "PurpleItalic",
    Delimiter      = "Fg",
    Ignore         = { fg = colors.grey1,  bg = colors.none },
    Underlined     = { fg = colors.none,   bg = colors.none, style = 'underline' },
}

local App = {
    -- treesitter
    TSStrong      = { fg = colors.none, bg = colors.none,   style = "bold" },
    TSEmphasis    = "TSStrong",
    TSUnderline   = { fg = colors.none, bg = colors.none,   style = 'underline' },
    TSNote        = { fg = colors.bg2,  bg = colors.blue,   style = 'bold' },
    TSWarning     = { fg = colors.bg2,  bg = colors.yellow, style = 'bold' },
    TSDanger      = { fg = colors.bg2,  bg = colors.red,    style = 'bold' },
    TSAnnotation         = "Purple",
    TSAttribute          = "Purple",
    TSBoolean            = "Purple",
    TSCharacter          = "Aqua",
    TSComment            = "Comment",
    TSConditional        = "Red",
    TSConstBuiltin       = "BlueItalic",
    TSConstMacro         = "BlueItalic",
    TSConstant           = "Fg",
    TSConstructor        = "Green",
    TSException          = "Red",
    TSField              = "Green",
    TSFloat              = "Purple",
    TSFuncBuiltin        = "Green",
    TSFuncMacro          = "Green",
    TSFunction           = "Green",
    TSInclude            = "Red",
    TSKeyword            = "Red",
    TSKeywordFunction    = "Red",
    TSKeywordOperator    = "Orange",
    TSLabel              = "Orange",
    TSMethod             = "Green",
    TSNamespace          = "YellowItalic",
    TSNone               = "Fg",
    TSNumber             = "Purple",
    TSOperator           = "Orange",
    TSParameter          = "Fg",
    TSParameterReference = "Fg",
    TSProperty           = "Green",
    TSPunctBracket       = "Fg",
    TSPunctDelimiter     = "Grey",
    TSPunctSpecial       = "Blue",
    TSRepeat             = "Red",
    TSString             = "Aqua",
    TSStringEscape       = "Green",
    TSStringRegex        = "Green",
    TSStructure          = "BlueItalic",
    TSSymbol             = "Fg",
    TSTag                = "Orange",
    TSTagDelimiter       = "Green",
    TSText               = "Green",
    TSStrike             = "Grey",
    TSMath               = "Blue",
    TSType               = "Yellow",
    TSTypeBuiltin        = "YellowItalic",
    TSURI                = "markdownUrl",
    TSVariable           = "Fg",
    TSVariableBuiltin    = "BlueItalic",

    -- telescope
    TelescopeMatching     = { fg = colors.green, bg = colors.none, style = 'bold' },
    TelescopeBorder       = "Grey",
    TelescopePromptPrefix = "Orange",
    TelescopeSelection    = "Grey",

    -- gitsigns | gitgutter
    diffAdded     = "Green",
    diffRemoved   = "Red",
    diffChanged   = "Blue",
    diffOldFile   = "Yellow",
    diffNewFile   = "Orange",
    diffFile      = "Aqua",
    diffLine      = "Grey",
    diffIndexLine = "Purple",
}

highlight(PredefinedColors)
highlight(UI)
highlight(Syntax)
highlight(App)
