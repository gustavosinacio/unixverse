-- Additional Keybindings
vim.keymap.set('n', '<S-l>', ':Lazy<CR>', {})

vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })    -- Save 

vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })    -- Quit with Leader + q
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlight with Leader + h

vim.keymap.set('n', '<C-t>', ':Neotree<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-t>', ':Neotree close<CR>', { noremap = true, silent = true })

-- Move lines up and down
vim.keymap.set('n', '<D-j>', 'ddp')
vim.keymap.set('n', '<D-J>', 'ddkkp')









