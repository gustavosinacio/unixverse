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
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

-- vim.keymap.set({"n", "i", MainMod .. "s>", ":w<CR>:mksession!<CR>", { noremap = true, silent = true }) -- Save

vim.keymap.set("n", MainMod .. "l>", function()
  -- function to run
  print(vim.fn.getcurpos(), vim.api.nvim_get_current_line(), vim.api.nvim_win_get_cursor(0))
end, {})

-- Window splitting
-- vim.keymap.set({ "n", "i" }, MainMod .. "Bslash>", "<C-w><C-v>", {})
-- vim.keymap.set({ "n", "i" }, "<S-D-Bslash>", "<C-w><C-s>", {})
-- vim.keymap.set({ "n", "i" }, MainMod .. "w>", "<C-w><C-q>", {})
-- vim.keymap.set({ "n", "i" }, MainMod .. "e>", "<C-w><C-w>", {})

-- Creating new lines above and beneath while in the middle of the line
vim.keymap.set({ "i", "n" }, MainMod .. "j>", "<Esc>ddp", {})
vim.keymap.set({ "i", "n" }, MainMod .. "k>", "<Esc>ddkP", {})

-- NOTE: Tabs
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmh", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tml", ":+tabmove<CR>", { noremap = true })