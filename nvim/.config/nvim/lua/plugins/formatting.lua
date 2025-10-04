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
      },
      formatters = {
        prettierd = {
          prepend_args = {
            "--config-precedence=prefer-file",
            "--tab-width=4",
            "--use-tabs=false",
            "--single-quote=true",
            "--jsx-single-quote=true",
            "--trailing-comma=es5",
            "--semi=true",
            "--html-whitespace-sensitivity=ignore",
            "--arrow-parens=always",
            "--print-width=80",
          },
        },
      },
    },
  },
}
