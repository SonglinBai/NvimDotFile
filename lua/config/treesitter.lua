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
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    }
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner"
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner"
    }
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer"
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer"
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer"
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer"
    }
  }
}
