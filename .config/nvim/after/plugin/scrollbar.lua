require("scrollbar").setup({
	hide_if_all_visible = true,
	handle = {
		blend = 10,
	},
	excluded_buftypes = {
		"lazygit",
		"prompt",
		"terminal",
	},
	excluded_filetypes = {
		"cmp_docs",
		"cmp_menu",
		"gitcommit",
		"lazygit",
		"noice",
		"prompt",
		"TelescopePrompt",
	},
})
