require("nvim-treesitter.configs").setup({
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
        ["ir"] = "@parameter.inner",
        ["ar"] = "@parameter.outer",
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
})
