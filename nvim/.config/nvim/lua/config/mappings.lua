local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- remap the key used to leave insert mode
map('i', 'jj', '<esc>', defaults)

-- make reload of nvim config
map('n', '<Leader>rr', ':luafile $MYVIMRC<CR>', defaults)

-- Toggle nvim-tree (file explorer)
map('n', '<C-e>', ':NvimTreeToggle<CR>', defaults) -- VSCode-like
map('n', '<Leader>e', ':NvimTreeToggle<CR>', defaults)

-- Natural hotkeys with CTRL (VSCode-like)
map('n', '<C-s>', ':w<CR>', defaults) -- Ctrl-S save
map('i', '<C-s>', '<Esc>:w<CR>', defaults) -- Ctrl-S save in insert mode
map('v', '<C-x>', '"+x', defaults) -- cut
map('v', '<C-c>', '"+y', defaults) -- copy
map('', '<C-v>', '"+gP', defaults) -- paste
map('i', '<C-v>', '<C-r>+', defaults) -- paste in insert mode
map('i', '<C-z>', '<C-o>u', defaults) -- undo in insert mode
map('n', '<C-z>', 'u', defaults) -- undo
map('n', '<C-y>', '<C-r>', defaults) -- redo
map('i', '<C-y>', '<C-o><C-r>', defaults) -- redo in insert mode

-- IDE-like commands
map('n', '<C-p>', ':Telescope find_files<CR>', defaults) -- Quick file open (VSCode default)
map('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', defaults) -- Search in file
map('n', '<C-g>', ':Telescope live_grep<CR>', defaults) -- Global search

-- Command palette
map('n', '<C-Shift-p>', ':Telescope commands<CR>', defaults) -- VSCode Command Palette
map('n', '<Leader>p', ':Telescope commands<CR>', defaults) -- Alternative

-- Telescope mappings (file finder, etc.)
map('n', '<leader>ff', ':Telescope find_files<CR>', defaults)
map('n', '<leader>fg', ':Telescope live_grep<CR>', defaults)
map('n', '<leader>fb', ':Telescope buffers<CR>', defaults)
map('n', '<leader>fh', ':Telescope help_tags<CR>', defaults)
map('n', '<leader>fw', ':Telescope workspaces<CR>', defaults)
map('n', '<leader>fo', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', defaults)

-- Buffer navigation (tabs in VSCode)
map('n', '<C-Tab>', '<Cmd>BufferNext<CR>', defaults) -- Next tab
map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', defaults) -- Previous tab
map('n', '<Leader>tr', '<Cmd>BufferPrevious<CR>', defaults)
map('n', '<Leader>ty', '<Cmd>BufferNext<CR>', defaults)
map('n', '<Leader>x', '<Cmd>BufferClose<CR>', defaults) -- Close buffer
map('n', '<Leader>c', '<Cmd>BufferClose<CR>', defaults) -- Close buffer (alternative)

-- Goto specific buffer by position
map('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', defaults)
map('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', defaults)
map('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>', defaults)
map('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>', defaults)
map('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>', defaults)
map('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>', defaults)
map('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>', defaults)
map('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>', defaults)
map('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>', defaults)
map('n', '<Leader>0', '<Cmd>BufferLast<CR>', defaults)

-- Pin/unpin buffer
map('n', '<Leader>tp', '<Cmd>BufferPin<CR>', defaults)

-- Split management (windows in VSCode)
map('n', '<Leader>sv', ':vsplit<CR>', defaults) -- Vertical split
map('n', '<Leader>sh', ':split<CR>', defaults) -- Horizontal split
map('n', '<C-j>', '<C-w>j', defaults) -- Navigate down
map('n', '<C-k>', '<C-w>k', defaults) -- Navigate up
map('n', '<C-h>', '<C-w>h', defaults) -- Navigate left
map('n', '<C-l>', '<C-w>l', defaults) -- Navigate right

-- Terminal toggle (VSCode integrated terminal)
map('n', '<C-`>', ':ToggleTerm direction=float<CR>', defaults)
map('t', '<C-`>', '<C-\\><C-n>:ToggleTerm<CR>', defaults)
map('t', '<Esc>', '<C-\\><C-n>', defaults) -- Exit terminal mode

-- Format document (VSCode)
-- map('n', '<Leader>f', ':lua vim.lsp.buf.format()<CR>', defaults)

-- Comment toggling (mapped to match VSCode defaults)
map('n', '<C-/>', ':CommentToggle<CR>', defaults)
map('v', '<C-/>', ':CommentToggle<CR>', defaults)
map('n', '<Leader>/', ':CommentToggle<CR>', defaults)
map('v', '<Leader>/', ':CommentToggle<CR>', defaults)

-- Code navigation (VSCode-like)
map('n', '<F12>', ':lua vim.lsp.buf.definition()<CR>', defaults) -- Go to definition
map('n', '<C-F12>', ':lua vim.lsp.buf.references()<CR>', defaults) -- Find all references
map('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', defaults) -- Rename symbol
map('n', '<C-Space>', ':lua vim.lsp.buf.code_action()<CR>', defaults) -- Show code actions

-- Multi-cursor simulation (via visual block mode)
map('n', '<C-d>', '*``cgn', defaults) -- Select next occurrence
map('x', '<C-d>', '*``cgn', defaults)

-- Folding
map('n', '<C-[>', 'za', defaults) -- Toggle fold
map('n', '<C-]>', 'zR', defaults) -- Open all folds

-- Workspace navigation
map('n', '<C-S-p>', ':Telescope workspaces<CR>', defaults) -- Switch workspace