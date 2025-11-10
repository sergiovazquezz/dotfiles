return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = true,
            },
            {
                "mason-org/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        automatic_installation = true,
                        handlers = {
                            function(server_name)
                                require("lspconfig")[server_name].setup({})
                            end,
                            ["lua_ls"] = function()
                                require("lspconfig").lua_ls.setup({
                                    settings = {
                                        Lua = {
                                            runtime = {
                                                version = "LuaJIT",
                                            },
                                            diagnostics = {
                                                globals = { "vim" },
                                            },
                                            workspace = {
                                                library = vim.api.nvim_get_runtime_file("", true),
                                                checkThirdParty = false,
                                            },
                                            telemetry = {
                                                enable = false,
                                            },
                                        },
                                    },
                                })
                            end,
                            ["gopls"] = function()
                                require("lspconfig").gopls.setup({
                                    settings = {
                                        gopls = {
                                            gofumpt = true,
                                            codelenses = {
                                                gc_details = false,
                                                generate = true,
                                                regenerate_cgo = true,
                                                run_govulncheck = true,
                                                test = true,
                                                tidy = true,
                                                upgrade_dependency = true,
                                                vendor = true,
                                            },
                                            hints = {
                                                assignVariableTypes = true,
                                                compositeLiteralFields = true,
                                                compositeLiteralTypes = true,
                                                constantValues = true,
                                                functionTypeParameters = true,
                                                parameterNames = true,
                                                rangeVariableTypes = true,
                                            },
                                            analyses = {
                                                nilness = true,
                                                unusedparams = true,
                                                unusedwrite = true,
                                                useany = true,
                                            },
                                            usePlaceholders = true,
                                            completeUnimported = true,
                                            staticcheck = true,
                                            directoryFilters = {
                                                "-.git",
                                                "-.vscode",
                                                "-.idea",
                                                "-.vscode-test",
                                                "-node_modules",
                                            },
                                            semanticTokens = true,
                                        },
                                    },
                                })
                            end,
                            -- ["html"] = function()
                            --   require("lspconfig").html.setup({
                            --     -- Custom HTML config
                            --   })
                            -- end,
                            -- ["cssls"] = function()
                            --   require("lspconfig").cssls.setup({
                            --     -- Custom CSS config
                            --   })
                            -- end,
                        },
                    })
                end,
            },
        },
        config = function()
            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- LSP keybindings
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    -- Go to definition
                    vim.keymap.set(
                        "n",
                        "gd",
                        "<cmd>Trouble lsp_definitions toggle<cr>",
                        vim.tbl_extend("force", opts, { desc = "Go to definition" })
                    )

                    -- Go to declaration
                    vim.keymap.set(
                        "n",
                        "gD",
                        "<cmd>Trouble lsp_declarations<cr>",
                        vim.tbl_extend("force", opts, { desc = "Go to declaration" })
                    )

                    -- Go to references
                    vim.keymap.set(
                        "n",
                        "gr",
                        "<cmd>Trouble lsp_references<cr>",
                        vim.tbl_extend("force", opts, { desc = "Go to references" })
                    )

                    -- Go to implementation
                    vim.keymap.set(
                        "n",
                        "gi",
                        "<cmd>Trouble lsp_implementations<cr>",
                        vim.tbl_extend("force", opts, { desc = "Go to implementation" })
                    )

                    -- Go to type definition
                    vim.keymap.set(
                        "n",
                        "gt",
                        "<cmd>Trouble lsp_type_definitions<cr>",
                        vim.tbl_extend("force", opts, { desc = "Go to type definition" })
                    )

                    -- Hover documentation
                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        vim.tbl_extend("force", opts, { desc = "Hover documentation" })
                    )

                    -- Signature help
                    vim.keymap.set(
                        "n",
                        "gK",
                        vim.lsp.buf.signature_help,
                        vim.tbl_extend("force", opts, { desc = "Signature help" })
                    )

                    -- Rename
                    vim.keymap.set(
                        "n",
                        "<leader>cr",
                        vim.lsp.buf.rename,
                        vim.tbl_extend("force", opts, { desc = "Rename" })
                    )

                    -- Code action
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

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP
                    "html",
                    "cssls",
                    "clangd",
                    "vtsls",
                    "pyright",
                    "lua_ls",
                    "codelldb",
                    "tailwindcss",
                    "zls",

                    -- Formatters and linters
                    "prettierd",
                    "eslint_d",
                    "ruff",
                    "stylua",

                    -- Go
                    "gopls",
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
}
