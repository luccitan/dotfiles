-- https://github.com/microsoft/vscode-json-languageservice
-- install: npm i -g vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd          = { "vscode-json-language-server", "--stdio" },
  filetypes    = { "json", "jsonc" },
  root_markers = { ".git" },

  settings = {
    json = {
      validate = { enable = true },
      -- For automatic schema matching, add plugin b0o/schemastore.nvim and uncomment:
      -- schemas = require("schemastore").json.schemas(),
    },
  },
}
