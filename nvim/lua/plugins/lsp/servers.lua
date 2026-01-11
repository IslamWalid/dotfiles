local M = {}

M.setup = function()
  local servers = {
    "gopls",
    "ts_ls",
    "lua_ls",
    "clangd",
    "bashls",
    "dockerls",
    "jsonls",
  }

  local additional_config = {
    ts_ls = {
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    },
  }

  for _, server in ipairs(servers) do
    local default_config = {
      on_attach = require("utils.lsp").on_attach,
      capabilities = M.capabilities,
      flags = M.lsp_flags,
    }

    if additional_config[server] ~= nil then
      for key, value in pairs(additional_config[server]) do
        default_config[key] = value
      end
    end

    vim.lsp.config(server, default_config)
    vim.lsp.enable(server)
  end
end

return M
