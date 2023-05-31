return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("utils.diagnostics").setup()
      require("plugins.lsp.servers").setup()
    end,
    dependencies = {
      "onsails/lspkind.nvim",
      {
        {
          "SmiteshP/nvim-navbuddy",
          dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
          },
          opts = {
            lsp = { auto_attach = true },
            window = {
              border = "rounded",
              size = {
                width = "85%",
                height = "85%",
              },
              sections = {
                left = { size = "20%" },
                mid = { size = "30%" },
                right = { preview = "always" },
              },
            },
          },
        },
      },
      {
        "j-hui/fidget.nvim",
        opts = {
          window = { blend = 0 },
        },
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
          local null_ls = require("null-ls")
          return {
            sources = {
              -- formatting
              null_ls.builtins.formatting.gofumpt,
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.eslint_d,
              null_ls.builtins.formatting.shfmt.with({ extra_args = { "-ci" } }),

              -- diagnostics
              null_ls.builtins.diagnostics.eslint_d,
            },
            on_attach = require("utils.lsp").on_attach,
          }
        end,
      },
    },
  },
}
