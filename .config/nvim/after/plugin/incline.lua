local function get_diagnostic_label(props)
	local icons = {
		Error = "",
		Warn = "",
		Info = "",
		Hint = "󰌵",
	}

	local label = {}
	for severity, icon in pairs(icons) do
		local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
		if n > 0 then
			local group = props.focused and "DiagnosticSign" .. severity or "NonText"
			table.insert(label, { icon .. " " .. n .. " ", group = group })
		end
	end
	return label
end

require("incline").setup({
	hide = {
		cursorline = true,
	},
	window = {
		margin = { vertical = 0 },
	},
	render = function(props)
		local bufname = vim.api.nvim_buf_get_name(props.buf)
		local filename = vim.fn.fnamemodify(bufname, ":t")
		local diagnostics = get_diagnostic_label(props)
		local focused = props.focused and "Normal" or "Comment"
		local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and " ●" or ""
		local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
		local fg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("NonText", true)["foreground"])
		local icon_color = props.focused and color or fg

		local buffer = {
			{ filetype_icon, guifg = icon_color },
			{ " " },
			{ filename, group = focused },
			{ modified, group = "NonText" },
		}

		if #diagnostics > 0 then
			table.insert(diagnostics, { "| ", group = "NonText" })
		end
		for _, buffer_ in ipairs(buffer) do
			table.insert(diagnostics, buffer_)
		end
		return diagnostics
	end,
})
