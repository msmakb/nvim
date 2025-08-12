return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("configs.conform").setup()
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvimtools/none-ls.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    ft = { "ruby", "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "ruby",
        "python",
      },
    },
  },
}
