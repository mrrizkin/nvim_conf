local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local navic = require("nvim-navic")
local utils = require("utils")

-- Mason settings
require("mason").setup()
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
		"phpactor",
		"eslint",
	},
})

-- LSP settings
local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	require("lsp_signature").on_attach({
		bind = true,
		hint_enable = false,
		handler_opts = {
			border = "rounded",
		},
	})
end

utils.autoload_lsp(lspconfig, {
	"pyright",
	"astro",
	"eslint",
	"html",
	"emmet_ls",
	"phpactor",
	"tsserver",
"arduino_language_server",
"dockerls",
"docker_compose_language_service",
"dockerls",
}, {
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy"] = true,
				},
			},
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			staticcheck = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "rust" },
	root_dir = lspconfig.util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})

-- Diagnostics settings
utils.set_diagnostic_sign({
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
})

vim.diagnostic.config({
	underline = true,
	float = {
		show_header = true,
		source = "if_many",
		border = "rounded",
		focusable = false,
	},
})
