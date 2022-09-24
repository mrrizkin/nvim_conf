local present, telescope = pcall(require, "telescope")

if not present then
	return false
end

local sorters = require("telescope.sorters")

telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		file_ignore_patterns = { "^public/", "%.png", "%.jpeg", "%.jpg" },
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	},
})

telescope.load_extension("media_files")
telescope.load_extension("fzy_native")
telescope.load_extension("luasnip")
