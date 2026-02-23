-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"

-- Set tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.list = false
vim.opt.smartindent = true

vim.opt.hlsearch = false -- Highlight search results
vim.opt.scrolloff = 18
vim.opt.ignorecase = true -- Make commands case insensitive
vim.opt.backspace = { "start", "eol", "indent" }

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable window borders
vim.opt.fillchars = {
    eob = " ",
    vert = " ",
}

-- Exit insert with jj
vim.keymap.set("i", "jj", "<Esc>")

-- Don't save with x
vim.keymap.set("n", "x", '"_x')

-- UI
vim.keymap.set("n", "<leader>uc", ":NoNeckPain<CR>", { desc = "Zen Mode", silent = true })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferClose<CR>", { desc = "Close buffer", silent = true })

-- Tab navigation
vim.keymap.set("n", "<A-t>", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<A-w>", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>", { silent = true })

-- Window (pane) navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window", silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window", silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Create vertical split", silent = true })
vim.keymap.set("n", "<leader>wd", ":dsplit<CR>", { desc = "Delete split", silent = true })

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Lang
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "es" }

vim.o.showtabline = 2

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        vim.fn.system("prettierd stop")
    end,
})

-------------------------------------------------------------------------

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = false },
})

vim.cmd("colorscheme tokyonight")

vim.diagnostic.config({
    virtual_text = {
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})
