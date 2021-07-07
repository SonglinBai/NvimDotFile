local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
colors.bg = "#2C323C"
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','packer'}

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_hl = {n = colors.red,
                          i = colors.green,
                          v=colors.blue,
                          [''] = colors.blue,
                          V=colors.blue,
                          c = colors.magenta,
                          no = colors.red,
                          s = colors.orange,
                          S=colors.orange,
                          [''] = colors.orange,
                          ic = colors.yellow,
                          R = colors.violet,
                          Rv = colors.violet,
                          cv = colors.red,
                          ce=colors.red,
                          r = colors.cyan,
                          rm = colors.cyan,
                          ['r?'] = colors.cyan,
                          ['!']  = colors.red,
                          t = colors.red}
      local mode_label = {
          n = "NORMAL",
          i = "INSERT",
          v = "VISUAL",
          [''] = "V-BLOCK",
          V = "V-LINE",
          c = "COMMAND",
          no = "OP",
          s = "S-CHAR",
          S = "S-LINE",
          [''] = "S-BLOCK",
          ic = "I-COM",
          R = "REPLACE",
          Rv = "V-REPLACE",
          cv = "EX",
          ce = "N-EX",
          r = "HE",
          rm = "--MORE--",
          ['r?'] = "CONFIRM",
          ['!']  = "SHELL",
          t = "TERMINAL"
      }
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_hl[vim.fn.mode()])
      -- return '  '
      return mode_label[vim.fn.mode()]
    end,
    separator = " ",
    separator_highlight = {"NONE", colors.bg},
    -- highlight = {colors.red,colors.bg,'bold'},
    highlight = {colors.bg,colors.bg,'bold'}
  },
}
gls.left[2] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    icon = ' ',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.orange,colors.bg},
  },
}

gls.left[6] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[7] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[8] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[9] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' ',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    -- separator = ' ',
    -- separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}


