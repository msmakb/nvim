return {
  -- {
  --   "hrsh7th/cmp-nvim-lsp",
  -- },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/" })
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/snippets/" })
      -- require("luasnip").filetype_extend("ruby", { vim.fn.stdpath("config") .. "/lua/snippets/ruby.snippets" })
      require("luasnip").filetype_extend("ruby", { vim.fn.stdpath("config") .. "/lua/snippets/rails.snippets" })
      require("luasnip").filetype_extend("rails", { vim.fn.stdpath("config") .. "/lua/snippets/rails.snippets" })
      require("luasnip").filetype_extend("eruby", { vim.fn.stdpath("config") .. "/lua/snippets/rails.snippets" })

    end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function()
  --     local cmp = require("cmp")
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         {
  --           name = 'luasnip',
  --           -- option = {
  --           --   use_show_condition = false,
  --           --   show_autosnippets = true
  --           -- }
  --         },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --     })
  --
  --     local capabilities = require('cmp_nvim_lsp').default_capabilities()
  --     require('lspconfig').clangd.setup {
  --       capabilities = capabilities,
  --     }
  --   end,
  -- },
}
