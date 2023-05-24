local M = {}

M.setup = function()
  local dap = require("dap")

  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
  }

  for _, language in ipairs({ "javascript", "typescript" }) do
    require("dap").configurations[language] = {
      {
        name = "Debug File",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach Process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
      },
    }
  end
end

return M
