return {
    {
        "mason-org/mason.nvim",
        config = true,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = { automatic_enable = true },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP servers
                    "html",
                    "cssls",
                    "clangd",
                    "vtsls",
                    "pyright",
                    "lua_ls",
                    "codelldb",
                    "tailwindcss",
                    "zls",
                    "gopls",
                    "asm_lsp",

                    -- Formatters and linters
                    "prettierd",
                    "eslint_d",
                    "ruff",
                    "stylua",
                    "asmfmt",

                    -- Go tools
                    "goimports",
                    "gofumpt",
                    "gomodifytags",
                    "impl",
                },
                integrations = {
                    ["mason-lspconfig"] = true,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason-lspconfig.nvim" },
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    -- Enable inlay hints for this buffer
                    vim.lsp.inlay_hint.enable(false, { bufnr = ev.buf })

                    -- Navigation (using Snacks picker)
                    vim.keymap.set("n", "gd", function()
                        Snacks.picker.lsp_definitions()
                    end, vim.tbl_extend(
                        "force",
                        opts,
                        { desc = "Go to definition" }
                    ))

                    vim.keymap.set("n", "gD", function()
                        Snacks.picker.lsp_declarations()
                    end, vim.tbl_extend(
                        "force",
                        opts,
                        { desc = "Go to declaration" }
                    ))

                    vim.keymap.set("n", "gr", function()
                        Snacks.picker.lsp_references()
                    end, vim.tbl_extend(
                        "force",
                        opts,
                        { desc = "Go to references" }
                    ))

                    vim.keymap.set("n", "gi", function()
                        Snacks.picker.lsp_implementations()
                    end, vim.tbl_extend(
                        "force",
                        opts,
                        { desc = "Go to implementation" }
                    ))

                    vim.keymap.set("n", "gt", function()
                        Snacks.picker.lsp_type_definitions()
                    end, vim.tbl_extend(
                        "force",
                        opts,
                        { desc = "Go to type definition" }
                    ))

                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        vim.tbl_extend("force", opts, { desc = "Hover documentation" })
                    )
                    vim.keymap.set(
                        "n",
                        "gK",
                        vim.lsp.buf.signature_help,
                        vim.tbl_extend("force", opts, { desc = "Signature help" })
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>cr",
                        vim.lsp.buf.rename,
                        vim.tbl_extend("force", opts, { desc = "Rename" })
                    )
                    vim.keymap.set(
                        { "n", "v" },
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        vim.tbl_extend("force", opts, { desc = "Code action" })
                    )
                end,
            })
        end,
    },
}
