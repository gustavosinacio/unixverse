-- My config for nvim
-- General Settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = "\\"

vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.hlsearch = true -- Highlight search results
vim.o.incsearch = true -- Incremental search
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
vim.o.wrap = false -- Disable line wrap
vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable true color support
vim.o.signcolumn = "yes" -- Always show the sign column
