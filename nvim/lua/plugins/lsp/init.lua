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
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = function()
          return {
            lsp = { auto_attach = true },
            window = {
              border = "rounded",
              size = {
                width = "90%",
                height = "90%",
              },
              sections = {
                left = { size = "5%" },
                mid = { size = "50%" },
                right = { preview = "always" },
              },
            },
            mappings = {
              ["t"] = require("nvim-navbuddy.actions").telescope({
                layout_strategy = "horizontal",
                layout_config = {
                  height = 0.9,
                  width = 0.9,
                  prompt_position = "bottom",
                  preview_width = 0.6,
                  scroll_speed = 1,
                },
              }),
            },
          }
        end,
      },
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
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
              null_ls.builtins.diagnostics.staticcheck,
            },
            on_attach = require("utils.lsp").on_attach,
          }
        end,
      },
    },
  },
}
