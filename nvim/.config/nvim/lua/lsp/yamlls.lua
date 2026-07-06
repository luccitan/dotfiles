-- https://github.com/redhat-developer/yaml-language-server
-- install: npm i -g yaml-language-server

---@type vim.lsp.Config
return {
  cmd          = { "yaml-language-server", "--stdio" },
  filetypes    = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },

  settings = {
    yaml = {
      validate    = true,
      schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
    },
  },
}
