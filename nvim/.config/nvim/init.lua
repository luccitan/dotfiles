-- Set leader key
vim.g.mapleader = " " -- Space leader key

-- Loading non-plugins configuration / customisation
require "config.autocmds"
require "config.mappings"
require "config.settings"

require "config.lazy"

-- Configs are loaded natively by neovim inside lsp/ directory
-- Most/all of configs are taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.lsp.enable({
    -- lua
    "luals",

    -- python
    "pyright",
    "ruff",

    -- bash
    "bashls"
})