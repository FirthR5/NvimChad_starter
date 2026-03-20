-- External CLI tool integrations

return {
  -- ─── Trouble ──────────────────────────────────────────────────────────────
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = {
      { "folke/todo-comments.nvim", opts = {} },
    },
    keys = require("keymaps.tools").trouble,
    config = function()
      require("trouble").setup()
    end,
  },

  -- ─── Ranger ────────────────────────────────────────────────────────────────
  {
    "kelly-lin/ranger.nvim",
    event = "VeryLazy",
    config = function()
      local ranger_nvim = require "ranger-nvim"
      ranger_nvim.setup {
        enable_cmds = false,
        replace_netrw = false,
        keybinds = {
          ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
          ["oh"] = ranger_nvim.OPEN_MODE.split,
          ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
          ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },
        ui = {
          border = "none",
          height = 1,
          width = 1,
          x = 0.5,
          y = 0.5,
        },
      }
      require("keymaps.tools").ranger()
    end,
  },

  -- ─── Tmux Navigator ───────────────────────────────────────────────────────
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = require("keymaps.tools").tmux_nav,
  },

  -- ─── Web Tools ─────────────────────────────────────────────────────────────
  {
    "ray-x/web-tools.nvim",
    event = "VeryLazy",
    config = function()
      require("web-tools").setup {
        keymaps = {
          rename = nil,
          repeat_rename = ".",
        },
        hurl = {
          show_headers = true,
          floating = false,
          json5 = false,
          formatters = {
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
  },
}
