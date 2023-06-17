return {
  "CRAG666/code_runner.nvim",
  opts = {
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
      typescript = "ts-node $fileName",
      python = "python $fileName",
      sh = "zsh $fileName",
      lua = "luajit $fileName",
    },
  },
  keys = {
    { "<F4>",  ":w<CR>:RunCode<CR>", desc = "run code" },
    { "<F16>", ":RunClose<CR>",      desc = "Close Run Code" },
  },
}
