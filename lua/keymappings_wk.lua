vim.g.mapleader = " "
-- Toggle search highlight
vim.api.nvim_set_keymap("n", "<A-h>", ":set hlsearch!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-w>", ":w<CR>", {noremap = true, silent = true})
-- Use Ctrl-n/p to navigate in command mode
vim.api.nvim_set_keymap("c", "<C-n>", "<down>", {noremap = true})
vim.api.nvim_set_keymap("c", "<C-p>", "<up>", {noremap = true})
-- Better window movemoment, ctrl+h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})

-- Better visual indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true, silent = true})
-- Tab switch buffer, alt+number to specific buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", {noremap = true, silent = true})
for i = 1, 9 do
  vim.api.nvim_set_keymap(
    "n",
    "<A-" .. tostring(i) .. ">",
    ":BufferGoto " .. tostring(i) .. "<CR>",
    {noremap = true, silent = true}
  )
end
vim.api.nvim_set_keymap("n", "<A-c>", ":BufferClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-b>", ":BufferPick<CR>", {noremap = true, silent = true})

-- Move line / block of text in visual mode
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", {noremap = true, silent = true})
-- Use register 0 when paste in visual mode
vim.cmd 'vnoremap p "0p'
vim.cmd 'vnoremap P "0P'

-- compe
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap(
  "i",
  "<Tab>",
  "compe#confirm({'select': v:true, 'keys': '<Tab>'})",
  {noremap = true, silent = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})

local wk = require "which-key"

local n_map = {
  ["<leader>"] = {
    f = {
      name = "+Telescope",
      f = {"<cmd>Telescope find_files<CR>", "Find file"},
      g = {"<cmd>Telescope live_grep<CR>", "Live grep"},
      b = {"<cmd>Telescope buffers<CR>", "Buffers"},
      j = {"<cmd>Telescope jumplist<CR>", "Jump list"}
    },
    ["h"] = {
      name = "+GitSigns hunk",
      s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', "Staged hunk"},
      u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Unstaged hunk"},
      r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk"},
      R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer"},
      p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk"},
      b = {'<cmd>lua require"gitsigns".blame_line()<CR>', "Blame line"}
    },
    e = {"<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
    q = {"<cmd>call QuickFixToggle()<CR>", "Toggle QuickFix"},
    o = {"<cmd>SymbolsOutline<CR>", "Toggle Outline"},
    ["z"] = {
      name = "+Zen",
      z = {"<cmd>TZFocus<CR>", "Zen Focus"},
      m = {"<cmd>TZMinimalist<CR>", "Zen Minimalist"},
      a = {"<cmd>TZAtaraxis<CR>", "Zen Ataraxis"}
    },
    ["l"] = {
      name = "+Lsp",
      s = {"<cmd>LspStart<CR>", "Start LSP"},
      S = {"<cmd>LspStop<CR>", "Stop LSP"},
      r = {"<cmd>LspRestart<CR>", "Restart LSP"},
      i = {"<cmd>LspInfo<CR>", "LSP info"},
      f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer"}
    },
    --[[ ["L"] = {
      name = "+Latex",
      c = {"<cmd>VimtexCompile<CR>", "Toggle Compilation Mode"},
      f = {"<cmd>call vimtex#fzf#run()<CR>", "Fzf Find"},
      i = {"<cmd>VimtexInfo<CR>", "Project Information"},
      s = {"<cmd>VimtexStop<CR>", "Stop Project Compilation"},
      t = {"<cmd>VimtexTocToggle<CR>", "Toggle Table Of Content"},
      v = {"<cmd>VimtexView<CR>", "View PDF"}
    } ]]
  },
  ["g"] = {
    --[[ c = {
      name = "Comment motion",
      c = {"", "Current line"}
    }, ]]
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
    D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration"},
    r = {"<cmd>lua vim.lsp.buf.references()<CR>", "Go to references"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation"}
  },
  -- Hop motion
  [","] = {
    c = {"<cmd>HopChar1<CR>", "Jump by 1 char"},
    s = {"<cmd>HopPattern<CR>", "Jump by pattern"},
    w = {"<cmd>HopWord<CR>", "Jump to word"},
    l = {"<cmd>HopLine<CR>", "Jump to line"}
  },
  ["]"] = {
    q = {"<cmd>cnext<CR>", "Next quickfix"},
    e = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next diagnostic"}
  },
  ["["] = {
    q = {"<cmd>cprev<CR>", "Previous quickfix"},
    e = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Previous diagnostic"}
  },
  ["<f12>"] = {"<cmd>MarkdownPreviewToggle<CR>", "Toggle markdown preview"}
}

local v_map = {
  ["<leader>"] = {
    h = {
      name = "+GitSigns hunk",
      s = {'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Stage hunk"},
      r = {'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Reset hunk"}
    }
  },
  [","] = {
    c = {"<cmd>HopChar1<CR>", "Jump by 1 char"},
    s = {"<cmd>HopPattern<CR>", "Jump by pattern"},
    w = {"<cmd>HopWord<CR>", "Jump to word"},
    l = {"<cmd>HopLine<CR>", "Jump to line"}
  },
}

local o_map = {
  ["ih"] = {'<cmd>lua require"gitsigns.actions".select_hunk()<CR>', "inner hunk"}
}
local x_map = {
  ["ih"] = {'<cmd>lua require"gitsigns.actions".select_hunk()<CR>', "inner hunk"}
}
-- register map
wk.register(n_map, {mode = "n", prefix = ""})
wk.register(v_map, {mode = "v", prefix = ""})
wk.register(o_map, {mode = "o", prefix = ""})
wk.register(x_map, {mode = "x", prefix = ""})
