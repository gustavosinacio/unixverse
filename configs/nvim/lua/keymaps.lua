-- Additional Keybindings
--
local myOS = vim.loop.os_uname().sysname
local pureMainMod = "A"

if myOS == "Darwin" then
  pureMainMod = "D"
end

MainMod = "<" .. pureMainMod .. "-"
print(myOS, MainMod)

vim.keymap.set("n", "<leader>ol", ":Lazy<CR>", {})
vim.keymap.set("n", "<leader>om", ":Mason<CR>", {})
vim.keymap.set("n", "<leader>os", ":LspInfo<CR>", {})
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {})
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", {})
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", {})
vim.keymap.set("n", "<leader>as", ":wa<CR>", { noremap = true, silent = true }) -- Save
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>E", ":Neotree close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

vim.keymap.set("n", MainMod .. "s>", ":w<CR>:mksession!<CR>", { noremap = true, silent = true }) -- Save
vim.keymap.set("i", MainMod .. "s>", "<Esc>:w<CR>", { noremap = true, silent = true }) -- Save

vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true }) -- Quit with Leader + q
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true }) -- Quit with Leader + q
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true }) -- Clear search highlight with Leader + h

-- Creating new lines above and beneath while in the middle of the line
vim.keymap.set({ "i", "n" }, MainMod .. "j>", "<Esc>ddp", {})
vim.keymap.set({ "i", "n" }, MainMod .. "k>", "<Esc>ddkP", {})

-- Testground
vim.keymap.set("n", MainMod .. "l>", function()
  -- function to run
  print(vim.fn.getcurpos(), vim.api.nvim_get_current_line(), vim.api.nvim_win_get_cursor(0))
end, {})

-- Window splitting
vim.keymap.set({ "n", "i" }, MainMod .. "Bslash>", "<C-w><C-v>", {})
vim.keymap.set({ "n", "i" }, "<S-D-Bslash>", "<C-w><C-s>", {})
vim.keymap.set({ "n", "i" }, MainMod .. "w>", "<C-w><C-q>", {})
vim.keymap.set({ "n", "i" }, MainMod .. "e>", "<C-w><C-w>", {})