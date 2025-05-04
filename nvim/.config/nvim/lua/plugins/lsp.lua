return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs and related tools
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim", -- Adds Neovim Lua API to LSP
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    },
    config = function()
      -- Setup mason so it can manage external tooling
      require("mason").setup()
      
      -- Setup neodev for better Lua development experience
      require("neodev").setup()
      
      -- Enable LSP features like code actions, diagnostics, etc.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Initialize mason-lspconfig
      require("mason-lspconfig").setup({
        -- Install these LSPs automatically
        ensure_installed = {
          "lua_ls",
          "pyright",
          "tsserver",
          "gopls",
          "html",
          "cssls",
          "jsonls",
        },
      })
      
      -- Setup keymaps for LSP functionality
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        
        -- VSCode-like keybindings
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("n", "<leader>lr", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>lf", vim.lsp.buf.format, "Format Document")
        map("n", "<leader>le", vim.diagnostic.open_float, "Show Diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        map("n", "<leader>lh", vim.lsp.buf.signature_help, "Signature Help")
        map("n", "<leader>lq", vim.diagnostic.setloclist, "Set Location List")
      end
      
      -- Set up LSP servers
      local lspconfig = require('lspconfig')
      
      -- Configure each LSP
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        
        -- Customize specific servers as needed
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
          })
        end,
      })
      
      -- Configure diagnostic symbols
      vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "⚠", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "➤", texthl = "DiagnosticSignHint" })
      
      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}