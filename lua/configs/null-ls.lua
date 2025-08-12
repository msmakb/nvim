local null_ls = require("null-ls")

local rubocop_extra_args = {
  "--config", os.getenv("HOME") .. "/.config/nvim/rubocop.yml"
}

local opts = {
  sources = {
    null_ls.builtins.formatting.rubocop.with({
      filetypes = { "ruby" },
      extra_args = rubocop_extra_args,
    }),
    null_ls.builtins.diagnostics.rubocop.with({
      filetypes = { "ruby" },
      extra_args = rubocop_extra_args,
    }),
  },
}

return opts
