return {
  {
    "tpope/vim-eunuch",
    cmd = {
      "Remove",
      "Delete",
      "Move",
      "Rename",
      "Copy",
      "Duplicate",
      "Chmod",
      "Mkdir",
      "Cfind",
      "Clocate",
      "Lfind",
      "Llocate",
      "Wall",
      "SudoWrite",
      "SudoEdit",
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "gG",
        function()
          vim.cmd.Git()
          vim.cmd.wincmd("H")
          vim.cmd("vertical resize 45")
        end,
        desc = "Fugitive",
      },
    },
    cmd = {
      "Git",
      "Gedit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "GMove",
      "GDelete",
      "GRename",
      "GRemove",
      "GBrowse",
    },
  },
}
