return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix", -- "classic", "modern", "helix"
            win = {
                col = 0.5,
            },
            spec = {
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code" },
                { "<leader>u", group = "ui" },
                { "<leader>g", group = "git" },
                { "<leader>s", group = "search" },
                { "<leader>f", group = "file/find" },
                { "<leader>l", group = "lsp" },
                { "<leader>x", group = "diagnostics/quickfix" },
                { "<leader>e", group = "yazi" },
                { "g", group = "goto" },
            },
        },
        -- keys = {
        --     {
        --         "<leader>?",
        --         function()
        --             require("which-key").show({ global = false })
        --         end,
        --         desc = "Buffer Local Keymaps (which-key)",
        --     },
        -- },
    },
}
