local config_trouble = require "configs.EXT.trouble"

local plugins = {

  -- ==================================================================
  -- External software integration
  -- ==================================================================
  -- RANGER
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require "configs.EXT.ranger"
    end,
  },

  -- ==================================================================
  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = config_trouble.dependencies(),
    config = function()
      config_trouble.setup()
    end,
  },

  -- ==================================================================
  --{
  --'VonHeikemen/fine-cmdline.nvim',
  --requires = {
  --{'MunifTanjim/nui.nvim'}
  --}
  --},
  -- TODO: CHECK OUT
  -- keymaps
  -- plugins.misc
  -- .lualine
  -- .dap

  -- trouble
  -- obsidian
  -- zenmode
  -- codesnap
  -- harpoon
}

return plugins
