return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "moon",
            transparent = true,
            styles = {
                comments = { italic = true, bold = false },
                keywords = { italic = false },
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(hl, c)
                hl.DiagnosticVirtualTextError = { fg = c.error, bg = "NONE" }
                hl.DiagnosticVirtualTextWarn = { fg = c.warning, bg = "NONE" }
                hl.DiagnosticVirtualTextInfo = { fg = c.info, bg = "NONE" }
                hl.DiagnosticVirtualTextHint = { fg = c.hint, bg = "NONE" }
            end,
        },
    },
}
