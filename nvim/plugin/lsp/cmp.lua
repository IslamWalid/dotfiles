local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	preselect = "none",
	window = {
		completion = {
			max_height = 40,
			max_width = 30,
		},
		documentation = {
			max_height = 20,
			max_width = 60,
		},
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "ultisnips", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "buffer", keyword_length = 5 },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				nvim_lsp = "[lsp]",
				luasnip = "[snip]",
				buffer = "[buf]",
				path = "[path]",
			},
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-2),
		["<C-d>"] = cmp.mapping.scroll_docs(2),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-j>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_forwards(fallback)
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, { "i", "s" }),
	}),
	experimental = {
		ghost_text = true,
	},
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
