local M = {}

M.config = function()
  local opts = {
    -- size can be a number or function which is passed the current terminal
    size = 5,
    -- open_mapping = [[<c-\>]],
    open_mapping = [[<c-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      border = "curved",
      -- width = <value>,
      -- height = <value>,
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal"
      }
    }
  }
  require("toggleterm").setup(opts)
end

return M
