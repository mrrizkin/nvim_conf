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
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("config.lsp")
        end
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end
    }

    use "nvim-treesitter/playground"

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("config.telescope")
        end
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cmd = "Telescope"
    }
    use {
        "nvim-telescope/telescope-media-files.nvim",
        cmd = "Telescope"
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
        config = function()
            require("config.nvimcmp")
        end
    }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("config.luasnip")
        end
    }

    use {
        "rafamadriz/friendly-snippets",
        requires = "L3MON4D3/LuaSnip",
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }

    -- gitsign
    use {
        "lewis6991/gitsigns.nvim",
        requires = "plenary.nvim",
        config = function()
            require("config.gitsigns")
        end
    }

    -- nvim comment
    use {
        "terrortylor/nvim-comment",
        config = function()
            require("config.nvim_comment")
        end
    }

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.tree")
        end
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end
    }

    use {
        "doums/darcula",
        config = function ()
            vim.cmd [[colorscheme darcula]]
        end
    }

    use "tpope/vim-fugitive"

    use "andymass/vim-matchup"

    use {
        "norcalli/nvim-colorizer.lua",
        config = function ()
            require("colorizer").setup()
        end
    }

    use "terryma/vim-multiple-cursors"

    use "voldikss/vim-floaterm"

    use "lifepillar/vim-colortemplate"

end)
