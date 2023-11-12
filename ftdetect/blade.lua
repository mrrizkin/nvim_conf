local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local blade_group = augroup("BladeFileRelated", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.blade.php",
	group = blade_group,
	callback = function()
		vim.opt.filetype = "blade"
	end,
})
