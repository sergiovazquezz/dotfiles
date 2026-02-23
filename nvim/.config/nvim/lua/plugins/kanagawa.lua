return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        theme = "wave",
        colors = {
            theme = {
                all = {
                    ui = { bg_gutter = "none" },
                },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            return {
                -- Floats
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                -- Pmenu (used as base by blink)
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },

                -- blink.cmp: menu window
                BlinkCmpMenu = { link = "none" },
                BlinkCmpMenuBorder = { link = "FloatBorder" },
                BlinkCmpMenuSelection = { link = "PmenuSel" },
                BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
                BlinkCmpScrollBarThumb = { link = "PmenuThumb" },

                -- blink.cmp: labels
                BlinkCmpLabel = { fg = theme.ui.pmenu.fg },
                BlinkCmpLabelMatch = { fg = theme.syn.fun, bold = true },
                BlinkCmpLabelDeprecated = { fg = theme.syn.comment, strikethrough = true },
                BlinkCmpGhostText = { fg = theme.ui.nontext },

                -- blink.cmp: doc float
                BlinkCmpDoc = { link = "NormalFloat" },
                BlinkCmpDocBorder = { link = "FloatBorder" },
                BlinkCmpDocSeparator = { link = "FloatBorder" },
                BlinkCmpDocCursorLine = { link = "Visual" },

                -- blink.cmp: signature help
                BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
                BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },

                -- blink.cmp: kind icons (correct prefix is BlinkCmpKind*, NOT BlinkCmpItemKind*)
                BlinkCmpKindText = { fg = theme.ui.fg },
                BlinkCmpKindMethod = { link = "@function.method" },
                BlinkCmpKindFunction = { link = "Function" },
                BlinkCmpKindConstructor = { link = "@constructor" },
                BlinkCmpKindField = { link = "@variable.member" },
                BlinkCmpKindVariable = { fg = theme.ui.fg_dim },
                BlinkCmpKindClass = { link = "Type" },
                BlinkCmpKindInterface = { link = "Type" },
                BlinkCmpKindModule = { link = "@module" },
                BlinkCmpKindProperty = { link = "@property" },
                BlinkCmpKindUnit = { link = "Number" },
                BlinkCmpKindValue = { link = "String" },
                BlinkCmpKindEnum = { link = "Type" },
                BlinkCmpKindKeyword = { link = "Keyword" },
                BlinkCmpKindSnippet = { link = "Special" },
                BlinkCmpKindColor = { link = "Special" },
                BlinkCmpKindFile = { link = "Directory" },
                BlinkCmpKindReference = { link = "Special" },
                BlinkCmpKindFolder = { link = "Directory" },
                BlinkCmpKindEnumMember = { link = "Constant" },
                BlinkCmpKindConstant = { link = "Constant" },
                BlinkCmpKindStruct = { link = "Type" },
                BlinkCmpKindEvent = { link = "Type" },
                BlinkCmpKindOperator = { link = "Operator" },
                BlinkCmpKindTypeParameter = { link = "Type" },
            }
        end,
    },
}
