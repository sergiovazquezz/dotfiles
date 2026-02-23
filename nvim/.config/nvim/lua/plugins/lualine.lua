return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "|", right = "|" },
                    globalstatus = true,
                    -- theme = "catppuccin",
                },
                sections = {
                    lualine_a = {
                        { "mode" }, -- icon = ""
                    },
                    lualine_b = {
                        {
                            "branch",
                            icon = "",
                            -- icon = "",
                            -- icon = "󰊤",
                        },
                    },
                    lualine_c = {
                        {
                            "filetype",
                            icon_only = true,
                            padding = { left = 1, right = 0 },
                            separator = "",
                        },
                        {
                            "filename",
                            color = { fg = "#E1DEF6" },
                            padding = { left = 0, right = 0 },
                            separator = "",
                        },
                        -- {
                        --     "buffers",
                        --     -- use_mode_colors = true,
                        --     buffers_color = {
                        --         active = { fg = "#E1DEF6" }, -- needs to be a table
                        --     },
                        --     symbols = {
                        --         modified = " ●",
                        --         alternate_file = "",
                        --         directory = "",
                        --     },
                        -- },
                    },
                    lualine_x = {
                        {
                            "diagnostics",
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = " ",
                            },
                            update_in_insert = false,
                        },
                        {
                            "diff",
                            symbols = { added = " ", modified = " ", removed = " " },
                            colored = true,
                        },
                    },
                    lualine_y = { "progress" },
                    lualine_z = {
                        { "location" }, -- icon = ""
                    },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = { "toggleterm", "trouble" },
            })
        end,
    },
}
