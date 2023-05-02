return {

	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			borderchars = {
				prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
				results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
				preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
			},
		}
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},

	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
	},

	{
		'ThePrimeagen/harpoon'
	},

	{
		"gnikdroy/projections.nvim",
		config = function()
			require("projections").setup({
				workspaces = {
					{ "~/git/personal", { '.git' } },
					{ "~/git/school",   { '.git' } },
				},
			})

			-- Bind <leader>fp to Telescope projections
			require('telescope').load_extension('projections')
			vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end,
				{ desc = 'Find projects' })

			-- Autostore session on VimExit
			local Session = require("projections.session")
			vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
				callback = function() Session.store(vim.loop.cwd()) end,
			})

			-- Switch to project if vim was started in a project dir
			local switcher = require("projections.switcher")
			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				callback = function()
					if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
				end,
			})

			vim.opt.sessionoptions:append("localoptions") -- Save localoptions to session file
		end
	},
}
