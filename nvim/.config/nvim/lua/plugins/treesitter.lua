return {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate", -- Automatically install updates for parsers
      event = { "BufReadPost", "BufNewFile" }, -- Load on file open
      config = function()
        require("nvim-treesitter.configs").setup({
          -- List of languages to install
          ensure_installed = {
            "lua", "javascript", "typescript", "python", "go", "html", "css", "json", "bash", "markdown",
          },
          highlight = {
            enable = true, -- Enable syntax highlighting
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true, -- Enable Tree-sitter-based indentation
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
              },
            },
          },
        })
      end,
    },
  }