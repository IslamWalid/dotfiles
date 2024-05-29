-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  concurrency = 4,
  install = {
    colorscheme = { "catppuccin" },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "netrwPlugin",
        "zipPlugin",
      },
    },
  },
}

-- leader
vim.g.mapleader = " "

require("lazy").setup("plugins", opts)
