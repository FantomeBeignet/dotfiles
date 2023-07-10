local format_buffer = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(_client)
			return _client.name == "null-ls"
		end,
	})
end

local null_ls = require("null-ls")
local formatters = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatters.clang_format,
		formatters.dart_format,
		formatters.gofumpt,
		formatters.goimports_reviser,
		formatters.golines,
		formatters.ocamlformat,
		formatters.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"svelte",
				"astro",
			},
		}),
		formatters.ruff,
		formatters.rustfmt,
		formatters.stylua,
	},
	on_attach = function(client, bufnr)
		-- Enable formatting on sync
		if client.supports_method("textDocument/formatting") then
			local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = format_on_save,
				buffer = bufnr,
				callback = function()
					format_buffer(bufnr)
				end,
			})
		end
	end,
})
