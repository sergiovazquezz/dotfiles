return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-e>"] = { "cancel", "fallback" },
            },
            completion = {
                menu = {
                    border = "rounded",
                },
                ghost_text = {
                    enabled = true,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },
            signature = {
                enabled = false,
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },
        },
    },
}
