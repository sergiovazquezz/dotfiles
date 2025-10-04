return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason-org/mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      servers = {
        html = {},
        cssls = {},
      },
    },
  },
}
