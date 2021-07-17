local M = {}

M.config = function()
  local actions = require("telescope.actions")
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
      }
      -- borderchars = { '━', '│', '━', '│', '┏', '┓', '┛', '┗' }
    }
  }
end

return M
