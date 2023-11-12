local utils = require("utils")
local map = utils.map
local set = utils.set

-- leader/local leader
map("", "<Space>", "<Nop>", { silent = true })
set("mapleader", " ")
set("maplocalleader", ",")

-- skip some remote provider loading
set("loaded_python_provider", 0)
set("loaded_ruby_provider", 0)
set("loaded_perl_provider", 0)
set("python_host_prog", "/usr/bin/python2")
set("python3_host_prog", "/usr/bin/python")

-- set to false if you don't use nvm
utils.node_neovim_host(true)

-- disable built-in plugins
utils.disable_builtins({
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
})

-- Settings
require("lazy_init")
require("settings")
require("commands")
require("keymaps")

-- Plugins Settings
set("floaterm_keymap_toggle", "<F10>")
set("floaterm_borderchars", "─│─│╭╮╯╰")
set("floaterm_position", "bottomright")
set("floaterm_width", 0.9)
set("floaterm_height", 0.9)
set("matchup_matchparen_offscreen", { method = "popup" })
