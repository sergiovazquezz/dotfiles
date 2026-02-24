return {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bold = true,
        italics = true,
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        background = {
            dark = "mist", -- try "zen", "mist" or "pearl" !
            light = "pearl", -- try "zen", "mist" or "ink" !
        },
        foreground = "default", -- "default" or "saturated" (can also be a table like background)
        minimal = true, -- reduced color palette for a more minimal look
    },
}
