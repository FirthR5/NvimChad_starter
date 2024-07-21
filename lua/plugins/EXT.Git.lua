local config_lazygit = require "configs.EXT.lazygit"
return {
  -- ==================================================================
  -- Lazy GIT
  {
    "kdheepak/lazygit.nvim",
    cmd = config_lazygit.cmd(),
    dependencies = config_lazygit.dependencies(),
    keys = config_lazygit.keys(),
    -- config = require("configs.EXT.lazygit").setup(),
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require "configs.EXT.aerial"
    end,
  },
  -- {--https://github.com/sindrets/diffview.nvim?tab=readme-ov-file
  --   "sindrets/diffview.nvim",
  --
  -- },
}

-- neogit
-- gitsigns
