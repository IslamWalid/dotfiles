local lspconfig = require("lspconfig")
local lsp_signature = require("lsp_signature")
local telescope_buitin = require("telescope.builtin")

local servers = {
  "gopls",
  "tsserver",
  "lua_ls",
  "clangd",
  "bashls",
  "dockerls",
  "jsonls",
}

local function on_attach(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  lsp_signature.on_attach({
    hint_prefix = "",
    floating_window = false,
  }, bufnr)

  -- LSP mappings
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "ge", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- Telescope mappings
  vim.keymap.set("n", "grf", telescope_buitin.lsp_references, opts)
  vim.keymap.set("n", "gld", telescope_buitin.diagnostics, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  debounce_text_changes = 150,
}

local additional_config = {
  tsserver = {
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

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

for _, server in ipairs(servers) do
  local default_config = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }

  if additional_config[server] ~= nil then
    for key, value in pairs(additional_config[server]) do
      default_config[key] = value
    end
  end

  lspconfig[server].setup(default_config)
end

-- Signs
local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
