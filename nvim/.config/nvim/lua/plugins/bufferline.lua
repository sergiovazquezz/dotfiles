return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = { "|", "|" }, -- Add bar separators
        indicator = {
          style = "none",
        },
        offsets = {
          {
            filetype = "neo-tree",
            highlight = "NONE",
            text_align = "center",
            separator = false, -- Remove separator between explorer and bufferline
          },
          {
            filetype = "snacks_layout_box",
            separator = false,
          },
        },
      },
      highlights = {
        fill = {
          bg = "NONE",
        },
        background = {
          bg = "NONE",
        },
        tab = {
          bg = "NONE",
        },
        tab_selected = {
          bg = "NONE",
          bold = true,
          -- underline = true,
          sp = "#547998",
        },
        tab_close = {
          bg = "NONE",
        },
        close_button = {
          bg = "NONE",
        },
        close_button_visible = {
          bg = "NONE",
        },
        close_button_selected = {
          bg = "NONE",
        },
        buffer_visible = {
          bg = "NONE",
        },
        buffer_selected = {
          bg = "NONE",
          bold = true,
          -- underline = true,
          sp = "#547998",
        },
        separator = {
          bg = "NONE",
          fg = "#547998",
        },
        separator_visible = {
          bg = "NONE",
          fg = "#547998",
        },
        separator_selected = {
          bg = "NONE",
          fg = "#547998",
        },
        indicator_visible = {
          bg = "NONE",
        },
        indicator_selected = {
          bg = "NONE",
          fg = "NONE",
        },
      },
    },
  },
}
