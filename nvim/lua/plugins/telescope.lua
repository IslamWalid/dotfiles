return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
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
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.load_extension("live_grep_args")
    telescope.setup(opts)

    vim.keymap.set("n", "<leader>lg", telescope.extensions.live_grep_args.live_grep_args, { desc = "Live Grep (Args)" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
    vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Find Treesitter" })
    vim.keymap.set("n", "<leader>qh", builtin.quickfixhistory, { desc = "Quickfix History" })
    vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Current File Fuzzy Find" })
  end,
}
