require("toggleterm").setup({
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
    width = 120,
    height = 22,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
