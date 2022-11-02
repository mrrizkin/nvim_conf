local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

-- NOTE: tsserver error when using nvim-lsp-installer
require("nvim-lsp-installer").setup({
	ensure_installed = {
		"emmet_ls",
		"gopls",
		"html",
		"pyright",
		"rust_analyzer",
		"sumneko_lua",
		-- "tsserver"
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

local on_attach = function()
	require("lsp_signature").on_attach({
		doc_lines = 0,
		handler_opts = {
			border = "none",
		},
	})
end

lspconfig.sumneko_lua.setup({
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
