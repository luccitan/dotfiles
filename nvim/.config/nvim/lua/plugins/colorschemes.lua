return {
    {
      "folke/tokyonight.nvim",
      lazy = false, -- Load immediately if it’s the main colorscheme
      priority = 1000, -- Ensure it loads before other plugins
      config = function()
        vim.cmd([[colorscheme tokyonight]])
      end,
    },
  }