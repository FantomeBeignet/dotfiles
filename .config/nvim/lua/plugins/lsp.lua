return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

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

	{
		"jinzhongjia/LspUI.nvim",
		branch = "legacy",
	},

	{
		"rmagatti/goto-preview",
	},
}
