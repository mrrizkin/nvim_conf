local o_s = vim.o
local map_key = vim.api.nvim_set_keymap

local M = {}

M.opt = function(o, v, scopes)
	scopes = scopes or { o_s }
	for _, s in ipairs(scopes) do
		s[o] = v
	end
end

M.set = function(key, value)
	vim.g[key] = value
end

M.map = function(modes, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = opts.noremap == nil and true or opts.noremap
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		map_key(mode, lhs, rhs, opts)
	end
end

M.highlight = function(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

M.node_neovim_host = function(nvm)
	if nvm == true then
		local node_version = vim.fn.system("node --version")
		node_version = string.sub(node_version, 1, -2)
		M.set("node_host_prog", "~/.nvm/versions/node/" .. node_version .. "/bin/neovim-node-host")
		return
	end
	M.set("node_host_prog", "~/.local/npm/bin/neovim-node-host")
end

M.disable_builtins = function(plugins)
	for _, plugin in pairs(plugins) do
		M.set("loaded_" .. plugin, 1)
	end
end

M.autoload_lsp = function(lspconf, lsps, config)
	for _, lsp in pairs(lsps) do
		lspconf[lsp].setup(config)
	end
end

M.set_diagnostic_sign = function(signs)
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

return M
