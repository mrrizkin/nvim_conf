require("formatter").setup({
	logging = false,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		astro = {
			require("formatter.filetypes.javascript").prettierd,
		},
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		scss = {
			require("formatter.filetypes.css").prettierd,
		},
		sass = {
			require("formatter.filetypes.css").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
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
		terraform = {
			require("formatter.filetypes.terraform").terraform_fmt,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
			require("formatter.filetypes.go").goimports,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		sql = {
			require("formatter.filetypes.sql").pgformat,
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		dart = {
			require("formatter.filetypes.dart").dartformat,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
