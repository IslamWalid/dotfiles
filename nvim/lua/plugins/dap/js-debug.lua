local M = {}

M.setup = function()
  require("dap-vscode-js").setup({
    debugger_path = os.getenv("HOME") .. "/.opt/vscode-js-debug",
    adapters = { "pwa-node" },
  })

  for _, language in ipairs({ "javascript", "typescript" }) do
    require("dap").configurations[language] = {
      {
        name = "Debug File",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach Process",
        type = "pwa-node",
        request = "attach",
        processId = function()
          require("dap.utils").pick_process("node --inspect")
        end,
      },
      {
        name = "Debug Jest Tests",
        type = "pwa-node",
        request = "launch",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }
  end
end

return M
