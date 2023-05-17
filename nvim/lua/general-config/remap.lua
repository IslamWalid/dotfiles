local set = vim.keymap.set
local silent = { silent = true }
local noremap = { noremap = true }
local silent_noremap = { silent = true, noremap = true }

-- Replace with register
set("n", "gr", "<Plug>ReplaceWithRegisterOperator")
set("x", "gr", "<Plug>ReplaceWithRegisterVisual")
set("n", "grr", "<Plug>ReplaceWithRegisterLine==")
set("n", "gR", "<Plug>ReplaceWithRegisterOperator$")

-- Moving lines
set("n", "<leader>j", ":m .+1<CR>==", silent)
set("n", "<leader>k", ":m .-2<CR>==", silent)
set("x", "J", ":m '>+1<CR>gv=gv", silent)
set("x", "K", ":m '<-2<CR>gv=gv", silent)

-- Navigation
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Buffers Control
set("n", "<Tab>", "<C-6>", noremap)
set("n", "<A-esc>", vim.cmd.bdelete, silent_noremap)

-- Quickfix list
set("n", "<leader>qo", vim.cmd.copen)
set("n", "<leader>qn", function()
  if not pcall(vim.cmd.cnext) then
    print("Quickfix: No Next Errors")
  end
end)
set("n", "<leader>qp", function()
  if not pcall(vim.cmd.cprevious) then
    print("Quickfix: No Previous Errors")
  end
end)
set("n", "<leader>qq", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end, noremap)

-- Text objects
set("o", "ie", ":<C-u>normal! mzggVG<CR>`z", silent_noremap)
set("x", "ie", ":<C-u>normal! ggVG<CR>", silent_noremap)

-- Misc
set("n", "J", "mzJ`z", silent_noremap)
set("n", "<C-j>", "o<esc>", noremap)
set("n", "<C-k>", "O<esc>", noremap)
set("n", "gp", "`[v`]", noremap)
set("t", "<A-esc>", "<C-\\><C-n>", noremap)
