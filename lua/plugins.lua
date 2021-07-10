local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
      "kyazdani42/nvim-tree.lua",
      -- cmd = "NvimTreeToggle",
      config = function()
        require("config.nvimtree")
      end
    }

    -- auto completion
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require("config.compe")
      end
    }
    use {
      "hrsh7th/vim-vsnip",
      event = "InsertEnter"
    }
    use {
      "rafamadriz/friendly-snippets",
      event = "InsertEnter"
    }

    -- language server
    use {"neovim/nvim-lspconfig"}
    use {
      "glepnir/lspsaga.nvim"
    }
    -- Treesitter

    use {
      "nvim-treesitter/nvim-treesitter",
      -- run = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end
    }
    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("config.telescope")
      end
    }
    use {"GustavoKatel/telescope-asynctasks.nvim"}

    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      after = {"telescope.nvim", "nvim-compe"},
      config = function()
        require("config.autopairs")
      end
    }

    -- Color scheme
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- Status Line
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      -- your statusline
      config = function()
        require("config.lunarline")
      end,
      -- some optional icons
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    use {
      "romgrk/barbar.nvim",
      config = function()
        require("config.barbar")
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- Motion
    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
      end
    }
    -- QuickScope
    use {
      "unblevable/quick-scope",
      config = function()
        require("config.quickscope")
      end
    }

    -- indent line, have bug, disabled it
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require("config.indent-blankline")
      end,
      disable = true
    }
    --git
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("config.gitsigns")
      end
    }
    -- Comment
    use {
      "b3nj5m1n/kommentary",
      config = function()
        require("config.kommentary")
      end
    }

    -- Color
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("config.colorizer")
      end
    }
    -- Outline
    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("config.outline")
      end
    }

    -- Format
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("config.formatter")
      end
    }
    -- Scroll
    use {
      "karb94/neoscroll.nvim",
      config = function()
        require("config.neoscroll")
      end,
      disable = true
    }
    -- Markdown
    use {
      "plasticboy/vim-markdown",
      requires = {{"godlygeek/tabular"}},
      ft = {"markdown"},
      config = function()
        require("config.markdown")
      end
    }

    use {
      "iamcco/markdown-preview.nvim",
      ft = {"markdown"},
      run = "cd app && yarn install"
    }

    -- task
    use {
      "skywind3000/asynctasks.vim",
      requires = {{"skywind3000/asyncrun.vim"}},
      config = function()
        require("config.asynctasks")
      end
    }
    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("config.toggleterm")
      end
    }
  end
)
