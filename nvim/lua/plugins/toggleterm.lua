return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 20,
    open_mapping = [[<C-CR>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  keys = {
    { "<C-CR>", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm"}
  }
}
