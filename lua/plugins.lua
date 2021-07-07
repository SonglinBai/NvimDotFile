local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    config = function() require("config.nvimtree") end,
  }

  -- auto completion
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function() require("config.compe") end,
  }
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }

  -- language server
  use { "neovim/nvim-lspconfig" }

  -- Treesitter
  
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("config.treesitter") end,
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = { "telescope.nvim", "nvim-compe" },
    config = function() require('config.autopairs') end
  }

  -- Color scheme
  use 'arcticicestudio/nord-vim'
  use 'rakr/vim-one'
  use 'joshdick/onedark.vim'

  -- Status Line
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
     config = function() require('config.galaxyline') end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'romgrk/barbar.nvim',
    config = function() require('config.barbar') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Motion
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
    -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- QuickScope
  use {
    "unblevable/quick-scope",
    config = function() require("config.quickscope") end
  }

  -- indent line
  use "lukas-reineke/indent-blankline.nvim"

  --git
  use {
  'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require("config.gitsigns") end
  }
  -- Comment
  use {
    'b3nj5m1n/kommentary',
    config = function() require('config.kommentary') end
  }

  -- Color
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('config.colorizer') end
  }

end)

