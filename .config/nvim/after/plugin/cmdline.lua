local fineline = require("fine-cmdline")
local fn = fineline.fn
local text = require("nui.text")

fineline.setup({
	popup = {
		position = {
			row = "90%",
			col = "50%",
		},
		border = {
			text = {
				top = text("cmd", "SpecialComment"),
				top_align = "center",
			},
		},
	},
	hooks = {
		set_keymaps = function(imap, _)
			imap("<Esc>", fn.close)
			imap("<C-k>", fn.up_search_history)
			imap("<C-j>", fn.down_search_history)
		end,
	},
})
