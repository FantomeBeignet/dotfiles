local function get_diagnostic_label(props)
	local icons = {
		Error = "",
		Warn = "",
		Info = "",
		Hint = "",
	}

	local labels = {}
	for severity, icon in pairs(icons) do
		local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
		if n > 0 then
			local group = props.focused and "DiagnosticSign" .. severity or "NonText"
			table.insert(labels, { icon .. " " .. n .. " ", group = group })
		end
	end
	if #labels > 0 then
		table.insert(labels, { "│ " })
	end
	return labels
end

local function get_git_diff(props)
	local icons = {
		removed = { icon = "-", group = "GitSignsDelete" },
		changed = { icon = "~", group = "GitSignsChange" },
		added = { icon = "+", group = "GitSignsAdd" },
	}
	local labels = {}
	local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
	-- local signs = vim.b.gitsigns_status_dict
	for name, ui in pairs(icons) do
		if tonumber(signs[name]) and signs[name] > 0 then
			table.insert(labels, { ui.icon .. signs[name] .. " ", group = ui.group })
		end
	end
	if #labels > 0 then
		table.insert(labels, { "│ ", group = "NonText" })
	end
	return labels
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
		local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "" or ""
		local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
		local icon_fg = "#" .. string.format("%06x", vim.api.nvim_get_hl(0, { name = "NonText" })["fg"])
		local fg = vim.api.nvim_buf_get_option(props.buf, "modified") and "String"
			or (props.focused and "Normal" or "Comment")
		local icon_color = props.focused and color or icon_fg

		local buffer = {
			{ get_diagnostic_label(props) },
			{ get_git_diff(props) },
			{ filetype_icon, guifg = icon_color },
			{ " " },
			{ filename, group = fg },
			{ " " },
			{ modified, group = "String" },
		}

		return buffer
	end,
})
