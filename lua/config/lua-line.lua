local ll = require("lualine")
local navic = require("nvim-navic")

local function lsp_status()
	local msg = ""
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

local function database_status()
	return vim.fn["db_ui#statusline"]({ show = { "db_name", "schema", "table" }, separator = "  " })
end

ll.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end,
			},
		},
		lualine_x = {
			{
				"lsp_progress",
				separators = {
					component = " ",
					progress = " | ",
					percentage = { pre = "", post = "%% " },
					title = { pre = "", post = ": " },
					lsp_client_name = { pre = "[", post = "]" },
					spinner = { pre = "", post = "" },
					message = { commenced = "In Progress", completed = "Completed" },
				},
				display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
				timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
				spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
			},
			{
				lsp_status,
				icon = " ",
			},
			{
				database_status,
				icon = " ",
			},
			"filetype",
		},
		lualine_y = { "encoding", "fileformat" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
