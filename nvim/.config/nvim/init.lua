-- Set leader key
vim.g.mapleader = " " -- Space leader key

-- Loading non-plugins configuration / customisation
require "config.autocmds"
require "config.mappings"
require "config.settings"

------------------------------------------------------------------------------------------------------------------------
-------------- Plugin Management
------------------------------------------------------------------------------------------------------------------------
-- Bootstraping lazy.nvim
-- Taken straight ouf of the documentation (november 2024)
-- https://lazy.folke.io/installation

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setting up Lazy

require("lazy").setup({
  spec = {
    -- import your plugins
    -- This way plugins are imported from nvim/lua/plugins folder
    -- Lua files within should return table with the plugins to install
    { import = "plugins" },
  },

  install = { colorscheme = { "tokyonight" } }, -- default colorscheme during install

  -- automatically check for plugin updates
  checker = { enabled = true },
})
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------