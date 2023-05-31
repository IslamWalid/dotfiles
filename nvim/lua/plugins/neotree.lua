return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.g.neo_tree_remove_legacy_commands = 1

      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree").close_all()
            end,
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added = "A",    -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted = "D",  -- this can only be used in the git_status source
              renamed = "R",  -- this can only be used in the git_status source
              -- Status type
              untracked = "U",
              ignored = "I",
              unstaged = "",
              staged = "S",
              conflict = "",
            },
          },
        },
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<cr>"] = "open",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["C"] = "close_node",
            ["W"] = "close_all_nodes",
            ["E"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["A"] = {
              "add_directory",
              config = {
                show_path = "relative",
              },
            },
            ["D"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["d"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = {
              "copy",                   -- takes text input for destination
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["m"] = {
              "move",                   -- takes text input for destination
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
          },
        },
        filesystem = {
          filtered_items = {
            hide_by_name = { "node_modules" },
            always_show = { ".gitignored", ".dockerignore" },
          },
          group_empty_dirs = true,
          use_libuv_file_watcher = true,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["f"] = "fuzzy_finder",
              ["F"] = "fuzzy_finder_directory",
              ["gM"] = "prev_git_modified",
              ["gm"] = "next_git_modified",
            },
            fuzzy_finder_mappings = {
              ["<down>"] = "move_cursor_down",
              ["<C-d>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-u>"] = "move_cursor_up",
            },
          },
          components = {
            harpoon_index = function(config, node, _)
              local Marked = require("harpoon.mark")
              local path = node:get_id()
              local succuss, index = pcall(Marked.get_index_of, path)
              if succuss and index and index > 0 then
                return {
                  text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
                  highlight = config.highlight or "NeoTreeDirectoryIcon",
                }
              else
                return {}
              end
            end,
          },
          renderers = {
            file = {
              { "icon" },
              { "name",         use_git_status_colors = true },
              { "harpoon_index" }, --> This is what actually adds the component in where you want it
              { "diagnostics" },
              { "git_status",   highlight = "NeoTreeDimText" },
            },
          },
        },
      })

      vim.keymap.set("n", "<leader><leader>", "<cmd>Neotree toggle<CR>", { desc = "NeoTree Toggle" })
    end,
  },
}
