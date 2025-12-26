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
        },
    },
}
