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
            -- Only run eslint_d if there's an ESLint config file
            local config_files = {
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              ".eslintrc",
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
            }

            local root_dir = vim.fs.dirname(vim.fs.find(config_files, {
              path = ctx.filename,
              upward = true,
            })[1])

            if root_dir then
              return true
            end

            -- Also check for eslint config in package.json
            local package_json = vim.fs.find("package.json", {
              path = ctx.filename,
              upward = true,
            })[1]

            if package_json then
              local ok, content = pcall(vim.fn.readfile, package_json)
              if ok then
                local package_data = vim.fn.json_decode(table.concat(content, "\n"))
                if
                  package_data
                  and (
                    package_data.eslintConfig or package_data.devDependencies and package_data.devDependencies.eslint
                  )
                then
                  return true
                end
              end
            end

            return false
          end,
        },
      },
    },
  },
}
