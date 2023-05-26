return {
  "akinsho/toggleterm.nvim",
  opts = {
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
      width = function()
        return math.ceil(vim.api.nvim_win_get_width(0) * 0.85)
      end,
      height = function()
        return math.ceil(vim.api.nvim_win_get_height(0) * 0.85)
      end,
    },
  },
  keys = {
    { "<C-CR>", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
  },
}
