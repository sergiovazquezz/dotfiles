return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "clangd",
        "vtsls",
        "jdtls",
        "pyright",
        "ruff",
        "html-lsp",
        "css-lsp",
        -- Linter
        "eslint_d",
        -- Formatter
        "prettierd",
      },
    },
  },
}
