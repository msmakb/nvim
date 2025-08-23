local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
  },
}

options.format_on_save = function(bufnr)
  local ft = vim.bo[bufnr].filetype
  if options.formatters_by_ft[ft] ~= nil then
    return { timeout_ms = 2000, lsp_fallback = true }
  end
end

options.setup = function()
  require("conform").setup(options)
end

return options
