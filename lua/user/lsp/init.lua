local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
-- require "user.lsp.ccls_config"
require "user.lsp.clangd"
require "user.lsp.robotframework_ls"
