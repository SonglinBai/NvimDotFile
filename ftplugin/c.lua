if require("utils").check_lsp_client_active "clangd" then
  return
end

local clangd_flags = {
  "--background-index",
  "--cross-file-rename"
}

require("lspconfig").clangd.setup {
  cmd = {"clangd", unpack(clangd_flags)},
  capabilities = require'lsp'.capabilities
}
