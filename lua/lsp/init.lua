local nvim_lsp = require("lspconfig")
-- Init lsp saga
require "lspsaga".init_lsp_saga()

-- Set lua-language-server path
local sumneko_root_path = "C:\\Users\\bsl13\\language-server\\lua-language-server"
local sumneko_binary =
  "C:\\Users\\bsl13\\language-server\\lua-language-server\\bin\\Windows\\lua-language-server.exe"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {"documentation", "detail", "additionalTextEdits"}
}

-- Disable diagnostic virtual text
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      -- Disable virtual_text
      virtual_text = false
    }
  )
}

local servers = {"pyright", "clangd", "cmake"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    handlers = handlers
  }
end
-- Load lua-language-server
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "Lua5.4.2",
        -- Setup your lua path
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
      }
    }
  },
  capabilities = capabilities,
  handlers = handlers
}

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

-- goto definition
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
-- goto declaration
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
-- list references
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
-- goto implementation
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
-- find definition and references
--[[ vim.api.nvim_set_keymap(
  "n",
  "gh",
  "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
  {noremap = true, silent = true}
) ]]
-- hover doc
vim.api.nvim_set_keymap(
  "n",
  "K",
  "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
  {noremap = true, silent = true}
)
-- smart scroll
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<C-b>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
  {noremap = true, silent = true}
)
-- signature help
-- vim.api.nvim_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { noremap = true, silent = true })
-- rename symbol
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  "<cmd>lua require('lspsaga.rename').rename()<CR>",
  {noremap = true, silent = true}
)
-- show cursor diagnostic
vim.api.nvim_set_keymap(
  "n",
  "ge",
  "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
  {noremap = true, silent = true}
)
-- next diagnostic
vim.api.nvim_set_keymap(
  "n",
  "]e",
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
  {noremap = true, silent = true}
)
-- prev diagnostic
vim.api.nvim_set_keymap(
  "n",
  "[e",
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
  {noremap = true, silent = true}
)
-- code action
vim.api.nvim_set_keymap(
  "n",
  "<leader>a",
  "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>a",
  ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
  {noremap = true, silent = true}
)
