local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.mypy.with {
      command = "uvx",
      args = { "--with", "django-stubs", "mypy" },
    },
  },
}
