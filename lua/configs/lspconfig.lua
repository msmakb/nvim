local config = require "nvchad.configs.lspconfig"
local util = require "lspconfig.util"
local capabilities = config.capabilities
local on_attach = config.on_attach

vim.diagnostic.config {
  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = false, -- { spacing = 2, prefix = "•" },
}

local servers = {
  html = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "html-lsp" },
    filetypes = { "html", "htmldjango", "eruby" },
  },

  cssls = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "css-lsp" },
    filetypes = { "css", "scss", "less" },
  },

  ts_ls = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
    },
  },

  ruby_lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "ruby-lsp" },
    filetypes = { "ruby" },
  },

  pyright = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  },

  ty = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
  },

  ruff = {
    filetypes = { "python" },
  },

  rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern "Cargo.toml",
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
