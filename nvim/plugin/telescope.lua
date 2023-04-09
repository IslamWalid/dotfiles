local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.9,
      width = 0.9,
      preview_width = 0.6,
      scroll_speed = 1,
    },
  },
})

vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>fk", builtin.keymaps)
vim.keymap.set("n", "<leader>lg", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>ft", builtin.treesitter)
vim.keymap.set("n", "<leader>fq", builtin.quickfix)
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>zh", function()
  builtin.find_files({ hidden = true })
end)
