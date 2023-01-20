require("mason-null-ls").setup({
	ensure_installed = {
		"gofumpt",
		"eslint_d",
		"stylua",
		"shfmt",
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- formatting
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.shfmt.with({
			extra_args = { "-ci" },
		}),

		-- diagnostics
		null_ls.builtins.diagnostics.eslint_d,
	},
})

vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format()
	vim.cmd.write()
end)
