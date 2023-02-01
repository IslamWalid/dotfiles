require("code_runner").setup({
  mode = "term",
  focus = true,
  term = {
    size = 9,
  },
  filetype = {
    go = "go run $fileName",
    c = "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
    cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
    javascript = "node $fileName",
    python = "python $fileName",
    sh = "zsh $fileName",
    lua = "luajit $fileName",
  },

  vim.keymap.set("n", "<F4>", ":w<CR>:RunCode<CR>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<F16>", ":RunClose<CR>", { noremap = true, silent = true }),
})
