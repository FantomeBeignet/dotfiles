return {

	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},

	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				component_separators = '|',
				section_separators = '',
			},
		},
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			char = '»',
			show_trailing_blankline_indent = false,
		},
	},

	{ 'numToStr/Comment.nvim', opts = {} },

	{
		'yamatsum/nvim-cursorline',
		opts = {
			cursorline = {
				timeout = 3000,
			},
			cursorword = {
				enable = false,
			},
		},
	},

	{
		'petertriho/nvim-scrollbar',
		opts = {
			handle = {
				blend = 10,
			},
		},
	},

	{
		'kevinhwang91/nvim-hlslens',
		config = function()
			require("scrollbar.handlers.search").setup({
				-- hlslens config overrides
			})
		end,
	},

	{
		'willothy/nvim-cokeline',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			local get_hex = require('cokeline.utils').get_hex
			local normal_fg = get_hex('Normal', 'fg')
			local comments_fg = get_hex('Comment', 'fg')
			local errors_fg = get_hex('DiagnosticSignError', 'fg')
			local warnings_fg = get_hex('DiagnosticSignWarn', 'fg')
			local background_bg = get_hex('Background', 'bg')
			local components = {
				space = {
					text = ' ',
					truncation = { priority = 1 }
				},
				two_spaces = {
					text = '  ',
					truncation = { priority = 1 },
				},
				separator = {
					text = function(buffer)
						return buffer.index ~= 1 and '▏' or ''
					end,
					truncation = { priority = 1 }
				},
				devicon = {
					text = function(buffer)
						return buffer.devicon.icon
					end,
					fg = function(buffer)
						return buffer.devicon.color
					end,
					truncation = { priority = 1 },
				},
				filename = {
					text = function(buffer)
						return buffer.filename
					end,
					truncation = {
						priority = 2,
						direction = 'left',
					},
				},
				diagnostics = {
					text = function(buffer)
						return
						    (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
						    or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
						    or ''
					end,
					fg = function(buffer)
						return
						    (buffer.diagnostics.errors ~= 0 and errors_fg)
						    or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
						    or nil
					end,
					truncation = { priority = 1 },
				},
				close_or_unsaved = {
					text = function(buffer)
						return buffer.is_modified and '  ●' or ''
					end,
					fg = function(buffer)
						return buffer.is_modified and comments_fg or nil
					end,
					truncation = { priority = 1 },
				},
			}
			require('cokeline').setup({
				default_hl = {
					fg = function(buffer)
						return
						    buffer.is_focused
						    and normal_fg
						    or comments_fg
					end,
					bg = background_bg,
				},
				components = {
					components.space,
					components.separator,
					components.space,
					components.devicon,
					components.space,
					components.filename,
					components.diagnostics,
					components.close_or_unsaved,
					components.space,
				},
			})
		end
	},

	{
		'folke/todo-comments.nvim',
		config = function ()
			require('todo-comments').setup({
			signs = false,
		})
		end,
	},
}
