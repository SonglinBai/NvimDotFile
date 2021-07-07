vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })

vim.g.mapleader = ' '
-- Toggle search highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Toggle file explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Better window movemoment, ctrl+h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Better visual indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- use jk as ESC
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- Tab switch buffer, alt+number to specific buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<A-'.. tostring(i) ..'>', ':BufferGoto '.. tostring(i) ..'<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', { noremap = true, silent = true })


-- Move line / block of text in visual mode
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'
-- vim.api.nvim_set_keymap("i", "<C-j>", "<C-n>", { expr = true })
-- vim.api.nvim_set_keymap("i", "<C-k>", "<C-p>", { expr = true })

-- Use register 0 when paste in visual mode
vim.cmd 'vnoremap p "0p'
vim.cmd 'vnoremap P "0P'

-- Toggle the QuickFix window
vim.api.nvim_set_keymap("", "<C-q>", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })

-- Hop, Quick navigation
vim.api.nvim_set_keymap("n", ",c", ":HopChar1<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",C", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",s", ":HopPattern<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",w", ":HopWord<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",l", ":HopLine<cr>", { silent = true })

-- LSP
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
