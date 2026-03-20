-- Completion, snippets, formatting, linting
local cmp_deps = require "data.cmp-deps"

return {
  -- ─── nvim-cmp ──────────────────────────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = cmp_deps,
    config = function()
      require("config.cmp").setup()
    end,
  },

  -- ─── LuaSnip ──────────────────────────────────────────────────────────────
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("config.lua-snippets").setup()
    end,
  },

  -- ─── Conform (formatting) ─────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("config.conform").setup()
    end,
  },

  -- ─── Comment ──────────────────────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- ─── TS AutoTag ────────────────────────────────────────────────────────────
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ["html"] = { enable_close = true },
          ["markdown"] = { enable_close = true },
          ["typescript"] = { enable_close = true },
          ["vue"] = { enable_close = true },
        },
      }
    end,
  },

  -- ─── Inc Rename ────────────────────────────────────────────────────────────
  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("inc_rename").setup {
        presets = { inc_rename = true },
      }
      local keybinds = require("keymaps.lsp").inc_rename
      vim.keymap.set("n", keybinds.rename, ":IncRename ", { silent = true })
    end,
  },

  -- ─── Colorizer ────────────────────────────────────────────────────────────
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.colorizer").setup()
    end,
  },

  -- ─── ALE (linting) ────────────────────────────────────────────────────────
  {
    "dense-analysis/ale",
    lazy = true,
    event = "VeryLazy",
    config = function()
      vim.g.ale_ruby_rubocop_auto_correct_all = 1
      vim.g.ale_linters = {
        cs = { "csharpier" },
      }
    end,
  },
}
