local ls = require("luasnip")

ls.config.set_config({
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/ftb/snippets/*.lua", true)) do
	loadfile(ft_path)()
end
