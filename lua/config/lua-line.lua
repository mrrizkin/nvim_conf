local ll = require("lualine")
-- local gps = require("nvim-gps")
local navic = require("nvim-navic")

local function lsp_status()
	-- Lsp server name .
	local msg = "No Active LSP"
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
	local msg = "No Active Database"
	local db_ui = vim.fn["db_ui#statusline"]({ show = { "db_name", "schema", "table" }, separator = "  " })
	if db_ui == "" then
		db_ui = msg
	end
	return db_ui
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
				database_status,
				icon = " ",
			},
			{
				lsp_status,
				icon = " ",
			},
			"filetype",
		},
		lualine_y = { "encoding", "fileformat", "progress" },
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
