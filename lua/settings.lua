-- set Global variable
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

local cmd = vim.cmd
local opt = vim.opt
if vim.fn.has("unix") == 1 then
  vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python"
  opt.rtp:append "/usr/local/opt/fzf"
elseif vim.fn.has("win32") == 1 then
  vim.g.python3_host_prog = "C:/Users/bsl13/virtualenv/nvim/Scripts/python"
  opt.rtp:append(DATA_PATH .. "\\fzf\\")
end


cmd "filetype plugin on"
cmd "set inccommand=split"
cmd "set iskeyword+=-"
cmd "set whichwrap+=<,>,[,],h,l"

opt.completeopt = "menuone,noselect"
opt.hidden = true
opt.wrap = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.ignorecase = true
opt.pumheight = 10
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

opt.scrolloff = 1
opt.sidescrolloff = 5

opt.autoread = true
opt.history = 1000

vim.api.nvim_command [[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
]]

require "utils".define_augroups(
  -- ENABLE yank highlight
  {
    general_settings = {
      {
        "TextYankPost",
        "*",
        "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})"
      }
    },
    -- ENABLE auto load filetype file
    AutoFt = {
      {
        "FileType",
        "*",
        "lua require('utils').do_filetype(vim.fn.expand('<amatch>'))"
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
