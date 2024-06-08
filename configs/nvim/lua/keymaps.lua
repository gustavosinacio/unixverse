-- Additional Keybindings
--

local myOS = vim.loop.os_uname().sysname

MainMod = 'A'

if myOS == "Darwin" then
  MainMod = 'D'
end

print(myOS, MainMod)

vim.keymap.set('n', '<leader>ol', ':Lazy<CR>', {})
vim.keymap.set('n', '<leader>om', ':Mason<CR>', {})
vim.keymap.set('n', '<leader>os', ':LspInfo<CR>', {})
vim.keymap.set('n', '<leader>go', ':DiffviewOpen<CR>', {})
vim.keymap.set('n', '<leader>gc', ':DiffviewClose<CR>', {})

vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('n', '<leader>as', ':wa<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })    -- Save 

vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })    -- Quit with Leader + q
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlight with Leader + h

vim.keymap.set('n', '<'..MainMod..'-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })


-- adds mapping for creating new lines above and beneath while in the middle of the line
vim.keymap.set('i', '<'..MainMod..'-S-CR>', '<Esc>ko', { noremap = true, silent = true })
vim.keymap.set('n', '<'..MainMod..'-S-CR>', 'ko<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', '<'..MainMod..'-j>', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<'..MainMod..'-k>', 'O<Esc>', { noremap = true, silent = true })

-- Move lines up and down
vim.keymap.set('n', '<'..MainMod..'-j>', 'ddp', {})
vim.keymap.set('n', '<'..MainMod..'-k>', 'ddkkp', {})
vim.keymap.set('i', '<'..MainMod..'-j>', '<Esc>ddpa', {})
vim.keymap.set('i', '<'..MainMod..'-k>', '<Esc>ddkkpa', {})

