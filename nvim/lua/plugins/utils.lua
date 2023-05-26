return {
  "mbbill/undotree",
  "vim-scripts/ReplaceWithRegister",
  { "ethanholz/nvim-lastplace", config = true },
  { "kevinhwang91/nvim-bqf",    event = "VeryLazy" },
  { "numToStr/Comment.nvim",    config = true,     event = "VeryLazy" },
  { "kylechui/nvim-surround",   version = "*",     event = "VeryLazy", config = true },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = { default_file_explorer = false },
    cmd = "Oil",
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>md",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
      },
    },
  },
}
