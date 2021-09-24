vim.api.nvim_command('packadd packer.nvim')

local present, _ = pcall(require, 'packer_init')
local packer

if present then
	packer = require 'packer'
else
	return false
end

local use = packer.use

return packer.startup(function()
	use { 'nvim-lua/plenary.nvim'
		, module = 'plenary'
		, opt = true
		}

	use { 'nvim-lua/popup.nvim'
		, module = 'popup'
		, requires = { 'nvim-lua/plenary.nvim' }
		, opt = true
		}

	use { 'nvim-treesitter/nvim-treesitter'
		, run = ':TSUpdate'
		, config = function()
				       require 'config.treesitter'
				   end
		}

	use { 'neovim/nvim-lspconfig'
		, event = 'BufRead'
		, config = function()
					   require 'config.lsp'
				   end
		}

	use { 'hrsh7th/nvim-cmp'
		, requires =
			{ 'hrsh7th/vim-vsnip'
			, 'hrsh7th/cmp-buffer'
			, 'hrsh7th/cmp-nvim-lsp'
			, 'saadparwaiz1/cmp_luasnip'
			, 'L3MON4D3/LuaSnip'
			}
		, config = function()
					   require 'config.cmp'
			       end
		}

	use { 'glepnir/lspsaga.nvim'
		, event = 'BufRead'
		, after = 'nvim-lspconfig'
		, config = function()
					   require 'config.saga'
				   end
		}

	use { 'nvim-telescope/telescope.nvim'
		, event = 'BufRead'
		, config = function()
					   require 'config.telescope'
				   end
		}

	use { 'nvim-telescope/telescope-fzf-native.nvim'
		, run = 'make'
		, cmd = 'Telescope'
		}

	use { 'nvim-telescope/telescope-media-files.nvim'
		, cmd = 'Telescope'
		}

	use { 'lewis6991/gitsigns.nvim'
		, requires = 'plenary.nvim'
		, event = 'BufRead'
		, config = function()
					   require 'config.gitsigns'
				   end
		}

	use { 'tpope/vim-fugitive'
		, cmd = { 'Git' }
		}

	use { 'terrortylor/nvim-comment'
		, config = function()
					   require 'nvim_comment'.setup(
						  { marker_padding = true
						  , comment_empty = true
						  , create_mappings = true
						  , line_mapping = 'gcc'
						  , operator_mapping = 'gc'
						  })
				   end
		}

	use { 'Pocco81/TrueZen.nvim'
		, cmd =
			{ 'TZAtaraxis'
			, 'TZMinimalist'
			, 'TZFocus'
			}
		, config = function()
					   require 'config.zen'
				   end
		}

	use { 'justinmk/vim-dirvish'
		, requires =
			{ { 'kristijanhusak/vim-dirvish-git' }
			, { 'roginfarrer/vim-dirvish-dovish', branch = 'main' }
			}
		}

	use { 'kyazdani42/nvim-tree.lua'
		, cmd = 'NvimTreeToggle'
		, requires = 'kyazdani42/nvim-web-devicons'
		, config = function()
					   require 'config.tree'
				   end
		}

	use { 'voldikss/vim-floaterm'
		, cmd = { 'FloatermToggle', 'FloatermNew', 'FloatermSend' }
		, config = function()
					   vim.g.floaterm_keymap_toggle = '<F1>'
					   vim.g.floaterm_gitcommit = 'floaterm'
					   vim.g.floaterm_autoinsert = 1
					   vim.g.floaterm_width = 0.8
					   vim.g.floaterm_height = 0.8
					   vim.g.floaterm_title = 0
					   vim.g.floaterm_autoclose = 1
				   end
	}

	use { 'andymass/vim-matchup'
		, event = 'CursorMoved'
		, config = function()
					   vim.g.matchup_matchparen_offscreen =
					       { method = 'popup'
					       }
				   end
		}

	use 'terryma/vim-multiple-cursors'

	use 'digitaltoad/vim-pug'

	use { 'wbthomason/packer.nvim'
		, opt = true
		}
end)
