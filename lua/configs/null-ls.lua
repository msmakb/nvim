local null_ls = require "null-ls"

local home
if vim.fn.has "win32" > 0 then
  home = os.getenv "USERPROFILE"
else
  home = os.getenv "HOME"
end

local rubocop_extra_args = {
  "--config",
  home .. "/.config/nvim/rubocop.yml",
}

local opts = {
  sources = {
    null_ls.builtins.formatting.rubocop.with {
      filetypes = { "ruby" },
      extra_args = rubocop_extra_args,
      timeout_ms = 2000,
    },
    null_ls.builtins.diagnostics.rubocop.with {
      filetypes = { "ruby" },
      extra_args = rubocop_extra_args,
    },

    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
  },
}

return opts
