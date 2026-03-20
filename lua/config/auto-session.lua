local options = {
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  log_level = "error",
  cwd_change_handling = {
    auto_session_enable_last_session = true,
    restore_upcoming_session = true,
    pre_cwd_changed_hook = nil,
    post_cwd_changed_hook = function()
      require("lualine").refresh()
    end,
  },
}

local function setup()
  require("auto-session").setup(options)
end

return {
  setup = setup,
}
