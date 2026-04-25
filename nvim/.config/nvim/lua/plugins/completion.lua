return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = (function()
                return "make install_jsregexp"
            end)(),
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            opts = {},
        },
    },
    opts = {
        keymap = {
            preset = "default",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-e>"] = { "cancel", "fallback" },
        },
        completion = {
            menu = {
                border = "solid", -- rounded, double, single, solid, shadow
            },
            ghost_text = {
                enabled = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        sources = {
            default = { "lsp", "path", "buffer", "snippets" },
        },
        signature = { enabled = true },
        appearance = {
            nerd_font_variant = "mono",
            use_nvim_cmp_as_default = false,
        },
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
    },
}
