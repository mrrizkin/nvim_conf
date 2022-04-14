local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
  return false
end

autopairs.setup()
