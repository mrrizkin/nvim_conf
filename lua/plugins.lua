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
    use {
        "wbthomason/packer.nvim",
        opt = true
    }

    -- plenary
    use {
        "nvim-lua/plenary.nvim",
        module = "plenary",
        opt = true
    }

    -- popup
    use {
        "nvim-lua/popup.nvim",
        module = "popup",
        requires = { "nvim-lua/plenary.nvim" },
        opt = true
    }

    use {
        "williamboman/nvim-lsp-installer",
        requires = { "neovim/nvim-lspconfig", "lukas-reineke/lsp-format.nvim" },
        config = "require('config.lsp')"
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = "require('config.treesitter')"
    }

    use "nvim-treesitter/playground"

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = "require('config.telescope')"
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-telescope/telescope-symbols.nvim"

    use {
        "renerocksai/telekasten.nvim",
        requires = "renerocksai/calendar-vim",
        config = "require('config.zettelkasten')"
    }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim"
        },
        config = "require('config.nvim-cmp')"
    }

    use {
        "L3MON4D3/LuaSnip",
        config = "require('config.lua-snip')"
    }

    use {
        "rafamadriz/friendly-snippets",
        requires = "L3MON4D3/LuaSnip",
        config = "require('luasnip.loaders.from_vscode').lazy_load()"
    }

    -- gitsign
    use {
        "lewis6991/gitsigns.nvim",
        requires = "plenary.nvim",
        config = "require('config.gitsigns')"
    }

    use {
        "numToStr/Comment.nvim",
        config = "require('Comment').setup()"
    }

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        requires = "kyazdani42/nvim-web-devicons",
        config = "require('config.nvim-tree')"
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = "require('config.lua-line')"
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = "require('nvim-autopairs').setup()"
    }

    use {
        "doums/darcula",
        config = function ()
            vim.cmd [[colorscheme darcula
              hi tklink ctermfg=65 guifg=#629755 cterm=underline gui=underline
              hi tkBrackets guifg=#606060
              hi tkHighlight ctermbg=220 ctermfg=235 cterm=bold guibg=#FFEF28 guifg=#2b2b2b gui=bold
              hi link CalNavi CalRuler
              hi tkTagSep ctermfg=248 guifg=#A4A3A3
              hi tkTag ctermfg=180 guifg=#E8BF6A
              highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
              highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
              highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
              highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

              sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
              sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
              sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
              sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
            ]]
        end
    }

    use "tpope/vim-fugitive"

    use "andymass/vim-matchup"

    use {
        "norcalli/nvim-colorizer.lua",
        config = "require('colorizer').setup()"
    }

    use "terryma/vim-multiple-cursors"

    use "voldikss/vim-floaterm"

end)
