return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
    },
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
        "rubocop",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("configs.lspconfig")
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      --
      -- local lspconfig = require("lspconfig")
      -- lspconfig.ruby_lsp.setup({
      --   capabilities = capabilities
      -- })
    end,
  },
}
