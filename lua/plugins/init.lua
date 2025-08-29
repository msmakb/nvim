return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("configs.conform").setup()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },
}
