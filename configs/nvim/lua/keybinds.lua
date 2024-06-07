-- Functions for keymaps
-- Lua function to handle conditional cut behavior
_G.conditional_cut = function()
  local mode = vim.fn.mode()
  if mode == "n" then
    -- Normal mode: cut the current line
    vim.api.nvim_command('normal! dd')
  elseif mode == "v" or mode == "V" or mode == "" then
    -- Visual mode (character-wise, line-wise, block-wise): cut the selection
    vim.api.nvim_command('normal! d')
  end
end


-- Additional Keybindings
vim.keymap.set('n', 'll', ':Lazy<CR>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>', { noremap = true, silent = true })    -- Save 

vim.keymap.set('n', '<C-x>', ':lua conditional_cut()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })    -- Quit with Leader + q
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlight with Leader + h

vim.keymap.set('n', '<C-t>', ':Neotree<CR>', { noremap = true, silent = true })

