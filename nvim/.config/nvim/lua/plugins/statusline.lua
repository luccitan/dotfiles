return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event        = "VeryLazy",

    opts = {
      options = {
        theme                = "tokyonight", -- Match the active colorscheme
        globalstatus         = true,         -- Single statusline across all splits
        section_separators   = "",
        component_separators = "",
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch + LSP counts
        lualine_c = { { "filename", path = 1 } },        -- Relative file path
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
