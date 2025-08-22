return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
      require("no-neck-pain").setup({
        width = 120,

        -- Automatically enable when opening Neovim
        autocmds = {
          enableOnVimEnter = false, -- Set to true if you want it always on
          enableOnTabEnter = false,
          reloadOnColorSchemeChange = true,
        },

        -- Buffer options for the side buffers
        buffers = {
          setNames = false, -- Don't set names for side buffers

          -- Options for the side buffers
          bo = {
            filetype = "no-neck-pain",
            buftype = "nofile",
            bufhidden = "hide",
            buflisted = false,
            swapfile = false,
          },

          colors = {
            blend = 0, -- No blending
            background = nil, -- Use default background
          },

          -- Window options for side buffers
          wo = {
            cursorline = false,
            cursorcolumn = false,
            colorcolumn = "0", -- Remove column indicators
            number = false,
            relativenumber = false,
            foldenable = false,
            list = false, -- Hide list characters
            wrap = false,
            linebreak = false,
          },
        },

        -- Integration settings
        integrations = {
          -- Snacks.nvim integration
          snacks = {
            -- For snacks dashboard
            dashboard = {
              position = "left", -- or "right"
              reopen = true,
            },
            -- For snacks explorer/picker
            explorer = {
              position = "left", -- or "right"
              reopen = true,
            },
          },
        },
      })
    end,

    -- Optional: Only load when needed
    cmd = "NoNeckPain",
  },
}
