return {
  {
    "milanglacier/minuet-ai.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("minuet").setup {
        provider = "gemini",
        n_completions = 1,
        throttle = 1500,
        debounce = 600,
        request_timeout = 3,

        -- Keep Minuet as inline virtual text only, not a cmp/blink/LSP source.
        cmp = { enable_auto_complete = false },
        blink = { enable_auto_complete = false },
        lsp = {
          completion = { enable = false },
          inline_completion = { enable = false },
        },

        virtualtext = {
          auto_trigger_ft = { "*" },
          show_on_completion_menu = true,
          keymap = {
            accept = "<A-l>",
            accept_line = "<Tab>",
            accept_n_lines = "<A-z>",
            next = "<C-\\>",
            prev = "<A-[>",
            dismiss = "<A-e>",
          },
        },

        provider_options = {
          gemini = {
            model = "gemini-3.5-flash",
            api_key = function()
              if type(_G.read_env) ~= "function" then
                pcall(require, "configs.read_env")
              end

              if type(_G.read_env) ~= "function" then
                return nil
              end

              return _G.read_env "GEMINI_API_KEY" or _G.read_env "GOOGLE_API_KEY"
            end,
            optional = {
              generationConfig = {
                maxOutputTokens = 128,
                thinkingConfig = {
                  thinkingLevel = "minimal",
                },
              },
            },
          },
        },
      }
    end,
  },
}
