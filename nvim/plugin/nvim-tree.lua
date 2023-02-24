local api = require("nvim-tree.api")
local nvim_tree = require("nvim-tree")

local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)
  api.tree.open()
end

nvim_tree.setup({
  auto_reload_on_write = true,
  sort_by = "name",
  view = {
    width = 30,
    signcolumn = "yes",
    hide_root_folder = false,
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
        { key = "<Tab>", action = "preview" },
        { key = "cd", action = "cd" },
        { key = "a", action = "create" },
        { key = "yy", action = "copy" },
        { key = "dd", action = "cut" },
        { key = "pp", action = "paste" },
        { key = "r", action = "rename" },
        { key = "dD", action = "remove" },
        { key = "E", action = "expand_all" },
        { key = "C", action = "collapse_all" },
        { key = "zh", action = "toggle_dotfiles" },
        { key = "zi", action = "toggle_git_ignored" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "M",
          staged = "A",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "D",
          ignored = "I",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set("n", "<leader>fe", function()
  api.tree.toggle()
  api.tree.reload()
end)

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
