local snippets = {
  --   -- ============================================================

  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   -- ai based completion
    --   {
    --     "jcdickinson/codeium.nvim",
    --     config = function()
    --       require("codeium").setup {}
    --     end,
    --   },
    -- },
  },
  -- AutoClose Tags

  -- Comment code
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup {
        -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local lua_snippets_my_path = ""

      -- -- Configurar la ruta de snippets según el sistema operativo
      if sysname == "Windows_NT" then
        lua_snippets_my_path = vim.fn.stdpath "config" .. "\\lua\\snippets\\"
      else
        lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/snippets/"
      end
      -- load snippets from path/of/your/nvim/config/my-cool-snippets

      require("luasnip.loaders.from_vscode").load()

      require("luasnip.loaders.from_lua").load { paths = lua_snippets_my_path }
    end,
  },
  -- {
  --   "windwp/nvim-ts-autotag",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require "custom.plugins.nvim-ts-autotag"
  --   end,
  -- },

  --   -- ========================================================================
  -- Lista de referencia para sacar los Snippets

  -- VUE:
  -- require("luasnip.session.snippet_collection").clear_snippets("r")
  -- $ npm install vue-meta --save
  -- --------------------- https://github.com/nuxt/vue-meta
}

return snippets
