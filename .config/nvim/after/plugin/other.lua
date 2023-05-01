local af_augroup = vim.api.nvim_create_augroup("Autoformatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "lua", "go", "rust", "java", "ocaml", "c", "cpp", "make", "typescript", "javascript", "svelte", "astro", "sh" },
  callback = function()
    vim.lsp.buf.format()
  end,
  group = af_augroup,
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
