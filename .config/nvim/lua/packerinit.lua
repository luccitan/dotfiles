-- Sources / inspirations
--  1. https://www.vincent-barrault.fr/articles/gerer-ses-plugins-nvim-avec-packer

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- 1. Install `packer` if not installed yet
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- List of plugins there
  --
  -- IDE-oriented plugins
  use 'sheerun/vim-polyglot'
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }  
  use { "LinArcX/telescope-command-palette.nvim" }

  -- Aesthetics
  use { "catppuccin/nvim", as = "catppuccin" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
