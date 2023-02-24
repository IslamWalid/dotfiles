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
set("n", "<Tab>", vim.cmd.bnext, silent_noremap)
set("n", "<S-Tab>", vim.cmd.bprevious, silent_noremap)
set("n", "ZD", vim.cmd.bdelete, silent_noremap)

-- Text objects
set("o", "ie", ":<C-u>normal! mzggVG<CR>`z", silent_noremap)
set("x", "ie", ":<C-u>normal! ggVG<CR>", silent_noremap)

-- Misc
set("n", "J", "mzJ`z", silent_noremap)
set("n", "<CR>", "o<esc>", noremap)
set("n", "<S-CR>", "O<esc>", noremap)
set("n", "gp", "`[v`]", noremap)
set("t", "<S-esc>", "<C-\\><C-n>", noremap)
