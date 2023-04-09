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
  tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = false,
        symbols = { modified = " ●", alternate_file = "", directory = "" },
        filetype_names = {
          TelescopePrompt = "Telescope",
          fugitive = "Fugitive",
          git = "git",
          lazy = "Lazy",
          mason = "Mason",
          NvimTree = "NvimTree",
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
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
