return {
    {
        "mikavilpas/yazi.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            {
                "<leader>en",
                mode = { "n" },
                "<cmd>Yazi<cr>",
                desc = "Root",
            },
            {
                "<leader>ee",
                "<cmd>Yazi toggle<cr>",
                desc = "Explorer",
            },
        },
        ---@type YaziConfig | {}
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
    },
}
