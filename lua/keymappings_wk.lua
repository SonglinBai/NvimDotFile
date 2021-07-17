vim.g.mapleader = " "
-- Toggle search highlight
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
vim.api.nvim_set_keymap(
  "i",
  "<Tab>",
  "compe#confirm({'select': v:true, 'keys': '<Tab>'})",
  {noremap = true, silent = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})

vim.cmd [[
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]]

local wk = require "which-key"

local n_map = {
  ["<leader>"] = {
    ["f"] = {
      name = "+Telescope",
      f = {"<cmd>Telescope find_files<CR>", "Find file"},
      g = {"<cmd>Telescope live_grep<CR>", "Live grep"},
      b = {"<cmd>Telescope buffers<CR>", "Buffers"},
      j = {"<cmd>Telescope jumplist<CR>", "Jump list"},
      r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"}
    },
    ["b"] = {
      name = "Buffers",
      j = {"<cmd>BufferPick<cr>", "jump to buffer"},
      f = {"<cmd>Telescope buffers<cr>", "Find buffer"},
      w = {"<cmd>BufferWipeout<cr>", "wipeout buffer"},
      e = {
        "<cmd>BufferCloseAllButCurrent<cr>",
        "close all but current buffer"
      },
      h = {"<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left"},
      l = {
        "<cmd>BufferCloseBuffersRight<cr>",
        "close all BufferLines to the right"
      },
      D = {
        "<cmd>BufferOrderByDirectory<cr>",
        "sort BufferLines automatically by directory"
      },
      L = {
        "<cmd>BufferOrderByLanguage<cr>",
        "sort BufferLines automatically by language"
      }
    },
    ["g"] = {
      name = "+Git",
      j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
      k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
      l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
      p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
      r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
      R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
      s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk"
      },
      o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
      b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
      c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)"
      }
    },
    e = {"<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
    q = {"<cmd>call QuickFixToggle()<CR>", "Toggle QuickFix"},
    o = {"<cmd>SymbolsOutline<CR>", "Toggle Outline"},
    w = {"<cmd>w!<CR>", "Save"},
    x = {"<cmd>xa<CR>", "Save all and quit"},
    c = {"<cmd>BufferClose<CR>", "Colse buffer"},
    ["l"] = {
      name = "+Lsp",
      s = {"<cmd>LspStart<CR>", "Start LSP"},
      S = {"<cmd>LspStop<CR>", "Stop LSP"},
      r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
      -- r = {"<cmd>LspRestart<CR>", "Restart LSP"},
      i = {"<cmd>LspInfo<CR>", "LSP info"},
      f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer"}
    },
    ["p"] = {
      name = "Packer",
      c = {"<cmd>PackerCompile<cr>", "Compile"},
      i = {"<cmd>PackerInstall<cr>", "Install"},
      s = {"<cmd>PackerSync<cr>", "Sync"},
      u = {"<cmd>PackerUpdate<cr>", "Update"}
    }
  },
  ["g"] = {
    c = {
      name = "Comment motion",
      c = "Current line"
    },
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
  [","] = {
    c = {"<cmd>HopChar1<CR>", "Jump by 1 char"},
    s = {"<cmd>HopPattern<CR>", "Jump by pattern"},
    w = {"<cmd>HopWord<CR>", "Jump to word"},
    l = {"<cmd>HopLine<CR>", "Jump to line"}
  },
  ["gc"] = "Comment"
}

-- register map
wk.register(n_map, {mode = "n", prefix = ""})
wk.register(v_map, {mode = "v", prefix = ""})
