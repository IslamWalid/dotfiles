local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("resize 13")
  end,
})
