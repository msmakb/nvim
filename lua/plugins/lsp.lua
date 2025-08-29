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
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    config = function()
      require "configs.null-ls"
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "ty",
        "mypy",
        "prettierd",
        "prettier",
        "rustfmt",
        "taplo",
        "codelldb",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = "rust",
    config = function()
      require "configs.rustacean"
    end,
  },
}
