require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    vimgrep_arguments = {
      'rg', '--hidden', '--iglob', '!.git', '--color=never', '--no-heading', '--with-filename', '--line-number',
      '--column', '--smart-case'
    },
    borderchars = {
      prompt  = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    }
  },
}

-- Enable extensions
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'harpoon')
pcall(require('telescope').load_extension, 'file_browser')
