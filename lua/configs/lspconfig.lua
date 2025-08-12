local config = require("nvchad.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.ruby_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
})

vim.diagnostic.config({
  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "•" },
})

local servers = { "html", "cssls", "ruby_lsp" }
vim.lsp.enable(servers)
