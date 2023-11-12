local opt = require("utils").opt
local o, wo, bo = vim.o, vim.wo, vim.bo

local buffer = { o, bo }
local window = { o, wo }

-- opt("guicursor", true)
opt("mouse", "nivh")
opt("background", "dark")
opt("undofile", true, buffer)
opt("synmaxcol", 200, buffer)
opt("confirm", true)
opt("lazyredraw", true)
opt("showmatch", true)
opt("hlsearch", false)
opt("incsearch", true)
opt("ignorecase", true)
opt("smartcase", true)
opt("expandtab", true, buffer)
opt("smarttab", true)
opt("smartindent", true, buffer)
opt("tabstop", 2, buffer)
opt("softtabstop", 2, buffer)
opt("shiftwidth", 2, buffer)
opt("splitbelow", true)
opt("number", true, window)
opt("cursorline", false, window)
opt("relativenumber", true, window)
opt("numberwidth", 3, window)
opt("signcolumn", "yes:1", window)
opt("colorcolumn", "81", window)
opt("laststatus", 3)
opt("completeopt", "menu,menuone,noselect")
opt("clipboard", o.clipboard .. "unnamedplus")
opt("showmode", false)
opt("showcmd", true)
opt("ruler", true)
opt("hidden", true)
opt("swapfile", false, buffer)
opt("backup", false)
opt("writebackup", false)
opt("termguicolors", true)
opt("updatetime", 50)
opt("scrolloff", 8)
opt("list", false, window)
opt("listchars", "eol:¬,tab:▏ ,trail:~,extends:>,precedes:<,nbsp:␣")
opt("modeline", false, buffer)
opt("timeoutlen", 300)
opt("shortmess", o.shortmess .. "csI")
opt("wildignore", "*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite")
opt("foldmethod", "expr", window)
opt("foldcolumn", "auto:3", window)
opt("foldexpr", "nvim_treesitter#foldexpr()", window)
