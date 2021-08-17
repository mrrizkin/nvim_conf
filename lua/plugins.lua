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
        requires = { "glepnir/lspsaga.nvim" },
        config = function()
            local nvim_lsp = require("lspconfig")

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
                buf_set_keymap('n', 'gD',         [[<Cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
                buf_set_keymap('n', 'gd',         [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts)
                buf_set_keymap('n', 'K',          [[<Cmd>Lspsaga hover_doc<CR>]], opts)
                buf_set_keymap('n', '<C-f>',      [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
                buf_set_keymap('n', '<C-b>',      [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
                buf_set_keymap('n', 'gi',         [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
                buf_set_keymap('i', '<C-k>',      [[<cmd>Lspsaga signature_help<CR>]], opts)
                buf_set_keymap('n', '<C-k>',      [[<cmd>Lspsaga signature_help<CR>]], opts)
                buf_set_keymap('n', '<leader>wa', [[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], opts)
                buf_set_keymap('n', '<leader>wr', [[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]], opts)
                buf_set_keymap('n', '<leader>wl', [[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], opts)
                buf_set_keymap('n', '<leader>D',  [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)
                buf_set_keymap('n', '<leader>rn', [[<cmd>Lspsaga rename<CR>]], opts)
                buf_set_keymap('n', 'gr',         [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
                buf_set_keymap('n', '<leader>ca', [[<cmd>Lspsaga code_action<CR>]], opts)
                buf_set_keymap('v', '<leader>ca', [[<cmd><C-U>Lspsaga range_code_action<CR>]], opts)
                buf_set_keymap('n', '<leader>ld', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], opts)
                buf_set_keymap('n', '[d',         [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opts)
                buf_set_keymap('n', ']d',         [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opts)
                buf_set_keymap('n', '<leader>q',  [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]], opts)
                buf_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
                vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

                if client.resolved_capabilities.document_formatting then
                    vim.api.nvim_command([[augroup Formatter]])
                    vim.api.nvim_command([[autocmd! * <buffer>]])
                    vim.api.nvim_command([[autocmd BufWritePre lua vim.lsp.buf.formatting_seq_sync(nil, 500)]])
                    vim.api.nvim_command([[augroup END]])
                end
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local servers = { 'bashls', 'html', 'cssls', 'elmls', 'tsserver', 'rust_analyzer' }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    flags = { debounce_text_changes = 150 },
                }
            end

            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, 'lua/?.lua')
            table.insert(runtime_path, 'lua/?/init.lua')

            nvim_lsp.sumneko_lua.setup({
                cmd = { "lua-language-server" },
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = vim.loop.cwd,
                flags = { debounce_text_changes = 150 },
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = runtime_path,
                        },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                    },
                },
            })
        end,
    })

    use({
        'glepnir/lspsaga.nvim',
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                use_saga_diagnostic_sign = true,
                error_sign = 'E',
                warn_sign = 'W',
                hint_sign = 'H',
                infor_sign = 'I',
                dianostic_header_icon = '   ',
                code_action_icon = ' ',
                code_action_prompt = {
                    enable = true,
                    sign = false,
                    sign_priority = 20,
                    virtual_text = true,
                },
                finder_definition_icon = '  ',
                finder_reference_icon = '  ',
                max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
                finder_action_keys = {
                    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
                },
                code_action_keys = {
                    quit = 'q',exec = '<CR>'
                },
                rename_action_keys = {
                    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
                },
                definition_preview_icon = '  ',
                border_style = "round",
                rename_prompt_prefix = '➤',
            })
        end
    })

    use({ "nvim-telescope/telescope.nvim" })

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
