return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/lua/" }
      require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/lua/snippets/" }
      -- require("luasnip").filetype_extend("ruby", { vim.fn.stdpath("config") .. "/lua/snippets/ruby.snippets" })
      require("luasnip").filetype_extend("ruby", { vim.fn.stdpath "config" .. "/lua/snippets/rails.snippets" })
      require("luasnip").filetype_extend("rails", { vim.fn.stdpath "config" .. "/lua/snippets/rails.snippets" })
      require("luasnip").filetype_extend("eruby", { vim.fn.stdpath "config" .. "/lua/snippets/rails.snippets" })
    end,
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "https://codeberg.org/FelipeLema/cmp-async-path.git",
    },
    config = function()
      local cmp = require "cmp"
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = "crates" },
          { name = "nvim_lsp" },
          {
            name = "luasnip",
            option = {
              use_show_condition = false,
              show_autosnippets = true,
            },
          },
        }, {
          { name = "buffer", keyword_length = 4 },
        }),
      }
    end,
    opts = function()
      return require "nvchad.configs.cmp"
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    dependencies = "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
}
