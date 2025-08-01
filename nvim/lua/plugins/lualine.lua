return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local custom_catppuccin = require("lualine.themes.catppuccin")

      -- Custom colours
      custom_catppuccin.normal.b.fg = "#cad3f5"
      custom_catppuccin.insert.b.fg = "#cad3f5"
      custom_catppuccin.visual.b.fg = "#cad3f5"
      custom_catppuccin.replace.b.fg = "#cad3f5"
      custom_catppuccin.command.b.fg = "#cad3f5"
      custom_catppuccin.inactive.b.fg = "#cad3f5"

      custom_catppuccin.normal.c.fg = "#6e738d"
      custom_catppuccin.normal.c.bg = "NONE" -- Make background transparent
      -- custom_catppuccin.normal.c.bg = "#1e2030"

      require("lualine").setup({
        options = {
          theme = custom_catppuccin,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "Outline" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = " ", right = "" }, icon = "" },
          },
          lualine_b = {
            {
              "filetype",
              icon_only = true,
              padding = { left = 1, right = 0 },
            },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_c = {
            {
              "branch",
              icon = "",
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              colored = false,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              update_in_insert = true,
            },
          },
          lualine_y = { "progress" },
          lualine_z = {
            { "location", separator = { left = "", right = " " }, icon = "" },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        extensions = { "toggleterm", "trouble" },
      })
    end,
  },
}
