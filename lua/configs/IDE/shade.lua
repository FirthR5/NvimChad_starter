local M = {}

local options = {
  overlay_opacity = 50,
  opacity_step = 100,
  keys = require("prefs.keymap.plug.IDE_Keys").shade,
  exclude_filetypes = { "NvimTree", "neo-tree", "markdown" },
}

function M.setup()
  require("shade").setup(options)
end

return M
