local gl = require "galaxyline"
local gls = gl.section
local condition = require "galaxyline.condition"
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }
local colors = require "galaxyline.theme"
local mode_map = {
  n = {'NORMAL', colors.blue},
  i = {'INSERT', colors.green},
  v = {'REPLACE', colors.purple},
  [""] = {'V-BLOCK', colors.purple},
  V = {'V-LINE', colors.purple},
  c = {'COMMAND', colors.magenta},
  no = {'NORMAL', colors.blue},
  s = {'SELECT', colors.orange},
  S = {'S-LINE', colors.orange},
  [""] = {'S-BLOCK', colors.orange},
  ic = {'INSERT-C', colors.yellow},
  R = {'REPLACE', colors.red},
  Rv = {'V-REPLACE', colors.red},
  cv = {'EX', colors.blue},
  ce = {'N-EX', colors.blue},
  r = {'H-ENTER', colors.cyan},
  rm = {'--MORE', colors.cyan},
  ["r?"] = {'Q-SORT', colors.cyan},
  ["!"] = {'E-SHELL', colors.blue},
  t = {'TERMINAL', colors.blue},
}

table.insert(gls.left, {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      -- vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_map[vim.fn.mode()][2])
      return mode_map[vim.fn.mode()][1]
    end,
    icon = "BufferIcon",
    highlight = 'StatusLineNC'
    -- highlight = {colors.red, colors.bg}
  },
})
-- print(vim.fn.getbufvar(0, 'ts'))
-- vim.fn.getbufvar(0, "ts")

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineGit",
  },
})

table.insert(gls.left, {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = "StatusLineGitAdd",
  },
})

table.insert(gls.left, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = "StatusLineGitChange",
  },
})

table.insert(gls.left, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = "StatusLineGitDelete",
  },
})

table.insert(gls.right, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = "StatusLineLspDiagnosticsError",
  },
})
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsWarning",
  },
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsInformation",
  },
})

table.insert(gls.right, {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",

    highlight = "StatusLineLspDiagnosticsHint",
  },
})

table.insert(gls.right, {
  TreesitterIcon = {
    provider = function()
      if next(vim.treesitter.highlighter.active) ~= nil then
        return "  "
      end
      return ""
    end,
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineTreeSitter",
  },
})

table.insert(gls.right, {
  ShowLspClient = {
    provider = "GetLspClient",
    condition = function()
      local tbl = { ["dashboard"] = true, [" "] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = " ",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  LineInfo = {
    provider = "LineColumn",
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  PerCent = {
    provider = "LinePercent",
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})
table.insert(gls.short_line_left, {
  BufferType = {
    provider = "FileTypeName",
    separator = "|",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,

    highlight = "StatusLineNC",
  },
})

--table.insert(gls.short_line_right[1] = {BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}})
