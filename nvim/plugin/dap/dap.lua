local dap = require("dap")
local dapui = require("dapui")

-- Config --
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
)
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })

-- Functions
local continue = function()
	if Compile ~= nil then
		Compile()
	end
	dap.continue()
	dapui.open()
end

local restart = function()
	dap.terminate()
	if Compile ~= nil then
		Compile()
	end
	vim.cmd("sleep 20m")
	dap.continue()
end

local terminate = function()
	dap.terminate()
	os.remove("debug")
end

local exit = function()
	dap.terminate()
	vim.cmd("sleep 20m")
	dap.repl.close()
	dapui.close()
	os.remove("debug")
end

local conditional_breakpoint = function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end

-- Mappings --
vim.keymap.set("n", "<F5>", continue)
vim.keymap.set("n", "<F6>", terminate)
vim.keymap.set("n", "<F7>", restart)
vim.keymap.set("n", "<F17>", exit)
vim.keymap.set("n", "<F8>", conditional_breakpoint)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F21>", dap.clear_breakpoints)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F22>", dap.run_to_cursor)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
