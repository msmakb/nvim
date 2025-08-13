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
        "solargraph",
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
    end,
  },
}
