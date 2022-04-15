local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return false
end

ts_config.setup({
  ensure_installed = { "go", "rust", "lua", "javascript", "typescript", "css", "html" },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = false
  }
})
