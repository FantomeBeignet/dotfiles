require("carbon").setup({
	auto_open = false,
	actions = {
		up = "[",
		down = "]",
		quit = { "q", "<esc>" },
		edit = { "<cr>", "<space>" },
		move = "m",
		reset = "u",
		split = { "<c-x>", "<c-s>" },
		vsplit = "<c-v>",
		create = { "c", "%" },
		delete = "d",
		close_parent = "-",
		toggle_recursive = "<tab>",
	},
	float_settings = function()
		local columns = vim.opt.columns:get()
		local rows = vim.opt.lines:get()
		local width = math.floor(columns * 0.8)
		local height = math.floor(rows * 0.7)

		return {
			relative = "editor",
			style = "minimal",
			border = "rounded",
			width = width,
			height = height,
			col = math.floor(columns / 2 - width / 2),
			row = math.floor(rows / 2 - height / 2 - 2),
		}
	end,
	highlights = {
		CarbonFloat = {
			link = "Float",
		},
		CarbonFloatBorder = {
			link = "FloatBorder",
		},
	},
})
