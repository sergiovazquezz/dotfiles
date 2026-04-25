return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>fm",
            function()
                require("telescope.builtin").man_pages()
            end,
            desc = "Man pages",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").spell_suggest()
            end,
            desc = "Spell suggestions",
        },
        {
            "<leader>ls",
            function()
                require("telescope.builtin").lsp_workspace_symbols()
            end,
            desc = "Symbols",
        },
        {
            "gr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "References",
        },
        {
            "gd",
            function()
                require("telescope.builtin").lsp_definitions()
            end,
            desc = "Definition",
        },
        {
            "gi",
            function()
                require("telescope.builtin").lsp_implementations()
            end,
            desc = "Implementation",
        },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                },
            },
        })
    end,
}
