local dap = require("dap")

require("mason-nvim-dap").setup({
  ensure_installed = {
    "delve",
    "js-debug-adapter",
    "codelldb",
  },
})

-- Config --
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "debugBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "", linehl = "", numhl = "debugBreakpoint" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })

-- Mappings --
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F17>", dap.run_last)
vim.keymap.set("n", "<F6>", dap.terminate)
vim.keymap.set("n", "<F7>", dap.restart)
vim.keymap.set("n", "<F8>", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F21>", dap.clear_breakpoints)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F22>", dap.run_to_cursor)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
