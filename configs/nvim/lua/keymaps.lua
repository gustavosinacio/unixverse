--
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
vim.keymap.set("n", "<leader>gg", ":DiffviewOpen<CR>", {})
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", {})

vim.keymap.set("n", "<leader>as", ":wa<CR>", { noremap = true, silent = true })                  -- Save
vim.keymap.set("n", MainMod .. "s>", ":w<CR>:mksession!<CR>", { noremap = true, silent = true }) -- Save
vim.keymap.set("i", MainMod .. "s>", "<Esc>:w<CR>", { noremap = true, silent = true })           -- Save

vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })                    -- Quit with Leader + q
vim.keymap.set("n", "<leader>sq", ":wq<CR>", { noremap = true, silent = true })                  -- Quit with Leader + q
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })           -- Clear search highlight with Leader + h

vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>E", ":Neotree close<CR>", { noremap = true, silent = true })

-- Move lines up and down
vim.keymap.set("n", MainMod .. "S-j>", "yyp", {})  -- copy line down
vim.keymap.set("n", MainMod .. "S-k>", "yykp", {}) -- copy line up

-- Creating new lines above and beneath while in the middle of the line
vim.keymap.set("n", MainMod .. "j>", "ddp", {})
vim.keymap.set("n", MainMod .. "k>", "ddkP", {})

-- Create line underneath
vim.keymap.set({ "n", "i" }, MainMod .. "CR>", "<Esc>o", {})
vim.keymap.set({ "n", "i" }, MainMod .. "S-CR>", "<Esc>O", {})

-- Testground
vim.keymap.set("n", MainMod .. "l>", function()
  -- function to run
  print(vim.fn.getcurpos(), vim.api.nvim_get_current_line(), vim.api.nvim_win_get_cursor(0))
end, {})

vim.keymap.set("i", MainMod .. "j>", "<Esc>ddp", {})
vim.keymap.set("i", MainMod .. "k>", "<Esc>ddkP", {})

vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- Window splitting
vim.keymap.set({ "n", "i" }, MainMod .. "Bslash>", "<C-w><C-v>", {})
vim.keymap.set({ "n", "i" }, "<S-D-Bslash>", "<C-w><C-s>", {})
vim.keymap.set({ "n", "i" }, MainMod .. "w>", "<C-w><C-q>", {})
vim.keymap.set({ "n", "i" }, MainMod .. "e>", "<C-w><C-w>", {})

-- Undo & redo
vim.keymap.set({ "n", "i" }, MainMod .. "z>", "<Esc>:undo<CR>", {})
vim.keymap.set({ "n", "i" }, MainMod .. "S-z>", "<Esc>:redo<CR>", {})
