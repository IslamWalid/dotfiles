local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  group = augroup("Help Resize", {}),
  pattern = "help",
  callback = function()
    vim.cmd("resize 13")
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  group = augroup("Yank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 50,
    })
  end,
})
