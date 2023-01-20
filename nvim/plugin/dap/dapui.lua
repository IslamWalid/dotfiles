require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				"watches",
				{ id = "scopes", size = 0.6 },
			},
			size = 40,
			position = "left",
		},
	},
	controls = {
		enabled = false,
	},
})
