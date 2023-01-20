local open_float_opts = {
	border = "single",
    scope = "line",
	source = "always",
	severity_sort = true,
	focus = false,
	close_events = {
		"CursorMoved",
		"InsertEnter",
		"DiagnosticChanged",
	},
	prefix = function(diagnostic)
		local signs = {
			[vim.diagnostic.severity.ERROR] = function()
				return ""
			end,
			[vim.diagnostic.severity.WARN] = function()
				return ""
			end,
			[vim.diagnostic.severity.HINT] = function()
				return ""
			end,
			[vim.diagnostic.severity.INFO] = function()
				return ""
			end,
		}
		local colors = {
			[vim.diagnostic.severity.ERROR] = function()
				return "DiagnosticFloatingError"
			end,
			[vim.diagnostic.severity.WARN] = function()
				return "DiagnosticFloatingWarn"
			end,
			[vim.diagnostic.severity.HINT] = function()
				return "DiagnosticFloatingHint"
			end,
			[vim.diagnostic.severity.INFO] = function()
				return "DiagnosticFloatingInfo"
			end,
		}
		return signs[diagnostic.severity](), colors[diagnostic.severity]()
	end,
	format = function(diagnostic)
		local WIN_WIDTH = vim.fn.winwidth(0)
		local max_width = math.floor(WIN_WIDTH * 0.7)
		local wrap_msg = require("utils.wrap").wrap_text(diagnostic.message, max_width)
		local msg = table.concat(wrap_msg, "\n")
		return msg
	end,
}

vim.diagnostic.config({
	virtual_text = false,
	float = open_float_opts,
})

vim.api.nvim_create_autocmd({ "CursorHold", "DiagnosticChanged" }, {
	callback = function()
		if vim.api.nvim_get_mode().mode == "n" then
			vim.diagnostic.open_float(open_float_opts)
		end
	end,
})
