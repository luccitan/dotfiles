local servers = require("config.languages").servers

return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig", -- Upstream cmd/filetypes/root detection; no legacy setup().
    },
    opts = {
      ensure_installed = servers,
      automatic_enable = servers,
    },
  },
}
