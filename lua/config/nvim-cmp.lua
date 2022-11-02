local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
		["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		-- { name = "copilot" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				-- copilot = "[cop]",
				path = "[path]",
				luasnip = "[snip]",
			},
			-- before = function(entry, vim_item)
			-- 	vim_item.kind = lspkind.presets.default[vim_item.kind]
			-- 	if entry.source.name == "copilot" then
			-- 		vim_item.kind = ""
			-- 	end
			-- 	return vim_item
			-- end,
		}),
	},
	-- experimental = {
	-- 	ghost_text = true,
	-- },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
