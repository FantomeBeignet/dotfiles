local utils = require("lualine.utils.utils")

local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")
local default_status_colors = {
	saved = "#" .. string.format("%06x", vim.api.nvim_get_hl(0, { name = "Normal" })["fg"]),
	modified = "#" .. string.format("%06x", vim.api.nvim_get_hl(0, { name = "String" })["fg"]),
}

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ fg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ fg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

local colors = {
	normal = utils.extract_color_from_hllist("fg", { "StatusLineNormal" }, "#000000"),
	insert = utils.extract_color_from_hllist("fg", { "StatusLineInsert" }, "#000000"),
	replace = utils.extract_color_from_hllist("fg", { "StatusLineReplace" }, "#000000"),
	visual = utils.extract_color_from_hllist("fg", { "StatusLineVisual" }, "#000000"),
	command = utils.extract_color_from_hllist("fg", { "StatusLineCommand" }, "#000000"),
	back1 = utils.extract_color_from_hllist("bg", { "Normal", "StatusLine" }, "#000000"),
	fore = utils.extract_color_from_hllist("fg", { "Normal", "StatusLine" }, "#000000"),
	back2 = utils.extract_color_from_hllist("bg", { "StatusLineNC" }, "#000000"),
}

local theme = {
	normal = {
		a = { bg = colors.normal, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.fore },
		c = { bg = colors.back2, fg = colors.fore },
		x = { bg = colors.back1, fg = colors.fore },
		y = { bg = colors.back1, fg = colors.fore },
		z = { bg = colors.normal, fg = colors.back1, gui = "bold" },
	},
	insert = {
		a = { bg = colors.insert, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.fore },
		c = { bg = colors.back2, fg = colors.fore },
		x = { bg = colors.back1, fg = colors.fore },
		y = { bg = colors.back1, fg = colors.fore },
		z = { bg = colors.insert, fg = colors.back1, gui = "bold" },
	},
	replace = {
		a = { bg = colors.replace, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.fore },
		c = { bg = colors.back2, fg = colors.fore },
		x = { bg = colors.back1, fg = colors.fore },
		y = { bg = colors.back1, fg = colors.fore },
		z = { bg = colors.replace, fg = colors.back1, gui = "bold" },
	},
	visual = {
		a = { bg = colors.visual, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.fore },
		c = { bg = colors.back2, fg = colors.fore },
		x = { bg = colors.back1, fg = colors.fore },
		y = { bg = colors.back1, fg = colors.fore },
		z = { bg = colors.visual, fg = colors.back1, gui = "bold" },
	},
	command = {
		a = { bg = colors.command, fg = colors.back1, gui = "bold" },
		b = { bg = colors.back1, fg = colors.fore },
		c = { bg = colors.back2, fg = colors.fore },
		x = { bg = colors.back1, fg = colors.fore },
		y = { bg = colors.back1, fg = colors.fore },
		z = { bg = colors.command, fg = colors.back1, gui = "bold" },
	},
}

require("lualine").setup({
	options = {
		globalstatus = true,
		theme = theme,
		component_separators = "│ ",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				separator = { left = "", right = "" },
				right_padding = 2,
				left_padding = 2,
			},
		},
		lualine_b = { { "branch", icon = "", right_padding = 2 } },
		lualine_c = {
			{
				function()
					return "%="
				end,
			},
			{
				custom_fname,
				file_status = false,
			},
		},
		lualine_x = {
			{ "encoding", separator = { left = "" } },
			{
				"fileformat",
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
		},
		lualine_y = { "filetype" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
				right_padding = 2,
				left_padding = 2,
			},
		},
	},
})
