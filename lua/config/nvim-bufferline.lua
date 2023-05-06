local opts = {
	diagnostics = "nvim_lsp",
	offsets = {
		{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "center",
		},
	},
}

require("bufferline").setup({
	options = opts,
})
