vim.fn.sign_define(
  "DapBreakpoint",
  {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = ""
  }
)

local dap = require "dap"
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

-- dap.adapters.cpptools = {
--   type = "executable",
--   command = "C:\\Users\\bsl13\\dap\\cpptools-win32\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe"
-- }
-- 
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "cpptools",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false
--   }
-- }
dap.adapters.lldb = {
  type = 'executable',
  command = "C:\\Users\\bsl13\\bin\\lldb-vscode.exe", -- adjust as needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

vim.cmd [[
  nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
  nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
  nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
  nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
  nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
  nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]]
