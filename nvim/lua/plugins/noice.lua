return {
  { -- Disable remaining documentation and restore command line
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = true, -- Keep noice cmdline enabled
        view = "cmdline", -- Use bottom cmdline view (like default Neovim)
      },
      presets = { command_palette = false },
      lsp = {
        signature = {
          enabled = true, -- Disable signature help
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
