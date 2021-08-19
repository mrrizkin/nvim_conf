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

-- Skip some remote provider loading {{{
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python"
g.node_host_prog = "/home/wright/.local/share/npm/bin/neovim-node-host"
-- }}}

-- Disable built-in plugins {{{
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
-- }}}

-- Settings {{{
local buffer = { o, bo }
local window = { o, wo }
opt("mouse", "nivh")
opt("background", "dark")
opt("undofile", true, buffer)
opt("synmaxcol", 200, buffer)
opt("lazyredraw", true)
opt("showmatch", true)
opt("incsearch", true)
opt("ignorecase", true)
opt("smartcase", true)
opt("expandtab", true, buffer)
opt("smarttab", true)
opt("smartindent", true, buffer)
opt("tabstop", 4, buffer)
opt("softtabstop", 4, buffer)
opt("shiftwidth", 4, buffer)
opt("splitbelow", true)
opt("number", true, window)
opt("relativenumber", true, window)
opt("numberwidth", 4, window)
opt("signcolumn", "yes:1", window)
opt("laststatus", 1)
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
opt("modeline", true, buffer)
opt("modelines", 5)
opt("shortmess", o.shortmess .. "csI")
opt("wildignore", "*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite")
-- }}}

-- Commands {{{
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
cmd [[command! -nargs=? -complete=dir Vexplore leftabove 30vsplit | silent Dirvish <args>]]

autocmd("dirvish_config", {
    [[FileType dirvish setlocal nonu nornu stl=%F]],
    [[FileType dirvish nnoremap <silent><buffer> <C-r> :<C-U>Dirvish %<CR>]],
    [[FileType dirvish nnoremap <silent><buffer> gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>]],
    [[FileType dirvish nnoremap <silent><buffer> t ddO<Esc><cmd>let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>]],
    [[BufEnter * if (winnr("$") == 1 && &filetype == 'dirvish') | q | endif]]
}, true)
-- }}}

-- Global function {{{
local hidden_all = 1
_G.toggleHiddenAll = function()
    if hidden_all  == 0 then
        hidden_all = 1
        opt("showmode", true)
        opt("ruler", true)
        opt("showcmd", true)
        opt("laststatus", 0)
    else
        hidden_all = 0
        opt("laststatus", 2)
        opt("showmode", false)
        opt("ruler", false)
        opt("showcmd", false)
    end
end
-- }}}

-- Keybindings {{{
local silent = { silent = true }

map("n", "<F1>", "<cmd>FloatermToggle<cr>", silent)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", silent)

map("n", "<leader>h", "v:lua.toggleHiddenAll()", { silent = true, expr = true })

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
-- }}}

-- vim: set foldmethod=marker:
