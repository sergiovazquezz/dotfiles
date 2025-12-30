return {
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
            completion = {
                crates = {
                    enabled = true,
                },
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                tools = {
                    float_win_config = {
                        border = "rounded",
                    },
                },
                server = {
                    status_notify_level = false,
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr }

                        vim.keymap.set("n", "<leader>ce", function()
                            vim.cmd.RustLsp("explainError")
                        end, vim.tbl_extend("force", opts, { desc = "Explain Error" }))

                        vim.keymap.set("n", "<leader>cd", function()
                            vim.cmd.RustLsp("renderDiagnostic")
                        end, vim.tbl_extend("force", opts, { desc = "Render Diagnostic" }))

                        -- Navigation
                        vim.keymap.set("n", "<leader>cc", function()
                            vim.cmd.RustLsp("openCargo")
                        end, vim.tbl_extend("force", opts, { desc = "Open Cargo.toml" }))

                        vim.keymap.set("n", "<leader>cD", function()
                            vim.cmd.RustLsp("openDocs")
                        end, vim.tbl_extend("force", opts, { desc = "Open docs.rs" }))

                        -- Code insight
                        vim.keymap.set("n", "<leader>cm", function()
                            vim.cmd.RustLsp("expandMacro")
                        end, vim.tbl_extend("force", opts, { desc = "Expand Macro" }))
                    end,
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            checkOnSave = true,
                            check = { command = "clippy", features = "all" },
                            diagnostics = {
                                enable = true,
                            },
                            notifications = {
                                cargoTomlNotFound = false,
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                            files = {
                                excludeDirs = {
                                    ".direnv",
                                    ".git",
                                    ".github",
                                    ".gitlab",
                                    "bin",
                                    "node_modules",
                                    "target",
                                    "venv",
                                    ".venv",
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
