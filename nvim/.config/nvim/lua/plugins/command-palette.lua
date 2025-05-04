return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local which_key = require("which-key")
      which_key.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        win = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        triggers = { "auto" }, -- automatically setup triggers
      })
      
      -- Register key mappings
      which_key.add({
        -- {"<leader>f", group = "File" },
        {"<leader>g", group = "Git" },
        {"<leader>l", group = "LSP" },
        {"<leader>t", group = "Terminal/Tabs" },
        {"<leader>s", group = "Search/Split" },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Add command palette functionality 
      { "<leader>p", "<cmd>Telescope commands<cr>", desc = "Command Palette" },
      { "<leader>:", "<cmd>Telescope commands<cr>", desc = "Command Palette" },
    }
  }
}