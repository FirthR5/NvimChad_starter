local config_shade = require "configs.TERM.shade"

return {
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
