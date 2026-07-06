local map = vim.keymap.set

-- Convenience wrapper: adds silent + desc in one call
local function opts(desc, extra)
  return vim.tbl_extend("force", { silent = true, desc = desc }, extra or {})
end


-- ─── Insert mode ──────────────────────────────────────────────────────────────
map("i", "jj", "<Esc>", opts("exit insert mode"))


-- ─── Editor ───────────────────────────────────────────────────────────────────
map("n", "<Leader>rr", ":luafile $MYVIMRC<CR>", opts("reload config"))
map("n", "<C-s>",      ":w<CR>",                opts("save file"))
map("i", "<C-s>",      "<Esc>:w<CR>",           opts("save file"))

-- Navigate wrapped lines visually (j/k move by screen line, not logical line)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- ─── Clipboard ────────────────────────────────────────────────────────────────
map("v", "<C-x>", '"+x',    opts("cut"))
map("v", "<C-c>", '"+y',    opts("copy"))
map("",  "<C-v>", '"+gP',   opts("paste"))
map("i", "<C-v>", "<C-r>+", opts("paste"))


-- ─── Undo / redo ──────────────────────────────────────────────────────────────
map("n", "<C-z>", "u",           opts("undo"))
map("i", "<C-z>", "<C-o>u",      opts("undo"))
map("n", "<C-y>", "<C-r>",       opts("redo"))
map("i", "<C-y>", "<C-o><C-r>",  opts("redo"))


-- ─── Buffer navigation ────────────────────────────────────────────────────────
map("n", "<C-Tab>",    "<Cmd>bnext<CR>",     opts("next buffer"))
map("n", "<C-S-Tab>",  "<Cmd>bprevious<CR>", opts("previous buffer"))
map("n", "<Leader>tr", "<Cmd>bprevious<CR>", opts("previous buffer"))
map("n", "<Leader>ty", "<Cmd>bnext<CR>",     opts("next buffer"))
map("n", "<Leader>x",  "<Cmd>bdelete<CR>",   opts("close buffer"))
map("n", "<Leader>c",  "<Cmd>bdelete<CR>",   opts("close buffer"))


-- ─── Split management ─────────────────────────────────────────────────────────
map("n", "<Leader>sv", ":vsplit<CR>", opts("vertical split"))
map("n", "<Leader>sh", ":split<CR>",  opts("horizontal split"))
map("n", "<C-h>", "<C-w>h", opts("move to left split"))
map("n", "<C-j>", "<C-w>j", opts("move to split below"))
map("n", "<C-k>", "<C-w>k", opts("move to split above"))
map("n", "<C-l>", "<C-w>l", opts("move to right split"))


-- ─── Find (fzf-lua) ───────────────────────────────────────────────────────────
-- <C-e> repurposed from NvimTreeToggle (was broken — no file tree installed)
map("n", "<C-e>",      "<Cmd>FzfLua files<CR>",               opts("find files"))
map("n", "<Leader>e",  "<Cmd>FzfLua files<CR>",               opts("find files"))
map("n", "<Leader>ff", "<Cmd>FzfLua files<CR>",               opts("find files"))
map("n", "<Leader>fb", "<Cmd>FzfLua buffers<CR>",             opts("find buffers"))
map("n", "<Leader>fr", "<Cmd>FzfLua oldfiles<CR>",            opts("recent files"))
map("n", "<Leader>/",  "<Cmd>FzfLua live_grep<CR>",           opts("search in project"))
map("n", "<Leader>fw", "<Cmd>FzfLua grep_cword<CR>",          opts("search word under cursor"))
map("n", "<Leader>fd", "<Cmd>FzfLua diagnostics_workspace<CR>", opts("workspace diagnostics"))

-- Command & help discovery (VS Code command-palette equivalent)
map("n", "<Leader>:",  "<Cmd>FzfLua commands<CR>",  opts("command palette"))
map("n", "<Leader>fh", "<Cmd>FzfLua help_tags<CR>", opts("search help"))
map("n", "<Leader>fk", "<Cmd>FzfLua keymaps<CR>",   opts("search keymaps"))
-- <leader>fp is defined in plugins/projects.lua (requires project.nvim)


-- ─── LSP ──────────────────────────────────────────────────────────────────────
-- F-key variants mirror VS Code; <leader>l* variants are discoverable via which-key
map("n", "K",          vim.lsp.buf.hover,           opts("hover docs"))
map("n", "gd",         vim.lsp.buf.definition,      opts("go to definition"))
map("n", "gr",         vim.lsp.buf.references,      opts("find references"))
map("n", "gi",         vim.lsp.buf.implementation,  opts("go to implementation"))

map("n", "<F12>",     vim.lsp.buf.definition,       opts("go to definition"))
map("n", "<C-F12>",   vim.lsp.buf.references,       opts("find references"))
map("n", "<F2>",      vim.lsp.buf.rename,           opts("rename symbol"))
map("n", "<C-Space>", vim.lsp.buf.code_action,      opts("code actions"))

map("n", "<Leader>ld", vim.lsp.buf.definition,      opts("go to definition"))
map("n", "<Leader>lr", vim.lsp.buf.references,      opts("find references"))
map("n", "<Leader>ln", vim.lsp.buf.rename,          opts("rename symbol"))
map("n", "<Leader>la", vim.lsp.buf.code_action,     opts("code actions"))
map("n", "<Leader>lf", function() vim.lsp.buf.format({ async = false }) end, opts("format buffer"))
map("n", "<Leader>li", "<Cmd>LspInfo<CR>",          opts("LSP info"))

-- Diagnostic navigation
map("n", "]d",         vim.diagnostic.goto_next,    opts("next diagnostic"))
map("n", "[d",         vim.diagnostic.goto_prev,    opts("previous diagnostic"))
map("n", "<Leader>le", vim.diagnostic.open_float,   opts("show diagnostic"))


-- ─── Multi-cursor simulation ──────────────────────────────────────────────────
-- cgn selects the next match of the last search and enters change mode.
-- Pressing . repeats the change for each subsequent match (poor-man's multi-cursor).
map("n", "<C-d>", "*``cgn", opts("change next occurrence"))
map("x", "<C-d>", "*``cgn", opts("change next occurrence"))


-- ─── Folding ─────────────────────────────────────────────────────────────────
map("n", "<C-[>", "za", opts("toggle fold"))
map("n", "<C-]>", "zR", opts("open all folds"))


-- ─── Terminal (native floating window, no plugin) ─────────────────────────────
local _term = { buf = -1, win = -1 }

local function toggle_float_term()
  -- Close if already visible
  if vim.api.nvim_win_is_valid(_term.win) then
    vim.api.nvim_win_hide(_term.win)
    _term.win = -1
    return
  end

  -- Compute 85 × 80 % of the editor area, centred
  local cols, rows = vim.o.columns, vim.o.lines
  local w = math.floor(cols * 0.85)
  local h = math.floor(rows * 0.80)

  if not vim.api.nvim_buf_is_valid(_term.buf) then
    _term.buf = vim.api.nvim_create_buf(false, true)
  end

  _term.win = vim.api.nvim_open_win(_term.buf, true, {
    relative = "editor", style = "minimal", border = "rounded",
    width    = w,        height = h,
    col      = math.floor((cols - w) / 2),
    row      = math.floor((rows - h) / 2),
  })

  -- Turn the buffer into a terminal on first open
  if vim.bo[_term.buf].buftype ~= "terminal" then
    vim.fn.termopen(vim.o.shell)
  end
  vim.cmd("startinsert")
end

map("n", "<C-`>", toggle_float_term, opts("toggle terminal"))
map("t", "<C-`>", function()
  if vim.api.nvim_win_is_valid(_term.win) then
    vim.api.nvim_win_hide(_term.win)
    _term.win = -1
  end
end, opts("hide terminal"))
map("t", "<Esc>", "<C-\\><C-n>", opts("exit terminal mode"))
