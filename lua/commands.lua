local cmd = vim.cmd
local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Packer
cmd([[command! PackerInstall packadd packer.nvim | lua require("plugins").install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require("plugins").update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require("plugins").sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require("plugins").clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require("plugins").compile()]])

-- Reload neovim
cmd([[command! Reload source $MYVIMRC | redraw!]])

-- Format using LSP
cmd([[command! FormatLSP lua vim.lsp.buf.formatting()]])

-- Abbrev
cmd([[cnoreabbrev W! w!]])
cmd([[cnoreabbrev Q! q!]])
cmd([[cnoreabbrev Qall! qall!]])
cmd([[cnoreabbrev Wq wq]])
cmd([[cnoreabbrev Wa wa]])
cmd([[cnoreabbrev wQ wq]])
cmd([[cnoreabbrev WQ wq]])
cmd([[cnoreabbrev W w]])
cmd([[cnoreabbrev Q q]])
cmd([[cnoreabbrev Qall qall]])

local format_auto_group = augroup("FormatAutogroup", { clear = true })
autocmd("BufWritePost", { pattern = "*", command = "silent! FormatWrite", group = format_auto_group })

local trim_trailing_white_space = augroup("TrimTrailingWhiteSpace", { clear = true })
autocmd("BufWritePre", { pattern = "*", command = [[%s/\s\+$//e]], group = trim_trailing_white_space })
autocmd("BufWritePre", { pattern = "*", command = [[%s/\n\+\%$//e]], group = trim_trailing_white_space })
