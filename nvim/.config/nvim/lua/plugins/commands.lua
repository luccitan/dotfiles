return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
      spec = {
        -- Group labels make the popup show context instead of raw key letters
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>s", group = "split" },
        { "<leader>t", group = "buffer" },
        { "g",         group = "goto" },
        { "]",         group = "next" },
        { "[",         group = "prev" },

        -- Show all buffer-local keymaps in a popup
        {
          "<leader>?",
          function() require("which-key").show({ global = false }) end,
          desc = "buffer keymaps",
        },
      },

      win = {
        border  = "rounded",
        padding = { 1, 2 }, -- { top/bottom, left/right }
      },
    },
  },
}
