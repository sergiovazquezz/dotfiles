return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                json = { "prettierd" },
                css = { "prettierd" },
                html = { "prettierd" },
                markdown = { "prettierd" },
                lua = { "stylua" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                prettierd = {
                    prepend_args = {
                        "--config-precedence=prefer-file",
                        "--tab-width=4",
                        "--use-tabs=false",
                        "--single-quote=true",
                        "--jsx-single-quote=true",
                        "--trailing-comma=es5",
                        "--semi=true",
                        "--html-whitespace-sensitivity=ignore",
                        "--arrow-parens=always",
                        "--print-width=80",
                    },
                },
            },
        },
    },
}
