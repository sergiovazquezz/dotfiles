return {
    "gbprod/nord.nvim",
    opts = {
        transparent = false, -- disable background color
        terminal_colors = true,
        diff = { mode = "bg" }, -- "bg" or "fg"
        borders = true, -- vertical split border
        errors = { mode = "bg" }, -- "bg", "fg", or "none"
        search = { theme = "vim" }, -- "vim" or "vscode"
        styles = {
            comments = { italic = true },
            keywords = {},
            functions = {},
            variables = {},
            lualine_bold = false,
        },
    },
}
