local utils = require("utils")
local set = utils.set

local plugins = {
	"andymass/vim-matchup",
	"github/copilot.vim",
	"preservim/tagbar",
	"ray-x/lsp_signature.nvim",
	"terryma/vim-multiple-cursors",
	"tpope/vim-fugitive",
	"voldikss/vim-floaterm",
	"nvim-lua/plenary.nvim",
	{
		"nvim-lua/popup.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("config.lsp")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("config.formatter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("config.nvim-naviconfig")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"benfowler/telescope-luasnip.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("config.telescope")
		end,
	},
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("config.nvim-flutter")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("config.lua-snip")
		end,
	},
	{
		"olexsmir/gopher.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "plenary.nvim",
		config = function()
			require("config.gitsigns")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		config = function()
			require("config.lua-line")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccino",
		priority = 1000,
		config = function()
			require("config.nvim-catppuccin")
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = "tpope/vim-dadbod",
		config = function()
			set("db_ui_save_location", "~/.config/nvim/db_ui")
			set("db_ui_use_nerd_fonts", 1)
			set("db_ui_win_position", "right")
			set("vim.g.db_ui_icons", {
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
			})
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = "kristijanhusak/vim-dadbod-ui",
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup(nil, { css = true })
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("config.noty")
		end,
	},
}

return plugins
