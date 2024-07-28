-- Auto Session
local options = {
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  log_level = "error",

  cwd_change_handling = {
    auto_session_enable_last_session = true,
    restore_upcoming_session = true, -- Disabled by default, set to true to enable
    pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
}
-- https://github.com/rmagatti/auto-session

return {
  {
    "rmagatti/auto-session",
    lazy = false,
    -- event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
    },
    config = function()
      require("auto-session").setup(options)
    end,
  },
}
