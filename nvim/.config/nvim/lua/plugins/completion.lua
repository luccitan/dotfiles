return {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
      },
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          mapping = {
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
          },
        })
      end,
    },
  }