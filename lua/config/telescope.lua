local present, telescope = pcall(require, "telescope")

if not present then
  return false
end

telescope.setup {
	pickers = {
		buffers = {
			sort_lastused = true,
			mappings = {
				i = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				}
			}
		},
	},
}
