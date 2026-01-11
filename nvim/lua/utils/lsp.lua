local M = {}

local telescope_builtin = require("telescope.builtin")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { desc = "Lsp: " .. desc, noremap = true, silent = true, buffer = bufnr }
  end

  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Documentation Hover"))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation"))
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts("Go to Type Definition"))
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts("Code Action"))
  vim.keymap.set("n", "gf", vim.lsp.buf.references, opts("Go To References"))
  vim.keymap.set("n", "gld", telescope_builtin.diagnostics, opts("Telescope List Diagnostics"))
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
  vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist, opts("Diagnostics Quick Fix"))
  vim.keymap.set("n", "<leader>nv", require("nvim-navbuddy").open, opts("NavBuddy Open"))
  vim.keymap.set("n", "ge", function()
    vim.diagnostic.jump({ count = 1, float = true })
    vim.cmd.normal("zz")
  end, opts("Go To Next Diagnostic"))
  vim.keymap.set("n", "gE", function()
    vim.diagnostic.jump({ count = -1, float = true })
    vim.cmd.normal("zz")
  end, opts("Go To Previous Diagnostic"))
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.lsp_flags = {
  debounce_text_changes = 150,
}

return M
