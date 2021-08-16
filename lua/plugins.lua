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

    use({ "nvim-lua/popup.nvim", after = "plenary.nvim", module = "popup", opt = true, })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead",
        opt = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "lua" },
                highlight = { enable = true, use_languagetree = true },
            })
        end,
    })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            local function on_attach(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local function buf_set_option(...)
                    vim.api.nvim_buf_set_option(bufnr, ...)
                end

                -- Enable completion triggered by <c-x><c-o>
                buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

                -- Mappings.
                local opts = { noremap = true, silent = true }

                buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

                -- GoTo code navigation
                buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
                buf_set_keymap(
                "n",
                "gy",
                "<cmd>lua vim.lsp.buf.type_definition()<CR>",
                opts
                )
                buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            end
            lspconfig.bashls.setup({
                on_attach = on_attach,
                flags = { debounce_text_changes = 150 },
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                flags = { debounce_text_changes = 150 },
            })

            lspconfig.elmls.setup({
                on_attach = function(client, bufnr)
                    client.resolved_capabilities.document_formatting = false
                    on_attach(client, bufnr)
                end,
                flags = { debounce_text_changes = 150 },
            })

            lspconfig.sumneko_lua.setup({
                cmd = { "lua-language-server" },
                root_dir = vim.loop.cwd,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                    },
                },
                on_attach = function(client, bufnr)
                    client.resolved_capabilities.document_formatting = false
                    on_attach(client, bufnr)
                end,
                flags = { debounce_text_changes = 150 },
            })

            lspconfig.tsserver.setup({
                on_attach = function(client, bufnr)
                    client.resolved_capabilities.document_formatting = false
                    on_attach(client, bufnr)
                end,
                flags = { debounce_text_changes = 150 },
            })

            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                flags = { debounce_text_changes = 150 },
            })
        end,
    })

    use({ "nvim-telescope/telescope.nvim" })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope", })

    use({ "nvim-telescope/telescope-media-files.nvim", cmd = "Telescope" })

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
            require("true-zen").setup({
                ui = {
                    bottom = {
                        laststatus = 0,
                        ruler = false,
                        showmode = false,
                        showcmd = false,
                        cmdheight = 1,
                    },
                    top = { showtabline = 0 },
                    left = {
                        number = false,
                        relativenumber = false,
                        signcolumn = "no",
                    },
                },
                modes = {
                    ataraxis = {
                        left_padding = 32,
                        right_padding = 32,
                        top_padding = 1,
                        bottom_padding = 1,
                        ideal_writing_area_width = { 0 },
                        just_do_it_for_me = true,
                        keep_default_fold_fillchars = true,
                        custome_bg = "",
                        bg_configuration = true,
                        affected_higroups = {
                            NonText = {},
                            FoldColumn = {},
                            ColorColumn = {},
                            VertSplit = {},
                            StatusLine = {},
                            StatusLineNC = {},
                            SignColumn = {},
                        },
                    },
                    focus = { margin_of_error = 5, focus_method = "experimental" },
                },
                integrations = {
                    vim_gitgutter = false,
                    galaxyline = true,
                    tmux = true,
                    gitsigns = true,
                    nvim_bufferline = true,
                    limelight = false,
                    vim_airline = false,
                    vim_powerline = false,
                    vim_signify = false,
                    express_line = false,
                    lualine = false,
                },
                misc = {
                    on_off_commands = false,
                    ui_elements_commands = false,
                    cursor_by_mode = false,
                },
            })
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
        cmd = "FloatermToggle",
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
