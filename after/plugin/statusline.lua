local api = vim.api

local M = {}

-- highlight groups
M.trunc_width = setmetatable({
  git_status = 90,
  filename   = 140,
  line_col   = 60,
}, {
  __index = function()
      return 80
  end
})

M.is_truncated = function(_, width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

M.get_git_status = function(self)
  -- use fallback because it doesn't set this variable on the initial `BufEnter`
  local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
  local is_head_empty = signs.head ~= ''

  if self:is_truncated(self.trunc_width.git_status) then
    return is_head_empty and string.format('  %s ', signs.head or '') or ''
  end

  return is_head_empty and string.format(
    ' +%s ~%s -%s |  %s ',
    signs.added, signs.changed, signs.removed, signs.head
  ) or ''
end

M.get_filename = function(self)
  if self:is_truncated(self.trunc_width.filename) then return " %<%f " end
  return " %<%F "
end

M.get_filetype = function()
  local filetype = vim.bo.filetype

  if filetype == '' then return '' end
  return string.format(' %s ', filetype):lower()
end

M.set_active = function(self)

  local git = self:get_git_status()
  local filename = self:get_filename()
  local filetype = self:get_filetype()

  return table.concat({
    git,
    "%=", filename, "%=",
    filetype,
  })
end

M.set_inactive = function(_)
  return '%= %F %='
end

M.set_explorer = function(_)
  local title = '   '

  return table.concat({ title })
end

Statusline = setmetatable(M, {
  __call = function(statusline, mode)
    if mode == "active" then return statusline:set_active() end
    if mode == "inactive" then return statusline:set_inactive() end
    if mode == "explorer" then return statusline:set_explorer() end
  end
})

-- set statusline
-- TODO: replace this once we can define autocmd using lua
api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType dirvish setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)
