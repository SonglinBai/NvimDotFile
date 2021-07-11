local lsp_config = {}

lsp_config.init = function()
  -- Set Sign
  vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
  )
  vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
  )
  vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
  )
  vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
  )

  -- Set Default Prefix.
  -- Note: You can set a prefix per lsp server in the lv-globals.lua file
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      --[[ virtual_text = {
      prefix = "",
      spacing = 0
    }, ]]
      virtual_text = false,
      signs = true,
      underline = true
    }
  )

  -- symbols for autocomplete
  vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
  }
  -- goto definition
  vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  -- goto declaration
  vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
  -- list references
  vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  -- goto implementation
  vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})

  -- Set q to close lspinfo window
  require("utils").define_augroups {
    _general_lsp = {
      {"FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>"}
    }
  }
end

lsp_config.capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_config.capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp_config.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {"documentation", "detail", "additionalTextEdits"}
}
return lsp_config
