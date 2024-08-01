local notify_config = require "configs.IDE.nvim_notify"
local config_noice = require "configs.IDE.noice"
-- local config_shade = require "configs.IDE.shade"
-- local keymaps = require "configs.IDE.keymaps"

return {
  -- ==================================================================
  -- Default by NvChad
  -- ==================================================================
  require "configs.IDE.LSP_Aerial",
  {
    "rcarriga/nvim-notify",
    -- lazy = false,
    opts = notify_config.opts(),
    config = function()
      notify_config.setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = config_noice.dependencies(),
    config = config_noice.setup,
  },
  -- ==================================================================
  require "configs.IDE.legendary",
  require "configs.Syntax.LSP_cmp.ng",
  require "configs.IDE.goto_preview",
  require "configs.IDE.indent_blankline",
  require "configs.IDE.auto-session",
  -- {
  --   -- dim inactive windows
  --   "andreadev-it/shade.nvim",
  --   --lazy = false,
  --   config = function()
  --     config_shade.setup()
  --   end,
  -- },
}
