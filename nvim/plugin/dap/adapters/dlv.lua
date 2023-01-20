local dap = require("dap")

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.configurations.go = {
	{
		type = "delve",
		name = "debug project",
		request = "launch",
		mode = "debug",
		program = "${fileDirname}",
	},
	{
		type = "delve",
		name = "debug project argv",
		request = "launch",
		program = "${fileDirname}",
		args = function()
			local input = vim.fn.input("argv: ")
			return vim.split(input or "", " ")
		end,
	},
	{
		type = "delve",
		name = "debug executable",
		request = "launch",
		mode = "exec",
		program = function()
			return vim.fn.getcwd() .. "/" .. vim.fn.input("executable path: ")
		end,
	},
	{
		type = "delve",
		name = "debug test",
		request = "launch",
		mode = "test",
		program = "${fileDirname}",
	},
	{
		type = "delve",
		name = "debug specific test",
		request = "launch",
		mode = "test",
		program = "${fileDirname}",
		args = {
			"--",
			"-test.run",
			function()
				vim.fn.input("test name: ")
			end,
		},
	},
}
