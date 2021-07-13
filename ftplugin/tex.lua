vim.opt.conceallevel = 0
-- Check active client, only run single language client
if require("utils").check_lsp_client_active "texlab" then
  return
end
require "lspconfig".texlab.setup {
  capabilities = require'lsp'.capabilities
}
