local present, gutter = pcall(require, "gitsigns")

if not present then
  return false
end

gutter.setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    topdelete = { text = '-' },
    changedelete = { text = '~' }
  }
})