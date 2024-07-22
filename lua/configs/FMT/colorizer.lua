local M = {}

-- https://github.com/norcalli/nvim-colorizer.lua
local options = {
  css = { RRGGBBAA = true },
}

-- Colorizer
M = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(options)
  end,
}

return M
