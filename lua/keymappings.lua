vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})

vim.g.mapleader = " "
-- Toggle search highlight
vim.api.nvim_set_keymap("n", "<A-h>", ":set hlsearch!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-w>", ":w<CR>", {noremap = true, silent = true})

-- Use Ctrl-n/p to navigate in command mode
vim.api.nvim_set_keymap("c", "<C-n>", "<down>", {noremap = true})
vim.api.nvim_set_keymap("c", "<C-p>", "<up>", {noremap = true})

-- Toggle file explorer
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Better window movemoment, ctrl+h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})

-- Better visual indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true, silent = true})

-- use jk as ESC
-- vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true, silent = true})

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

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", {noremap = true, silent = true})

-- Better nav for omnicomplete
--[[ vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")' ]]
-- vim.api.nvim_set_keymap("i", "<C-j>", "<C-n>", { expr = true })
-- vim.api.nvim_set_keymap("i", "<C-k>", "<C-p>", { expr = true })

-- Use register 0 when paste in visual mode
vim.cmd 'vnoremap p "0p'
vim.cmd 'vnoremap P "0P'

-- Toggle the QuickFix window
vim.api.nvim_set_keymap("n", "<leader>q", ":call QuickFixToggle()<CR>", {noremap = true, silent = true})

-- Hop, Quick navigation
vim.api.nvim_set_keymap("n", ",c", ":HopChar1<cr>", {silent = true})
--vim.api.nvim_set_keymap("n", ",C", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",s", ":HopPattern<cr>", {silent = true})
vim.api.nvim_set_keymap("n", ",w", ":HopWord<cr>", {silent = true})
vim.api.nvim_set_keymap("n", ",l", ":HopLine<cr>", {silent = true})

-- compe
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap(
  "i",
  "<CR>",
  'compe#confirm(luaeval("require \'nvim-autopairs\'.autopairs_cr()"))',
  {silent = true, expr = true, noremap = true}
)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope grep_string<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fj", ":Telescope jumplist<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fr", ":Telescope registers<CR>", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<leader>ft",
  ":lua require('telescope').extensions.asynctasks.all()<CR>",
  {noremap = true}
)

-- Outline
vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<CR>", {noremap = true})

-- Markdown
vim.api.nvim_set_keymap("n", "<f12>", ":MarkdownPreviewToggle<CR>", {noremap = true})
