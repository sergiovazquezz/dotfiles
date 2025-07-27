return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = false, -- Removes the indent line guide
    },
    explorer = {
      enabled = true,
      prompt = {
        enabled = false,
      },
      search = {
        enabled = false,
      },
      input = false,
    },
    picker = {
      enabled = true,
      layout = {
        preset = "vertical",
        cycle = false,
      },
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
        },
      },
    },
  },
}
