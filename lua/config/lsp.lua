local nvim_lsp = require("lspconfig")
require("packer").loader("coq_nvim coq.artifacts")

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
        vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
        vim.api.nvim_command([[augroup END]])
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { 'bashls', 'html', 'cssls', 'elmls', 'tsserver', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(
        require("coq")().lsp_ensure_capabilities({
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
        })
    )
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup(
    require("coq")().lsp_ensure_capabilities({
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
)
