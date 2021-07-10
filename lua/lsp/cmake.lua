if require("utils").check_lsp_client_active "cmake" then
  return
end

require("lspconfig").cmake.setup {}
