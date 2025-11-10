return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    lazygit = {},
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Find Recent Files",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find Config Files",
        },

        -- Buffers
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Find Buffers",
        },
        -- Grep / Search
        {
            "<leader>sG",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep (Root Dir)",
        },
        {
            "<leader>sw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Word",
            mode = { "n", "x" },
        },
        -- {
        --     "<leader>sb",
        --     function()
        --         Snacks.picker.lines()
        --     end,
        --     desc = "Buffer Lines",
        -- },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep_buffers()
            end,
            desc = "Grep Open Buffers",
        },
        -- LSP
        {
            "<leader>ls",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "Symbols",
        },
        {
            "<leader>lS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "Workspace Symbols",
        },
        -- Git
        {
            "<leader>gc",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        -- Search
        -- {
        --     "<leader>sc",
        --     function()
        --         Snacks.picker.commands()
        --     end,
        --     desc = "Commands",
        -- },
        -- {
        --     "<leader>sC",
        --     function()
        --         Snacks.picker.command_history()
        --     end,
        --     desc = "Command History",
        -- },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        -- {
        --     "<leader>sh",
        --     function()
        --         Snacks.picker.help()
        --     end,
        --     desc = "Help Pages",
        -- },
        -- {
        --     "<leader>sH",
        --     function()
        --         Snacks.picker.highlights()
        --     end,
        --     desc = "Highlights",
        -- },
        -- {
        --     "<leader>sk",
        --     function()
        --         Snacks.picker.keymaps()
        --     end,
        --     desc = "Keymaps",
        -- },
        -- {
        --     "<leader>sl",
        --     function()
        --         Snacks.picker.loclist()
        --     end,
        --     desc = "Location List",
        -- },
        -- {
        --     "<leader>sM",
        --     function()
        --         Snacks.picker.man()
        --     end,
        --     desc = "Man Pages",
        -- },
        -- {
        --     "<leader>sm",
        --     function()
        --         Snacks.picker.marks()
        --     end,
        --     desc = "Marks",
        -- },
        {
            "<leader>sq",
            function()
                Snacks.picker.qflist()
            end,
            desc = "Quickfix List",
        },

        -- Notifications
        {
            "<leader>sn",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notifications",
        },
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
    },
    opts = {
        styles = {
            snacks_image = {
                relative = "editor",
                col = -1,
            },
        },
        image = {
            enabled = true,
            doc = {
                inline = vim.g.neovim_mode == "skitty" and true or false,
                float = true,
                max_width = vim.g.neovim_mode == "skitty" and 20 or 60,
                max_height = vim.g.neovim_mode == "skitty" and 10 or 30,
            },
        },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
                                                                              
           ████ ██████           █████      ██                          
          ███████████             █████                                  
          █████████ ███████████████████ ███   ███████████        
         █████████  ███    █████████████ █████ ██████████████        
        █████████ ██████████ █████████ █████ █████ ████ █████        
      ███████████ ███    ███ █████████ █████ █████ ████ █████       
     ██████  █████████████████████ ████ █████ █████ ████ ██████      
                                                                           ]],
            },
        },
        indent = {
            enabled = false, -- Removes the indent line guide
        },
        bigfile = {
            enabled = true,
        },
        notifier = {
            enabled = true,
            timeout = 5000,
        },
        quickfile = {
            enabled = true,
        },
        statuscolumn = {
            enabled = false,
        },
        words = {
            enabled = true,
        },
        zen = {
            enabled = false,
        },
        -- explorer = {
        --     enabled = false,
        --     prompt = {
        --         enabled = false,
        --     },
        --     search = {
        --         enabled = false,
        --     },
        --     input = false,
        -- },
        picker = {
            enabled = true,
            layout = {
                preset = "telescope",
                cycle = false,
            },
            ui_select = true,
            prompt = "",
            matcher = {
                frecency = true,
            },
            sources = {
                files = {
                    hidden = false, -- Hide dotfiles in picker
                    ignored = false, -- Hide ignored files in picker
                },
                explorer = {
                    hidden = true, -- Show dotfiles in explorer
                    ignored = true, -- Show ignored files in explorer
                    layout = {
                        auto_hide = { "input" },
                    },
                },
            },
        },
    },
}
