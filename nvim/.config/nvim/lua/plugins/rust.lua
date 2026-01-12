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
            -- Helper function to detect ESP projects by checking Cargo.toml
            local function detect_esp_project()
                -- Find Cargo.toml in current directory or parent directories
                local cargo_toml = vim.fs.find("Cargo.toml", {
                    upward = true,
                    path = vim.fn.getcwd(),
                })[1]

                if not cargo_toml then
                    return false
                end

                -- Read Cargo.toml contents
                local file = io.open(cargo_toml, "r")
                if not file then
                    return false
                end

                local content = file:read("*all")
                file:close()

                -- Check for ESP-related dependencies
                local esp_patterns = {
                    "esp%-idf%-sys",
                    "esp%-idf%-hal",
                    "esp%-idf%-svc",
                    "esp%-hal",
                    "esp%-backtrace",
                    "esp%-println",
                }

                for _, pattern in ipairs(esp_patterns) do
                    if content:match(pattern) then
                        return true
                    end
                end

                return false
            end

            -- Detect if this is an ESP project
            local is_esp_project = detect_esp_project()

            vim.g.rustaceanvim = {
                tools = {
                    float_win_config = {
                        border = "rounded",
                    },
                },
                server = {
                    cmd_env = {
                        RUSTUP_TOOLCHAIN = "stable",
                    },
                    status_notify_level = false,
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr }

                        vim.keymap.set("n", "<leader>ce", function()
                            vim.cmd.RustLsp("explainError")
                        end, vim.tbl_extend(
                            "force",
                            opts,
                            { desc = "Explain Error" }
                        ))

                        vim.keymap.set("n", "<leader>cd", function()
                            vim.cmd.RustLsp("renderDiagnostic")
                        end, vim.tbl_extend(
                            "force",
                            opts,
                            { desc = "Render Diagnostic" }
                        ))

                        -- Navigation
                        vim.keymap.set("n", "<leader>cc", function()
                            vim.cmd.RustLsp("openCargo")
                        end, vim.tbl_extend(
                            "force",
                            opts,
                            { desc = "Open Cargo.toml" }
                        ))

                        vim.keymap.set("n", "<leader>cD", function()
                            vim.cmd.RustLsp("openDocs")
                        end, vim.tbl_extend(
                            "force",
                            opts,
                            { desc = "Open docs.rs" }
                        ))

                        -- Code insight
                        vim.keymap.set("n", "<leader>cm", function()
                            vim.cmd.RustLsp("expandMacro")
                        end, vim.tbl_extend(
                            "force",
                            opts,
                            { desc = "Expand Macro" }
                        ))
                    end,
                    default_settings = (function()
                        local settings = {
                            ["rust-analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                    loadOutDirsFromCheck = true,
                                    buildScripts = {
                                        enable = true,
                                    },
                                },
                                inlayHints = {
                                    -- Type hints for variables
                                    typeHints = { enable = true },
                                    -- Parameter names at call sites
                                    parameterHints = {
                                        enable = true,
                                        -- Show hints for all parameters, not just non-obvious ones
                                        maxLength = 20,
                                        -- Show hints even for constructor-like functions
                                        hideNamedConstructorHints = false,
                                    },
                                    -- Types in method chains
                                    chainingHints = { enable = false },
                                    -- Return types for closures
                                    closureReturnTypeHints = { enable = false },
                                    -- Elided lifetimes in function signatures
                                    lifetimeElisionHints = {
                                        enable = false,
                                        useParameterNames = true,
                                    },
                                    -- Binding modes (ref, mut, etc.)
                                    bindingModeHints = { enable = false },
                                    -- Labels after closing braces
                                    closingBraceHints = {
                                        enable = false,
                                    },
                                    -- Implicit reborrow operations
                                    reborrowHints = { enable = false },
                                    -- Where values are implicitly dropped
                                    implicitDrops = { enable = false },
                                    -- Enum variant discriminant values
                                    discriminantHints = { enable = false },
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
                        }

                        -- Add ESP-specific configuration for Xtensa projects
                        if is_esp_project then
                            settings["rust-analyzer"].cargo.extraEnv = { RUSTUP_TOOLCHAIN = "esp" }
                            settings["rust-analyzer"].cargo.allTargets = false
                            settings["rust-analyzer"].check.extraEnv = { RUSTUP_TOOLCHAIN = "esp" }
                            settings["rust-analyzer"].server =
                                { extraEnv = { RUSTUP_TOOLCHAIN = "stable" } }
                        end

                        return settings
                    end)(),
                },
            }
        end,
    },
}
