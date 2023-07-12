return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        height = 0.9,
        width = 0.9,
        preview_width = 0.6,
        scroll_speed = 1,
      },
    },
  },
  config = function(_, opts)
    local builtin = require("telescope.builtin")
    require("telescope").setup(opts)

    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
    vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Find Treesitter" })
    vim.keymap.set("n", "<leader>qh", builtin.quickfixhistory, { desc = "Quickfix History" })
    vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Current File Fuzzy Find" })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
