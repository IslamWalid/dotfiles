local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.c = {
	{
		name = "debug",
		type = "codelldb",
		request = "launch",
		program = function()
			local file_name = vim.fn.expand("%")
			local filetype = vim.bo.filetype
			if filetype == "c" then
				os.execute(string.format("gcc -g %s -o debug", file_name))
			elseif filetype == "cpp" then
				os.execute(string.format("g++ -g %s -o debug", file_name))
			end
			return "debug"
		end,
		cwd = "${workspaceFolder}",
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}

dap.configurations.cpp = dap.configurations.c
