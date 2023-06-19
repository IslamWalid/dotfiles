local M = {}

M.setup = function()
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
      name = "Project",
      type = "delve",
      request = "launch",
      mode = "debug",
      program = "${fileDirname}",
    },
    {
      name = "Project (with args)",
      type = "delve",
      request = "launch",
      program = "${fileDirname}",
      args = function()
        local input = vim.fn.input("argv: ")
        return vim.split(input or "", " ")
      end,
    },
    {
      name = "Attach Process",
      type = "delve",
      request = "attach",
      mode = "local",
      processId = require("dap.utils").pick_process,
    },
    {
      name = "Executable",
      type = "delve",
      request = "launch",
      mode = "exec",
      program = function()
        return vim.fn.getcwd() .. "/" .. vim.fn.input("executable path: ")
      end,
    },
    {
      name = "Tests",
      type = "delve",
      request = "launch",
      mode = "test",
      program = "${fileDirname}",
    },
    {
      name = "Specific Test",
      type = "delve",
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
end

return M
