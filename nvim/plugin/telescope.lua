local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], "/")[1]
			if mime_type == "text" then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				-- maybe we want to write something to the buffer here
				vim.schedule(function()
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
				end)
			end
		end,
	}):sync()
end

require("telescope").setup({
	defaults = {
		buffer_previewer_maker = new_maker,
		layout_strategy = "horizontal",
		layout_config = {
			height = 0.9,
			width = 0.9,
			preview_width = 0.6,
			scroll_speed = 1,
		},
	},
})

vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fk", builtin.keymaps)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>ft", builtin.treesitter)
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find)
