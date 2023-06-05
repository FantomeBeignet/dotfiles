local bg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("TelescopePreviewTitle", true)["background"])

require("bufferline").setup({
	options = {
		mode = "buffers",
		style_preset = require("bufferline").style_preset.minimal,
		numbers = "none",
		indicator = {
			style = "none",
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		show_duplicate_prefix = true,
		separator_style = "slant",
		hover = {
			enabled = false,
		},
		sort_by = "insert_after_current",
	},
	highlights = {
		fill = {
			bg = bg,
		},
		background = {
			bg = bg,
		},
		separator_selected = {
			fg = bg,
		},
		separator_visible = {
			fg = bg,
		},
		separator = {
			fg = bg,
			bg = bg,
		},
		buffer_selected = { bold = false },
		diagnostic_selected = { bold = false },
		hint_selected = { bold = false },
		pick_selected = { bold = false },
		pick_visible = { bold = false },
		pick = { bold = false },
	},
})
