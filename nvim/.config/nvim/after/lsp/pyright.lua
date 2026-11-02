---@type vim.lsp.Config
return {
  settings = { pyright = { disableOrganizeImports = true } },
  on_attach = function(_, bufnr)
    -- Ruff owns import organization; project .venv is selected automatically.
    vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", function(command)
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, name = "pyright" })) do
        client.settings.python = vim.tbl_deep_extend("force", client.settings.python or {}, {
          pythonPath = vim.fn.expand(command.args),
        })
        client:notify("workspace/didChangeConfiguration", { settings = client.settings })
      end
    end, { desc = "Set Python interpreter", nargs = 1, complete = "file" })
  end,
}
