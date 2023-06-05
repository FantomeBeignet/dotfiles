local utils = require("lualine.utils.utils")

local colors = {
	normal = utils.extract_color_from_hllist("fg", { "StatusLineNormal" }, "#000000"),
	insert = utils.extract_color_from_hllist("fg", { "StatusLineInsert" }, "#000000"),
	replace = utils.extract_color_from_hllist("fg", { "StatusLineReplace" }, "#000000"),
	visual = utils.extract_color_from_hllist("fg", { "StatusLineVisual" }, "#000000"),
	command = utils.extract_color_from_hllist("fg", { "StatusLineCommand" }, "#000000"),
	back1 = utils.extract_color_from_hllist("bg", { "Normal", "StatusLineNC" }, "#000000"),
	fore = utils.extract_color_from_hllist("fg", { "Normal", "StatusLine" }, "#000000"),
	back2 = utils.extract_color_from_hllist("bg", { "StatusLine" }, "#000000"),
}

local theme = {
	normal = {
		a = { bg = colors.normal, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.normal },
		c = { bg = colors.back2, fg = colors.fore },
	},
	insert = {
		a = { bg = colors.insert, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.insert },
		c = { bg = colors.back2, fg = colors.fore },
	},
	replace = {
		a = { bg = colors.replace, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.replace },
		c = { bg = colors.back2, fg = colors.fore },
	},
	visual = {
		a = { bg = colors.visual, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.visual },
		c = { bg = colors.back2, fg = colors.fore },
	},
	command = {
		a = { bg = colors.command, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.command },
		c = { bg = colors.back2, fg = colors.fore },
	},
}

require("lualine").setup({
	options = {
		globalstatus = true,
		theme = theme,
	},
})
