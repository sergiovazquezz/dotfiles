-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set tab to 2 spaces
vim.opt.tabstop = 2 -- Display tabs as 2 spaces wide
vim.opt.shiftwidth = 2 -- Use 2 spaces for indentation
vim.opt.softtabstop = 2 -- Insert 2 spaces when pressing Tab
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.hlsearch = false -- Highlight search results
vim.opt.scrolloff = 20
vim.opt.ignorecase = true -- Make commands case insensitive
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.mouse = "" -- Disable the mouse
