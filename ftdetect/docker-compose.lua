local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local docker_compose_file_type = augroup("DockerComposeFileType", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "docker-compose.y{,a}ml",
	command = "set filetype=yaml.docker-compose",
	group = docker_compose_file_type,
})
