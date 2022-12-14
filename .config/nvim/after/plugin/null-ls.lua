require('null-ls').setup({
    sources = {
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.formatting.gofmt,
        require("null-ls").builtins.formatting.prismaFmt,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.clang_formatter,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
