return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
      }

      -- Custom linter configurations
      lint.linters.eslint_d = lint.linters.eslint_d or {}
      lint.linters.eslint_d.condition = function(ctx)
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
      end

      lint.linters["markdownlint-cli2"] = lint.linters["markdownlint-cli2"] or {}
      lint.linters["markdownlint-cli2"].args = {
        "--config", "~/.config/.markdownlint-cli2.yaml", "--"
      }

      -- Setup autocommand to trigger linting
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
