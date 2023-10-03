return {

	{
		"nvim-tree/nvim-web-devicons",
	},

	{
		"MunifTanjim/nui.nvim",
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
			},
		},
	},

	{
		"petertriho/nvim-scrollbar",
		lazy = true,
	},

	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
		lazy = true,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
		lazy = true,
	},

	{
		"b0o/incline.nvim",
		lazy = true,
	},

	{
		"levouh/tint.nvim",
		lazy = true,
	},

	{
		"nyngwang/murmur.lua",
		lazy = true,
	},

	{
		"rcarriga/nvim-notify",
	},

	{
		"VonHeikemen/searchbox.nvim",
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
	},

	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},
}
