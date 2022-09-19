local spooky = vim.api.nvim_create_augroup("SKELETON", {clear = true})
local fname = vim.fn.input("File: ", "", "file")

vim.api.nvim_create_autocmd({"BufNewFile"}, {
  group = spooky,
  pattern  = "*.tex",
  command = '0r ~/.config/nvim/skeletons/' .. fname .. ".tex"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
  group = spooky,
  pattern  = "*.cls",
  command = '0r ~/.config/nvim/skeletons/' .. fname .. ".cls"
})

vim.api.nvim_create_autocmd({"BufNewFile"}, {
  group = spooky,
  pattern  = "*.py",
  command = '0r ~/.config/nvim/skeletons/' .. fname .. ".py"
})
