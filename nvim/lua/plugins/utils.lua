return {
  "mbbill/undotree",
  "vim-scripts/ReplaceWithRegister",
  { "ethanholz/nvim-lastplace", config = true },
  { "kevinhwang91/nvim-bqf",    ft = "qf" },
  { "numToStr/Comment.nvim",    config = true, event = "VeryLazy" },
  { "kylechui/nvim-surround",   version = "*", event = "VeryLazy", config = true },
  {
    "chrishrb/gx.nvim",
    config = true,
    keys = { { "gx", vim.cmd.Browse, mode = { "n", "x" } } },
  },
  {
    "folke/todo-comments.nvim",
    opts = { signs = false },
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTelescope", "TodoQuickFix" },
  },
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
        desc = "Toggle Markdown Preview",
      },
    },
  },
}
