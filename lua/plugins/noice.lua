return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
      },
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = false,
      },
    },
  },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
