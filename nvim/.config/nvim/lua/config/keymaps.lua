-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center when navigating big blocks
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- Exit insert with jj
vim.keymap.set("i", "jj", "<Esc>")

-- Don't save with x
vim.keymap.set("n", "x", '"_x')

-- Disable the letters on the sidebar
vim.keymap.set({ "n", "v", "o" }, "m", "<Nop>", { noremap = true, silent = true })

-- Center current buffer
vim.keymap.set("n", "<leader>z", ":NoNeckPain<CR>", { desc = "Toggle No Neck Pain", silent = true })
