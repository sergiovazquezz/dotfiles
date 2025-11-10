return {
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        config = function()
            require("no-neck-pain").setup({
                width = 125,
                autocmds = {
                    enableOnVimEnter = false,
                    enableOnTabEnter = false,
                    reloadOnColorSchemeChange = true,
                },
                buffers = {
                    setNames = false,
                    bo = {
                        filetype = "no-neck-pain",
                        buftype = "nofile",
                        bufhidden = "hide",
                        buflisted = false,
                        swapfile = false,
                    },
                    colors = {
                        blend = 0,
                        background = nil,
                    },
                    wo = {
                        cursorline = false,
                        cursorcolumn = false,
                        number = false,
                        relativenumber = false,
                        foldenable = false,
                        wrap = false,
                        linebreak = false,
                    },
                },
                integrations = {
                    snacks = {
                        dashboard = {
                            position = "left", -- or "right"
                            reopen = true,
                        },
                        explorer = {
                            position = "left", -- or "right"
                            reopen = true,
                        },
                    },
                },
            })
        end,

        cmd = "NoNeckPain",
    },
}
