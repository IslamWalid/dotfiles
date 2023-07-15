return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<C-\>]],
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
        return math.ceil(vim.api.nvim_get_option_value("columns", {}) * 0.85)
      end,
      height = function()
        return math.ceil(vim.api.nvim_get_option_value("lines", {}) * 0.8)
      end,
    },
  },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
  },
}
