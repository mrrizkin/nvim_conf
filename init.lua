local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("utils")
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader/local leader
map('', '<Space>', '<Nop>', { silent = true })
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python"
g.node_host_prog = "/home/wright/.local/share/npm/bin/neovim-node-host"

-- Disable built-in plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "matchparen",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "remote_plugins",
    "rrhelper",
    "shada_plugin",
    "spellfile_plugin",
    "tar",
    "tarPlugin",
    "tutor_mode_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Settings
local buffer = { o, bo }
local window = { o, wo }
opt("mouse", "nivh")
opt("background", "dark")
opt("undofile", true, buffer)
opt("synmaxcol", 200, buffer)
opt("confirm", true)
opt("lazyredraw", true)
opt("showmatch", true)
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
opt("cursorline", true, window)
opt("relativenumber", true, window)
opt("numberwidth", 4, window)
opt("signcolumn", "auto:1", window)
opt("laststatus", 2)
opt("completeopt", "menuone,noselect")
opt("clipboard", o.clipboard .. "unnamedplus")
opt("showmode", true)
opt("showcmd", true)
opt("ruler", true)
opt("hidden", true)
opt("swapfile", false, buffer)
opt("writebackup", false)
opt("termguicolors", true)
opt("updatetime", 500)
opt("modeline", false, buffer)
opt("shortmess", o.shortmess .. "csI")
opt("wildignore", "*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite")

-- Commands
cmd [[colorscheme everbush]]

cmd [[cnoreabbrev W! w!]]
cmd [[cnoreabbrev Q! q!]]
cmd [[cnoreabbrev Qall! qall!]]
cmd [[cnoreabbrev Wq wq]]
cmd [[cnoreabbrev Wa wa]]
cmd [[cnoreabbrev wQ wq]]
cmd [[cnoreabbrev WQ wq]]
cmd [[cnoreabbrev W w]]
cmd [[cnoreabbrev Q q]]
cmd [[cnoreabbrev Qall qall]]

cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

cmd [[command! -nargs=? -complete=dir Explore Dirvish <args>]]
cmd [[command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>]]
cmd [[command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>]]

autocmd("dirvish_config", {
  [[FileType dirvish setlocal nonu nornu stl=%F]],
  [[FileType dirvish nnoremap <silent><buffer> <C-r> :<C-U>Dirvish %<CR>]],
  [[FileType dirvish nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>]],
}, true)

-- Keybindings
local silent = { silent = true }

map("n", "<F1>", "<cmd>FloatermToggle<cr>", silent)
map("n", "<F5>", "<cmd>FloatermSend<cr>", silent)

map("n", "<leader>e", "<cmd>FloatermNew lf<cr>", silent)
map("n", "<leader>l", "<cmd>FloatermNew lazygit<cr>", silent)

map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", silent)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", silent)

-- Moving bitween windows with ease
map("n", "<c-h>", "<c-w>h", silent)
map("n", "<c-j>", "<c-w>j", silent)
map("n", "<c-k>", "<c-w>k", silent)
map("n", "<c-l>", "<c-w>l", silent)

-- Trigger completion with Ctrl + space
map("i", "<C-space>", "<C-x><C-o>", silent)
map("n", "<C-space>", "<C-x><C-o>", silent)

map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)

map("n", "<A-f>", ":fin ")

map("n", "<leader>dd", "<cmd>call vimspector#launch()<cr>", silent)
map("n", "<leader>dc", "<cmd>call GotoWindow(g:vimspector_session_window.code)<cr>", silent)
map("n", "<leader>dt", "<cmd>call GotoWindow(g:vimspector_session_window.tagpage)<cr>", silent)
map("n", "<leader>dv", "<cmd>call GotoWindow(g:vimspector_session_window.variables)<cr>", silent)
map("n", "<leader>dw", "<cmd>call GotoWindow(g:vimspector_session_window.watches)<cr>", silent)
map("n", "<leader>ds", "<cmd>call GotoWindow(g:vimspector_session_window.stack_trace)<cr>", silent)
map("n", "<leader>do", "<cmd>call GotoWindow(g:vimspector_session_window.output)<cr>", silent)
map("n", "<leader>de", "<cmd>call vimspector#Reset()<cr>", silent)

map("n", "<leader>dtcb", "<cmd>call vimspector#CleanLineBreakpoint()<cr>", silent)

map("n", "<leader>dl", "<plug>VimspectorStepInto", { silent = true, noremap = false })
map("n", "<leader>dj", "<plug>VimspectorStepOver", { silent = true, noremap = false })
map("n", "<leader>dk", "<plug>VimspectorStepOut", { silent = true, noremap = false })
map("n", "<leader>d_", "<plug>VimspectorRestart", { silent = true, noremap = false })
map("n", "<leader>d<space>", "<cmd>call vimspector#Continue()<cr>", silent)

map("n", "<leader>drc", "<plug>VimspectorRunToCursor", { silent = true, noremap = false })
map("n", "<leader>dbp", "<plug>VimspectorToogleBreakpoint", { silent = true, noremap = false })
map("n", "<leader>dcbp", "<plug>VimspectorToogleConditionalBreakpoint", { silent = true, noremap = false })
