return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- LSP
	use("onsails/lspkind.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
				},
			})
		end,
	})

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"quangnguyen30192/cmp-nvim-ultisnips",
		config = function()
			require("cmp_nvim_ultisnips").setup({
				filetype_source = "treesitter",
				show_snippets = "all",
				documentation = require("cmp_nvim_ultisnips.snippets").documentation,
			})
		end,
	})
	use({
		"SirVer/ultisnips",
		config = function()
			vim.g.UltiSnipsSnippetDirectories = { vim.fn.stdpath("config") .. "/ultisnips" }
		end,
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("andymass/vim-matchup")
	use("p00f/nvim-ts-rainbow")

	-- Dap
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mxsdev/nvim-dap-vscode-js")

	-- File exploring
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-tree.lua")

	-- Color schemes and icons
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("sainnhe/gruvbox-material")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Pacman
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	})

	-- MISC
	use("mbbill/undotree")
	use("tpope/vim-eunuch")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-obsession")
	use("lilydjwg/colorizer")
	use("akinsho/toggleterm.nvim")
	use("farmergreg/vim-lastplace")
	use("CRAG666/code_runner.nvim")
	use("vim-scripts/ReplaceWithRegister")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "┊",
				show_trailing_blankline_indent = false,
			})
		end,
	})
	use({
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "gG", function()
				vim.cmd.Git()
				vim.cmd.wincmd("H")
				vim.cmd("vertical resize 45")
			end)
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				numhl = true,
			})
		end,
	})
	use({
		"toppair/peek.nvim",
		ft = "markdown",
		run = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			vim.keymap.set("n", "<leader>md", function()
				if peek.is_open() then
					peek.close()
				else
					peek.open()
				end
			end)
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
end)
