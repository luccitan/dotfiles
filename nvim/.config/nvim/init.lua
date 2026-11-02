assert(vim.fn.has("nvim-0.12") == 1, "This configuration requires Neovim 0.12+")

-- Plugins read leaders at setup time.
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

require("config.settings")
require("config.mappings")
require("config.autocmds")
require("config.lsp").setup()

require("config.lazy")
