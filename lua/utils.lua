local utils = {}

function utils.check_lsp_client_active(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

function utils.define_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd("autocmd!")

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.cmd(command)
    end
    vim.cmd("augroup END")
  end
end

utils.find_lua_ftplugins = function(filetype)
  local patterns = {
    string.format("ftplugin/%s.lua", filetype),

    -- Looks like we don't need this, because the first one works
    -- string.format("after/ftplugin/%s.lua", filetype),
  }

  local result = {}
  for _, pat in ipairs(patterns) do
    vim.list_extend(result, vim.api.nvim_get_runtime_file(pat, true))
  end

  return result
end

utils.do_filetype = function(filetype)
  local ftplugins = utils.find_lua_ftplugins(filetype)

  local f_env = setmetatable({
    -- Override print, so the prints still go through, otherwise it's confusing for people
    print = vim.schedule_wrap(print)
  }, {
    -- Buf default back read/write to whatever is going on in the global landscape
    __index = _G,
    __newindex = _G,
  })

  for _, file in ipairs(ftplugins) do
    local f = loadfile(file)
    if not f then
      vim.api.nvim_err_writeln("Unable to load file: " .. file)
    else
      local ok, msg = pcall(setfenv(f, f_env))

      if not ok then
        vim.api.nvim_err_writeln("Error while processing file: " .. file .. "\n" .. msg)
      end
    end
  end
end

return utils
