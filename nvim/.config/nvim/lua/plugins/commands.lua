return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        }
      },
      spec = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
      triggers = { "auto" }, -- automatically setup triggers
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
    },
  }
    --   -- Register key mappings
    --   which_key.add({
    --     -- {"<leader>f", group = "File" },
    --     {"<leader>g", group = "Git" },
    --     {"<leader>l", group = "LSP" },
    --     {"<leader>t", group = "Terminal/Tabs" },
    --     {"<leader>s", group = "Search/Split" },
    --   })
    -- end
}