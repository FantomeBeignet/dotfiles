local format_buffer = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(_client)
			return _client.name == "null-ls"
		end,
	})
end

local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
	nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")

	nmap("gd", vim.lsp.buf.definition, "Goto Definition")
	nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
	nmap("gI", vim.lsp.buf.implementation, "Goto Implementation")
	nmap("<leader>cd", vim.lsp.buf.type_definition, "Type Definition")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
	nmap("<leader>cwa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
	nmap("<leader>cwr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
	nmap("<leader>cwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "List Workspace Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
	nmap("<leader>cf", function()
		format_buffer(bufnr)
	end, "Format buffer")

	if client.server_capabilities.codeLensProvider then
		local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
			group = codelens,
			callback = function()
				require("ftb.codelens").refresh_virtlines()
			end,
			buffer = bufnr,
		})
	end
end

local servers = {
	clangd = {},
	gopls = {},
	rust_analyzer = {},
	tsserver = {},
	pylsp = {},
	pyright = {},
	ruff_lsp = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				nilness = true,
				unusedwrite = true,
			},
		},
	},
})

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = "utf-8"
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- Additional LSP keymaps
vim.keymap.set("n", "<leader>ch", function()
	vim.lsp.buf.hover()
end, { desc = "Help for symbol" })

lspconfig.ocamllsp.setup({
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = lspconfig.util.root_pattern(
		"*.opam",
		"esy.json",
		"package.json",
		".git",
		"dune-project",
		"dune-workspace"
	),
	on_attach = on_attach,
	capabilities = capabilities,
})
