local M = {}

local options = {
  overlay_opacity = 0,
  opacity_step = 1,
  keys = {
    brightness_up = "<C-Up>",
    brightness_down = "<C-Down>",
    toggle = "<Leader>s",
  },
  exclude_filetypes = { "NvimTree", "neo-tree", "markdown" },
}

function M.setup()
  require("shade").setup(options)
end

return M
