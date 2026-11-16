local ensure_installed = {
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
  "sql",
}

return {
  {
    "andymass/vim-matchup",
    init = function()
      -- Replaces the old treesitter `disable_virtual_text` module option:
      -- don't show the offscreen match in a popup/virtual text.
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  "HiPhish/rainbow-delimiters.nvim",
  "nvim-treesitter/nvim-treesitter-context",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V",  -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = false,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local swap = require("nvim-treesitter-textobjects.swap")

      local select_maps = {
        ["ic"] = "@class.inner",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
      }
      for lhs, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      vim.keymap.set("n", "<leader>s", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })
      vim.keymap.set("n", "<leader>S", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap previous parameter" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(ensure_installed)

      -- The `main` branch no longer enables highlighting automatically;
      -- start treesitter per-buffer for any filetype that has a parser.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
