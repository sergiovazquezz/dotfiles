return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "Outline" },
        },
        sections = {
          lualine_a = {
            { "mode" }, -- icon = ""
          },
          lualine_c = {
            {
              "filetype",
              icon_only = true,
              padding = { left = 1, right = 0 },
              separator = "",
            },
            {
              LazyVim.lualine.pretty_path(),
              color = { fg = "#E1DEF6" },
              separator = "",
            },
          },
          lualine_b = {
            {
              "branch",
              -- icon = "",
              icon = "",
              -- icon = "󰊤",
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              update_in_insert = false,
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              colored = true,
            },
          },
          lualine_y = { "progress" },
          lualine_z = {
            { "location" }, -- icon = ""
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
