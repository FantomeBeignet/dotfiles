return {

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
			'nvim-treesitter/playground',
		},
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},

	{
		'm-demare/hlargs.nvim',
		opts = {},
	},
}
