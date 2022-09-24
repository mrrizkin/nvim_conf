local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return false
end

ts_config.setup({
	ensure_installed = { "go", "rust", "lua", "javascript", "typescript", "php", "css", "html", "astro" },
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
