local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

-- remap the key used to leave insert mode
map('i', 'jj', '<esc>', defaults)

-- make reload of nvim config 
map('n', '<Leader>rr', ':source ~/.config/nvim/init.lua<CR>', defaults)

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
