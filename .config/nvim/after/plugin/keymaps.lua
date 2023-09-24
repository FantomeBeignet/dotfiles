-- which-key group names
require("which-key").register({
	["<leader>c"] = { name = "+code" },
	["<leader>e"] = { name = "+edit" },
	["<leader>f"] = { name = "+find" },
	["<leader>h"] = { name = "+harpoon" },
	["<leader>s"] = { name = "+search" },
	["<leader>t"] = { name = "+terminal" },
})

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope keymaps
vim.keymap.set("n", "<leader>fF", require("telescope.builtin").oldfiles, { desc = "Find recently opened files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").current_buffer_fuzzy_find({ previewer = false })
end, { desc = "Find in current buffer" })

vim.keymap.set("n", "<leader>ff", function()
	-- Show hidden files
	require("telescope.builtin").find_files({
		find_command = { "rg", "--files", "--color", "never", "--iglob", "!.git", "--hidden" },
	})
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags({ previewer = false })
end, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "Find current Word" })
vim.keymap.set("n", "<leader>fG", require("telescope.builtin").live_grep, { desc = "Find by Grep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Find Diagnostics" })
vim.keymap.set("n", "<leader>fm", function()
	require("telescope").extensions.harpoon.marks({ layout_config = { height = 7 } })
end, { desc = "Find Marks" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { desc = "Find References" })
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").lsp_incoming_calls, { desc = "Find Incoming Calls" })
vim.keymap.set("n", "<leader>fC", require("telescope.builtin").lsp_outgoing_calls, { desc = "Find Outgoing Calls" })
vim.keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_implementations, { desc = "Find Implementations" })
vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").lsp_document_symbols({ previewer = false })
end, { desc = "Find Document Symbols" })
vim.keymap.set("n", "<leader>fS", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols({ previewer = false })
end, { desc = "Find Workspace Symbols" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })
vim.keymap.set("n", "<leader>fM", function()
	require("telescope.builtin").man_pages({ previewer = false, sections = { "1", "2", "3" } })
end, { desc = "Find Workspace Symbols" })

-- [[ Configure Harpoon ]]
local hm = require("harpoon.mark")
local hui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ha", hm.add_file, { desc = "Harpoon Add" })
vim.keymap.set("n", "<leader>hq", function()
	hui.nav_file(1)
end, { desc = "Mark 1" })
vim.keymap.set("n", "<leader>hw", function()
	hui.nav_file(2)
end, { desc = "Mark 2" })
vim.keymap.set("n", "<leader>he", function()
	hui.nav_file(3)
end, { desc = "Mark 3" })
vim.keymap.set("n", "<leader>hr", function()
	hui.nav_file(4)
end, { desc = "Mark 4" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", function()
	require("LspUI.diagnostic").run("next")
end, { desc = "Open floating diagnostic" })

require("leap").add_default_mappings()
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
vim.keymap.set("n", "<leader>l", function()
	local current_window = vim.fn.win_getid()
	require("leap").leap({ target_windows = { current_window } })
end, { desc = "Leap" })
require("flit").setup()
require("leap-spooky").setup()

-- Vim Tmux navigator setup
vim.keymap.set("n", "<ctrl>h", "<cmd>TmuxNavigateLeft<cr>", { desc = "Left Tmux window" })
vim.keymap.set("n", "<ctrl>j", "<cmd>TmuxNavigateDown<cr>", { desc = "Down Tmux window" })
vim.keymap.set("n", "<ctrl>k", "<cmd>TmuxNavigateUp<cr>", { desc = "Up Tmux window" })
vim.keymap.set("n", "<ctrl>l", "<cmd>TmuxNavigateRight<cr>", { desc = "Right Tmux window" })

require("zen-mode").setup({})
vim.keymap.set("n", "<leader>z", require("zen-mode").toggle, { desc = "Toggle Zen mode" })

-- Splits
vim.keymap.set("n", "<leader><Bslash>", "<cmd>vsp<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>sp<cr>", { desc = "Horizontal split" })

-- Utility edit keymaps
vim.keymap.set("n", "<leader>er", require("genghis").renameFile, { desc = "Rename file" })
vim.keymap.set("n", "<leader>em", require("genghis").moveAndRenameFile, { desc = "Move file" })
vim.keymap.set("n", "<leader>ed", require("genghis").duplicateFile, { desc = "Duplicate file" })
vim.keymap.set("n", "<leader>ex", require("genghis").chmodx, { desc = "Make file executable" })

-- LSP related keymaps
vim.keymap.set("n", "<leader>cr", require("LspUI.rename").run, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", require("LspUI.code_action").run, { desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>cd", require("LspUI.peek_definition").run, { desc = "Preview Definition" })
vim.keymap.set(
	"n",
	"<leader>ct",
	require("goto-preview").goto_preview_type_definition,
	{ desc = "Preview Type Definition" }
)
vim.keymap.set(
	"n",
	"<leader>ci",
	require("goto-preview").goto_preview_implementation,
	{ desc = "Preview Implementation" }
)
vim.keymap.set("n", "<leader>ch", require("LspUI.hover").run, { desc = "Hover Documentation" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
vim.keymap.set("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
vim.keymap.set("n", "<leader>cwl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List Workspace Folders" })

-- Nabla
vim.keymap.set("n", "<leader>mp", require("nabla").popup, { desc = "Open math popup" })

-- Searchbox
vim.keymap.set("n", "<leader>ss", require("searchbox").incsearch, { desc = "Search" })
vim.keymap.set("n", "<leader>sr", require("searchbox").replace, { desc = "Search and Replace" })
vim.keymap.set("n", "<leader>sa", function()
	require("searchbox").match_all({ confirm = true })
end, { desc = "Match all" })

-- Cmdline
vim.keymap.set("n", "<CR>", require("fine-cmdline").open, { desc = "Open Cmdline" })

-- Luasnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("n", "<leader>b", require("carbon").explore_float, { desc = "Open File Browser" })
