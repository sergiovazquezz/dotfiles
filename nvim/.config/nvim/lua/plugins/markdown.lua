return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      heading = {
        width = "full",
        sign = false,
        position = "inline", -- "overlay" or "inline"
        border = false,
        icons = { "󰲡  ", "󰲣  ", "󰲥  ", "󰲧  ", "󰲩  ", "󰲫  " },
      },
      checkbox = {
        enabled = true,
      },
      indent = {
        enabled = false,
        skip_heading = false,
      },
    },
  },
}
