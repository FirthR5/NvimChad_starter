-- UI plugins: notifications, noice, aerial, indent, session, markview, etc.
local noice_config = require "config.noice"

return {
  -- ─── Aerial ────────────────────────────────────────────────────────────────
  {
    "stevearc/aerial.nvim",
    lazy = true,
    config = function()
      require("config.aerial").setup()
    end,
  },

  -- ─── Notify ────────────────────────────────────────────────────────────────
  {
    "rcarriga/nvim-notify",
    opts = require("config.notify").opts,
    config = function()
      require("config.notify").setup()
    end,
  },

  -- ─── Noice ─────────────────────────────────────────────────────────────────
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = noice_config.dependencies,
    config = noice_config.setup,
  },

  -- ─── Legendary ────────────────────────────────────────────────────────────
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("legendary").setup {
        keymaps = require("keymaps.tools").legendary,
        autocmds = {
          { "BufWritePre", vim.lsp.buf.format, description = "Format on save" },
          { name = "MyAugroup", clear = true },
        },
        extensions = {
          lazy_nvim = true,
          op_nvim = true,
          diffview = true,
        },
        scratchpad = {
          view = "float",
          results_view = "float",
        },
      }
    end,
  },

  -- ─── Angular (ng.nvim) ────────────────────────────────────────────────────
  {
    "joeveiga/ng.nvim",
    lazy = false,
    config = function()
      local ng = require "ng"
      local keys = require("keymaps.lsp").ng
      vim.keymap.set("n", keys.goto_template_for_component, ng.goto_template_for_component,
        { noremap = true, silent = true, desc = "Go to Template Html File Component" })
      vim.keymap.set("n", keys.goto_component_with_template_file, ng.goto_component_with_template_file,
        { noremap = true, silent = true, desc = "Go to Template Typescript File Component" })
      vim.keymap.set("n", keys.get_template_tcb, ng.get_template_tcb,
        { noremap = true, silent = true, desc = "Get Template TCB" })
    end,
  },

  -- ─── Goto Preview ─────────────────────────────────────────────────────────
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = function()
      require("config.goto-preview").setup()
      require("keymaps.tools").goto_preview()
    end,
  },

  -- ─── Indent Blankline ─────────────────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("config.indent-blankline").setup()
    end,
  },

  -- ─── Auto Session ─────────────────────────────────────────────────────────
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("config.auto-session").setup()
    end,
  },

  -- ─── Markview ──────────────────────────────────────────────────────────────
  {
    "OXY2DEV/markview.nvim",
    branch = "dev",
    lazy = false,
    ft = "markdown",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("markview").setup {
        preview = {
          modes = { "n", "i", "no", "c" },
          hybrid_modes = { "i" },
          callbacks = {
            on_enable = function(_, win)
              vim.wo[win].conceallevel = 2
              vim.wo[win].concealcursor = "nc"
            end,
          },
        },
        experimental = {
          check_rtp_message = false,
        },
      }
    end,
  },

  -- ─── TimeSpent ─────────────────────────────────────────────────────────────
  {
    "quentingruber/timespent.nvim",
    keys = {
      {
        require("keymaps.tools").timespent[1],
        require("keymaps.tools").timespent[2],
        mode = { "n" },
        desc = "Show time spent",
      },
    },
  },
}
