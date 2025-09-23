return {
  { -- Disable remaining documentation and restore command line
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = true, -- Keep noice cmdline enabled
        -- view = "cmdline", -- Use bottom cmdline view (like default Neovim)
      },
      presets = {
        command_palette = true,
        bottom_search = false,
      },
      lsp = {
        signature = {
          enabled = true,
          auto_open = false, -- Don't auto-open signature help
        },
        hover = {
          enabled = false, -- Disable hover documentation
        },
        progress = {
          enabled = false, -- Disable LSP progress messages
        },
      },
    },
  },
}
