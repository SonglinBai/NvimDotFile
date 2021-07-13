local g = vim.g

g.asyncrun_open = 6

if vim.fn.has('win32') == 1 then
  g.asynctasks_extra_config = {'~/AppData/Local/nvim/tasks.ini'}
  g.asynctasks_system = 'win32'
else
  g.asynctasks_extra_config = {'~/.config/nvim/tasks.ini'}
  g.asynctasks_system = 'macos'
end

g.asynctasks_term_pos = 'external'

-- Define new runner for macos

vim.cmd[[
  function! s:mac_term(opts)
    let cmds = []
    let cmds += ['cd' . shellescape(getcwd())]
    let cmds += [a:opts.cmd]
    let text = shellescape(join(cmds, ";"))
    let command = stdpath('config') . '/scripts/macterm ') . text
    call system(command . ' &')
  endfunction
  let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
  let g:asyncrun_runner.macterm = function('s:mac_term')
]]
