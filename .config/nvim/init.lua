-- Generic vim configuration
--
-- Inspirations:
--  - https://github.com/potamides/dotfiles/blob/master/.config/nvim/init.lua
--
--  ---------

-- Package manager and configs
require 'packerinit'
require 'options'
require 'keys'

-- Aesthetics plugins 
require 'plugins.catppuccin'
require 'plugins.lualine'

-- Navigation plugins
require 'plugins.nvim-tree'
require 'plugins.telescope'
require 'plugins.workspaces'
require 'plugins.sessions'

-- Other plugins
require 'plugins.which_key'

-- Making an automatic packer compile when the packerinit file is updated 
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/packerinit.lua source <afile> | PackerCompile
  augroup end
]])

