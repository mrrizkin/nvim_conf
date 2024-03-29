local wkey = require("which-key")
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

-- lsp stuff
nmap("`", "<cmd>lua vim.lsp.buf.code_action()<cr>")
nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
nmap("<f2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nmap("gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
nmap("<f3>", "<cmd>lua vim.lsp.buf.format({ async = true})<cr>")
nmap("lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
nmap("lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
nmap("lws", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")

-- dianostic stuff
nmap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

nmap("<c-s>", "<cmd>w<cr>")
nmap("<c-p>", "<cmd>Telescope find_files<cr>")
nmap("<c-c>", "<cmd>Telescope commands<cr>")
nmap("<c-t>", "<cmd>Telescope<cr>")
nmap("<a-b>", "<cmd>Telescope buffers<cr>")
nmap("<a-d>", "<cmd>DBUIToggle<cr>")
-- nmap("<a-r>", "<cmd>Reload<cr>")
nmap("<a-r>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
nmap("<a-p>", "<cmd>Telescope live_grep<cr>")

-- close current buffer
nmap("<c-w>", "<cmd>bd<cr>")

-- keep it centered
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

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

-- Leader key map
wkey.register({
	t = {
		name = "Terminal",
		f = { "<cmd>FloatermNew --width=0.6 --height=0.6 --title=\\ File\\ Manager\\  lf<cr>", "File Manager" },
		g = { "<cmd>FloatermNew --width=0.9 --height=0.9 --title=\\ Git\\  lazygit<cr>", "Git" },
	},
	f = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
}, { prefix = "<leader>" })
