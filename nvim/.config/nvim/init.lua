-- Generic vim configuration
--
-- Inspirations:
--  - https://github.com/potamides/dotfiles/blob/master/.config/nvim/init.lua
--  - https://github.com/NavePnow/dotfiles/tree/main/.config/nvim
--

require 'config.options'
require 'config.keys'
require 'config.autocmds'

-- ------------------------------------------------
-- LAZY package manager setup
-- + plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  ui = {
    icons = { -- using Unicode icons
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- require 'plugins.lualine'

-- Navigation plugins
-- require 'plugins.nvim-tree'
-- require 'plugins.telescope'
-- require 'plugins.workspaces'
-- require 'plugins.sessions'
-- require 'plugins.barbar'

-- Other plugins
-- require 'plugins.which_key'

-- -- Making an automatic packer compile when the packerinit file is updated
-- vim.cmd([[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost lua/packerinit.lua source <afile> | PackerCompile
--   augroup end
-- ]])

