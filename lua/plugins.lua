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
    use({ "nvim-lua/plenary.nvim", module = "plenary", opt = true })

    use({ "nvim-lua/popup.nvim", module = "popup", requires = { "nvim-lua/plenary.nvim" }, opt = true, })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead",
        opt = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "lua" },
                highlight = { enable = true, use_languagetree = true },
                indent = { enable = true },
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

    -- she said it's fast as fuck
    use({
        'ms-jpq/coq_nvim',
        branch = 'coq',
        config = function()
            vim.g.coq_settings = {
                auto_start= "shut-up",
                keymap = {
                    jump_to_mark = "<A-h>"
                }
            }
        end
    }) -- main one
    use({ 'ms-jpq/coq.artifacts', branch= 'artifacts'}) -- 9000+ Snippets

    use({
        'glepnir/lspsaga.nvim',
        event = "BufRead",
        after = "nvim-lspconfig",
        config = function()
            require("config.saga")
        end
    })

    use({ "nvim-telescope/telescope.nvim", event = "BufRead" })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope", })

    use({ "nvim-telescope/telescope-media-files.nvim", cmd = "Telescope" })

    use({
        "lewis6991/gitsigns.nvim",
        requires = "plenary.nvim",
        event = "BufRead",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
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
        "NTBBloodbath/rest.nvim",
        ft = { "http" },
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local u = require("utils")
            local ntst = { noremap = true, silent = true }
            require("rest-nvim").setup({ result_split_horizontal = false })
            u.keymap(
                "n",
                "<leader>rn",
                "<cmd>lua require('rest-nvim').run()<CR>",
                ntst
            )
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

    use({ "wbthomason/packer.nvim", opt = true })
end)
