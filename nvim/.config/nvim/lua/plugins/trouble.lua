return {
    {
        "folke/trouble.nvim",
        opts = {
            modes = {
                lsp_references = {
                    mode = "lsp_references",
                    win = { position = "bottom", size = 0.4 },
                },
                lsp_definitions = {
                    mode = "lsp_definitions",
                    win = { position = "bottom", size = 0.4 },
                },
                lsp_implementations = {
                    mode = "lsp_implementations",
                    win = { position = "bottom", size = 0.4 },
                },
                lsp_type_definitions = {
                    mode = "lsp_type_definitions",
                    win = { position = "bottom", size = 0.4 },
                },
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "All Diagnostics",
            },
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics",
            },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List",
            },
        },
    },
}
