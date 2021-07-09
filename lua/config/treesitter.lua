-- TODO:Don't work on windows, fix later
require "nvim-treesitter.install".compilers = {"clang"}
require "nvim-treesitter.configs".setup {
  ensure_installed = {"cpp", "lua", "c", "json"},
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = true
  },
  autopairs = {
    enable = true
  }
}
