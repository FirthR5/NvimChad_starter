local snippets = {
  -- ============================================================
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- ============================================================
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   -- ai based completion
    --   {
    --     "jcdickinson/codeium.nvim",
    --     config = function()  require("codeium").setup {}   end,
    --   },
    -- },
  },

  -- ============================================================
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

  -- ============================================================
  -- AutoClose Tags
  -- {
  --   "windwp/nvim-ts-autotag",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require "custom.plugins.nvim-ts-autotag"
  --   end,
  -- },

  {
    "ray-x/web-tools.nvim",
    config = function()
      require("web-tools").setup {
        keymaps = {
          rename = nil, -- by default use same setup of lspconfig
          repeat_rename = ".", -- . to repeat
        },
        hurl = { -- hurl default
          show_headers = false, -- do not show http headers
          floating = false, -- use floating windows (need guihua.lua)
          json5 = false, -- use json5 parser require json5 treesitter
          formatters = { -- format the result by filetype
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
  },
  -- {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- },
  -- https://github.com/mg979/vim-visual-multi
  -- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
  -- {
  --   "mg979/vim-visual-multi",
  --   branch = "master",
  --   lazy = false,
  --   init = function()
  --     vim.g.VM_Maps = {
  --       ["Find Under"] = "<C-l>"
  --     }
  --   end
  -- },
  -- -- https://github.com/anuvyklack/pretty-fold.nvim
  --   use{ 'anuvyklack/pretty-fold.nvim',
  --      config = function()
  --         require('pretty-fold').setup()
  --      end
  --   }

  --   -- ========================================================================
  -- Lista de referencia para sacar los Snippets

  -- VUE:
  -- require("luasnip.session.snippet_collection").clear_snippets("r")
  -- $ npm install vue-meta --save
  -- --------------------- https://github.com/nuxt/vue-meta
  -- ============================================================
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      local lua_snippets_my_path = ""
      local sysname = vim.loop.os_uname().sysname

      if sysname == "Windows_NT" then
        lua_snippets_my_path = vim.fn.stdpath "config" .. "\\lua\\snippets\\"
      else
        lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/snippets/"
      end
      require("luasnip.loaders.from_vscode").load()

      require("luasnip.loaders.from_lua").load { paths = lua_snippets_my_path }
      vim.g.lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/snippets"
    end,
  },
}

return snippets
