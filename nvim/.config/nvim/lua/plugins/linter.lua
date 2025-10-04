return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
      },
      linters = {

        eslint_d = {
          condition = function(ctx)
            local root = vim.fs.root(ctx.filename, {
              ".eslintrc",
              ".eslintrc.json",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.js",
              ".eslintrc.cjs",
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
            })
            return root ~= nil
          end,
        },
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.config/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
