local M = {}

M.setup = function()
  local dap = require("dap")
  local dap_utils = require("dap.utils")

  dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }

  dap.configurations.go = {
    {
      name = "Attach Process",
      type = "delve",
      request = "attach",
      mode = "local",
      processId = function()
        local process_name = vim.fn.input("Process name: ")
        return dap_utils.pick_process({ filter = process_name })
      end,
    },
    {
      name = "Test Package",
      type = "delve",
      request = "launch",
      mode = "test",
      program = "${fileDirname}",
    },
    {
      name = "Attach Process (Givesync)",
      type = "delve",
      request = "attach",
      mode = "local",
      processId = function()
        return dap_utils.pick_process({ filter = "./build/api" })
      end,
    },
    {
      name = "Test Package (Givesync)",
      type = "delve",
      request = "launch",
      mode = "test",
      program = function()
        local main_pkg_dir = vim.fn.fnamemodify(vim.fn.expand("%:p:h") .. "/../", ":p")

        for _, dir in ipairs(vim.fn.readdir(main_pkg_dir)) do
          if string.match(dir, "spec$") ~= nil then
            return main_pkg_dir .. dir
          end
        end
      end,
      env = {
        GIVESYNC_CONFIG = "/home/islam/work/lasting-dynamics/givesync-api/play/config.test.local.yaml",
      },
    },
  }
end

return M
