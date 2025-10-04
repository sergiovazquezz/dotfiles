return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },

  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    config = function()
      local transparent = true
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,

        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
        on_highlights = function(hl, c)
          hl.TabLine = { bg = c.none }
          hl.TabLineFill = { bg = c.none }
          hl.TabLineSel = { bg = c.none }
          hl.BufferLineBackground = { bg = c.none }
          hl.BufferLineFill = { bg = c.none }
          hl.BufferLineTab = { bg = c.none }
          hl.BufferLineTabSelected = { bg = c.none }
          hl.BufferLineTabClose = { bg = c.none }
          hl.BufferLineSeparator = { bg = c.none }
          hl.BufferLineSeparatorVisible = { bg = c.none }
          hl.BufferLineSeparatorSelected = { bg = c.none }
          hl.BufferLineCloseButton = { bg = c.none }
          hl.BufferLineCloseButtonVisible = { bg = c.none }
          hl.BufferLineCloseButtonSelected = { bg = c.none }
        end,
      })
    end,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      no_bold = true,
      styles = {
        comments = { "italic" },
        keywords = {},
        types = { "italic" },
        conditionals = {},
        loops = {},
        strings = {},
        variables = {},
        properties = {},
        operators = {},
        functions = {},
      },
      integrations = {
        aerial = true,
        alpha = true,
        bufferline = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        disable_background = true,
        disable_nc_background = true,
        disable_float_background = true,
        extend_background_behind_borders = false,
        styles = {
          bold = false,
          italic = false,
          transparency = false,
        },
        enable = {
          terminal = false,
          legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },
      })
    end,
  },

  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    name = "sonokai",
    config = function()
      vim.g.sonokai_enable_italic = true
    end,
  },

  {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    name = "mellow",
    config = function()
      vim.g.mellow_italic_keywords = false
      vim.g.mellow_transparent = true
    end,
  },
}
