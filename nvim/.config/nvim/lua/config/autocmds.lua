local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- ─── File editing ─────────────────────────────────────────────────────────────

-- Strip trailing whitespace before every save
autocmd("BufWritePre", {
  pattern  = "*",
  command  = [[%s/\s\+$//e]],
})

-- Auto-create parent directories when saving a file in a new path
autocmd("BufWritePre", {
  callback = function(ev)
    local file = vim.loop.fs_realpath(ev.match) or ev.match
    local dir  = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Restore cursor to its last known position when reopening a file
autocmd("BufReadPost", {
  callback = function()
    local mark  = vim.api.nvim_buf_get_mark(0, '"')
    local lines = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


-- ─── LSP format on save ───────────────────────────────────────────────────────

local fmt_group = augroup("LspFormatting", {})
local fmt_filetypes = {
  "javascript", "typescript", "typescriptreact", "javascriptreact",
  "css", "scss", "html", "json", "yaml", "markdown",
  "python", "go", "lua", "rust",
}

autocmd("BufWritePre", {
  group    = fmt_group,
  callback = function()
    local ft = vim.bo.filetype
    for _, allowed in ipairs(fmt_filetypes) do
      if ft == allowed then
        vim.lsp.buf.format({ async = false })
        return
      end
    end
  end,
})


-- ─── Window & layout ──────────────────────────────────────────────────────────

-- Re-equalise split sizes when the Neovim window is resized
autocmd("VimResized", {
  callback = function() vim.cmd("wincmd =") end,
})

-- Open :help windows in a vertical split to the right
autocmd("BufEnter", {
  pattern  = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then vim.cmd("wincmd L") end
  end,
})


-- ─── Visual feedback ──────────────────────────────────────────────────────────

-- Flash yanked region briefly (like VS Code's copy highlight)
autocmd("TextYankPost", {
  group    = augroup("HighlightYank", {}),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})


-- ─── Terminal ─────────────────────────────────────────────────────────────────

-- Clean terminal buffer appearance
autocmd("TermOpen", {
  pattern  = "term://*",
  callback = function()
    vim.opt_local.number         = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn     = "no"
    vim.cmd("startinsert")
  end,
})

-- Return to normal mode when leaving a terminal buffer
autocmd("BufLeave", {
  pattern  = "term://*",
  callback = function() vim.cmd("stopinsert") end,
})
