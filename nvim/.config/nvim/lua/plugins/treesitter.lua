local parsers = require("config.languages").parsers

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false, -- The rewritten plugin does not support lazy-loading.
    config = function()
      local ts = require("nvim-treesitter")
      if vim.fn.executable("tree-sitter") == 1 then
        ts.install(parsers)
      else
        vim.notify_once("Install tree-sitter-cli (Brewfile) to provision parsers", vim.log.levels.WARN)
      end
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterFeatures", { clear = true }),
        desc = "Enable highlighting, folds and available indentation queries",
        callback = function(ev)
          -- Missing/unsupported parsers retain native syntax and indentation.
          if not pcall(vim.treesitter.start, ev.buf) then return end
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
          if lang and vim.treesitter.query.get(lang, "indents") then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
