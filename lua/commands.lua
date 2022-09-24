local cmd = vim.cmd

-- Packer
cmd([[command! PackerInstall packadd packer.nvim | lua require("plugins").install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require("plugins").update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require("plugins").sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require("plugins").clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require("plugins").compile()]])

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

cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * silent! FormatWrite
augroup END
]])

cmd([[
augroup TrimTrailingWhiteSpace
  au!
  au BufWritePre * %s/\s\+$//e
  au BufWritePre * %s/\n\+\%$//e
augroup END
]])
