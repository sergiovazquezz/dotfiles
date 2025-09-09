-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Legends when pressing leader
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 3000
-- vim.opt.ttimeoutlen = 100

-- Set tab to 2 spaces
vim.opt.tabstop = 2 -- Display tabs as 2 spaces wide
vim.opt.shiftwidth = 2 -- Use 2 spaces for indentation
vim.opt.softtabstop = 2 -- Insert 2 spaces when pressing Tab
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.hlsearch = false -- Highlight search results
vim.opt.scrolloff = 18
vim.opt.ignorecase = true -- Make commands case insensitive
vim.opt.backspace = { "start", "eol", "indent" }

-- vim.opt.mouse = "" -- Disable the mouse

-- Disable window borders
vim.opt.fillchars = {
  eob = " ",
  vert = " ",
}

-- Lint info command
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
