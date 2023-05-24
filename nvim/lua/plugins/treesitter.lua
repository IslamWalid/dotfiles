return {
  "andymass/vim-matchup",
  "HiPhish/nvim-ts-rainbow2",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "go",
        "vim",
        "vimdoc",
        "lua",
        "bash",
        "markdown",
        "markdown_inline",
        "make",
        "diff",
        "json",
        "gitcommit",
        "git_rebase",
        "gitattributes",
        "gitignore",
        "sxhkdrc",
        "toml",
        "dockerfile",
        "javascript",
        "typescript",
      },

      highlight = { enable = true },

      matchup = { enable = true, disable_virtual_text = true },

      rainbow = { enable = true, extended_mode = true, max_file_lines = nil },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ic"] = "@class.inner",
            -- ["ac"] = "@class.outer",
            ["if"] = "@function.inner",
            ["af"] = "@function.outer",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
          },
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>s"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>S"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    build = function()
      local update = require("nvim-treesitter.install").update({ with_sync = true })
      update()
    end,
  },
}
