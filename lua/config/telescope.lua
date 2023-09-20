local present, telescope = pcall(require, "telescope")

if not present then
	return false
end

local sorters = require("telescope.sorters")

telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "   ",
		layout_config = {
			prompt_position = "top",
			width = 0.4,
			height = 0.9,
		},
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_ignore_patterns = { "node_modules", ".git", "^public/", "%.png", "%.jpeg", "%.jpg" },
		max_results = 100,
		preview = false,
	},
	pickers = {
		live_grep = {
			layout_config = {
				width = 0.7,
				height = 0.7,
			},
			preview = true,
		},
		find_files = {
			layout_config = {
				width = 0.6,
				height = 0.7,
			},
			preview = true,
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		live_grep_args = {
			layout_config = {
				width = 0.9,
				height = 0.9,
			},
			preview = true,
		},
	},
})

telescope.load_extension("media_files")
telescope.load_extension("fzy_native")
telescope.load_extension("luasnip")
