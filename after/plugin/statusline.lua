local utils = require("utils")
local autocmd = utils.autocmd
local ts_utils = require("nvim-treesitter.ts_utils")

local M = {}

M.get_git_status = function()
	local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
	local is_head_empty = signs.head ~= ''

	return is_head_empty
		and string.format('  %s | +%s ~%s -%s ', signs.head, signs.added, signs.changed, signs.removed)
		or ''
end

M.get_node_under_cursor = function()
	local usernode = ts_utils.get_node_at_cursor()
	local node = tostring(usernode)

	return node == 'nil' and '' or node
end

M.set_active = function(self)
	local git = self:get_git_status()
	local node = self:get_node_under_cursor()

	return table.concat(
		{ " %<%F %m%r%h%w "
		, tostring(node)
		,"%="
		, git
		, " %l:%c %y %P "
		})
end

M.set_inactive = function()
	return '%= %F %='
end

M.set_disable = function()
	return ''
end

Statusline = setmetatable(M, {
	__call = function(statusline, mode)
		if mode == "active" then return statusline:set_active() end
		if mode == "inactive" then return statusline:set_inactive() end
		if mode == "disable" then return statusline:set_disable() end
	end
})

autocmd("Statusline",
	{ [[WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')]]
	, [[WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')]]
	, [[WinEnter,WinLeave,BufEnter,BufLeave,FileType NvimTree setlocal statusline=%!v:lua.Statusline('disable')]]
	}, true)
