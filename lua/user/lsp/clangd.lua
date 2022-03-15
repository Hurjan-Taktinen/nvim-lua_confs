-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["clangd"].setup({
--     capabilities = capabilities,
-- })

lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--all-scopes-completion",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--cross-file-rename",
    },
})
