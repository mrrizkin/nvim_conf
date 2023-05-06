-- setup vim-dadbod
vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = "right"

vim.g.db_ui_icons = {
	expanded = {
		db = "▾ 󰆼",
		buffers = "▾ ",
		saved_queries = "▾ ",
		schemas = "▾ ",
		schema = "▾ 󰙅",
		tables = "▾ 󰓰",
		table = "▾ ",
	},
	collapsed = {
		db = "▸ 󰆼",
		buffers = "▸ ",
		saved_queries = "▸ ",
		schemas = "▸ ",
		schema = "▸ 󰙅",
		tables = "▸ 󰓰",
		table = "▸ ",
	},
	saved_query = "",
	new_query = "󰓰",
	tables = "󰓫",
	buffers = "󰆼",
	add_connection = "󱘖",
	connection_ok = "✓",
	connection_error = "✕",
}
