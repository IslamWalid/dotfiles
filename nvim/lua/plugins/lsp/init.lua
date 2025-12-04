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
                width = "95%",
                height = "90%",
              },
              sections = {
                left = { size = "10%" },
                mid = { size = "30%" },
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
        "nvimtools/none-ls.nvim",
        dependencies = "nvimtools/none-ls-extras.nvim",
        opts = function()
          local null_ls = require("null-ls")
          return {
            sources = {
              -- formatting
              null_ls.builtins.formatting.gofmt,
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.shfmt.with({ extra_args = { "-ci" } }),
              require("none-ls.formatting.eslint_d"),

              -- diagnostics
              require("none-ls.diagnostics.eslint_d"),
            },
            on_attach = require("utils.null-ls").on_attach,
          }
        end,
      },
    },
  },
}
