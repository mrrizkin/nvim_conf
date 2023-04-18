local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local navic = require("nvim-navic")

require("mason").setup()

-- NOTE: tsserver error when using nvim-lsp-installer
require("mason-lspconfig").setup({
	ensure_installed = {
		"emmet_ls",
		"gopls",
		"html",
		"pyright",
		"rust_analyzer",
		"lua_ls",
		"tsserver",
		"astro",
		"intelephense",
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	underline = true,
	-- virtual_text = true,
	float = {
		show_header = true,
		source = "if_many",
		border = "rounded",
		focusable = false,
	},
	-- signs = true,
})

local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	require("lsp_signature").on_attach({
		doc_lines = 0,
		floating_window = false,
		handler_opts = {
			border = "none",
		},
	})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.intelephense.setup({ capabilities = capabilities, filetypes = { "php", "blade" }, on_attach = on_attach })
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "blade" },
	on_attach = on_attach,
})
lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.astro.setup({ capabilities = capabilities, on_attach = on_attach })
