local g = vim.g
local utils = require("utils")
local map = utils.map

-- leader/local leader
map("", "<Space>", "<Nop>", { silent = true })
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- skip some remote provider loading
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python"
g.node_host_prog = "~/.local/npm/bin/neovim-node-host"

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
    "zipPlugin"
}
for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Settings
require("settings")
require("commands")
require("keymaps")
require("snippets")

-- Plugins Settings
g.floaterm_keymap_toggle = "<F10>"
g.matchup_matchparen_offscreen = { method = "popup" }
