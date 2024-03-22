local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

-- remap the key used to leave insert mode
map('i', 'jj', '<esc>', defaults)

-- make reload of nvim config 
map('n', '<Leader>rr', ':luafile $MYVIMRC', defaults)

-- Toggle nvim-tree
map('n', 'nt', ':NvimTreeToggle<CR>', defaults)

-- Natural hotkeys with CTRL
map('n', '<C-S>', ':w<CR>', defaults) -- Ctrl-S save
map('v', '<C-X>', '"+x', defaults) -- cut
map('v', '<C-C>', '"+y', defaults) -- copy
map('', '<C-V', '"+gp', defaults) -- paste

-- Telescope mappings
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', defaults)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', defaults)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', defaults)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', default)
vim.keymap.set('n', '<leader>fw', ':Telescope workspaces<CR>', defaults) 

-- Mappings for the vim splits, analogous to my tmux splits
map('n', '<Leader>s<left>', ':leftabove vnew<CR>', defaults)
map('n', '<Leader>s<right>', ':rightbelow vnew<CR>', defaults)
map('n', '<Leader>s<up>', ':leftabove new<CR>', defaults)
map('n', '<Leader>s<down>', ':rightbelow new<CR>', defaults)

-- Move to previous/next
map('n', '<Leader>tr', '<Cmd>BufferPrevious<CR>', defaults)
map('n', '<Leader>ty', '<Cmd>BufferNext<CR>', defaults)
-- Goto buffer in position...
map('n', '<Leader>t1', '<Cmd>BufferGoto 1<CR>', defaults)
map('n', '<Leader>t2', '<Cmd>BufferGoto 2<CR>', defaults)
map('n', '<Leader>t3', '<Cmd>BufferGoto 3<CR>', defaults)
map('n', '<Leader>t4', '<Cmd>BufferGoto 4<CR>', defaults)
map('n', '<Leader>t5', '<Cmd>BufferGoto 5<CR>', defaults)
map('n', '<Leader>t6', '<Cmd>BufferGoto 6<CR>', defaults)
map('n', '<Leader>t7', '<Cmd>BufferGoto 7<CR>', defaults)
map('n', '<Leader>t8', '<Cmd>BufferGoto 8<CR>', defaults)
map('n', '<Leader>t9', '<Cmd>BufferGoto 9<CR>', defaults)
map('n', '<Leader>t0', '<Cmd>BufferLast<CR>', defaults)
-- Pin/unpin buffer
map('n', '<Leader>tp', '<Cmd>BufferPin<CR>', defaults)
-- Close buffer
map('n', '<Leader>c', '<Cmd>BufferClose<CR>', defaults)

