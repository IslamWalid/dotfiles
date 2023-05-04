local function filename()
  local fname = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  return fname .. " %m"
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = vim.g.colors_name,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { filename },
    lualine_x = { "progress" },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  extensions = {
    "fugitive",
    "man",
    "nvim-dap-ui",
    "nvim-tree",
    "quickfix",
    "toggleterm",
  },
})
