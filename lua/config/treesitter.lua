local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return false
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

---@diagnostic disable-next-line: inject-field
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

---@diagnostic disable-next-line: missing-fields
ts_config.setup({
	ensure_installed = {
		"go",
		"rust",
		"lua",
		"javascript",
		"typescript",
		"php",
		"css",
		"html",
		"astro",
		"blade",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
