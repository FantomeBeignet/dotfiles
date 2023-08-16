local augroup = "murmur_augroup"
vim.api.nvim_create_augroup(augroup, { clear = true })

require("murmur").setup({
	cursor_rgb = {
		guibg = "#393939",
	},
	cursor_rgb_always_use_config = true, -- if set to `true`, then always use `cursor_rgb`.
	-- yank_blink = {
	--   enabled = true,
	--   on_yank = nil, -- Can be customized. See `:h on_yank`.
	-- },
	exclude_filetypes = {},
	callbacks = {
		-- to trigger the close_events of vim.diagnostic.open_float.
		function()
			-- Close floating diag. and make it triggerable again.
			vim.api.nvim_exec_autocmds("User", { pattern = "MurmurDiagnostics" })
			vim.w.diag_shown = false
		end,
	},
})

-- To create IDE-like no blinking diagnostic message with `cursor` scope. (should be paired with the callback above)
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	group = augroup,
-- 	pattern = "*",
-- 	callback = function()
-- 		-- skip when a float-win already exists.
-- 		if vim.w.diag_shown then
-- 			return
-- 		end
--
-- 		-- open float-win when hovering on a cursor-word.
-- 		require("LspUI.diagnostic").run()
-- 			vim.w.diag_shown = true
-- 	end,
-- })
