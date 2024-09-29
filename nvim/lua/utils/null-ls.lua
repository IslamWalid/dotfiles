local M = {}

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { desc = "Lsp: " .. desc, noremap = true, silent = true, buffer = bufnr }
  end

  vim.keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format()
    vim.cmd.write()
  end, opts("Buffer Format"))

  vim.keymap.set("v", "<leader>fm", function()
    local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    vim.lsp.buf.format({
      range = {
        ["start"] = { start_row, 0 },
        ["end"] = { end_row, 0 },
      },
      async = true,
    })
  end, opts("Range Format"))
end

return M
