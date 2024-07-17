local M = {}

M.setup = function()
  local filetypes = { "javascript", "typescript" }

  require("dap-vscode-js").setup({
    debugger_path = os.getenv("HOME") .. "/.opt/vscode-js-debug",
    adapters = { "pwa-node" },
  })

  require("dap.ext.vscode").load_launchjs("./vscode/launch.json", filetypes)

  for _, language in ipairs(filetypes) do
    require("dap").configurations[language] = {
      {
        name = "Debug file",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach process (default port)",
        type = "pwa-node",
        request = "attach",
        cwd = "${workspaceFolder}",
        port = 9229,
      },
      {
        name = "Attach process (select port)",
        type = "pwa-node",
        request = "attach",
        cwd = "${workspaceFolder}",
        port = function()
          return vim.fn.input("Port: ")
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
