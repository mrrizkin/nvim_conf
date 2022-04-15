local map = require("utils").map

local silent = { silent = true }

local nmap = function(key, cmd)
    map("n", key, cmd, silent)
end
local imap = function(key, cmd)
    map("i", key, cmd, silent)
end
local vmap = function(key, cmd)
    map("v", key, cmd, silent)
end

-- lsp
nmap("gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>")
nmap("gd",         "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("K",          "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>")
nmap("<C-k>",      "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nmap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
nmap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
nmap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
nmap("<leader>D",  "<cmd>lua vim.lsp.buf.type_definition()<CR>")
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nmap("gr",         "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- file tree
nmap("<leader>t", "<cmd>NvimTreeToggle<cr>")

-- file finder
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fm", "<cmd>Telescope media_files<cr>")

-- zettlekasten
nmap("<leader>zf", "<cmd>Telekasten find_notes<cr>")
nmap("<leader>zd", "<cmd>Telekasten find_daily_notes<cr>")
nmap("<leader>zg", "<cmd>Telekasten search_notes<cr>")
nmap("<leader>zz", "<cmd>Telekasten follow_link<cr>")
nmap("<leader>zT", "<cmd>Telekasten goto_today<cr>")
nmap("<leader>zW", "<cmd>Telekasten goto_thisweek<cr>")
nmap("<leader>zw", "<cmd>Telekasten find_weekly_notes<cr>")
nmap("<leader>zn", "<cmd>Telekasten new_note<cr>")
nmap("<leader>zN", "<cmd>Telekasten new_templated_note<cr>")
nmap("<leader>zy", "<cmd>Telekasten yank_notelink<cr>")
nmap("<leader>zc", "<cmd>Telekasten show_calendar<cr>")
nmap("<leader>zC", "<cmd>CalendarT<cr>")
nmap("<leader>zi", "<cmd>Telekasten paste_img_and_link<cr>")
nmap("<leader>zt", "<cmd>Telekasten toggle_todo<cr>")
nmap("<leader>zb", "<cmd>Telekasten show_backlinks<cr>")
nmap("<leader>zF", "<cmd>Telekasten find_friends<cr>")
nmap("<leader>zI", "<cmd>Telekasten insert_img_link({ i=true })<cr>")
nmap("<leader>zp", "<cmd>Telekasten preview_img<cr>")
nmap("<leader>zm", "<cmd>Telekasten browse_media<cr>")
nmap("<leader>za", "<cmd>Telekasten show_tags<cr>")
nmap("<leader>#", "<cmd>Telekasten show_tags<cr>")
nmap("<leader>zr", "<cmd>Telekasten rename_note<cr>")
nmap("<leader>z", "<cmd>Telekasten panel<cr>")

-- keep it centered
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

-- undo breakpoints
imap(",", ",<c-g>u")
imap(".", ".<c-g>u")
imap("!", "!<c-g>u")
imap("?", "?<c-g>u")

-- moving text
vmap("<a-j>", ":m '>+1<cr>gv=gv")
vmap("<a-k>", ":m '<-2<cr>gv=gv")
imap("<a-j>", "<esc>:m .+1<cr>==a")
imap("<a-k>", "<esc>:m .-2<cr>==a")
nmap("<a-j>", ":m .+1<cr>==")
nmap("<a-k>", ":m .-2<cr>==")

-- moving bitween windows
nmap("<c-h>", "<c-w>h")
nmap("<c-j>", "<c-w>j")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")

-- manual indent selection
vmap("<", "<gv")
vmap(">", ">gv")
