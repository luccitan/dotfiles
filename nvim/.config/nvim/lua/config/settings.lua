-- ─── Search ───────────────────────────────────────────────────────────────────
vim.opt.ignorecase = true         -- Case-insensitive search by default
vim.opt.smartcase  = true         -- …but case-sensitive when pattern has uppercase


-- ─── Indentation ──────────────────────────────────────────────────────────────
vim.opt.tabstop     = 2           -- Visual width of a <Tab> character
vim.opt.softtabstop = 2           -- Spaces inserted/removed per <Tab> / <BS>
vim.opt.shiftwidth  = 2           -- Spaces used for >> / << indent
vim.opt.expandtab   = true        -- Convert tabs to spaces
vim.opt.smarttab    = true        -- Use shiftwidth at the start of a line
vim.opt.breakindent = true        -- Indent wrapped lines to match original


-- ─── Lines & columns ──────────────────────────────────────────────────────────
vim.opt.number         = true         -- Absolute line numbers
vim.opt.relativenumber = true         -- Relative numbers (easy jump distances)
vim.opt.cursorline     = true         -- Highlight the current line
vim.opt.cursorlineopt  = "line,number"
vim.opt.textwidth      = 99           -- Hard-wrap at 99 chars (prose only)
vim.opt.colorcolumn    = { 100, 120 } -- Visual ruler columns
vim.opt.scrolloff      = 8            -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff  = 8            -- Keep 8 columns visible left/right
vim.opt.linebreak      = true         -- Break at word boundaries, not mid-word
vim.opt.wrap           = true         -- Soft-wrap long lines visually
vim.opt.whichwrap:append("<,>,[,],h,l") -- Allow h/l and arrow keys to cross line endings


-- ─── Completion ───────────────────────────────────────────────────────────────
vim.opt.completeopt = { "menuone", "noinsert", "popup" } -- popup shows a docs side-pane (0.12+)
vim.opt.pumheight   = 10                                 -- Max items shown in the completion menu


-- ─── Folding ──────────────────────────────────────────────────────────────────
vim.opt.foldenable    = true      -- Enable folding
vim.opt.foldlevelstart = 99       -- All folds open when a file is opened
vim.opt.foldmethod    = "expr"    -- Fold boundaries defined by an expression
vim.opt.foldexpr      = "v:lua.vim.treesitter.foldexpr()" -- Built-in treesitter folds (no plugin needed)


-- ─── Files & persistence ──────────────────────────────────────────────────────
vim.opt.undofile   = true         -- Persist undo history between sessions
vim.opt.undolevels = 10000        -- Max undo steps to keep
vim.opt.swapfile   = false        -- No swap files (modern editors don't use them)
vim.opt.autowrite  = true         -- Auto-save before :next, :make, etc.
vim.opt.hidden     = true         -- Keep buffers loaded when not visible
vim.opt.confirm    = true         -- Ask to save instead of silently failing


-- ─── UI & display ─────────────────────────────────────────────────────────────
vim.opt.termguicolors = true      -- 24-bit color support
vim.opt.showmode      = false     -- Mode is shown by the statusline instead
vim.opt.signcolumn    = "yes"     -- Always-visible sign column (no layout shifts on diagnostics)
vim.opt.laststatus    = 3         -- Single global statusline (not one per split)
vim.opt.list          = true      -- Visualize invisible characters
vim.opt.listchars     = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.conceallevel  = 0         -- Never hide characters (e.g. markdown quote characters)
vim.opt.title         = true      -- Show filename in the OS window title bar


-- ─── Editing behaviour ────────────────────────────────────────────────────────
vim.opt.mouse       = "a"         -- Enable mouse in all modes
vim.opt.clipboard   = "unnamedplus" -- Use the system clipboard for all yank/put
vim.opt.joinspaces  = false       -- No double-space after . when joining lines
vim.opt.virtualedit = "block"     -- Allow free cursor positioning in visual-block mode
vim.opt.backspace   = "indent,eol,start" -- Backspace through indents and line breaks
vim.opt.timeoutlen  = 300         -- Milliseconds to wait for a key-sequence to complete
vim.opt.updatetime  = 100         -- How often the swap file (and CursorHold) fires


-- ─── Splits ───────────────────────────────────────────────────────────────────
vim.opt.splitright = true         -- New vertical splits open to the right
vim.opt.splitbelow = true         -- New horizontal splits open below


-- ─── Command-line completion ──────────────────────────────────────────────────
vim.opt.wildmode    = "longest:full,full" -- Complete longest common match first, then cycle
vim.opt.wildoptions = "pum"               -- Show completion candidates in a popup menu


-- ─── Disable unused built-in plugins ─────────────────────────────────────────
-- These legacy Vim plugins are never needed in a modern Neovim setup.
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

for _, p in ipairs({
  "netrwSettings", "netrwFileHandlers",
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin",
  "vimball", "vimballPlugin",
  "2html_plugin", "logipat", "rrhelper", "spellfile_plugin",
}) do
  vim.g["loaded_" .. p] = 1
end
