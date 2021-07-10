if require("utils").check_lsp_client_active "clangd" then
  return
end

local clangd_flags = {
  "--background-index",
  "--cross-file-rename"
}

require("lspconfig").clangd.setup {
  cmd = {"clangd", unpack(clangd_flags)},
  init_options = {codeAction = false},
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true
      }
    )
  }
}
