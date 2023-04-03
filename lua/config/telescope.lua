local present, telescope = pcall(require, "telescope")

if not present then
	return false
end

local sorters = require("telescope.sorters")

telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
	},
	pickers = {
		live_grep = {
			theme_config = {
				border = true,
				previewer = false,
			},
			layout_config = {
				width = 0.9,
				height = 0.9,
				prompt_position = "top",
			},
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			file_ignore_patterns = { "node_modules", ".git", "^public/", "%.png", "%.jpeg", "%.jpg" },
			max_results = 100,
		},
		find_files = {
			theme_config = {
				border = true,
				previewer = false,
			},
			layout_config = {
				width = 0.9,
				height = 0.9,
				prompt_position = "top",
			},
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			file_ignore_patterns = { "node_modules", ".git", "^public/", "%.png", "%.jpeg", "%.jpg" },
			max_results = 100,
		},
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
