require('bqf').setup({
    auto_enable = true,
    magic_window = true,
    auto_resize_height = true,
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '┃'}
    },
    func_map = {
        split = '<C-s>',
        vsplit = '<C-v>',
    },
    filter = {
        fzf = {
            action_for = {
                  ['ctrl-t'] = 'tabedit',
                  ['ctrl-v'] = 'vsplit',
                  ['ctrl-s'] = 'split',
                  ['ctrl-q'] = 'signtoggle',
      },
            extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
        }
    }
})

