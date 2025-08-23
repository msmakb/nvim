---@type ChadrcConfig
local M = {}

-- Create an autocommand group for cleaner management
local autocmd_group = vim.api.nvim_create_augroup("NvChadAutoReload", { clear = true })

-- Automatically check for file changes when Neovim gains focus,
-- enters a buffer, or cursor is held idle.
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
  group = autocmd_group,
  pattern = "*",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename ~= "" and vim.fn.filereadable(filename) == 1 then
        vim.cmd "silent! checktime"
      end
    end
  end,
  desc = "Auto-reload externally changed files",
})

M.base46 = {
  theme = "tokyodark",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
