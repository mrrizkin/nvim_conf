local bufferline = require("bufferline")

local opts = {
	diagnostics = "nvim_lsp",
	style_preset = {
		bufferline.style_preset.no_italic,
		bufferline.style_preset.no_bold,
	},
	diagnostics_indicator = function(_, _, diagnostics_dict)
		local s = " "
		for e, n in pairs(diagnostics_dict) do
			local sym = e == "error" and " " or (e == "warning" and " " or "")
			s = s .. n .. sym
		end
		return s
	end,
	indicator = {
		style = "underline",
	},
	offsets = {
		{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "center",
		},
	},
}

bufferline.setup({
	options = opts,
})
