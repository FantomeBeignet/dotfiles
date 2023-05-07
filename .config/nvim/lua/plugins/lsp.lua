return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			"folke/neodev.nvim",
		},
	},

	{
		"onsails/lspkind.nvim",
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
