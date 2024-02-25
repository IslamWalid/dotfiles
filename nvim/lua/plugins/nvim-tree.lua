return {
  "kyazdani42/nvim-tree.lua",
  opts = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
      vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "dd", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "dD", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
      vim.keymap.set("n", "C", api.tree.collapse_all, opts("Collapse"))
      vim.keymap.set("n", "<BS>", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
      vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    end

    return {
      auto_reload_on_write = true,
      on_attach = on_attach,
      sort_by = "name",
      view = {
        width = 30,
        adaptive_size = true,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
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
    }
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<leader><leader>", function()
      api.tree.toggle()
      api.tree.reload({}, 0)
    end, { desc = "NvimTree Toggle", noremap = true, silent = true, nowait = true })

    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function(data)
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
          return
        end

        vim.cmd.cd(data.file)
        api.tree.open()
      end,
    })
  end,
}
