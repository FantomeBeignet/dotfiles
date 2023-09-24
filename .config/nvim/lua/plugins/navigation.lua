return {

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			borderchars = {
				prompt = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" },
				results = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" },
				preview = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" },
			},
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{ "SidOfc/carbon.nvim" },

	{
		"ThePrimeagen/harpoon",
	},

	{
		"gnikdroy/projections.nvim",
		branch = "pre_release",
	},
}
