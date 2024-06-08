-- Additional Keybindings

local myOS = vim.loop.os_uname().sysname

mainMod = nil

if myOS == "Darwin" then
  mainMod = 'D'
else
  mainMod = 'A'
end

print(myOS, mainMod)

if BinaryFormat == "dll" then
    function os.name()
        myOS = "Windows"
    end
elseif BinaryFormat == "so" then
    function os.name()
        myOS = "Linux"
    end
elseif BinaryFormat == "dylib" then
    function os.name()
        myOS = "MacOS"
    end
end


vim.keymap.set('n', '<'..mainMod..'-l><'..mainMod..'-l>', ':Lazy<CR>', {})
vim.keymap.set('i', '<D-l><D-l>', ':Lazy<CR>', {})

vim.keymap.set('n', '<D-l><D-s>', ':LspInfo<CR>', {})
vim.keymap.set('i', '<D-l><D-s>', ':LspInfo<CR>', {})

vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('n', '<leader>as', ':wa<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })    -- Save 
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })    -- Save 

vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })    -- Quit with Leader + q
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlight with Leader + h

vim.keymap.set('n', '<D-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })


-- adds mapping for creating new lines above and beneath while in the middle of the line
vim.keymap.set('i', '<D-CR>', '<Esc>o', { noremap = true, silent = true })
vim.keymap.set('n', '<D-CR>', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<D-S-CR>', '<Esc>ko', { noremap = true, silent = true })
vim.keymap.set('n', '<D-S-CR>', 'ko<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>j', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', 'O<Esc>', { noremap = true, silent = true })


-- Move lines up and down
vim.keymap.set('n', '<D-j>', 'ddp', {})
vim.keymap.set('n', '<D-J>', 'ddkkp', {})


