local notify_config = require "configs.TERM.nvim_notify"
local config_noice = require "configs.TERM.noice"
local config_shade = require "configs.TERM.shade"

return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = notify_config.opts(),
    config = function()
      notify_config.setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = config_noice.dependencies(),
    config = config_noice.setup(),
  },
  {
    "stevearc/aerial.nvim",
    lazy = true,
    dependencies = require "opts.deps.aerial",
    config = function()
      require "configs.EXT.aerial"
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    --lazy = false,
    config = function()
      config_shade.setup()
    end,
  },
}
