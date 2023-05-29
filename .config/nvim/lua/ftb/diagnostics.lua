local icons = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "󰌵",
}

for type, icon in pairs(icons) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "■",
	},
	severity_sort = true,
	float = {
		source = "always",
	},
})
