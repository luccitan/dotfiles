return {
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      config = True,
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      build = ":MasonUpdate",
      config = true,
    },
  }