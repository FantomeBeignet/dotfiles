-- which-key group names
require('which-key').register({
  ['<leader>c'] = { name = '+code' },
  ['<leader>f'] = { name = '+find' },
  ['<leader>h'] = { name = '+harpoon' },
})

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope keymaps
vim.keymap.set('n', '<leader>b', require('telescope').extensions.file_browser.file_browser,
  { noremap = true, desc = 'Open file browser' })
vim.keymap.set('n', '<leader>fF', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fg',
  function() require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false }) end,
  { desc = 'Find in current buffer' })

vim.keymap.set('n', '<leader>ff', function()
  -- Show hidden files
  require('telescope.builtin').find_files({
    find_command = { 'rg', '--files', '--color', 'never', '--iglob', '!.git', '--hidden' }
  })
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags({ previewer = false }) end,
  { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current Word' })
vim.keymap.set('n', '<leader>fG', require('telescope.builtin').live_grep, { desc = 'Find by Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fm',
  function() require('telescope').extensions.harpoon.marks({ layout_config = { height = 7 } }) end,
  { desc = 'Find Marks' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = 'Find References' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').lsp_incoming_calls,
  { desc = 'Find Incoming Calls' })
vim.keymap.set('n', '<leader>fC', require('telescope.builtin').lsp_outgoing_calls,
  { desc = 'Find Outgoing Calls' })
vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_implementations, { desc = 'Find Implementations' })
vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').lsp_document_symbols({ previewer = false }) end,
  { desc = 'Find Document Symbols' })
vim.keymap.set('n', '<leader>fS',
  function() require('telescope.builtin').lsp_dynamic_workspace_symbols({ previewer = false }) end,
  { desc = 'Find Workspace Symbols' })

-- [[ Configure Harpoon ]]
local hm = require('harpoon.mark')
local hui = require('harpoon.ui')
vim.keymap.set('n', '<leader>ha', hm.add_file, { desc = 'Harpoon Add' })
vim.keymap.set('n', '<leader>hq', function() hui.nav_file(1) end, { desc = 'Mark 1' })
vim.keymap.set('n', '<leader>hw', function() hui.nav_file(2) end, { desc = 'Mark 2' })
vim.keymap.set('n', '<leader>he', function() hui.nav_file(3) end, { desc = 'Mark 3' })
vim.keymap.set('n', '<leader>hr', function() hui.nav_file(4) end, { desc = 'Mark 4' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, { desc = 'Open floating diagnostic' })

require('leap').add_default_mappings()
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
vim.keymap.set('n', '<leader>l', function()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end, { desc = 'Leap' })
require('flit').setup()
require('leap-spooky').setup()

-- Vim Tmux navigator setup
vim.keymap.set('n', '<ctrl>h', '<cmd>TmuxNavigateLeft<cr>', { desc = "Left Tmux window" })
vim.keymap.set('n', '<ctrl>j', '<cmd>TmuxNavigateDown<cr>', { desc = "Down Tmux window" })
vim.keymap.set('n', '<ctrl>k', '<cmd>TmuxNavigateUp<cr>', { desc = "Up Tmux window" })
vim.keymap.set('n', '<ctrl>l', '<cmd>TmuxNavigateRight<cr>', { desc = "Right Tmux window" })

require('zen-mode').setup({})
vim.keymap.set('n', '<leader>z', require('zen-mode').toggle, { desc = 'Toggle Zen mode' })
