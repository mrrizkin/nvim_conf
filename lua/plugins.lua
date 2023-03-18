vim.api.nvim_command("packadd packer.nvim")

local present, _ = pcall(require, "packer_init")
local packer

if present then
	packer = require("packer")
else
	return false
end

local use = packer.use

-- plugins
return packer.startup(function()
	-- packer
	use({
		"wbthomason/packer.nvim",
		opt = true,
	})

	-- plenary
	use({
		"nvim-lua/plenary.nvim",
		module = "plenary",
		opt = true,
	})

	-- popup
	use({
		"nvim-lua/popup.nvim",
		module = "popup",
		requires = { "nvim-lua/plenary.nvim" },
		opt = true,
	})

	-- lsp
	use({
		"williamboman/mason.nvim",
		requires = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
		config = "require('config.lsp')",
	})

	-- lsp-signature
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- formatter
	use({
		"mhartington/formatter.nvim",
		config = "require('config.formatter')",
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = "require('config.treesitter')",
	})

	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = "require('config.nvim-gpsconfig')",
	})
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = "require('config.telescope')",
	})
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-symbols.nvim")
	use({
		"benfowler/telescope-luasnip.nvim",
		module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	})

	-- copilot
	use({
		"github/copilot.vim",
		config = "require('config.nvim-copilot')",
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
		},
		config = "require('config.nvim-cmp')",
	})

	use({
		"L3MON4D3/LuaSnip",
		config = "require('config.lua-snip')",
	})

	-- gitsign
	use({
		"lewis6991/gitsigns.nvim",
		requires = "plenary.nvim",
		config = "require('config.gitsigns')",
	})

	use({
		"numToStr/Comment.nvim",
		config = "require('Comment').setup()",
	})

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		requires = "kyazdani42/nvim-web-devicons",
		config = "require('config.nvim-tree')",
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = "require('config.lua-line')",
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = "require('nvim-autopairs').setup()",
	})

	use({
		"olivercederborg/poimandres.nvim",
		config = "require('config.nvim-poimandres')",
	})

	use({
		"rmehri01/onenord.nvim",
		config = "require('config.nvim-onenord')",
	})

	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = "tpope/vim-dadbod",
		config = "require('config.nvim-dadbod')",
	})

	-- dadbod completion
	use({
		"kristijanhusak/vim-dadbod-completion",
		requires = "kristijanhusak/vim-dadbod-ui",
	})

	use({
		"folke/which-key.nvim",
		config = "require('config.nvim-wkey')",
	})

	use("tpope/vim-fugitive")

	use("andymass/vim-matchup")

	use("preservim/tagbar")

	use({
		"norcalli/nvim-colorizer.lua",
		config = "require('colorizer').setup(nil, { css = true })",
	})

	use("terryma/vim-multiple-cursors")

	use({
		"kylechui/nvim-surround",
		config = "require('nvim-surround').setup({})",
	})

	use("voldikss/vim-floaterm")

	use({
		"rcarriga/nvim-notify",
		config = "require('config.noty')",
	})
end)
