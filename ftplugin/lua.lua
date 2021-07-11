vim.cmd'setlocal tabstop=2 shiftwidth=2'
-- Check active client, only run single language client
if require("utils").check_lsp_client_active "sumneko_lua" then
  return
end

local sumneko_root_path
local sumneko_binary
-- Set lua-language-server path
if vim.fn.has("unix") == 1 then
  sumneko_root_path = "/Users/songlin/language-server/lua-language-server"
  sumneko_binary = "/Users/songlin/language-server/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("win32") == 1 then
  sumneko_root_path = "C:\\Users\\bsl13\\language-server\\lua-language-server"
  sumneko_binary = "C:\\Users\\bsl13\\language-server\\lua-language-server\\bin\\Windows\\lua-language-server.exe"
end
-- Load lua-language-server
require'lspconfig'.sumneko_lua.setup {
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
  capabilities = require'lsp'.capabilities,
}
