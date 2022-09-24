local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local astro_file_type = augroup("AstroFileType", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.astro", command = "setfiletype astro", group = astro_file_type })
