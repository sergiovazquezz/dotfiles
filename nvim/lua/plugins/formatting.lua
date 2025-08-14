return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        markdown = { "prettierd" },
        c = { "clangd " },
        cpp = { "clangd" },
        python = { "black" },
      },
      formatters = {
        prettierd = {
          prepend_args = {
            "--config-precedence=prefer-file",
            "--tab-width=2",
            "--use-tabs=false",
            "--single-quote=true",
            "--jsx-single-quote=true",
            "--trailing-comma=es5",
            "--semi=false",
            "--html-whitespace-sensitivity=ignore",
            "--arrow-parens=always",
            "--print-width=100",
          },
        },
      },
    },
  },
}
