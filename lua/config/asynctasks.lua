local g = vim.g

g.asyncrun_open = 6

if vim.fn.has('win32') == 1 then
  g.asynctasks_extra_config = {'~/AppData/Local/nvim/tasks.ini'}
else
  g.asynctasks_extra_config = {'~/.config/nvim/tasks.ini'}
end

g.asynctasks_term_pos = 'external'
