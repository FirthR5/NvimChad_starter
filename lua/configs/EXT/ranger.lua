local options = {}
local M = {}

M = {
  "kelly-lin/ranger.nvim",
  event = "VeryLazy",
  config = function()
    local ranger_nvim = require "ranger-nvim"
    local opts = {
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
    ranger_nvim.setup(opts)

    require("prefs.keymap.plug.EXT_MISC").ranger()
  end,
}

return M
