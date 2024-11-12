return {
    { "nvim-lualine/lualine.nvim", config = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "akinsho/bufferline.nvim",
      event = "VeryLazy",
      config = true,
    },
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
          update_cwd = false,
        }
      end,
    },
  }
  