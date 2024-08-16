local M = {}

-- https://github.com/norcalli/nvim-colorizer.lua
local options = {
  filetypes = {
    "html",
    "css",
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "lua",
  },
  user_default_options = {
    mode = "background",
  },
  css = {
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  },
}

-- Colorizer
M = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(options)
  end,
}

return M
