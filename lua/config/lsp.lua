local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp_nvim_lsp")
local lsp_format = require("lsp-format")

vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "sumneko_lua" then
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
                    }
                }
            }
        }
    end

    if server.name == "gopls" then
        opts = {
            on_attach = lsp_format.on_attach
        }
    end

    -- support lsp completion
    opts.capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
