return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "pyright",
        "ruff",
        "rubocop",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "black",
        "mypy",
      },
    },
  },

  {
    "benomahony/uv.nvim",
    config = function()
      require("uv").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require "configs.lspconfig"
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      --
      -- local lspconfig = require("lspconfig")
      -- lspconfig.ruby_lsp.setup({
      --   capabilities = capabilities
      -- })
    end,
  },
}
