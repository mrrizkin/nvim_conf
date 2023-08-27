local g = vim.g
local utils = require("utils")
local map = utils.map

-- leader/local leader
map("", "<Space>", "<Nop>", { silent = true })
g.mapleader = " "
g.maplocalleader = ","

-- skip some remote provider loading
g.loaded_python_provider = 0
g.loaded_perl_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python"

-- uncomment if you don't use nvm
-- g.node_host_prog = "~/.local/npm/bin/neovim-node-host"

-- uncomment if you use nvm
local node_version = vim.fn.system("node --version")
g.node_host_prog = "~/.nvm/versions/node/" .. node_version .. "/bin/neovim-node-host"

-- disable built-in plugins
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
require("settings")
require("commands")
require("keymaps")

-- Plugins Settings
g.floaterm_keymap_toggle = "<F10>"
g.floaterm_borderchars = "─│─│╭╮╯╰"
g.floaterm_position = "bottomright"
g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.matchup_matchparen_offscreen = { method = "popup" }
