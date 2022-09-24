require("formatter").setup({
	logging = false,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		html = {
			require("formatter.filetypes.javascript").prettierd,
		},
		css = {
			require("formatter.filetypes.javascript").prettierd,
		},
		json = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
	},
})
