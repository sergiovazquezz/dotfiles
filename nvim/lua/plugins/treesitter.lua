return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "yaml",
        "html",
        "css",
        "python",
        "http",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "vimdoc",
        "c",
        "cpp",
        "java",
        "rust",
      },
      additional_vim_regex_highlighting = false,
    },
  },
}
