-- set Global variable
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

O = {
  colorscheme = "spacegray",
  python3_path = "~/.pyenv/versions/nvim/bin/python",
  fzf_rtp = "/usr/local/opt/fzf",
  vsnip_snippet_dir = CONFIG_PATH .. "/snippets/",

  vim_opt = {
    completeopt = "menuone,noselect",
    hidden = true,
    wrap = false,
    encoding = "utf-8",
    fileencoding = "utf-8",
    ignorecase = true,
    incsearch = true,
    smartcase = true,
    tabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    expandtab = true,
    splitbelow = true,
    splitright = true,
    smartindent = true,
    cindent = true,
    autoindent = true,
    pumheight = 10,
    ruler = false,
    cmdheight = 1,
    cursorline = true,
    background = "dark",
    showtabline = 2,
    showmode = false,
    showcmd = true,
    signcolumn = "yes",
    number = true,
    relativenumber = true,
    termguicolors = true,
    wildmenu = true,
    wildignorecase = true,
    mouse = "a",
    laststatus = 2,
    conceallevel = 0,
    updatetime = 0,
    timeoutlen = 500,
    writebackup = false,
    swapfile = false,
    backup = false,
    undodir = CACHE_PATH .. '/undo/',
    undofile = true,
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldenable = false,
    errorbells = false,
    visualbell = false,
    scrolloff = 1,
    sidescrolloff = 5,
    autoread = true,
    history = 1000,
    shell = "zsh",
  }
}

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
-- Windows
if vim.fn.has("win32") == 1 then
  O.python3_path = "C:/Users/bsl13/virtualenv/nvim/Scripts/python"
  O.fzf_rtp = DATA_PATH .. "\\fzf\\"
  O.vim_opt.undodir = CACHE_PATH .. "\\undo\\"
  O.vsnip_snippet_dir = CONFIG_PATH .. "\\snippets\\"
  O.vim_opt.shell = "cmd"
end

opt.shortmess:append "c"
opt.rtp:append(O.fzf_rtp)
g.python3_host_prog = O.python3_path

cmd "filetype plugin on"
cmd "set inccommand=split"
cmd "set iskeyword+=-"
-- cmd "set whichwrap+=<,>,[,],h,l"


-- Color Scheme
cmd "colorscheme spacegray"


-- vim option
for k, v in pairs(O.vim_opt) do
  vim.opt[k] = v
end

-- Autocmd
vim.api.nvim_command [[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
]]

-- Augroups
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

-- Functions
vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction
]]
