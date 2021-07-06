-- set Global variable
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

vim.g.python3_host_prog="C:/Users/bsl13/virtualenv/nvim/Scripts/python"
vim.o.hidden=true
vim.o.wrap=false
vim.o.encoding="utf-8"
vim.o.pumheight=10
vim.o.fileencoding="utf-8"
vim.o.ruler=true
vim.o.cmdheight=1
vim.o.mouse="a"
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.conceallevel=0
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.smarttab=true
vim.o.expandtab=true
vim.o.smartindent=true
vim.o.autoindent=true
vim.o.laststatus=2
vim.o.number=true
vim.o.cursorline=true
vim.o.background="dark"
vim.o.showtabline=2
vim.o.showmode=true
vim.o.backup=false
vim.o.writebackup=false
vim.o.signcolumn="yes"
vim.o.updatetime=300
vim.o.timeoutlen=200
vim.o.incsearch=true
vim.o.termguicolors=true
vim.o.undodir=CACHE_PATH .. "\\undo\\"
vim.o.undofile=true
vim.o.relativenumber=true
-- vim.o.shortmess:append "c"

-- vim.o.title=true

