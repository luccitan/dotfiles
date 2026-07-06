return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    opts = {
      -- Grammars to auto-install (run :TSUpdate to keep them fresh)
      ensure_installed = {
        "lua", "python", "typescript", "javascript", "tsx",
        "rust", "html", "css", "json", "yaml",
        "bash", "markdown", "markdown_inline",
      },

      highlight = { enable = true }, -- Better syntax coloring than vim's regex engine
      indent    = { enable = true }, -- Treesitter-aware indentation
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
