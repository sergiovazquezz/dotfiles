return {
  "folke/snacks.nvim",
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
        -- Personally I set this to false, I don't want to render all the
        -- images in the file, only when I hover over them
        -- render the image inline in the buffer
        -- if your env doesn't support unicode placeholders, this will be disabled
        -- takes precedence over `opts.float` on supported terminals
        inline = vim.g.neovim_mode == "skitty" and true or false,
        -- render the image in a floating window
        -- only used if `opts.inline` is disabled
        float = true,
        -- Sets the size of the image
        max_width = vim.g.neovim_mode == "skitty" and 20 or 60,
        max_height = vim.g.neovim_mode == "skitty" and 10 or 30,
        -- max_width = 60,
        -- max_height = 30,
        -- Where are the cached images stored?
        -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
        -- Go 1 dir above and check `sudo du -sh ./* | sort -hr | head -n 5`
      },
    },
    dashboard = {
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
        preset = "telescope",
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
          layout = {
            auto_hide = { "input" },
          },
        },
      },
    },
  },
}
