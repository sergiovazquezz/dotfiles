return {
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            bold = true,
            italic = true,
            style = {
                boolean = "none",
                number = "none",
                float = "none",
                error = "italic",
                comments = "italic",
                conditionals = "none",
                functions = "none",
                headings = "none",
                operators = "none",
                strings = "none",
                variables = "none",

                -- keywords
                keywords = "none",
                keyword_return = "italic",
                keywords_loop = "none",
                keywords_label = "none",
                keywords_exception = "none",

                -- builtin
                builtin_constants = "none",
                builtin_functions = "none",
                builtin_types = "none",
                builtin_variables = "none",
            },
            plugins = {
                cmp = {
                    match = "none",
                    match_fuzzy = "none",
                },
                lsp = {
                    diagnostic_error = "bold",
                    diagnostic_hint = "bold",
                    diagnostic_info = "none",
                    diagnostic_ok = "none",
                    diagnostic_warn = "bold",
                },
                neotest = {
                    focused = "bold",
                    adapter_name = "bold",
                },
                telescope = {
                    match = "none",
                },
            },
        },
    },
}
