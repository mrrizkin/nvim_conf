vim.api.nvim_command("packadd packer.nvim")

local present, _ = pcall(require, "packer_init")
local packer

if present then
  packer = require("packer")
else
  return false
end

local use = packer.use

return packer.startup(function()
  use({
    "nvim-lua/plenary.nvim",
    module = "plenary",
    opt = true
  })

  use({
    "nvim-lua/popup.nvim",
    module = "popup",
    requires = { "nvim-lua/plenary.nvim" },
    opt = true,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    opt = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "lua", "html", "css", "scss", "typescript" },
        highlight = { enable = true, use_languagetree = true },
      })
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
      require("config.lsp")
    end,
  })

  use({ "puremourning/vimspector" })

  use({
    "neoclide/coc.nvim",
    branch = "release"
  })

  use({
    'glepnir/lspsaga.nvim',
    event = "BufRead",
    after = "nvim-lspconfig",
    config = function()
      require("config.saga")
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    event = "BufRead",
    config = function()
      require("telescope").setup({
        pickers = {
          buffers = {
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
              },
              n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
              }
            }
          },
          find_files = {
            theme = "dropdown",
            previewer = false,
          }
        },
      })
    end
  })

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cmd = "Telescope",
  })

  use({
    "nvim-telescope/telescope-media-files.nvim",
    cmd = "Telescope"
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = "plenary.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end,
  })

  use({ "tpope/vim-fugitive", cmd = { "Git" } })

  use({ "vimwiki/vimwiki", ft = { "vimwiki", "markdown" } })

  use({ "tools-life/taskwiki", ft = { "vimwiki", "markdown" } })

  use({
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        marker_padding = true,
        comment_empty = true,
        create_mappings = true,
        line_mapping = "gcc",
        operator_mapping = "gc",
      })
    end,
  })

  use({
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    config = function()
      require("config.zen")
    end,
  })

  use({
    "justinmk/vim-dirvish",
    requires = {
      { "kristijanhusak/vim-dirvish-git" },
      { "roginfarrer/vim-dirvish-dovish", branch = "main" }
    }
  })

  use({
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("config.tree")
    end
  })

  use({
    "voldikss/vim-floaterm",
    cmd = { "FloatermToggle", "FloatermNew", "FloatermSend" },
    config = function()
      vim.g.floaterm_keymap_toggle = "<F1>"
      vim.g.floaterm_gitcommit = "floaterm"
      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_title = 0
      vim.g.floaterm_autoclose = 1
    end,
  })

  use({
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  })

  use({
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    ft = { "css", "scss", "sass", "html", "less" },
    opt = true,
    config = function()
      require("colorizer").setup()
      vim.cmd([[ColorizerReloadAllBuffers]])
    end,
  })

  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",
          offsets = {
            {
              filetype = "NvimTree",
              text = "",
              highlight = "BG0",
              text_align = "left"
            }
          },
          close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
          right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
          left_trunc_marker = '',
          right_trunc_marker = '',
          name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
              return vim.fn.fnamemodify(buf.name, ':t:r')
            end
          end,
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = "thick",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        }
      })
    end
  })

  use({ "vim-scripts/loremipsum" })
  use({ "terryma/vim-multiple-cursors" })

  use({ "wbthomason/packer.nvim", opt = true })
end)
