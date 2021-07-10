-- set Global variable
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

local cmd = vim.cmd
local opt = vim.opt
vim.g.python3_host_prog = "C:/Users/bsl13/virtualenv/nvim/Scripts/python"

cmd "filetype plugin indent on"
cmd "set inccommand=split"
cmd "set iskeyword+=-"
cmd "set whichwrap+=<,>,[,],h,l"

opt.completeopt = "menuone,noselect"
opt.hidden = true
opt.wrap = false
opt.encoding = "utf-8"
opt.ignorecase = true
opt.pumheight = 10
opt.fileencoding = "utf-8"
opt.ruler = false
opt.cmdheight = 1
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.conceallevel = 0
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.smartcase = true
opt.expandtab = true
opt.smartindent = true
opt.cindent = true
opt.swapfile = false
opt.autoindent = true
opt.laststatus = 2
opt.number = true
opt.cursorline = true
opt.background = "dark"
opt.showtabline = 2
opt.showmode = false
opt.showcmd = true
opt.backup = false
opt.writebackup = false
opt.signcolumn = "yes"
opt.updatetime = 300
opt.timeoutlen = 500
opt.incsearch = true
opt.termguicolors = true
opt.undodir = CACHE_PATH .. "\\undo\\"
opt.undofile = true
opt.relativenumber = true
opt.shortmess:append "c"
opt.wildmenu = true
opt.wildignorecase = true

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.errorbells = false
opt.visualbell = false

vim.api.nvim_command [[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
]]

-- ENABLE yank highlight
require"utils".define_augroups(
  {
    general_settings = {
      {
        "TextYankPost",
        "*",
        "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})"
      }
    }
  }
)

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction
]]

-- enable diabled built modules
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin", -- 'man',
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  -- 'matchit', 'matchparen', 'shada_plugin',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
