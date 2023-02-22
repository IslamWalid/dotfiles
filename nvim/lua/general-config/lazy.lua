-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  concurrency = 4,
  install = {
    colorscheme = { "catppuccin" },
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "netrwPlugin",
        "zipPlugin",
      },
    },
  },
}

-- leader
vim.g.mapleader = " "

require("lazy").setup({
  -- LSP
  "onsails/lspkind.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",
  "ray-x/lsp_signature.nvim",
  {
    "j-hui/fidget.nvim",
    config = {
      window = { blend = 0 },
    },
  },

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    config = function()
      require("cmp_nvim_ultisnips").setup({
        filetype_source = "treesitter",
        show_snippets = "all",
        documentation = require("cmp_nvim_ultisnips.snippets").documentation,
      })
    end,
  },
  {
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsSnippetDirectories = { vim.fn.stdpath("config") .. "/ultisnips" }
    end,
  },

  -- Treesitter
  "andymass/vim-matchup",
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
  },

  -- Dap
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "jay-babu/mason-nvim-dap.nvim",

  -- File exploring
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-tree.lua",

  -- Color schemes and icons
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "sainnhe/gruvbox-material",
  { "catppuccin/nvim", name = "catppuccin" },

  -- Pacman
  {
    "williamboman/mason.nvim",
    config = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- MISC
  "mbbill/undotree",
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-obsession",
  "lilydjwg/colorizer",
  "kana/vim-textobj-user",
  "kana/vim-textobj-entire",
  "akinsho/toggleterm.nvim",
  "farmergreg/vim-lastplace",
  "CRAG666/code_runner.nvim",
  "vim-scripts/ReplaceWithRegister",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = {
      char = "┊",
      show_trailing_blankline_indent = false,
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
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = {
      numhl = true,
    },
  },
  {
    "toppair/peek.nvim",
    ft = "makrdown",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>md",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
      },
    },
  },
  { "numToStr/Comment.nvim", config = true },
  { "windwp/nvim-autopairs", config = true },
}, opts)
