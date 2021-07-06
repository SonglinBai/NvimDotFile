local execute = vim.api.nvim_command
local fn = vim.fn
--[[
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
--]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "kyazdani42/nvim-tree.lua",
    -- cmd = "NvimTreeToggle",
    -- config = function() require("config.tree") end,
  }

  -- auto completion
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    -- config = function() require("config.compe").config() end,
  }
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }

  -- language server
  use { "neovim/nvim-lspconfig" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
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
     config = function() require
       'config.galaxyline'
     end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
