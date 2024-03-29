local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.config.disable,
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-i>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-e>"] = cmp.mapping.abort(),
	},
	sources = {
		{ name = "luasnip" },
		{
			name = "nvim_lsp",
			keyword_length = 2,
			entry_filter = function(entry, _)
				return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
			end,
		},
		{ name = "nvim_lsp_signature_help" },
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "(buff)",
				nvim_lsp = "(lsp)",
				luasnip = "(snip)",
				nvim_lua = "(lua)",
			},
		}),
	},
	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	preselect = cmp.PreselectMode.Item,
	completion = {
		completeopt = "menu,menuone,preview",
	},

	experimental = {
		ghost_text = true,
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_length = 3 },
	}),
})
