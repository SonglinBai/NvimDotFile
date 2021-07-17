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
      config = function()
        require("config.nvimtree").config()
      end
    }

    -- auto completion
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require("config.compe").config()
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
    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter"
      -- run = ":TSUpdate"
    }
    use {"nvim-treesitter/nvim-treesitter-textobjects"}
    use {"p00f/nvim-ts-rainbow"}
    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("config.telescope").config()
      end
    }

    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      after = {"telescope.nvim", "nvim-compe"},
      config = function()
        require("config.autopairs").config()
      end
    }

    -- Color scheme
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- Status Line
    use {
      "glepnir/galaxyline.nvim",
      event = "BufWinEnter",
      config = function()
        require("config.lunarline").config()
      end,
      -- some optional icons
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    use {
      "romgrk/barbar.nvim",
      event = "BufWinEnter",
      config = function()
        require("config.barbar").config()
      end,
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- Motion
    use {
      "phaazon/hop.nvim",
      as = "hop",
      event = "BufRead",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
      end
    }
    -- indent line, have bug, disabled it
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require("config.indent-blankline").config()
      end,
      disable = true
    }
    --git
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("config.gitsigns").config()
      end
    }
    -- Comment
    use {
      "b3nj5m1n/kommentary",
      event = "BufRead",
      config = function()
        require("config.comment").config()
      end
    }

    -- Color
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufWinEnter",
      config = function()
        require("config.colorizer").config()
      end,
      disable = true
    }
    -- Outline
    use {
      "simrat39/symbols-outline.nvim",
      event = "BufWinEnter",
      config = function()
        require("config.outline").config()
      end
    }

    -- Format
    use {
      "mhartington/formatter.nvim",
      event = "BufRead",
      config = function()
        require("config.formatter").config()
      end
    }
    use {
      "iamcco/markdown-preview.nvim",
      ft = {"markdown"},
      run = "cd app && yarn install",
      disable = true
    }

    -- diffview
    use {
      "sindrets/diffview.nvim",
      event = "BufWinEnter"
    }
    -- surround
    use {
      "blackCauldron7/surround.nvim",
      event = "BufRead",
      config = function()
        require "surround".setup {}
      end
    }
    -- zen mode
    use {
      "Pocco81/TrueZen.nvim",
      event = "BufWinEnter",
      config = function()
        require("config.zen").config()
      end,
      disable = true
    }
    -- quickfix enhancement
    use {
      "kevinhwang91/nvim-bqf",
      event = "BufWinEnter",
      config = function()
        require("config.bqf").config()
      end
    }
    use {
      "lervag/vimtex",
      ft = "tex",
      config = function()
        require("config.vimtex").config()
      end
    }
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").config()
      end
    }
    use {
      "akinsho/nvim-toggleterm.lua",
      event = "BufWinEnter",
      config = function()
        require("config.terminal").config()
      end
    }
  end
)
