return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                dark_variant = "moon",
                dim_inactive_windows = false,
                disable_background = false,
                disable_nc_background = true,
                disable_float_background = true,
                extend_background_behind_borders = false,
                styles = {
                    bold = false,
                    italic = false,
                    transparency = true,
                },
                enable = {
                    terminal = false,
                    legacy_highlights = false,
                    migrations = true,
                },
                highlight_groups = {
                    ["@function.macro"] = { fg = "iris" },
                    ["@lsp.type.macro.rust"] = { fg = "iris" },
                    -- ["@string"] = { fg = "iris" },
                    -- ["@lsp.type.string.rust"] = { fg = "iris" },
                    ["@lsp.type.enumMember"] = { fg = "love" },
                    ["@constant"] = { fg = "text" },
                    ["@lsp.type.constant"] = { fg = "text" },
                },
            })
        end,
    },
}
