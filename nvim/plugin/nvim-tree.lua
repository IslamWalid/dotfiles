require("nvim-tree").setup({
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
				{ key = "y", action = "copy" },
				{ key = "d", action = "cut" },
				{ key = "p", action = "paste" },
				{ key = "r", action = "rename" },
				{ key = "D", action = "remove" },
				{ key = "E", action = "expand_all" },
				{ key = "C", action = "collapse_all" },
				{ key = "<BS>", action = "toggle_dotfiles" },
				{ key = "I", action = "toggle_git_ignored" },
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

local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>fe", function()
	api.tree.toggle()
	api.tree.reload()
end)
