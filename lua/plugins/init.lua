local notify_config = require "configs.TERM.nvim_notify"
local config_noice = require "configs.TERM.noice"

return {
  -- Notifications
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

  -- TODO: Add NeoTests for HTTP re
}
