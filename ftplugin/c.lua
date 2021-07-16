if require("utils").check_lsp_client_active "clangd" then
  return
end

local clangd_flags = {
  "--background-index",
  "--cross-file-rename",
  "--clang-tidy-checks=clang-diagnostic-*,clang-analyzer-*,-*,bugprone*,modernize*,performance*,-modernize-pass-by-value,-modernize-use-auto,-modernize-use-using,-modernize-use-trailing-return-type",
}

require("lspconfig").clangd.setup {
  cmd = {"clangd", unpack(clangd_flags)},
  capabilities = require'lsp'.capabilities
}
