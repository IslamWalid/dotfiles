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

-- Misc
set("n", "J", "mzJ`z", silent_noremap)
set("n", "<Tab>", "<cmd>bn<CR>", silent_noremap)
set("n", "<S-Tab>", "<cmd>bp<CR>", silent_noremap)
set("n", "ZD", "<cmd>bd<CR>", silent_noremap)
set("n", "<CR>", "o<esc>", noremap)
set("n", "<S-CR>", "O<esc>", noremap)
set("n", "gp", "`[v`]", noremap)
set("t", "<S-esc>", "<C-\\><C-n>", noremap)
