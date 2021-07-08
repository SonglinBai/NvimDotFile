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
opt.mouse = ""
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
opt.timeoutlen = 300
opt.incsearch = true
opt.termguicolors = true
opt.undodir = CACHE_PATH .. "\\undo\\"
opt.undofile = true
opt.relativenumber = true
opt.shortmess:append "c"
opt.wildmenu = true
opt.wildignorecase = true

-- opt.title=true
