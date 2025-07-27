-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd("CursorMoved", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("normal! zz")
--   end,
-- })

vim.api.nvim_create_user_command("LintInfo", function()
  local lint = require("lint")
  local filetype = vim.bo.filetype
  local configured_linters = lint.linters_by_ft[filetype] or {}
  local active_linters = {}

  -- Check which linters would actually run based on their conditions
  for _, linter_name in ipairs(configured_linters) do
    local linter = lint.linters[linter_name]
    local should_run = true

    -- Check if linter has a condition function
    if linter and linter.condition then
      local ctx = {
        filename = vim.api.nvim_buf_get_name(0),
        dirname = vim.fn.expand("%:h"),
      }
      should_run = linter.condition(ctx)
    end

    if should_run then
      table.insert(active_linters, linter_name)
    end
  end

  local lines = {
    "Lint Info for buffer: " .. vim.api.nvim_buf_get_name(0),
    "Filetype: " .. filetype,
    "",
    "Configured linters: " .. (#configured_linters > 0 and table.concat(configured_linters, ", ") or "None"),
    "Active linters: " .. (#active_linters > 0 and table.concat(active_linters, ", ") or "None"),
  }

  if #configured_linters ~= #active_linters then
    table.insert(lines, "")
    table.insert(lines, "Note: Some linters are disabled due to missing configuration files")
  end

  print(table.concat(lines, "\n"))
end, {})
