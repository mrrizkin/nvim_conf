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
  use {
    'nvim-lua/plenary.nvim',
    module = 'plenary',
    opt = true
  }

  use { 
    'nvim-lua/popup.nvim',
    module = 'popup',
    requires = { 'nvim-lua/plenary.nvim' },
    opt = true
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'config.treesitter'
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    requires = 'honza/vim-snippets'
  }

  use {
    'nvim-telescope/telescope.nvim',
    event = 'BufRead',
    config = function()
      require 'config.telescope'
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cmd = 'Telescope'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    cmd = 'Telescope'
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'plenary.nvim',
    event = 'BufRead',
    config = function()
      require 'config.gitsigns'
    end
  }

  use {
    'tpope/vim-fugitive',
    cmd = { 'Git' }
  }

  use {
    'terrortylor/nvim-comment',
    config = function()
      require 'nvim_comment'.setup({
        marker_padding = true,
        comment_empty = true,
        create_mappings = true,
        line_mapping = 'gcc',
        operator_mapping = 'gc'
      })
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'config.tree'
    end
  }

  use {
    'andymass/vim-matchup',
    event = 'CursorMoved',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'config.autopairs'
    end
  }

  use 'terryma/vim-multiple-cursors'

  use {
    'wbthomason/packer.nvim',
    opt = true
  }

end)
