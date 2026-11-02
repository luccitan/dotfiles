return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000, -- Establish highlights before other plugins.
    config = function()
      vim.cmd.colorscheme("vscode")
    end,
  },
}
